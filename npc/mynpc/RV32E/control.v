module control(
    /* verilator lint_off UNUSEDSIGNAL */
    input wire [31:0] inst,
    /* verilator lint_on UNUSEDSIGNAL */
    output reg reg_write,
    output reg mem_to_reg,
    output reg mem_write,
    output reg mem_read,
    output reg [3:0] alu_op,
    output reg alu_src,
    output reg branch,
    output reg jump
);

    // 只提取需要的指令字段
    wire [6:0] opcode = inst[6:0];
    wire [2:0] funct3 = inst[14:12];
    wire funct7_5 = inst[30];  // 只提取funct7的第5位，这是唯一用到的位

    // ALU操作码
    parameter ALU_ADD  = 4'b0000;
    parameter ALU_SUB  = 4'b0001;
    parameter ALU_SLL  = 4'b0010;
    parameter ALU_SLT  = 4'b0011;
    parameter ALU_SLTU = 4'b0100;
    parameter ALU_XOR  = 4'b0101;
    parameter ALU_SRL  = 4'b0110;
    parameter ALU_SRA  = 4'b0111;
    parameter ALU_OR   = 4'b1000;
    parameter ALU_AND  = 4'b1001;

    always @(*) begin
        // 默认控制信号
        reg_write = 0;
        mem_to_reg = 0;
        mem_write = 0;
        mem_read = 0;
        alu_op = ALU_ADD;
        alu_src = 0;
        branch = 0;
        jump = 0;

        case (opcode)
            7'b0110111: begin // LUI
                reg_write = 1;
                alu_src = 1;
                alu_op = ALU_ADD; // ALU直接传递imm
            end
            
            7'b0010111: begin // AUIPC
                reg_write = 1;
                alu_src = 1;
                alu_op = ALU_ADD; // PC + imm
            end
            
            7'b1101111: begin // JAL
                reg_write = 1;
                jump = 1;
            end
            
            7'b1100111: begin // JALR
                reg_write = 1;
                alu_src = 1;
                jump = 1;
            end
            
            7'b1100011: begin // 分支指令(BEQ, BNE, BLT, BGE, BLTU, BGEU)
                branch = 1;
                
                case(funct3)
                    3'b000: alu_op = ALU_SUB;  // BEQ: 等于时分支
                    3'b001: alu_op = ALU_SUB;  // BNE: 不等于时分支
                    3'b100: alu_op = ALU_SLT;  // BLT: 小于时分支
                    3'b101: alu_op = ALU_SLT;  // BGE: 大于等于时分支
                    3'b110: alu_op = ALU_SLTU; // BLTU: 无符号小于时分支
                    3'b111: alu_op = ALU_SLTU; // BGEU: 无符号大于等于时分支
                    default: alu_op = ALU_SUB;
                endcase
            end
            
            7'b0000011: begin // 加载指令(LB, LH, LW, LBU, LHU)
                reg_write = 1;
                mem_to_reg = 1;
                mem_read = 1;
                alu_src = 1;
            end
            
            7'b0100011: begin // 存储指令(SB, SH, SW)
                mem_write = 1;
                alu_src = 1;
            end
            
            7'b0010011: begin // 立即数运算指令
                reg_write = 1;
                alu_src = 1;
                
                case (funct3)
                    3'b000: alu_op = ALU_ADD;  // ADDI
                    3'b001: alu_op = ALU_SLL;  // SLLI
                    3'b010: alu_op = ALU_SLT;  // SLTI
                    3'b011: alu_op = ALU_SLTU; // SLTIU
                    3'b100: alu_op = ALU_XOR;  // XORI
                    3'b101: alu_op = (funct7_5) ? ALU_SRA : ALU_SRL; // SRAI/SRLI
                    3'b110: alu_op = ALU_OR;   // ORI
                    3'b111: alu_op = ALU_AND;  // ANDI
                    default: alu_op = ALU_ADD;
                endcase
            end
            
            7'b0110011: begin // 寄存器运算指令
                reg_write = 1;
                
                case (funct3)
                    3'b000: alu_op = (funct7_5) ? ALU_SUB : ALU_ADD; // ADD/SUB
                    3'b001: alu_op = ALU_SLL;  // SLL
                    3'b010: alu_op = ALU_SLT;  // SLT
                    3'b011: alu_op = ALU_SLTU; // SLTU
                    3'b100: alu_op = ALU_XOR;  // XOR
                    3'b101: alu_op = (funct7_5) ? ALU_SRA : ALU_SRL; // SRA/SRL
                    3'b110: alu_op = ALU_OR;   // OR
                    3'b111: alu_op = ALU_AND;  // AND
                    default: alu_op = ALU_ADD;
                endcase
            end
            
            default: begin
                // 未实现的指令
                reg_write = 0;
                mem_to_reg = 0;
                mem_write = 0;
                mem_read = 0;
                alu_op = ALU_ADD;
                alu_src = 0;
                branch = 0;
                jump = 0;
            end
        endcase
    end

endmodule
