module EXU(
    input wire clk,
    input wire rst,
    // ALU控制信号
    input wire [3:0] alu_op,
    input wire ebreak_en, // EBREAK标志
    input wire ecall_en,  // ECALL使能信号
    input wire mret_en,   // MRET使能信号
    
    // 操作数
    input wire [31:0] rs1_data,
    input wire [31:0] rs2_data,
    input wire [31:0] imm,
    input wire alu_src,
    
    // input wire [6:0] opcode,

    // CSR相关
    input wire is_csr_op,

    // PC相关
    input wire [31:0] pc,
    // input wire [31:0] snpc,
    input wire branch,
    input wire jal_en,
    input wire jalr_en,
    input wire auipc_flag,
    
    // 输出
    output reg [31:0] alu_result,
    // ECALL导致的异常跳转
    output reg ecall_taken,         // ECALL跳转标志
    output reg [31:0] ecall_target,  // ECALL跳转目标地址
    output reg mret_taken,       // MRET跳转标志
    output reg [31:0] mret_target, // MRET跳转目标地址
    output wire branch_taken,
    output wire [31:0] branch_target
);

import "DPI-C" function void ebreak();

    wire [31:0] operand_a;
    wire [31:0] operand_b;
    
    //rtthread相关
    wire [31:0] csr_read_data;
    reg [31:0] mstatus;
    reg [31:0] mepc;
    reg [31:0] mcause;
    reg [31:0] mtvec;


    assign csr_read_data = (imm == 32'h300) ? mstatus :
                          (imm == 32'h341) ? mepc :
                          (imm == 32'h342) ? mcause :
                          (imm == 32'h305) ? mtvec : 32'h0;
    
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
            4'b0000: alu_result = operand_a + operand_b;  // 加法计算：基地址 + 偏移量
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
            4'b1100: alu_result = csr_read_data;

            default: alu_result = 32'h0;
        endcase
    end

    //rt-thread
    always @(*) begin
        // 默认值
        mret_taken = 1'b0;
        mret_target = 32'h0;
        
        if (mret_en) begin
            mret_taken = 1'b1;
            mret_target = mepc;  // 跳转到mepc保存的地址
        end
    end

    always @(*) begin
        ecall_taken = 1'b0;
        ecall_target = 32'h0;

        if (ecall_en) begin
            ecall_taken = 1'b1;
            ecall_target = mtvec; // 跳转到mtvec地址
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            mstatus <= 32'h1800;
            mepc <= 32'h0;
            mcause <= 32'h0;
            mtvec <= 32'h0;
        end
        else if (ecall_en) begin
        mepc <= pc;            // 保存当前PC到mepc
        mcause <= 32'h11;      // 设置mcause为ECALL异常码
        end
        else if (is_csr_op) begin
            case (imm[11:0])
                12'h300: mstatus <= rs1_data; // 写入mstatus
                12'h341: mepc <= rs1_data;    // 写入mepc
                12'h342: mcause <= rs1_data;  // 写入mcause
                12'h305: mtvec <= rs1_data;   // 写入mtvec
                default: ; // 其他CSR寄存器忽略写操作
            endcase
        end
    end

    always @(*) begin
        if(ebreak_en)
            ebreak();
end
endmodule
