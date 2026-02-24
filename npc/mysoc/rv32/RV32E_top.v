module RV32E_top(
    input wire clk,
    input wire rst,
    
    // 指令存储器接口
    input wire [31:0] inst,
    output wire [31:0] pc,
    
    // 数据存储器接口
    input wire [31:0] ram_rdata,
    output wire ram_we,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata
);

    // 内部连线
    wire [31:0] inst_out;
    wire [31:0] snpc;  // 静态下一个PC
    wire [31:0] dnpc;  // 动态下一个PC
    
    // 寄存器接口连线
    wire [3:0] rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire reg_write;
    
    // 指令解码连线
    wire [31:0] imm;
    wire [3:0] alu_op;
    wire mem_read, mem_write, alu_src, mem_to_reg, branch, jump;
    
    // 执行单元连线
    wire [31:0] alu_result;
    wire branch_taken;
    wire [31:0] branch_target;
    
    // 内存单元连线
    wire [31:0] load_data;
    
    // 指令获取单元
    IFU ifu(
        .clk(clk),
        .rst(rst),
        .branch_taken(branch_taken),
        .branch_target(branch_target),
        .pc(pc),
        .snpc(snpc),
        .dnpc(dnpc),
        .inst(inst),
        .inst_out(inst_out)
    );
    
    // 指令解码单元
    IDU idu(
        .inst(inst_out),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .imm(imm),
        .alu_op(alu_op),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .jump(jump),
        
    );
    
    // 寄存器模块
    REG reg_file(
        .clk(clk),
        .rst(rst),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .rd_data(wb_data),
        .rd_wen(reg_write),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );
    
    // 执行单元
    EXU exu(
        .alu_op(alu_op),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .alu_src(alu_src),
        .pc(pc),
        .branch(branch),
        .jump(jump),
        
        .alu_result(alu_result),
        .branch_taken(branch_taken),
        .branch_target(branch_target)
    );
    
    // 加载/存储单元
    LSU lsu(
        .clk(clk),
        .rst(rst),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(alu_result),         // 修正为addr而不是raddr
        .store_data(rs2_data),
        .load_data(load_data),
        .ram_we(ram_we),
        .ram_addr(ram_addr),       // 修正为ram_addr而不是ram_raddr
        .ram_wdata(ram_wdata),
        .ram_rdata(ram_rdata)
    );
    
    // 写回单元
    WBU wbu(
        .alu_result(alu_result),
        .load_data(load_data),
        .snpc(snpc),           // 使用snpc作为返回地址
        .mem_to_reg(mem_to_reg),
        .jump(jump),
        .wb_data(wb_data)
    );

endmodule
