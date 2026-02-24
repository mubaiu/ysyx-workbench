module EXU(
    // ALU控制信号
    input wire [3:0] alu_op,
    
    // 操作数
    input wire [31:0] rs1_data,
    input wire [31:0] rs2_data,
    input wire [31:0] imm,
    input wire alu_src,
    
    // PC相关
    input wire [31:0] pc,
    input wire branch,
    input wire jump,

    
    // 输出
    output reg [31:0] alu_result,
    output wire branch_taken,
    output wire [31:0] branch_target
);

    wire [31:0] operand_a;
    wire [31:0] operand_b;
    
    // 操作数选择
    assign operand_a = (jump && !alu_src) ? pc : rs1_data;  // rs1作为基地址
    assign operand_b = alu_src ? imm : rs2_data;           // 使用立即数作为偏移量
    
    // 分支目标计算
    // JALR指令：pc = rs1 + imm (需要将最低位清零)
    // JAL/分支指令：pc = pc + imm
    assign branch_target = (jump && !alu_src) ? (alu_result & 32'hFFFFFFFE) : (pc + imm);
    
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
    
    assign branch_taken = (branch && branch_cond) || jump;
    
    // ALU操作
    always @(*) begin
        case (alu_op)
            4'b0000: alu_result = operand_a + operand_b;  // 加法计算：基地址 + 偏移量
            4'b0001: alu_result = operand_a - operand_b;      // SUB
            4'b0010: alu_result = operand_a << operand_b[4:0]; // SLL
            4'b0011: alu_result = {31'b0, $signed(operand_a) < $signed(operand_b)}; // SLT
            4'b0100: alu_result = {31'b0, operand_a < operand_b}; // SLTU
            4'b0101: alu_result = operand_a ^ operand_b;      // XOR
            4'b0110: alu_result = operand_a >> operand_b[4:0]; // SRL
            4'b0111: alu_result = $signed(operand_a) >>> operand_b[4:0]; // SRA
            4'b1000: alu_result = operand_a | operand_b;      // OR
            4'b1001: alu_result = operand_a & operand_b;      // AND
            4'b1010: alu_result = operand_b;                  // 直通(用于LUI)
            default: alu_result = 32'h0;
        endcase
    end

endmodule
