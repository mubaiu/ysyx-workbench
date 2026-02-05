module psram(
  input sck,
  input ce_n,
  inout [3:0] dio
);

  // Memory array: 4MB (4M x 8-bit)
  reg [7:0] mem [0:4*1024*1024-1];

  // Internal signals
  reg [7:0] cmd_reg;
  reg [23:0] addr_reg;
  reg [31:0] data_reg;
  reg [5:0] bit_counter;
  reg [3:0] dout_reg;
  reg dout_en;

  // QPI mode: 0=SPI mode (1-4-4), 1=QPI mode (4-4-4)
  reg qpi_mode;

  // State machine
  localparam IDLE = 3'd0;
  localparam CMD = 3'd1;
  localparam ADDR = 3'd2;
  localparam DUMMY = 3'd3;
  localparam READ_DATA = 3'd4;
  localparam WRITE_DATA = 3'd5;

  reg [2:0] state;
  reg [2:0] next_state;

  // Tri-state buffer control
  assign dio = dout_en ? dout_reg : 4'bz;

  // State machine - next state logic
  always @(*) begin
    next_state = state;
    case (state)
      IDLE: begin
        if (!ce_n) next_state = CMD;
      end
      CMD: begin
        if (bit_counter >= 7) begin
          next_state = ADDR;
        end
      end
      ADDR: begin
        if (bit_counter == 13) begin
          if (cmd_reg == 8'h35) begin
            // Enter QPI mode command - no address needed
            next_state = IDLE;
          end else if (cmd_reg == 8'hEB) begin
            next_state = DUMMY;
          end else if (cmd_reg == 8'h38) begin
            next_state = WRITE_DATA;
          end else begin
            next_state = IDLE;
          end
        end
      end
      DUMMY: begin
        if (bit_counter == 19) next_state = READ_DATA;
      end
      READ_DATA: begin
        if (ce_n) next_state = IDLE;
      end
      WRITE_DATA: begin
        if (ce_n) next_state = IDLE;
      end
      default: next_state = IDLE;
    endcase

    if (ce_n && state != IDLE) next_state = IDLE;
  end

  // State register
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  // QPI mode control - set when receiving 0x35 command
  initial begin
    qpi_mode = 1'b0;  // Power-on default: SPI mode
  end

  always @(posedge sck) begin
    if (state == ADDR && bit_counter == 13 && cmd_reg == 8'h35) begin
      qpi_mode <= 1'b1;  // Enter QPI mode
    end
  end

  // Bit counter - in QPI mode, increment by 4 during command phase
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      bit_counter <= 0;
    end else begin
      // In QPI mode, command phase uses 4-bit parallel transfer
      // Increment by 4 to maintain consistent bit_counter values
      if (qpi_mode && bit_counter < 8) begin
        bit_counter <= bit_counter + 4;
      end else begin
        bit_counter <= bit_counter + 1;
      end
    end
  end

  // Command reception - SPI mode: serial on dio[0], QPI mode: quad on dio[3:0]
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      cmd_reg <= 8'h00;
    end else if (bit_counter < 8) begin
      if (qpi_mode) begin
        // QPI mode: 4-bit parallel transfer
        cmd_reg <= {cmd_reg[3:0], dio};
      end else begin
        // SPI mode: 1-bit serial transfer
        cmd_reg <= {cmd_reg[6:0], dio[0]};
      end
    end
  end

  // Address reception (quad mode)
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      addr_reg <= 24'h000000;
    end else if (bit_counter >= 8 && bit_counter < 14) begin
      addr_reg <= {addr_reg[19:0], dio};
    end
  end

  // Write data reception (quad mode)
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      data_reg <= 32'h00000000;
    end else if (state == WRITE_DATA) begin
      // Receive 4 bits at a time, 2 cycles per byte
      case (bit_counter - 14)
        0: data_reg[7:4] <= dio;
        1: begin
          data_reg[3:0] <= dio;
          mem[addr_reg[21:0]] <= {data_reg[7:4], dio};
        end
        2: data_reg[15:12] <= dio;
        3: begin
          data_reg[11:8] <= dio;
          mem[addr_reg[21:0] + 1] <= {data_reg[15:12], dio};
        end
        4: data_reg[23:20] <= dio;
        5: begin
          data_reg[19:16] <= dio;
          mem[addr_reg[21:0] + 2] <= {data_reg[23:20], dio};
        end
        6: data_reg[31:28] <= dio;
        7: begin
          data_reg[27:24] <= dio;
          mem[addr_reg[21:0] + 3] <= {data_reg[31:28], dio};
        end
      endcase
    end
  end

  // Read data output (quad mode) - output on falling edge of sck
  reg [1:0] read_byte_index;
  reg [23:0] read_addr;

  // Load read address after address reception is complete
  always @(posedge sck or posedge ce_n) begin
    if (ce_n) begin
      read_addr <= 24'h000000;
    end else if (bit_counter == 14) begin
      read_addr <= addr_reg;
    end
  end

  // Output data on falling edge of sck
  always @(negedge sck or posedge ce_n) begin
    if (ce_n) begin
      dout_reg <= 4'h0;
      dout_en <= 1'b0;
    end else if (bit_counter >= 20 && cmd_reg == 8'hEB) begin
      dout_en <= 1'b1;
      // Output 4 bits at a time, 2 cycles per byte
      case (bit_counter - 20)
        0: dout_reg <= mem[read_addr[21:0]][7:4];
        1: dout_reg <= mem[read_addr[21:0]][3:0];
        2: dout_reg <= mem[read_addr[21:0] + 1][7:4];
        3: dout_reg <= mem[read_addr[21:0] + 1][3:0];
        4: dout_reg <= mem[read_addr[21:0] + 2][7:4];
        5: dout_reg <= mem[read_addr[21:0] + 2][3:0];
        6: dout_reg <= mem[read_addr[21:0] + 3][7:4];
        7: dout_reg <= mem[read_addr[21:0] + 3][3:0];
        default: dout_reg <= 4'h0;
      endcase
    end else begin
      dout_en <= 1'b0;
    end
  end

endmodule
