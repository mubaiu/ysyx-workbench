// define this macro to enable fast behavior simulation
// for flash by skipping SPI transfers
//`define FAST_FLASH

module spi_top_apb #(
  parameter flash_addr_start = 32'h30000000,
  parameter flash_addr_end   = 32'h3fffffff,
  parameter spi_ss_num       = 8
) (
  input         clock,
  input         reset,
  input  [31:0] in_paddr,
  input         in_psel,
  input         in_penable,
  input  [2:0]  in_pprot,
  input         in_pwrite,
  input  [31:0] in_pwdata,
  input  [3:0]  in_pstrb,
  output        in_pready,
  output [31:0] in_prdata,
  output        in_pslverr,

  output                  spi_sck,
  output [spi_ss_num-1:0] spi_ss,
  output                  spi_mosi,
  input                   spi_miso,
  output                  spi_irq_out
);

`ifdef FAST_FLASH

wire [31:0] data;
parameter invalid_cmd = 8'h0;
flash_cmd flash_cmd_i(
  .clock(clock),
  .valid(in_psel && !in_penable),
  .cmd(in_pwrite ? invalid_cmd : 8'h03),
  .addr({8'b0, in_paddr[23:2], 2'b0}),
  .data(data)
);
assign spi_sck    = 1'b0;
assign spi_ss     = 8'b0;
assign spi_mosi   = 1'b1;
assign spi_irq_out= 1'b0;
assign in_pslverr = 1'b0;
assign in_pready  = in_penable && in_psel && !in_pwrite;
assign in_prdata  = data[31:0];

`else

// XIP mode detection: check if address is in flash space
wire is_flash_access = (in_paddr >= flash_addr_start) && (in_paddr <= flash_addr_end);
wire is_reg_access = !is_flash_access;

// SPI register interface signals
wire [31:0] spi_prdata;
wire        spi_pready;
wire        spi_pslverr;

// XIP state machine
localparam XIP_IDLE     = 3'd0;
localparam XIP_TX1      = 3'd1;
localparam XIP_DIVIDER  = 3'd2;
localparam XIP_SS       = 3'd3;
localparam XIP_CTRL     = 3'd4;
localparam XIP_WAIT     = 3'd5;
localparam XIP_READ     = 3'd6;
localparam XIP_SS_CLEAR = 3'd7;

reg [2:0]  xip_state;
reg [31:0] xip_data;
reg        xip_ready;
reg        xip_write_error;  // Flash write error flag

// XIP internal register access signals
reg [4:0]  xip_reg_addr;
reg [31:0] xip_reg_wdata;
reg [3:0]  xip_reg_strb;
reg        xip_reg_write;
reg        xip_reg_sel;
reg        xip_reg_enable;

// Multiplex between XIP and register access
wire [4:0]  mux_addr   = is_flash_access ? xip_reg_addr : in_paddr[4:0];
wire [31:0] mux_wdata  = is_flash_access ? xip_reg_wdata : in_pwdata;
wire [3:0]  mux_strb   = is_flash_access ? xip_reg_strb : in_pstrb;
wire        mux_write  = is_flash_access ? xip_reg_write : in_pwrite;
wire        mux_sel    = is_flash_access ? xip_reg_sel : in_psel;
wire        mux_enable = is_flash_access ? xip_reg_enable : in_penable;

spi_top u0_spi_top (
  .wb_clk_i(clock),
  .wb_rst_i(reset),
  .wb_adr_i(mux_addr),
  .wb_dat_i(mux_wdata),
  .wb_dat_o(spi_prdata),
  .wb_sel_i(mux_strb),
  .wb_we_i (mux_write),
  .wb_stb_i(mux_sel),
  .wb_cyc_i(mux_enable),
  .wb_ack_o(spi_pready),
  .wb_err_o(spi_pslverr),
  .wb_int_o(spi_irq_out),

  .ss_pad_o(spi_ss),
  .sclk_pad_o(spi_sck),
  .mosi_pad_o(spi_mosi),
  .miso_pad_i(spi_miso)
);

