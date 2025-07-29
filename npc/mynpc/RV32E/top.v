module top(
    input wire clk,
    input wire rst
);

    // PC相关信号
    wire [31:0] pc;        // 当前PC
    wire [31:0] snpc;      // 顺序下一个PC
    wire [31:0] dnpc;      // 实际下一个PC

    // 指令相关信号
    wire [31:0] inst;      // 当前指令

    // 控制信号
    wire reg_write;        // 寄存器写使能
    wire mem_to_reg;       // 存储器到寄存器
    wire mem_write;        // 存储器写使能
    wire mem_read;         // 存储器读使能
    wire [3:0] alu_op;     // ALU操作码
    wire alu_src;          // ALU源操作数选择
    wire branch;           // 分支指令
    wire jump;             // 跳转指令

    // ALU相关信号
    wire [31:0] rs1_data;  // 源寄存器1数据
    wire [31:0] rs2_data;  // 源寄存器2数据
    wire [31:0] imm;       // 立即数
    wire [31:0] alu_in2;   // ALU第二个输入
    wire [31:0] alu_result;// ALU结果
    wire zero;             // ALU结果是否为零

    // 寄存器索引
    wire [4:0] rs1;        // 源寄存器1索引
    wire [4:0] rs2;        // 源寄存器2索引
    wire [4:0] rd;         // 目标寄存器索引

    // 存储器数据
    wire [31:0] mem_data;  // 存储器读取的数据
    wire [31:0] wb_data;   // 写回数据

    // PC模块实例化
    pc pc_reg(
        .clk(clk),
        .rst(rst),
        .dnpc(dnpc),
        .pc(pc),
        .snpc(snpc)
    );

    // 指令存储器接口
    inst_mem imem(
        .clk(clk),        // 添加时钟连接
        .rst(rst),        // 添加复位连接
        .pc(pc),
        .inst(inst)
    );

    // 控制单元
    control ctrl(
        .inst(inst),
        .reg_write(reg_write),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .branch(branch),
        .jump(jump)
    );

    // 译码模块
    decode dec(
        .inst(inst),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm(imm)
    );

    // 寄存器堆
    regfile rf(
        .clk(clk),
        .rst(rst),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .we(reg_write),
        .wdata(wb_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    // 解码opcode和funct3
    wire [6:0] opcode = inst[6:0];
    wire [2:0] funct3 = inst[14:12];
    
    // JAL/JALR指令的返回地址 - 移动到前面
    wire [31:0] link_addr = snpc; // PC+4作为返回地址
    
    // 分支条件生成 - 确保使用阻塞赋值
    reg branch_taken;
    
    always @(*) begin
        if (branch) begin
            case (funct3)
                3'b000: branch_taken = zero;                // BEQ
                3'b001: branch_taken = !zero;               // BNE
                3'b100: branch_taken = alu_result[0];       // BLT
                3'b101: branch_taken = !alu_result[0];      // BGE
                3'b110: branch_taken = alu_result[0];       // BLTU
                3'b111: branch_taken = !alu_result[0];      // BGEU
                default: branch_taken = 0;
            endcase
        end else begin
            branch_taken = 0;
        end
    end
    
    // LUI指令特殊处理 - 需要直接传递立即数
    wire is_lui = (opcode == 7'b0110111);
    wire [31:0] lui_result = imm; // LUI直接使用立即数作为结果
    
    // ALU输入选择 - 针对AUIPC调整
    wire [31:0] alu_in1;
    wire is_auipc = (opcode == 7'b0010111);
    assign alu_in1 = is_auipc ? pc : rs1_data;
    assign alu_in2 = alu_src ? imm : rs2_data;

    // ALU模块
    alu alu_unit(
        .alu_op(alu_op),
        .in1(alu_in1),
        .in2(alu_in2),
        .out(alu_result),
        .zero(zero)
    );

    // 数据存储器接口
    data_mem dmem(
        .clk(clk),
        .addr(alu_result),
        .wdata(rs2_data),
        .we(mem_write),
        .re(mem_read),
        .funct3(funct3),  // 传递funct3给数据存储器
        .rdata(mem_data)
    );

    // 写回数据选择 - 增加LUI特殊处理
    assign wb_data = is_lui ? lui_result :
                     jump ? link_addr : 
                     mem_to_reg ? mem_data : alu_result;

    // 下一个PC计算 - 使用新的分支条件
    wire jalr = (opcode == 7'b1100111);
    assign dnpc = jalr ? {alu_result[31:1], 1'b0} :        // JALR: (rs1+imm)清除最低位
                 (branch_taken || jump) ? (pc + imm) : snpc;

    // DPI-C接口增强，确保所有寄存器状态可访问
    import "DPI-C" function void set_pc(input int pc);
    import "DPI-C" function void set_snpc(input int snpc);
    import "DPI-C" function void set_dnpc(input int dnpc);
    
    // 添加寄存器访问接口
    import "DPI-C" function void set_gpr_ptr(input int gpr_0, input int gpr_1, input int gpr_2,
                                             input int gpr_3, input int gpr_4, input int gpr_5,
                                             input int gpr_6, input int gpr_7, input int gpr_8,
                                             input int gpr_9, input int gpr_10, input int gpr_11,
                                             input int gpr_12, input int gpr_13, input int gpr_14,
                                             input int gpr_15);

    // 更新PC状态和寄存器状态的接口
    always @(posedge clk) begin
        set_pc(pc);
        set_snpc(snpc);
        set_dnpc(dnpc);
        
        // 传递所有寄存器值
        set_gpr_ptr(rf.regs[0], rf.regs[1], rf.regs[2], rf.regs[3],
                    rf.regs[4], rf.regs[5], rf.regs[6], rf.regs[7],
                    rf.regs[8], rf.regs[9], rf.regs[10], rf.regs[11],
                    rf.regs[12], rf.regs[13], rf.regs[14], rf.regs[15]);
    end

endmodule
