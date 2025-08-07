module IDU(
    input wire [31:0] inst,
    input wire [31:0] pc,
    // input wire rst,

    // 寄存器地址输出
    output wire [4:0] rs1_addr,
    output wire [4:0] rs2_addr,
    output wire [4:0] rd_addr,
    
    // 立即数生成
    output reg [31:0] imm,
    
    // 控制信号
    output reg [3:0] alu_op,
    output reg mem_read,
    output reg mem_write,
    output reg reg_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg branch,
    output reg jal_en,
    output reg jalr_en,
    output reg ebreak_en, // EBREAK标志
    output reg ecall_en,  // ECALL使能信号
    output reg mret_en,   // MRET使能信号
    // output wire [6:0] opcode
    output wire [2:0] funct3,
    output reg auipc_flag,
    output wire is_csr_op
);


import "DPI-C" function void invalid_inst(input int thispc);


    // 指令类型和操作码
    wire [6:0] opcode;
    // wire [2:0] funct3;
    wire [6:0] funct7;
    
    assign opcode = inst[6:0];
    assign funct3 = inst[14:12];
    assign funct7 = inst[31:25];

    // 寄存器地址提取
    assign rs1_addr = inst[19:15] & 5'hF; // RV32E只有16个寄存器
    assign rs2_addr = inst[24:20] & 5'hF;
    assign rd_addr = inst[11:7] & 5'hF;

    // 指令解码和控制信号生成
    always @(*) begin
        // 默认值
        alu_op = 4'b0000;
        mem_read = 1'b0;
        mem_write = 1'b0;
        reg_write = 1'b0;
        alu_src = 1'b0;
        auipc_flag = 1'b0;
        ecall_en = 1'b0;
        ebreak_en = 1'b0; // EBREAK标志
        mret_en = 1'b0;
        mem_to_reg = 1'b0;
        branch = 1'b0;
        jal_en = 1'b0;
        jalr_en = 1'b0;
        imm = 32'h0;
        is_csr_op = 1'b0;

        case (opcode)
            7'b0110011: begin // R-type
                reg_write = 1'b1;
                alu_src = 1'b0;
                
                case (funct3)
                    3'b000: alu_op = (funct7 == 7'b0000000) ? 4'b0000 : 4'b0001; // ADD/SUB
                    3'b001: alu_op = 4'b0010; // SLL
                    3'b010: alu_op = 4'b0011; // SLT
                    3'b011: alu_op = 4'b0100; // SLTU
                    3'b100: alu_op = 4'b0101; // XOR
                    3'b101: alu_op = (funct7 == 7'b0000000) ? 4'b0110 : 4'b0111; // SRL/SRA
                    3'b110: alu_op = 4'b1000; // OR
                    3'b111: alu_op = 4'b1001; // AND
                    default: begin
                    invalid_inst(pc);
                end
                endcase
            end

            7'b0010011: begin // I-type ALU
                reg_write = 1'b1;
                alu_src = 1'b1;
                imm = {{20{inst[31]}}, inst[31:20]};
                
                case (funct3)
                    3'b000: alu_op = 4'b0000; // ADDI
                    3'b001: alu_op = 4'b0010; // SLLI
                    3'b010: alu_op = 4'b0011; // SLTI
                    3'b011: alu_op = (imm == 32'h0) ? 4'b1011 : 4'b0100; // SEQZ/SLTIU
                    3'b100: alu_op = 4'b0101; // XORI
                    3'b101: alu_op = (funct7 == 7'b0000000) ? 4'b0110 : 4'b0111; // SRLI/SRAI
                    3'b110: alu_op = 4'b1000; // ORI
                    3'b111: alu_op = 4'b1001; // ANDI
                    default: begin
                    invalid_inst(pc);
                end
                endcase
            end

            7'b0000011: begin // Load
                reg_write = 1'b1;
                alu_src = 1'b1;
                mem_read = 1'b1;
                mem_to_reg = 1'b1;
                alu_op = 4'b0000; // 加法计算地址
                imm = {{20{inst[31]}}, inst[31:20]};
            end

            7'b0100011: begin // Store
                alu_src = 1'b1;
                mem_write = 1'b1;
                alu_op = 4'b0000; // 加法计算地址
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
                // $display("imm: %h rs1_addr: %h\n", imm, rs1_addr);
            end

            7'b1100011: begin // Branch
                branch = 1'b1;
                alu_src = 1'b0;
                case (funct3)
                    3'b000: alu_op = 4'b1010; // BEQ
                    3'b001: alu_op = 4'b1011; // BNE
                    3'b100: alu_op = 4'b1100; // BLT
                    3'b101: alu_op = 4'b1101; // BGE
                    3'b110: alu_op = 4'b1110; // BLTU
                    3'b111: alu_op = 4'b1111; // BGEU
                default: begin
                    invalid_inst(pc);
                end
                endcase
                imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
            end
            
            7'b1101111: begin // JAL
                reg_write = 1'b1;
                jal_en = 1'b1;
                alu_src = 1'b1;
                alu_op = 4'b0000;
                imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
                // $display("jal_pc: %08x\n",pc);
            end
            
            7'b1100111: begin // JALR
                reg_write = 1'b1;
                jalr_en = 1'b1;
                alu_src = 1'b1;
                alu_op = 4'b0000;
                imm = {{20{inst[31]}}, inst[31:20]};
                // $display("jalr_pc: %08x\n",pc);
            end
            
            7'b0110111: begin // LUI
                reg_write = 1'b1;
                alu_op = 4'b1010; // 直通操作
                alu_src = 1'b1;
                imm = {inst[31:12], 12'b0};
            end
            
            7'b0010111: begin // AUIPC
                reg_write = 1'b1;
                alu_op = 4'b0000;
                auipc_flag = 1'b1; // AUIPC特有的标志
                alu_src = 1'b1;
                imm = {inst[31:12], 12'b0};
            end

            7'b1110011: begin // SYSTEM指令
                if (funct3 == 3'b000) begin
                    case (inst[31:20])
                        12'b000000000000: begin // ECALL
                            ecall_en = 1'b1; // 设置ECALL标志
                        end
                        12'b000000000001: begin // EBREAK
                            ebreak_en = 1'b1; // 设置EBREAK标志
                        end
                        12'b001100000010: begin // MRET
                            mret_en = 1'b1; // 设置MRET标志
                        end
                    default: begin
                        invalid_inst(pc);
                    end
                    endcase
                end
                if (funct3 == 3'b001) begin // CSRRW
                        reg_write = 1'b1;
                        is_csr_op = 1'b1;
                        alu_op = 4'b1100; // 直通操作
                        imm = {{20{1'b0}}, inst[31:20]};
                    end 
                else if (funct3 == 3'b010) begin // CSRRS
                        reg_write = 1'b1;
                        is_csr_op = (rs1_addr != 5'h0); // 如果rs1_addr为0，则不写回
                        alu_op = 4'b1100; // 直通操作
                        imm = {{20{1'b0}}, inst[31:20]};
                    end 
                else begin
                        invalid_inst(pc);
                    end
                end
                // 其他系统指令...
            
            
            default: begin
                if(!rst)begin
                    invalid_inst(pc); // 调用DPI-C函数处理非法指令
                end
            end
        endcase
    end

endmodule

