module regfile(
    input wire clk,
    input wire rst,
    input wire [4:0] rs1,
    input wire [4:0] rs2,
    input wire [4:0] rd,
    input wire we,
    input wire [31:0] wdata,
    output wire [31:0] rs1_data,
    output wire [31:0] rs2_data
);

    // RV32E只有16个寄存器
    reg [31:0] regs [15:0];
    
    // 读取寄存器值 - 修复时序问题
    assign rs1_data = (rs1 == 0) ? 32'b0 : regs[rs1[3:0]];
    assign rs2_data = (rs2 == 0) ? 32'b0 : regs[rs2[3:0]];
    
    // 写入寄存器
    always @(posedge clk) begin
        if (rst) begin
            // 寄存器复位
            regs[0] <= 32'b0;
            regs[1] <= 32'b0;
            regs[2] <= 32'b0;
            regs[3] <= 32'b0;
            regs[4] <= 32'b0;
            regs[5] <= 32'b0;
            regs[6] <= 32'b0;
            regs[7] <= 32'b0;
            regs[8] <= 32'b0;
            regs[9] <= 32'b0;
            regs[10] <= 32'b0;
            regs[11] <= 32'b0;
            regs[12] <= 32'b0;
            regs[13] <= 32'b0;
            regs[14] <= 32'b0;
            regs[15] <= 32'b0;
        end
        else if (we && rd != 0) begin
            regs[rd[3:0]] <= wdata;
        end
    end

endmodule
