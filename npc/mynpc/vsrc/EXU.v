module EXU(
    // ALU控制信号
    input wire [3:0] alu_op,
    input wire ebreak_en, // EBREAK标志
    
    // 操作数
    input wire [31:0] rs1_data,
    input wire [31:0] rs2_data,
    input wire [31:0] imm,
    input wire alu_src,
    
    // input wire [6:0] opcode,

    // PC相关
    input wire [31:0] pc,
    // input wire [31:0] snpc,
    input wire branch,
    input wire jal_en,
    input wire jalr_en,
    input wire auipc_flag,
    
    // 输出
    output reg [31:0] alu_result,
    output wire branch_taken,
    output wire [31:0] branch_target
);

import "DPI-C" function void ebreak();

    wire [31:0] operand_a;
    wire [31:0] operand_b;
    
    // 操作数选择 - 修改逻辑以支持AUIPC指令
    // AUIPC指令的特征是使用加法操作(alu_op=0000)和立即数alu_result(alu_src=1)，但不是跳转指令
    assign operand_a = (jal_en | auipc_flag ) ? pc : rs1_data;
    assign operand_b = alu_src ? imm : rs2_data;  // 使用立即数作为偏移量         // 使用立即数作为偏移量
    
    // 分支目标计算
    // JALR指令：pc = rs1 + imm (需要将最低位清零)
    // JAL/分支指令：pc = pc + imm
    assign branch_target = (jal_en | jalr_en) ? 
                        (alu_op == 4'b0000 && alu_src && jal_en) ? (pc + imm) :    // JAL: pc + imm
                        (rs1_data + imm) & 32'hFFFFFFFE :                // JALR: (rs1 + imm) & ~1
                        (pc + imm);        
    // 分支判断
    reg branch_cond;
    always @(*) begin
        case (alu_op)
            4'b1010: branch_cond = (rs1_data == rs2_data);     // BEQ
            4'b1011: branch_cond = (rs1_data != rs2_data);     // BNE
            4'b1100: branch_cond = ($signed(rs1_data) < $signed(rs2_data)); // BLT
            4'b1101: branch_cond = ($signed(rs1_data) >= $signed(rs2_data)); // BGE
            4'b1110: branch_cond = (rs1_data < rs2_data);      // BLTU
            4'b1111: branch_cond = (rs1_data >= rs2_data);     // BGEU
            default: branch_cond = 1'b0;
        endcase
    end
    
    assign branch_taken = (branch && branch_cond) || (jal_en | jalr_en);
    
    // ALU操作
    always @(*) begin
        case (alu_op)
            4'b0000:begin 
                alu_result = operand_a + operand_b;  // 加法计算：基地址 + 偏移量
            end
            4'b0001: alu_result = operand_a - operand_b;      // SUB
            4'b0010: alu_result = operand_a << operand_b[4:0]; // SLL
            4'b0011: alu_result = {31'b0, $signed(operand_a) < $signed(operand_b)}; // SLT
            4'b0100: alu_result = {31'b0, operand_a < operand_b}; // SLTIU
            4'b0101: alu_result = operand_a ^ operand_b;      // XOR
            4'b0110: alu_result = operand_a >> operand_b[4:0]; // SRL
            4'b0111: alu_result = $signed(operand_a) >>> operand_b[4:0]; // SRA
            4'b1000: alu_result = operand_a | operand_b;      // OR
            4'b1001: alu_result = operand_a & operand_b;      // AND
            4'b1010: alu_result = operand_b;                  // 直通(用于LUI)
            4'b1011: alu_result = {31'b0, operand_a == 0}; //SEQZ
            default: alu_result = 32'h0;
        endcase
    end

always @(*) begin
    if(ebreak_en)
        ebreak();
end
endmodule
