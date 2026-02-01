module bitrev (
  input  sck,
  input  ss,
  input  mosi,
  output miso
);

  // State machine states
  localparam IDLE     = 2'b00;
  localparam RECEIVE  = 2'b01;
  localparam TRANSMIT = 2'b10;

  // Registers
  reg [1:0]  state;
  reg [2:0]  bit_cnt;      
  reg [7:0]  rx_data;      
  reg [7:0]  tx_data;      
  reg        miso_reg;

  wire [7:0] reversed_data_next;
  assign reversed_data_next = {rx_data[0], rx_data[1], rx_data[2], rx_data[3], 
                               rx_data[4], rx_data[5], rx_data[6], rx_data[7]};

  // Output assignment
  assign miso = miso_reg ;
  reg test;
  always @(posedge sck) begin
    test <= mosi;
  end

  always @(posedge sck or posedge ss) begin
    if (ss) begin
      state <= IDLE;
      bit_cnt <= 3'b0;
      miso_reg <= 1'b1;  // MISO high when idle
    end else begin
      case (state)
        IDLE: begin
          rx_data <= {rx_data[6:0], mosi};
          state <= RECEIVE;
          bit_cnt <= 3'b1;  
          miso_reg <= 1'b1; 
        end

        RECEIVE: begin
          // Shift in data from MOSI (MSB first)
          if (bit_cnt == 3'd7) begin
            state <= TRANSMIT;
            bit_cnt <= 3'b0;
            rx_data <= {rx_data[6:0], mosi};
            tx_data <= reversed_data_next;  // Load reversed data (including current bit)
            miso_reg <= reversed_data_next[6]; // Output MSB first
            $display("mosi: %b, rx_data: %b, tx_data: %b", mosi, rx_data, reversed_data_next);
          end else if (bit_cnt == 3'd6) begin
            miso_reg <= mosi;
            rx_data <= {rx_data[6:0], mosi};
            bit_cnt <= bit_cnt + 1'b1;
          end
            else begin
            rx_data <= {rx_data[6:0], mosi};
            bit_cnt <= bit_cnt + 1'b1;
          end
        end

        TRANSMIT: begin
          if (bit_cnt == 3'd6) begin
            state <= IDLE;
            rx_data <= 8'b0;
            bit_cnt <= 3'b0;
            miso_reg <= 1'b1;  // Set MISO high when done
          end else begin
            bit_cnt <= bit_cnt + 1'b1;
            tx_data <= {1'b0,tx_data[5:0], 1'b0};  // Shift left
            miso_reg <= tx_data[5];  // Output next bit
          end
        end

        default: begin
          state <= IDLE;
          miso_reg <= 1'b1;
        end
      endcase
    end
  end

endmodule

