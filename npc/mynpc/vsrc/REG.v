module REG(
    input wire clk,
    input wire rst,
    
    // 读寄存器地址
    input wire [4:0] rs1_addr,
    input wire [4:0] rs2_addr,
    
    // 写寄存器地址和数据
    input wire [4:0] rd_addr,
    input wire [31:0] rd_data,
    input wire rd_wen,  // 写使能
    
    // 读出的寄存器数据
    output reg [31:0] rs1_data,
    output reg [31:0] rs2_data
);
  // DPI-C接口声明
  import "DPI-C" function void set_reg_value(input int idx, input int val);
  import "DPI-C" function void ebreak();

  // 16个寄存器(RV32E)
  reg [31:0] registers [0:31];
  
  integer i;
  
  // 寄存器读取逻辑
  always @(*) begin
      if (!rst) begin
          rs1_data = 32'h0;
          rs2_data = 32'h0;
      end else begin
          // x0寄存器恒为0
          rs1_data = (rs1_addr == 5'h0) ? 32'h0 : registers[rs1_addr];
          rs2_data = (rs2_addr == 5'h0) ? 32'h0 : registers[rs2_addr];
      end
  end

  // 寄存器写入逻辑
  always @(posedge clk) begin
      if (!rst) begin
          for (i = 0; i < 16; i = i + 1) begin
              registers[i] <= 32'h0;
          end
      end else if (rd_wen && rd_addr != 5'h0) begin
          // x0不可写
          registers[rd_addr] <= rd_data;
          set_reg_value(32'(rd_addr), rd_data); // 更新DPI-C接口中的寄存器值
      end
  end

endmodule
