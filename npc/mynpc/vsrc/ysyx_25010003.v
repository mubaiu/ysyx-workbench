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
    wire lsu_ready;
    wire wbu_ready;
    wire [31:0] snpc;  // 静态下一个PC
    // wire [31:0] dnpc;  // 动态下一个PC
    
    // 寄存器接口连线
    wire [4:0] rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire reg_write;
    
    // 指令解码连线
    wire [31:0] imm;
    wire [3:0] alu_op;
    wire lsu_reqValid, mem_read, mem_write, alu_src, mem_to_reg, branch, jal_en, jalr_en, ebreak_en, ecall_en, mret_en, auipc_flag, is_csr_op;
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
    IFU ysyx_25010003_IFU(
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
        // .dnpc(),
        .inst_valid(inst_valid),
        .idu_ready(idu_ready),
        .wbu_ready(wbu_ready),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .inst(inst_out),
        .io_ifu_reqValid(io_ifu_reqValid),
        .io_ifu_addr(io_ifu_addr)
    );
    
    // 指令解码单元
    IDU ysyx_25010003_IDU(
        .pc(pc),
        .reset(reset),
        .inst(inst_out),
        .inst_valid(inst_valid),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .imm(imm),
        .lsu_wmask(lsu_wmask),
        .alu_op(alu_op),
        .ebreak_en(ebreak_en),
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
    REG ysyx_25010003_REG(
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
    EXU ysyx_25010003_EXU(
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
        .ebreak_en(ebreak_en),
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
    LSU ysyx_25010003_LSU(
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
        .lsu_ready(lsu_ready),
        .mem_to_reg(mem_to_reg),
        .io_lsu_reqValid(io_lsu_reqValid),
        .io_lsu_size(io_lsu_size),
        .io_lsu_wmask(io_lsu_wmask)
    );
    
    // 写回单元
    WBU ysyx_25010003_WBU(
        .idu_ready(idu_ready),
        .lsu_ready(lsu_ready),
        .alu_result(alu_result),
        .load_data(load_data),
        .snpc(snpc),           // 使用snpc作为返回地址
        .mem_to_reg(mem_to_reg),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .wb_data(wb_data),
        .wbu_ready(wbu_ready)
    );

import "DPI-C" function void set_callfunc();
import "DPI-C" function void set_retfunc();


always @(posedge clock) begin
    if(jal_en)
        set_callfunc();
    if(jalr_en)
        set_retfunc();
end

endmodule
