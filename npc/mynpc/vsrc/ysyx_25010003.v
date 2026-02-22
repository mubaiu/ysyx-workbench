module ysyx_25010003(
    input wire clock,
    input wire reset,
    input wire io_interrupt,

    // ===== Master 接口 =====
    input wire        io_master_arready,
    input wire        io_master_rvalid,
    input wire [31:0] io_master_rdata,
    input wire        io_master_rlast,
    input wire [3:0]  io_master_rid,
    input wire [1:0]  io_master_rresp,

    output wire       io_master_arvalid,
    output wire[31:0] io_master_araddr,
    output wire[3:0]  io_master_arid,
    output wire[7:0]  io_master_arlen,
    output wire[2:0]  io_master_arsize,
    output wire[1:0]  io_master_arburst,
    output wire       io_master_rready,
        
    input wire        io_master_awready,
    input wire        io_master_wready,
    input wire        io_master_bvalid,
    input wire [1:0]  io_master_bresp,
    input wire [3:0]  io_master_bid,

    output wire       io_master_awvalid,
    output wire [31:0]io_master_awaddr,
    output wire [3:0] io_master_awid,
    output wire [7:0] io_master_awlen,
    output wire [2:0] io_master_awsize,
    output wire [1:0] io_master_awburst,
    output wire       io_master_wvalid,
    output wire [31:0]io_master_wdata,
    output wire [3:0] io_master_wstrb,
    output wire       io_master_wlast,
    output wire       io_master_bready,

    // ===== Slave 接口 =====
    output wire       io_slave_arready,
    output wire       io_slave_rvalid,
    output wire [31:0]io_slave_rdata,
    output wire       io_slave_rlast,
    output wire [3:0] io_slave_rid,
    output wire [1:0] io_slave_rresp,

    input wire        io_slave_arvalid,
    input wire[31:0]  io_slave_araddr,
    input wire[3:0]   io_slave_arid,
    input wire[7:0]   io_slave_arlen,
    input wire[2:0]   io_slave_arsize,
    input wire[1:0]   io_slave_arburst,
    input wire        io_slave_rready,
    
    output wire       io_slave_awready,
    output wire       io_slave_wready,
    output wire       io_slave_bvalid,
    output wire [1:0] io_slave_bresp,
    output wire [3:0] io_slave_bid,

    input wire        io_slave_awvalid,
    input wire [31:0] io_slave_awaddr,
    input wire [3:0]  io_slave_awid,
    input wire [7:0]  io_slave_awlen,
    input wire [2:0]  io_slave_awsize,
    input wire [1:0]  io_slave_awburst,
    input wire        io_slave_wvalid,
    input wire [31:0] io_slave_wdata,
    input wire [3:0]  io_slave_wstrb,
    input wire        io_slave_wlast,
    input wire        io_slave_bready
);

    assign io_master_awid = 4'd0;
    assign io_master_awlen = 8'd0;
    assign io_master_awburst = 2'b00;
    // assign io_master_wlast = 1'b1;  // awlen=0时，每次传输1个数据，该数据即为最后一个
    assign io_master_arid = 4'd0;
    assign io_master_arlen = 8'd0;
    assign io_master_arburst = 2'b00;

    assign io_slave_arready = 1'b0;
    assign io_slave_rvalid = 1'b0;
    assign io_slave_rdata = 32'd0;
    assign io_slave_rlast = 1'b0;
    assign io_slave_rid = 4'd0;
    assign io_slave_rresp = 2'b00;
    assign io_slave_awready = 1'b0;
    assign io_slave_wready = 1'b0;
    assign io_slave_bvalid = 1'b0;
    assign io_slave_bresp = 2'b00;
    assign io_slave_bid = 4'd0;

    // 内部连线
    wire [31:0] pc;
    wire [31:0] inst_out;
    wire        inst_valid;
    wire        idu_ready;
    wire        lsu_ready;
    wire        wbu_ready;
    wire [31:0] snpc;  // 静态下一个PC
    
    // 寄存器接口连线（RV32E使用4位地址）
    wire [3:0]  rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire        reg_write;
    
    // 指令解码连线
    wire [31:0] imm;
    wire [3:0]  alu_op;
    wire        mem_read, mem_write, alu_src, mem_to_reg, branch, jal_en, 
                jalr_en, ebreak_en, ecall_en, mret_en, auipc_flag, is_csr_op;
    wire [3:0]  lsu_wmask;

    // 执行单元连线
    wire [31:0] alu_result;
    wire        branch_taken;
    wire [31:0] branch_target;
    wire        ecall_taken;
    wire [31:0] ecall_target;
    wire        mret_taken;
    wire [31:0] mret_target;

    // 内存单元连线
    wire [31:0] load_data;
    wire [2:0]  funct3;

    // ===== IFU Arbiter 接口 =====
    wire        io_ifu_arvalid;  //AR
    wire [31:0] io_ifu_araddr;
    wire        io_ifu_rready;   //R
    wire [31:0] io_ifu_rdata;
    wire        io_ifu_rvalid;
    wire [1:0]  io_ifu_rresp;
    wire [31:0] io_ifu_awaddr;   //AW
    wire        io_ifu_awvalid;
    wire [31:0] io_ifu_wdata;    //W
    wire [3:0]  io_ifu_wstrb;
    wire        io_ifu_wvalid;
    wire        io_ifu_bready;   //B

    // ===== LSU Arbiter 接口 =====
    wire        io_lsu_arvalid;  //AR
    wire [31:0] io_lsu_araddr;
    wire [2:0]  io_lsu_arsize;
    wire        io_lsu_rready;   //R
    wire [31:0] io_lsu_rdata;
    wire        io_lsu_rvalid;
    wire [1:0]  io_lsu_rresp;
    wire [31:0] io_lsu_awaddr;   //AW
    wire        io_lsu_awvalid;
    wire [2:0]  io_lsu_awsize;
    wire [31:0] io_lsu_wdata;    //W
    wire [3:0]  io_lsu_wstrb;
    wire        io_lsu_wvalid;
    wire        io_lsu_wlast;
    wire        io_lsu_bready;   //B
    wire [1:0]  io_lsu_bresp;
    wire        io_lsu_bvalid;

    // ===== CLINT Arbiter 接口 =====
    wire        io_clint_arready;
    wire        io_clint_rvalid;
    wire [31:0] io_clint_rdata;
    wire [1:0]  io_clint_rresp;
    wire        io_clint_arvalid;
    wire [31:0] io_clint_araddr;
    wire        io_clint_rready;
    wire        io_clint_awready;
    wire        io_clint_wready;
    wire        io_clint_bvalid;
    wire [1:0]  io_clint_bresp;
    wire        io_clint_awvalid;
    wire [31:0] io_clint_awaddr;
    wire        io_clint_wvalid;
    wire [31:0] io_clint_wdata;
    wire [3:0]  io_clint_wstrb;
    wire        io_clint_bready;

    // 指令获取单元
    IFU ysyx_25010003_IFU(
        .clock              (clock),
        .reset              (reset),

        .io_clint_arvalid   (io_clint_arvalid),
        .io_clint_arready   (io_clint_arready),
        
        .io_master_arready  (io_master_arready),
        .io_master_awready  (io_master_awready),
        .io_master_wready   (io_master_wready),
        .io_master_arvalid  (io_master_arvalid),
        .io_master_awvalid  (io_master_awvalid),
        .io_master_wvalid   (io_master_wvalid),

        //===== 分支控制信号 =====
        .mret_taken         (mret_taken),
        .mret_target        (mret_target),
        .ecall_taken        (ecall_taken),
        .ecall_target       (ecall_target),
        .branch_taken       (branch_taken),
        .branch_target      (branch_target),
        .pc                 (pc),
        .snpc               (snpc),

        .inst_valid         (inst_valid),
        .mem_read           (mem_read),
        .mem_write          (mem_write),
        .inst               (inst_out),

        // ===== IFU Arbiter 接口 =====
        .io_ifu_arvalid     (io_ifu_arvalid),
        .io_ifu_araddr      (io_ifu_araddr),
        .io_ifu_rready      (io_ifu_rready),
        .io_ifu_rdata       (io_ifu_rdata),
        .io_ifu_rvalid      (io_ifu_rvalid),
        .io_ifu_rresp       (io_ifu_rresp),
        .io_ifu_awaddr      (io_ifu_awaddr),
        .io_ifu_awvalid     (io_ifu_awvalid),
        .io_ifu_wdata       (io_ifu_wdata),
        .io_ifu_wstrb       (io_ifu_wstrb),
        .io_ifu_wvalid      (io_ifu_wvalid),
        .io_ifu_bready      (io_ifu_bready),

        // ===== LSU Arbiter 接口 =====
        .io_lsu_arvalid     (io_lsu_arvalid),
        .io_lsu_rready      (io_lsu_rready),
        .io_lsu_rvalid      (io_lsu_rvalid),
        .io_lsu_awvalid     (io_lsu_awvalid),
        .io_lsu_wvalid      (io_lsu_wvalid),
        .io_lsu_wlast       (io_lsu_wlast),
        .io_lsu_bready      (io_lsu_bready),
        .io_lsu_bvalid      (io_lsu_bvalid)
    );
    
    Arbiter ysyx_25010003_Arbiter(
        .clock              (clock),
        .reset              (reset),
        // ===== IFU Master 接口 =====
        .io_ifu_arvalid     (io_ifu_arvalid), //AR
        .io_ifu_araddr      (io_ifu_araddr),
        .io_ifu_rready      (io_ifu_rready),  //R
        .io_ifu_rdata       (io_ifu_rdata),
        .io_ifu_rvalid      (io_ifu_rvalid),
        .io_ifu_rresp       (io_ifu_rresp),
        .io_ifu_awaddr      (io_ifu_awaddr),  //AW
        .io_ifu_awvalid     (io_ifu_awvalid),
        .io_ifu_wdata       (io_ifu_wdata),   //W
        .io_ifu_wstrb       (io_ifu_wstrb),
        .io_ifu_wvalid      (io_ifu_wvalid),
        .io_ifu_bready      (io_ifu_bready),  //B

        // ===== LSU Master 接口 =====
        .io_lsu_arvalid     (io_lsu_arvalid),  //AR
        .io_lsu_araddr      (io_lsu_araddr),
        .io_lsu_arsize      (io_lsu_arsize),
        .io_lsu_rready      (io_lsu_rready),   //R
        .io_lsu_rdata       (io_lsu_rdata),
        .io_lsu_rvalid      (io_lsu_rvalid),
        .io_lsu_rresp       (io_lsu_rresp),
        .io_lsu_awvalid     (io_lsu_awvalid),  //AW
        .io_lsu_awaddr      (io_lsu_awaddr),
        .io_lsu_awsize      (io_lsu_awsize),
        .io_lsu_wvalid      (io_lsu_wvalid),   //W
        .io_lsu_wlast       (io_lsu_wlast),
        .io_lsu_wdata       (io_lsu_wdata),
        .io_lsu_wstrb       (io_lsu_wstrb),
        .io_lsu_bready      (io_lsu_bready),  //B
        .io_lsu_bresp       (io_lsu_bresp),
        .io_lsu_bvalid      (io_lsu_bvalid),

        // ===== CLINT 接口 =====
        .io_clint_arready   (io_clint_arready),
        .io_clint_rvalid    (io_clint_rvalid),
        .io_clint_rdata     (io_clint_rdata),
        .io_clint_rresp     (io_clint_rresp),
        
        .io_clint_arvalid   (io_clint_arvalid),
        .io_clint_araddr    (io_clint_araddr),
        .io_clint_rready    (io_clint_rready),
        
        .io_clint_awready   (io_clint_awready),
        .io_clint_wready    (io_clint_wready),
        .io_clint_bvalid    (io_clint_bvalid),
        .io_clint_bresp     (io_clint_bresp),
        
        .io_clint_awvalid   (io_clint_awvalid),
        .io_clint_awaddr    (io_clint_awaddr),
        .io_clint_wvalid    (io_clint_wvalid),
        .io_clint_wdata     (io_clint_wdata),
        .io_clint_wstrb     (io_clint_wstrb),
        .io_clint_bready    (io_clint_bready),

        // ===== Slave 接口 =====
        .io_master_arready  (io_master_arready),
        .io_master_rvalid   (io_master_rvalid),
        .io_master_rdata    (io_master_rdata),
        .io_master_rresp    (io_master_rresp),

        .io_master_arvalid  (io_master_arvalid),
        .io_master_araddr   (io_master_araddr),
        .io_master_arsize   (io_master_arsize),
        .io_master_rready   (io_master_rready),

        .io_master_awready  (io_master_awready),
        .io_master_wready   (io_master_wready),
        .io_master_bvalid   (io_master_bvalid),
        .io_master_bresp    (io_master_bresp),

        .io_master_awvalid  (io_master_awvalid),
        .io_master_awaddr   (io_master_awaddr),
        .io_master_awsize   (io_master_awsize),
        .io_master_wvalid   (io_master_wvalid),
        .io_master_wlast    (io_master_wlast),
        .io_master_wdata    (io_master_wdata),
        .io_master_wstrb    (io_master_wstrb),
        .io_master_bready   (io_master_bready)
    );

    CLINT ysyx_25010003_CLINT(
        .clock              (clock),
        .reset              (reset),

        //读地址/数据通道
        .io_slave_araddr    (io_clint_araddr),
        .io_slave_arvalid   (io_clint_arvalid),
        .io_slave_rready    (io_clint_rready),
        .io_slave_arready   (io_clint_arready),
        .io_slave_rdata     (io_clint_rdata),
        .io_slave_rresp     (io_clint_rresp),
        .io_slave_rvalid    (io_clint_rvalid),

        // 写地址/数据通道
        .io_slave_awaddr    (io_clint_awaddr),
        .io_slave_awvalid   (io_clint_awvalid),
        .io_slave_wdata     (io_clint_wdata),
        .io_slave_wstrb     (io_clint_wstrb),
        .io_slave_wvalid    (io_clint_wvalid),
        .io_slave_bready    (io_clint_bready),

        .io_slave_awready   (io_clint_awready),
        .io_slave_wready    (io_clint_wready),
        .io_slave_bresp     (io_clint_bresp),
        .io_slave_bvalid    (io_clint_bvalid)
    );

    // 指令解码单元
    IDU ysyx_25010003_IDU(
        .pc                 (pc),
        .reset              (reset),
        .inst               (inst_out),
        .inst_valid         (inst_valid),
        .rs1_addr           (rs1_addr),
        .rs2_addr           (rs2_addr),
        .rd_addr            (rd_addr),
        .imm                (imm),
        .lsu_wmask          (lsu_wmask),
        .alu_op             (alu_op),
        .ebreak_en          (ebreak_en),
        .ecall_en           (ecall_en),
        .mret_en            (mret_en),
        .mem_read           (mem_read),
        .mem_write          (mem_write),
        .reg_write          (reg_write),
        .alu_src            (alu_src),
        .funct3             (funct3),
        .branch             (branch),
        .jal_en             (jal_en),
        .jalr_en            (jalr_en),
        .auipc_flag         (auipc_flag),
        .is_csr_op          (is_csr_op),
        .idu_ready          (idu_ready)
    );
    
    // 寄存器模块
    REG ysyx_25010003_REG(
        .clock              (clock),
        .reset              (reset),
        .mem_to_reg         (mem_to_reg),
        .rs1_addr           (rs1_addr),
        .rs2_addr           (rs2_addr),
        .rd_addr            (rd_addr),
        .rd_data            (wb_data),
        .rd_wen             (reg_write),
        .rs1_data           (rs1_data),
        .rs2_data           (rs2_data)
    );
    
    // 执行单元
    EXU ysyx_25010003_EXU(
        .clock              (clock),
        .reset              (reset),
        .idu_ready          (idu_ready),
        .alu_op             (alu_op),
        .rs1_data           (rs1_data),
        .rs2_data           (rs2_data),
        .imm                (imm),
        .alu_src            (alu_src),
        .pc                 (pc),
        .branch             (branch),
        .jal_en             (jal_en),
        .jalr_en            (jalr_en),
        .ebreak_en          (ebreak_en),
        .ecall_en           (ecall_en),
        .mret_en            (mret_en),
        .mret_taken         (mret_taken),
        .mret_target        (mret_target),
        .ecall_taken        (ecall_taken),
        .ecall_target       (ecall_target),
        .auipc_flag         (auipc_flag),
        .is_csr_op          (is_csr_op),
        .alu_result         (alu_result),
        .branch_taken       (branch_taken),
        .branch_target      (branch_target)
    );
    
    // 加载/存储单元
    LSU ysyx_25010003_LSU(
        .clock              (clock),
        .reset              (reset),
        .lsu_wmask          (lsu_wmask),
        .io_lsu_rdata       (io_lsu_rdata),
        .io_lsu_rvalid      (io_lsu_rvalid),
        .mem_read           (mem_read),
        .mem_write          (mem_write),
        .addr               (alu_result),
        .funct3             (funct3),
        .store_data         (rs2_data),
        .load_data          (load_data),
        .io_lsu_araddr      (io_lsu_araddr),
        .io_lsu_awaddr      (io_lsu_awaddr),
        .io_lsu_wdata       (io_lsu_wdata),
        .lsu_ready          (lsu_ready),
        .mem_to_reg         (mem_to_reg),
        .io_lsu_arsize      (io_lsu_arsize),
        .io_lsu_awsize      (io_lsu_awsize),
        .io_lsu_wstrb       (io_lsu_wstrb)
    );
    
    // 写回单元
    WBU ysyx_25010003_WBU(
        .idu_ready          (idu_ready),
        .lsu_ready          (lsu_ready),
        .alu_result         (alu_result),
        .load_data          (load_data),
        .snpc               (snpc),
        .mem_to_reg         (mem_to_reg),
        .jal_en             (jal_en),
        .jalr_en            (jalr_en),
        .wb_data            (wb_data),
        .wbu_ready          (wbu_ready)
    );

`ifdef VERILATOR
import "DPI-C" function void set_callfunc();
import "DPI-C" function void set_retfunc();

// 性能计数器DPI-C函数
import "DPI-C" function void perf_alu_inst();
import "DPI-C" function void perf_branch_inst();
import "DPI-C" function void perf_csr_inst();
`endif

always @(posedge clock) begin
`ifdef VERILATOR
    if(jal_en)
        set_callfunc();
    if(jalr_en)
        set_retfunc();
`endif
end

// 指令类型性能计数器
always @(posedge clock) begin
`ifdef VERILATOR
    if (inst_valid && !reset) begin
        // 分支跳转指令
        if (branch_taken || jal_en || jalr_en)
            perf_branch_inst();

        // CSR指令
        if (is_csr_op)
            perf_csr_inst();

        // ALU计算指令（排除访存、分支、CSR指令）
        if (!mem_read && !mem_write && !branch_taken && !jal_en && !jalr_en && !is_csr_op)
            perf_alu_inst();
    end
`endif
end

endmodule
