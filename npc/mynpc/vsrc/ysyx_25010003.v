module ysyx_25010003(
    input wire clock,
    input wire reset,
    
    // 指令存储器接口
    input wire io_ifu_respValid, 
    input wire [31:0] io_ifu_rdata,
    output wire io_ifu_reqValid,
    output wire [31:0] io_ifu_addr,

    
    // 数据存储器接口
    input wire io_lsu_respValid,
    input wire [31:0] io_lsu_rdata,
    output wire io_lsu_reqValid,
    output wire [31:0] io_lsu_addr,
    output wire [1:0] io_lsu_size,
    output wire io_lsu_wen,
    output wire [31:0] io_lsu_wdata,
    output wire [3:0] io_lsu_wmask
);

    // 内部连线
    wire [31:0] pc;
    wire [31:0] inst_out;
    wire inst_valid;
    wire idu_ready;
    wire [31:0] snpc;  // 静态下一个PC
    // wire [31:0] dnpc;  // 动态下一个PC
    
    // 寄存器接口连线
    wire [3:0] rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire reg_write;
    
    // 指令解码连线
    wire [31:0] imm;
    wire [3:0] alu_op;
    wire lsu_reqValid, mem_read, mem_write, alu_src, mem_to_reg, branch, jal_en, jalr_en, ecall_en, mret_en, auipc_flag, is_csr_op;
    wire [3:0] lsu_wmask;

    // 执行单元连线
    wire [31:0] alu_result;
    wire branch_taken;
    wire [31:0] branch_target;
    wire ecall_taken;
    wire [31:0] ecall_target;
    wire mret_taken;
    wire [31:0] mret_target;

    // 内存单元连线
    wire [31:0] load_data;
    wire [2:0] funct3;
    
    // 指令获取单元
    ysyx_25010003_IFU ysyx_25010003_IFU(
        .clock(clock),
        .reset(reset),
        .io_ifu_respValid(io_ifu_respValid),
        .io_ifu_rdata(io_ifu_rdata),
        .io_lsu_respValid(io_lsu_respValid),
        .io_lsu_reqValid(io_lsu_reqValid),
        .mret_taken(mret_taken),
        .mret_target(mret_target),
        .ecall_taken(ecall_taken),
        .ecall_target(ecall_target),
        .branch_taken(branch_taken),
        .branch_target(branch_target),
        .pc(pc),
        .snpc(snpc),
        .inst_valid(inst_valid),
        .inst(inst_out),
        .io_ifu_reqValid(io_ifu_reqValid),
        .io_ifu_addr(io_ifu_addr)
    );
    
    // 指令解码单元
    ysyx_25010003_IDU ysyx_25010003_IDU(
        .inst(inst_out),
        .inst_valid(inst_valid),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .imm(imm),
        .lsu_wmask(lsu_wmask),
        .alu_op(alu_op),
        .ecall_en(ecall_en),
        .mret_en(mret_en),
        .lsu_reqValid(lsu_reqValid),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .funct3(funct3),
        .branch(branch),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .auipc_flag(auipc_flag),
        .is_csr_op(is_csr_op),
        .idu_ready(idu_ready)
    );
    
    // 寄存器模块
    ysyx_25010003_REG ysyx_25010003_REG(
        .clock(clock),
        .reset(reset),
        .mem_to_reg(mem_to_reg),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .rd_data(wb_data),
        .rd_wen(reg_write),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );
    
    // 执行单元
    ysyx_25010003_EXU ysyx_25010003_EXU(
        // .snpc(snpc),
        .clock(clock),
        .reset(reset),
        .idu_ready(idu_ready),
        .alu_op(alu_op),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .alu_src(alu_src),
        .pc(pc),
        .branch(branch),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .ecall_en(ecall_en),
        .mret_en(mret_en),
        .mret_taken(mret_taken),
        .mret_target(mret_target),
        .ecall_taken(ecall_taken),
        .ecall_target(ecall_target),
        .auipc_flag(auipc_flag),
        .is_csr_op(is_csr_op),
        .alu_result(alu_result),
        .branch_taken(branch_taken),
        .branch_target(branch_target)
    );
    
    // 加载/存储单元
    ysyx_25010003_LSU ysyx_25010003_LSU(
        .clock(clock),
        .reset(reset),
        .lsu_wmask(lsu_wmask),
        .io_lsu_rdata(io_lsu_rdata),
        .io_lsu_respValid(io_lsu_respValid),
        .lsu_reqValid(lsu_reqValid),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(alu_result),
        .funct3(funct3),
        .store_data(rs2_data),
        .load_data(load_data),
        .io_lsu_wen(io_lsu_wen),
        .io_lsu_addr(io_lsu_addr),
        .io_lsu_wdata(io_lsu_wdata),
        .mem_to_reg(mem_to_reg),
        .io_lsu_reqValid(io_lsu_reqValid),
        .io_lsu_size(io_lsu_size),
        .io_lsu_wmask(io_lsu_wmask)
    );
    
    // 写回单元
    ysyx_25010003_WBU ysyx_25010003_WBU(
        .alu_result(alu_result),
        .load_data(load_data),
        .snpc(snpc),           // 使用snpc作为返回地址
        .mem_to_reg(mem_to_reg),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .wb_data(wb_data)
    );


