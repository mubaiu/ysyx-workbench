module top(
    input wire clk,
    input wire rst,
    
    // 指令存储器接口

    output wire [31:0] pc,
    
    // 数据存储器接口

    output wire ram_we,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata
);

    // 内部连线
    wire [31:0] inst_out;
    wire [31:0] snpc;  // 静态下一个PC
    // wire [31:0] dnpc;  // 动态下一个PC
    
    // 寄存器接口连线
    wire [4:0] rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire reg_write;
    
    // 指令解码连线
    wire [31:0] imm;
    wire [3:0] alu_op;
    wire mem_read, mem_write, alu_src, mem_to_reg, branch, jal_en, jalr_en, ebreak_en, ecall_en, auipc_flag, is_csr_op;
    
    // 执行单元连线
    wire [31:0] alu_result;
    wire branch_taken;
    wire [31:0] branch_target;
    wire ecall_taken;
    wire [31:0] ecall_target;
    
    // 内存单元连线
    wire [31:0] load_data;
    wire [2:0] funct3;
    
    // 指令获取单元
    IFU ifu(
        .clk(clk),
        .rst(rst),
        .ecall_taken(ecall_taken),
        .ecall_target(ecall_target),
        .branch_taken(branch_taken),
        .branch_target(branch_target),
        .pc(pc),
        .snpc(snpc),
        // .dnpc(),
        .inst(inst_out)
    );
    
    // 指令解码单元
    IDU idu(
        .pc(pc),
        // .rst(rst),
        .inst(inst_out),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .imm(imm),
        .alu_op(alu_op),
        .ebreak_en(ebreak_en),
        .ecall_en(ecall_en),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .funct3(funct3),
        .branch(branch),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .auipc_flag(auipc_flag),
        .is_csr_op(is_csr_op)
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
        // .snpc(snpc),
        .clk(clk),
        .rst(rst),
        .alu_op(alu_op),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .alu_src(alu_src),
        .pc(pc),
        .branch(branch),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .ebreak_en(ebreak_en),
        .ecall_en(ecall_en),
        .ecall_taken(ecall_taken),
        .ecall_target(ecall_target),
        .auipc_flag(auipc_flag),
        .is_csr_op(is_csr_op),
        .alu_result(alu_result),
        .branch_taken(branch_taken),
        .branch_target(branch_target)
    );
    
    // 加载/存储单元
    LSU lsu(
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(alu_result),
        .funct3(funct3),
        .store_data(rs2_data),
        .load_data(load_data),
        .ram_we(ram_we),
        .ram_addr(ram_addr),
        .ram_wdata(ram_wdata)
    );
    
    // 写回单元
    WBU wbu(
        .alu_result(alu_result),
        .load_data(load_data),
        .snpc(snpc),           // 使用snpc作为返回地址
        .mem_to_reg(mem_to_reg),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .wb_data(wb_data)
    );

import "DPI-C" function void set_callfunc();
import "DPI-C" function void set_retfunc();


always @(posedge clk) begin
    if(jal_en)
        set_callfunc();
    if(jalr_en)
        set_retfunc();
end

endmodule
