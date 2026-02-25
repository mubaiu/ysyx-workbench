module Forwarding(
    // EX/MEM寄存器
    input wire EX_LSU_reg_write,
    input wire [3:0] EX_LSU_rd,
    input wire [31:0] EX_LSU_alu_result,

    // MEM/WB寄存器
    input wire LSU_WB_reg_write,
    input wire [3:0] LSU_WB_rd,
    input wire [31:0] LSU_WB_wb_data,

    // ID/EX寄存器
    input wire [3:0] ID_EX_rs1,
    input wire [3:0] ID_EX_rs2,
    input wire [31:0] ID_EX_rs1_data,
    input wire [31:0] ID_EX_rs2_data,

    // 前递后的操作数
    output reg [31:0] forward_a,
    output reg [31:0] forward_b
);

    always @(*) begin
        // 默认使用寄存器值
        forward_a = ID_EX_rs1_data;
        forward_b = ID_EX_rs2_data;

        // 前递A（rs1）
        if (EX_LSU_reg_write && EX_LSU_rd != 4'h0 && EX_LSU_rd == ID_EX_rs1)
            forward_a = EX_LSU_alu_result;
        else if (LSU_WB_reg_write && LSU_WB_rd != 4'h0 && LSU_WB_rd == ID_EX_rs1)
            forward_a = LSU_WB_wb_data;

        // 前递B（rs2）
        if (EX_LSU_reg_write && EX_LSU_rd != 4'h0 && EX_LSU_rd == ID_EX_rs2)
            forward_b = EX_LSU_alu_result;
        else if (LSU_WB_reg_write && LSU_WB_rd != 4'h0 && LSU_WB_rd == ID_EX_rs2)
            forward_b = LSU_WB_wb_data;
    end

endmodule
