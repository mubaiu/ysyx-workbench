module IDU(
    input wire [31:0] inst,
    
    // 寄存器地址输出
    output wire [3:0] rs1_addr,
    output wire [3:0] rs2_addr,
    output wire [3:0] rd_addr,
    
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
    output reg jump,
    
);

    // 指令类型和操作码
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    
    assign opcode = inst[6:0];
    assign funct3 = inst[14:12];
    assign funct7 = inst[31:25];
    
    // 寄存器地址提取
    assign rs1_addr = inst[19:15] & 4'hF; // RV32E只有16个寄存器
    assign rs2_addr = inst[24:20] & 4'hF;
    assign rd_addr = inst[11:7] & 4'hF;
    
    // 指令解码和控制信号生成
    always @(*) begin
        // 默认值
        alu_op = 4'b0000;
        mem_read = 1'b0;
        mem_write = 1'b0;
        reg_write = 1'b0;
        alu_src = 1'b0;
        mem_to_reg = 1'b0;
        branch = 1'b0;
        jump = 1'b0;
        imm = 32'h0;
        
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
                    3'b011: alu_op = 4'b0100; // SLTIU
                    3'b100: alu_op = 4'b0101; // XORI
                    3'b101: alu_op = (funct7 == 7'b0000000) ? 4'b0110 : 4'b0111; // SRLI/SRAI
                    3'b110: alu_op = 4'b1000; // ORI
                    3'b111: alu_op = 4'b1001; // ANDI
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
                endcase
                imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
            end
            
            7'b1101111: begin // JAL
                reg_write = 1'b1;
                jump = 1'b1;
                alu_op = 4'b0000;
                imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
            end
            
            7'b1100111: begin // JALR
                reg_write = 1'b1;
                jump = 1'b1;
                alu_src = 1'b1;
                alu_op = 4'b0000;
                imm = {{20{inst[31]}}, inst[31:20]};
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
                alu_src = 1'b1;
                imm = {inst[31:12], 12'b0};
            end
            
            7'b1110011: begin // SYSTEM指令
                if (funct3 == 3'b000) begin
                    case (inst[31:20])
                        12'b000000000000: begin // ECALL
                            // ECALL实现...
                        end
                        
                        12'b000000000001: begin // EBREAK
                            // 这里实现EBREAK指令的控制信号
                            // 通常需要设置一个特殊的控制信号来触发调试处理
                            // 例如:
                            // ebreak_flag = 1'b1;
                        end
                        
                        // 其他SYSTE  // if(g_nr_guest_inst == 25){
    //   break;
    // }M指令...
                    endcase
                end
                // 其他系统指令...
            end
        endcase
    end
endmodule