endmodule

/* verilator lint_off DECLFILENAME */
module ysyx_25010003_EXU(
    input wire clock,
    input wire reset,
    // ALU控制信号
    input wire [3:0] alu_op,
    input wire ecall_en,  // ECALL使能信号
    input wire mret_en,   // MRET使能信号
    input wire idu_ready,
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


    wire [31:0] operand_a;
    wire [31:0] operand_b;
    
    //rtthread相关
    wire [31:0] csr_read_data;
    reg [31:0] mstatus;
    reg [31:0] mepc;
    reg [31:0] mcause;
    reg [31:0] mtvec;
    reg [31:0] mcycle;
    reg [31:0] mcycleh;
    reg [31:0] mvendorid;
    reg [31:0] marchid;


    assign csr_read_data = (imm == 32'h300) ? mstatus :
                          (imm == 32'h341) ? mepc :
                          (imm == 32'h342) ? mcause :
                          (imm == 32'h305) ? mtvec :
                          (imm == 32'hB00) ? mcycle :
                          (imm == 32'hB80) ? mcycleh :
                          (imm == 32'hF11) ? mvendorid :
                          (imm == 32'hF12) ? marchid : 32'h0;
    
    // AUIPC指令的特征是使用加法操作(alu_op=0000)和立即数alu_result(alu_src=1)，但不是跳转指令
    assign operand_a = (jal_en | auipc_flag ) ? pc : rs1_data;
    assign operand_b = alu_src ? imm : rs2_data;  // 使用立即数作为偏移量         // 使用立即数作为偏移量
    
    // 分支目标计算
    // JALR指令：pc = rs1 + imm (需要将最低位清零)
    // JAL/分支指令：pc = pc + imm
    assign branch_target = (!idu_ready) ? ((jal_en | jalr_en) ? 
                        (alu_op == 4'b0000 && alu_src && jal_en) ? (pc + imm) :    // JAL: pc + imm
                        (rs1_data + imm) & 32'hFFFFFFFE :                // JALR: (rs1 + imm) & ~1
                        (pc + imm)) : 32'h0;                     // 分支指令: pc + imm
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

    assign branch_taken = (!idu_ready) ? (branch && branch_cond) || (jal_en | jalr_en) : 1'b0;

    // ALU操作
    always @(*) begin
        alu_result = 32'h0;
        if(!idu_ready) begin
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
        else begin
            alu_result = 32'h0;
        end
    end

    //rt-thread
    always @(*) begin
        if (mret_en && !idu_ready) begin
            mret_taken = 1'b1;
            mret_target = mepc;  // 跳转到mepc保存的地址
        end
        else begin
            mret_taken = 1'b0;
            mret_target = 32'h0;
        end
    end

    always @(*) begin
        if (ecall_en && !idu_ready) begin
            ecall_taken = 1'b1;
            ecall_target = mtvec; // 跳转到mtvec地址
        end
        else begin
            ecall_taken = 1'b0;
            ecall_target = 32'h0;
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            mstatus <= 32'h1800;
            mepc <= 32'h0;
            mcause <= 32'h0;
            mtvec <= 32'h80000004;  // 设置默认异常处理地址
            mcycle <= 32'h0;
            mcycleh <= 32'h0;
            mvendorid <= 32'h79737978; // 'ysyx'
            marchid <= 32'h17d9f53; // '25010003'
        end
        else begin
            if (ecall_en) begin
                mepc <= pc;            // 保存当前PC到mepc
                mcause <= 32'd11;      // 设置mcause为ECALL异常码
                // etrace_exception(32'd11, pc, mtvec);
            end
            else if (is_csr_op) begin
                case (imm)
                    32'h300: mstatus <= rs1_data; // 写入mstatus
                    32'h341: mepc <= rs1_data;    // 写入mepc
                    32'h342: mcause <= rs1_data;  // 写入mcause
                    32'h305: mtvec <= rs1_data;   // 写入mtvec
                    // 32'hB00: mcycle <= rs1_data;  // 写入mcycle
                    // 32'hB80: mcycleh <= rs1_data; // 写入mcycleh
                    default: ; // 其他CSR寄存器忽略写操作
                endcase
            end
            {mcycleh, mcycle} <= {mcycleh, mcycle} + 64'h1;
        end
    end


endmodule

module ysyx_25010003_IDU(
    input wire [31:0] inst,
    input wire inst_valid,

    // 寄存器地址输出
    output reg [3:0] rs1_addr,
    output reg [3:0] rs2_addr,
    output reg [3:0] rd_addr,

    // 立即数生成
    output reg [31:0] imm,
    
    // 控制信号
    output reg [3:0] lsu_wmask,
    output reg [3:0] alu_op,
    output reg lsu_reqValid,
    output reg mem_read,
    output reg mem_write,
    output reg reg_write,
    output reg alu_src,
    output reg branch,
    output reg jal_en,
    output reg jalr_en,
    output reg ecall_en,  // ECALL使能信号
    output reg mret_en,   // MRET使能信号
    // output wire [6:0] opcode
    output reg [2:0] funct3,
    output reg auipc_flag,
    output reg is_csr_op,
    output wire idu_ready
);


    // 指令类型和操作码
    reg [6:0] opcode;
    // wire [2:0] funct3;
    reg [6:0] funct7;

    assign idu_ready = !inst_valid;

    // assign opcode = inst[6:0];
    // assign funct3 = inst[14:12];
    // assign funct7 = inst[31:25];

    // // 寄存器地址提取
    // assign rs1_addr = inst[19:15] & 5'hF; // RV32E只有16个寄存器
    // assign rs2_addr = inst[24:20] & 5'hF;
    // assign rd_addr = inst[11:7] & 5'hF;

    // 指令解码和控制信号生成
    always @(*) begin
        // 默认值
        opcode = inst[6:0];
        funct3 = inst[14:12];
        funct7 = inst[31:25];
        rs1_addr = inst[18:15] & 4'hF; // RV32E只有16个寄存器
        rs2_addr = inst[23:20] & 4'hF;
        rd_addr = inst[10:7] & 4'hF;
        
        lsu_wmask = 4'b0;
        alu_op = 4'b0000;
        lsu_reqValid = 1'b0;
        mem_read = 1'b0;
        mem_write = 1'b0;
        reg_write = 1'b0;
        alu_src = 1'b0;
        auipc_flag = 1'b0;
        ecall_en = 1'b0;
        mret_en = 1'b0;
        branch = 1'b0;
        jal_en = 1'b0;
        jalr_en = 1'b0;
        imm = 32'h0;
        is_csr_op = 1'b0;
    if(inst_valid) begin
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
                    3'b011: alu_op = (imm == 32'h0) ? 4'b1011 : 4'b0100; // SEQZ/SLTIU
                    3'b100: alu_op = 4'b0101; // XORI
                    3'b101: alu_op = (funct7 == 7'b0000000) ? 4'b0110 : 4'b0111; // SRLI/SRAI
                    3'b110: alu_op = 4'b1000; // ORI
                    3'b111: alu_op = 4'b1001; // ANDI
                endcase
            end

            7'b0000011: begin // Load
                alu_src = 1'b1;
                lsu_reqValid = 1'b1;
                mem_read = 1'b1;
                alu_op = 4'b0000; // 加法计算地址
                imm = {{20{inst[31]}}, inst[31:20]};

            end

            7'b0100011: begin // Store
                alu_src = 1'b1;
                lsu_reqValid = 1'b1;
                mem_write = 1'b1;
                alu_op = 4'b0000; // 加法计算地址
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
                case (funct3)
                    3'b000: lsu_wmask = 4'b0001; // lb - load byte (sign extended)
                    3'b001: lsu_wmask = 4'b0011; // lh - load halfword (sign extended)
                    3'b010: lsu_wmask = 4'b1111; // lw
                    default: lsu_wmask = 4'b1111; // 默认按字读取
                endcase
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
                    default: alu_op = 4'b0000;
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
                            ecall_en = 1'b0;
                        end
                        12'b001100000010: begin // MRET
                            mret_en = 1'b1; // 设置MRET标志
                        end
                        default: begin
                            ecall_en = 1'b0;
                            mret_en = 1'b0;
                        end
                    endcase
                end
                else if (funct3 == 3'b001) begin // CSRRW
                    reg_write = 1'b1;
                    is_csr_op = 1'b1;
                    alu_op = 4'b1100; // 直通操作
                    imm = {{20{1'b0}}, inst[31:20]};
                end 
                else if (funct3 == 3'b010) begin // CSRRS
                    reg_write = 1'b1;
                    is_csr_op = (rs1_addr != 4'h0) ? 1'b1 : 1'b0; // 如果rs1_addr为0，则不写回
                    alu_op = 4'b1100; // 直通操作
                    imm = {{20{1'b0}}, inst[31:20]};
                end 
                else begin
                    reg_write = 1'b0;
                    is_csr_op = 1'b0;
                    alu_op = 4'b0000;
                    imm = 32'h0;
                end
            end
                // 其他系统指令...
            
            
            default: begin
                lsu_wmask = 4'b0;
                alu_op = 4'b0000;
                lsu_reqValid = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                reg_write = 1'b0;
                alu_src = 1'b0;
                auipc_flag = 1'b0;
                ecall_en = 1'b0;
                mret_en = 1'b0;
                branch = 1'b0;
                jal_en = 1'b0;
                jalr_en = 1'b0;
                imm = 32'h0;
                is_csr_op = 1'b0;
            end
        endcase
        
    end
    else begin
        lsu_wmask = 4'b0;
        alu_op = 4'b0000;
        lsu_reqValid = 1'b0;
        mem_read = 1'b0;
        mem_write = 1'b0;
        reg_write = 1'b0;
        alu_src = 1'b0;
        auipc_flag = 1'b0;
        ecall_en = 1'b0;
        mret_en = 1'b0;
        branch = 1'b0;
        jal_en = 1'b0;
        jalr_en = 1'b0;
        imm = 32'h0;
        is_csr_op = 1'b0;
    end
end

endmodule



module ysyx_25010003_IFU(
    input wire clock,
    input wire reset,
    input wire io_ifu_respValid,
    input wire [31:0] io_ifu_rdata,
    input wire io_lsu_reqValid, 
    input wire io_lsu_respValid, // 来自LSU的内存响应信号

    // 分支控制信号
    input wire mret_taken, // MRET跳转标志
    input wire [31:0] mret_target, // MRET跳转目标地址
    input wire ecall_taken,
    input wire [31:0] ecall_target,
    input wire branch_taken,
    input wire [31:0] branch_target,
    
    output reg [31:0] pc,
    output reg [31:0] snpc, // 静态下一个PC
    // output wire [31:0] dnpc, // 动态下一个PC
    output reg inst_valid,
    output reg io_ifu_reqValid,
    output wire [31:0] io_ifu_addr,
    output wire [31:0] inst // 从指令存储器获取的
);
    // 状态定义
    localparam IDLE = 3'd0;
    localparam FETCH = 3'd1;
    localparam WAIT = 3'd2;
    localparam EXECUTE = 3'd3;

    reg [31:0] dnpc; // 动态下一个PC
    reg [31:0] dnpc_reg;
    reg [2:0] state;
    reg [2:0] next_state;
    
    assign io_ifu_addr = pc;
    assign inst = io_ifu_rdata;

    always @(*) begin
        snpc = pc + 32'd4;
    end

    // 动态PC（考虑分支/跳转的下一个PC）
    always @(*) begin
        dnpc = mret_taken ? mret_target :  // MRET优先级最高
                    ecall_taken ? ecall_target : 
                    branch_taken ? branch_target : 
                    snpc;
    end

     // 下一状态逻辑
    always @(*) begin
          state = next_state;
    end


    // PC更新逻辑
    always @(posedge clock) begin
        if (reset) begin
            pc <= 32'h30000000;
            inst_valid <= 1'b0;
            io_ifu_reqValid <= 1'b0;
            next_state <= FETCH;
            dnpc_reg <= 32'h30000004;
        end 
        else begin
            case(state)
                IDLE: begin
                        io_ifu_reqValid <= 1'b0;
                        inst_valid <= 1'b0;
                        pc <= dnpc_reg;
                        next_state <= FETCH;
                end
                FETCH: begin
                    // inst_reg <= intake(pc);
                    io_ifu_reqValid <= 1'b1;
                    inst_valid <= 1'b0;
                    next_state <= WAIT;
                end
                WAIT: begin
                    io_ifu_reqValid <= 1'b0;
                    inst_valid <= 1'b0;
                    if(io_ifu_respValid) begin
                        inst_valid <= 1'b1;
                        next_state <= EXECUTE;
                    end
                    else if(io_lsu_respValid)
                        next_state <= IDLE;
                    else 
                        next_state <= WAIT;
                end
                EXECUTE: begin
                    io_ifu_reqValid <= 1'b0;
                    inst_valid <= 1'b1;
                    dnpc_reg <= dnpc;
                    if (io_lsu_reqValid) begin
                        next_state <= WAIT; 
                        inst_valid <= 1'b0;       
                    end
                    else begin
                        next_state <= IDLE;
                        inst_valid <= 1'b0;
                    end
                end
                default: ;
            endcase
        end
    end


endmodule

module ysyx_25010003_LSU(
    input wire clock,
    input wire reset,
    // 内存控制信号
    input wire [31:0] io_lsu_rdata,
    input wire io_lsu_respValid,
    input wire lsu_reqValid,
    input wire mem_read,
    input wire mem_write,
    input wire [2:0] funct3, 
    // 地址和数据
    input wire [31:0] addr,
    input wire [3:0] lsu_wmask, 
    input wire [31:0] store_data,
    output reg [31:0] load_data,
    output wire mem_to_reg,
    // RAM接口
    output wire io_lsu_wen,
    output wire [31:0] io_lsu_addr,
    output wire [31:0] io_lsu_wdata,
    output wire io_lsu_reqValid,
    output reg [1:0] io_lsu_size,
    output wire [3:0] io_lsu_wmask
);

    // RAM控制信号
    assign io_lsu_wen = mem_write;
    assign io_lsu_addr = addr;
    assign io_lsu_wdata = io_lsu_wdata_reg; 
    assign io_lsu_reqValid = lsu_reqValid;
    assign mem_to_reg = (io_lsu_respValid && load_flag) ? 1'b1 : 1'b0;

    assign io_lsu_wmask = io_lsu_wmask_reg;

    // Memory mem (
    //     .clk(clk),
    //     .we(mem_write),
    //     .re(mem_read),
    //     .addr(addr[9:2]), // 256个位置
    //     .byte_sel(addr[1:0]),
    //     .wdata(store_data),
    //     .funct3(funct3),
    //     .rdata(load_data)
    // );
    reg [1:0] addr_reg;
    reg load_flag;
    reg [3:0] io_lsu_wmask_reg;
    reg [31:0] io_lsu_wdata_reg;
    // reg [31:0] temp_data;

    always @(posedge clock) begin
         if (lsu_reqValid && mem_read)
            load_flag <= 1'b1;
        else if (io_lsu_respValid)
            load_flag <= 1'b0;
    end

    always @(posedge clock) begin
        if (reset)
            addr_reg <= 2'b0;
        else if (lsu_reqValid) begin
            addr_reg <= addr[1:0];  // 只存储需要的低2位
        end
    end

    always @(*) begin
        if (mem_read) begin
            // temp_data = vaddr_read(addr, len);
            io_lsu_size = (funct3 == 3'b000 || funct3 == 3'b100) ? 2'b00 : // byte
                      (funct3 == 3'b001 || funct3 == 3'b101) ? 2'b01 : // halfword
                      2'b10; // word
            io_lsu_wmask_reg = 4'b0000;
            io_lsu_wdata_reg = 32'b0;
        end
        else if (mem_write) begin
            io_lsu_size = (lsu_wmask == 4'b0001) ? 2'b00 : // byte
                      (lsu_wmask == 4'b0011) ? 2'b01 : // halfword
                      2'b10; // word
            case (lsu_wmask) 
                4'b0001: begin //SB
                    case (addr[1:0])
                        2'b00: io_lsu_wmask_reg = 4'b0001;  // 字节0
                        2'b01: io_lsu_wmask_reg = 4'b0010;  // 字节1
                        2'b10: io_lsu_wmask_reg = 4'b0100;  // 字节2
                        2'b11: io_lsu_wmask_reg = 4'b1000;  // 字节3
                    endcase
                end
                4'b0011: begin //SH
                    case (addr[1]) 
                        1'b0: io_lsu_wmask_reg = 4'b0011;  // 半字0-1
                        1'b1: io_lsu_wmask_reg = 4'b1100;  // 半字2-3
                    endcase
                end
                4'b1111: io_lsu_wmask_reg = 4'b1111; //SW
                default: io_lsu_wmask_reg = 4'b0000; // 默认按
            endcase

            case (lsu_wmask)
                4'b0001: begin
                    case (addr[1:0])
                        2'b00: io_lsu_wdata_reg = {24'b0, store_data[7:0]};  // 字节0
                        2'b01: io_lsu_wdata_reg = {16'b0, store_data[7:0], 8'b0};  // 字节1
                        2'b10: io_lsu_wdata_reg = {8'b0, store_data[7:0], 16'b0};  // 字节2
                        2'b11: io_lsu_wdata_reg = {store_data[7:0], 24'b0};  // 字节3
                    endcase
                end
                4'b0011: begin
                    case (addr[1])
                        1'b0: io_lsu_wdata_reg = {16'b0, store_data[15:0]};  // 半字0-1
                        1'b1: io_lsu_wdata_reg = {store_data[15:0], 16'b0};  // 半字2-3
                    endcase
                end
                4'b1111: io_lsu_wdata_reg = store_data; //SW
                default: io_lsu_wdata_reg = 32'b0; // 默认按
            endcase
        end
        else begin
            io_lsu_size = 2'b10;
            io_lsu_wmask_reg = 4'b0000;
            io_lsu_wdata_reg = 32'b0;
        end
    end

    always @(*) begin
        if (io_lsu_respValid && load_flag) begin
            case(funct3)
                3'b000: begin // lb
                    case (addr_reg[1:0])
                        2'b00: load_data = {{24{io_lsu_rdata[7]}}, io_lsu_rdata[7:0]};
                        2'b01: load_data = {{24{io_lsu_rdata[15]}}, io_lsu_rdata[15:8]};
                        2'b10: load_data = {{24{io_lsu_rdata[23]}}, io_lsu_rdata[23:16]};
                        2'b11: load_data = {{24{io_lsu_rdata[31]}}, io_lsu_rdata[31:24]};
                    endcase
                end
                3'b100: begin // lbu
                    case (addr_reg[1:0])
                        2'b00: load_data = {24'b0, io_lsu_rdata[7:0]};
                        2'b01: load_data = {24'b0, io_lsu_rdata[15:8]};
                        2'b10: load_data = {24'b0, io_lsu_rdata[23:16]};
                        2'b11: load_data = {24'b0, io_lsu_rdata[31:24]};
                    endcase
                end
                3'b001: begin // lh
                    case (addr_reg[1])
                        1'b0: load_data = {{16{io_lsu_rdata[15]}}, io_lsu_rdata[15:0]};
                        1'b1: load_data = {{16{io_lsu_rdata[31]}}, io_lsu_rdata[31:16]};
                    endcase
                end
                3'b101: begin // lhu
                    case (addr_reg[1])
                        1'b0: load_data = {16'b0, io_lsu_rdata[15:0]};
                        1'b1: load_data = {16'b0, io_lsu_rdata[31:16]};
                    endcase 
                end
                3'b010: load_data = io_lsu_rdata; // lw
                default: load_data = io_lsu_rdata;
            endcase
        end
        else begin
            load_data = 32'b0;
        end
    end

endmodule

module ysyx_25010003_REG(
    input wire clock,
    input wire reset,
    
    input wire mem_to_reg,
    // 读寄存器地址
    input wire [3:0] rs1_addr,
    input wire [3:0] rs2_addr,
    
    // 写寄存器地址和数据
    input wire [3:0] rd_addr,
    input wire [31:0] rd_data,
    input wire rd_wen,  // 写使能
    
    // 读出的寄存器数据
    output reg [31:0] rs1_data,
    output reg [31:0] rs2_data
);

  // 16个寄存器(RV32E)
  reg [31:0] registers [0:15];
  
  integer i;
  
  // 寄存器读取逻辑
  always @(*) begin
      if (reset) begin
          rs1_data = 32'h0;
          rs2_data = 32'h0;
      end 
      else begin
          // x0寄存器恒为0
          rs1_data = (rs1_addr == 4'h0) ? 32'h0 : registers[rs1_addr];
          rs2_data = (rs2_addr == 4'h0) ? 32'h0 : registers[rs2_addr];
      end
  end

  // 寄存器写入逻辑
  always @(posedge clock) begin
      if (reset) begin
          for (i = 0; i < 16; i = i + 1) begin
              registers[i] <= 32'h0;
          end
      end else if ((rd_wen || mem_to_reg) && rd_addr != 4'h0) begin
          // x0不可写
          registers[rd_addr] <= rd_data;
      end
  end

endmodule

module ysyx_25010003_WBU(
    // 写回数据选择
    input wire [31:0] alu_result,
    input wire [31:0] load_data,
    input wire [31:0] snpc,     // 静态PC，替代pc_plus4
    
    input wire mem_to_reg,
    input wire jal_en,
    input wire jalr_en,
    
    // 输出写回数据
    output reg [31:0] wb_data
);

always @(*) begin
        if (jal_en || jalr_en) begin
            wb_data = snpc;     // JAL/JALR指令存储返回地址
        end 
        else if (mem_to_reg) begin
            wb_data = load_data; // 加载指令
        end 
        else begin
            wb_data = alu_result; // ALU操作
        end
end

endmodule