// XIP state machine
always @(posedge clock) begin
  if (reset) begin
    xip_state <= XIP_IDLE;
    xip_data <= 32'h0;
    xip_ready <= 1'b0;
    xip_write_error <= 1'b0;
    xip_reg_addr <= 5'h0;
    xip_reg_wdata <= 32'h0;
    xip_reg_strb <= 4'h0;
    xip_reg_write <= 1'b0;
    xip_reg_sel <= 1'b0;
    xip_reg_enable <= 1'b0;
  end else begin
    case (xip_state)
      XIP_IDLE: begin
        xip_ready <= 1'b0;
        xip_write_error <= 1'b0;
        if (is_flash_access && in_psel && !in_penable && !in_pwrite) begin
          // Start XIP read sequence
          xip_state <= XIP_TX1;
          // Write command (0x03) and address to TX1 register
          xip_reg_addr <= 5'h04;  // TX1 offset
          xip_reg_wdata <= {8'h03, in_paddr[23:2], 2'b0};  // READ command + address
          xip_reg_strb <= 4'b1111;  // Access all bytes
          xip_reg_write <= 1'b1;
          xip_reg_sel <= 1'b1;
          xip_reg_enable <= 1'b1;
        end else if (is_flash_access && in_psel && !in_penable && in_pwrite) begin
          // Flash write error - flash is read-only via XIP
          xip_write_error <= 1'b1;
        end
      end

      XIP_TX1: begin
        if (spi_pready) begin
          xip_state <= XIP_DIVIDER;
          xip_reg_addr <= 5'h14;  // DIVIDER offset
          xip_reg_wdata <= 32'd1;  // Divider value = 1
        end
      end
      
      XIP_DIVIDER: begin
        if (spi_pready) begin
          xip_state <= XIP_SS;
          xip_reg_addr <= 5'h18;  // SS offset
          xip_reg_wdata <= 32'd1;  // Select flash (bit 0)
        end
      end

      XIP_SS: begin
        if (spi_pready) begin
          xip_state <= XIP_CTRL;
          xip_reg_addr <= 5'h10;  // CTRL offset
          xip_reg_wdata <= {18'h0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 7'd64};  // TX_NEG=1, GO=1, LEN=64
        end
      end

      XIP_CTRL: begin
        if (spi_pready) begin
          xip_state <= XIP_WAIT;
          xip_reg_addr <= 5'h10;  // CTRL offset
          xip_reg_write <= 1'b0;
        end
      end

      XIP_WAIT: begin
        if (spi_pready) begin
          if ((spi_prdata[8] == 1'b0)) begin  // GO bit cleared
            xip_state <= XIP_READ;
            xip_reg_addr <= 5'h00;  // RX0 offset
          end
        end
      end

      XIP_READ: begin
        if (spi_pready) begin
          xip_data <= {spi_prdata[7:0], spi_prdata[15:8], spi_prdata[23:16], spi_prdata[31:24]};
          xip_state <= XIP_SS_CLEAR;
          xip_reg_addr <= 5'h18;  // SS offset
          xip_reg_wdata <= 32'd0;  // Deselect all (clear all bits)
          xip_reg_write <= 1'b1;
        end
      end

      XIP_SS_CLEAR: begin
        if (spi_pready) begin
          xip_state <= XIP_IDLE;
          xip_ready <= 1'b1;
          xip_reg_strb <= 4'b0000;
          xip_reg_write <= 1'b0;
          xip_reg_sel <= 1'b0;
          xip_reg_enable <= 1'b0;
        end
      end

      default: begin
        xip_state <= XIP_IDLE;
      end
    endcase
  end
end

// Output multiplexing
assign in_prdata  = is_flash_access ? xip_data : spi_prdata;
assign in_pready  = is_flash_access ? xip_ready : spi_pready;
assign in_pslverr = is_flash_access ? xip_write_error : spi_pslverr;

`endif // FAST_FLASH

endmodule
