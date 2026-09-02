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
    wire [31:0] predicted_next;
    wire [31:0] snpc;  // 静态下一个PC

    // ===== 流水线控制信号 =====
    wire stall_IF, stall_ID, stall_EX, flush_IF, flush_ID, flush_EX, flush_LSU;
    wire lsu_busy, lsu_done, store_pending, store_buffered;
    wire load_hit_forwardable;
    wire load_use_interlock;

    // ===== IF/ID 流水线寄存器 =====
    wire [31:0] IF_ID_pc;
    wire [31:0] IF_ID_predicted_next;
    wire [31:0] IF_ID_inst;
    wire        IF_ID_inst_valid;

    // ===== ID/EX 流水线寄存器 =====
    wire        ID_EX_data_valid;
    wire [31:0] ID_EX_pc;
    wire [31:0] ID_EX_predicted_next;
    wire [31:0] ID_EX_inst;
    wire [31:0] ID_EX_rs1_data;
    wire [31:0] ID_EX_rs2_data;
    wire [31:0] ID_EX_imm;
    wire [3:0]  ID_EX_rs1_addr;
    wire [3:0]  ID_EX_rs2_addr;
    wire [3:0]  ID_EX_rd_addr;
    wire [3:0]  ID_EX_alu_op;
    wire        ID_EX_mem_read;
    wire        ID_EX_mem_write;
    wire        ID_EX_reg_write;
    wire        ID_EX_alu_src;
    wire        ID_EX_branch;
    wire        ID_EX_jal_en;
    wire        ID_EX_jalr_en;
    wire        ID_EX_ebreak_en;
    wire        ID_EX_ecall_en;
    wire        ID_EX_mret_en;
    wire        ID_EX_auipc_flag;
    wire        ID_EX_is_csr_op;
    wire        ID_EX_fence_i_en;
    wire [2:0]  ID_EX_funct3;
    wire [3:0]  ID_EX_lsu_wmask;

    // ===== EX/MEM 流水线寄存器 =====
    wire        EX_LSU_data_valid;
    wire [31:0] EX_LSU_pc;
    wire [31:0] EX_LSU_next_pc;
    wire [31:0] EX_LSU_inst;
    wire [31:0] EX_LSU_alu_result;
    wire [31:0] EX_LSU_rs2_data;
    wire [3:0]  EX_LSU_rd_addr;
    wire        EX_LSU_mem_read;
    wire        EX_LSU_mem_write;
    wire        EX_LSU_reg_write;
    wire        EX_LSU_ebreak;
    wire        EX_LSU_skip_ref;
    wire [2:0]  EX_LSU_funct3;
    wire [3:0]  EX_LSU_lsu_wmask;


    // ===== MEM/WB 流水线寄存器 =====
    wire        LSU_WB_data_valid;
    wire [31:0] LSU_WB_pc;
    wire [31:0] LSU_WB_next_pc;
    wire [31:0] LSU_WB_inst;
    wire [31:0] LSU_WB_alu_result;
    wire [31:0] LSU_WB_load_data;
    wire [3:0]  LSU_WB_rd_addr;
    wire        LSU_WB_reg_write;
    wire        LSU_WB_mem_to_reg;
    wire        LSU_WB_ebreak;
    wire        LSU_WB_skip_ref;

    // 寄存器接口连线（RV32E使用4位地址）
    wire [3:0]  rs1_addr, rs2_addr, rd_addr;
    wire [31:0] rs1_data, rs2_data, wb_data;
    wire        reg_write;
    
    // 指令解码连线（IDU输出）
    wire [31:0] imm;
    wire [3:0]  alu_op;
    wire        mem_read, mem_write, alu_src, branch, jal_en,
                jalr_en, ebreak_en, ecall_en, mret_en, fence_i_en, auipc_flag, is_csr_op;
    wire [3:0]  lsu_wmask;
    wire [2:0]  funct3;

    // 执行单元连线（EXU输出）
    wire [31:0] alu_result;
    wire        branch_taken;
    wire [31:0] branch_target;
    wire        ecall_taken;
    wire [31:0] ecall_target;
    wire        mret_taken;
    wire [31:0] mret_target;

    // An ID/EX instruction executes only when the occupied EX/LSU stage can
    // accept it.  In particular, a held branch/JALR must not redirect (and be
    // flushed) while an older memory transaction still owns EX/LSU.
    wire        ID_EX_fire = ID_EX_data_valid && !stall_EX;

    // ===== 退休元数据 =====
    wire [31:0] ID_EX_next_pc = mret_taken   ? mret_target :
                                 ecall_taken  ? ecall_target :
                                 branch_taken ? branch_target :
                                                ID_EX_pc + 32'd4;
    wire ID_EX_control = ID_EX_branch || ID_EX_jal_en || ID_EX_jalr_en;
    wire control_mispredict = ID_EX_fire && ID_EX_control &&
                              (ID_EX_next_pc != ID_EX_predicted_next);
    wire fence_redirect = ID_EX_fire && ID_EX_fence_i_en;
    wire frontend_redirect = control_mispredict || ecall_taken || mret_taken ||
                             fence_redirect;
    // MMIO 指令由 DUT 执行，退休时把 DUT 状态同步给参考模型。
    wire ID_EX_skip_ref = ID_EX_fire &&
                          (ID_EX_mem_read || ID_EX_mem_write) &&
                          (((alu_result >= 32'h02000000) && (alu_result < 32'h02010000)) ||
                           ((alu_result >= 32'h10000000) && (alu_result < 32'h10012000)) ||
                           ((alu_result >= 32'h21000000) && (alu_result < 32'h21200000)) ||
                           ((alu_result >= 32'h40000000) && (alu_result < 32'h80000000)));

    // 普通指令进入 WB 即完成；访存指令必须等到 AXI 响应后才能退休。
    wire EX_LSU_complete = EX_LSU_data_valid &&
                           (!(EX_LSU_mem_read || EX_LSU_mem_write) || lsu_done);

    // 内存单元连线（LSU输出）
    wire [31:0] load_data;
    wire        mem_to_reg;

    // ===== Forwarding 单元连线 =====
    wire [31:0] forward_a;
    wire [31:0] forward_b;

    // ===== IFU Arbiter 接口 =====
    wire        io_ifu_arvalid;  //AR
    wire [31:0] io_ifu_araddr;
    wire [7:0]  io_ifu_arlen;
    wire [1:0]  io_ifu_arburst;
    wire        io_ifu_arready;
    wire        io_ifu_rready;   //R
    wire [31:0] io_ifu_rdata;
    wire        io_ifu_rvalid;
    wire [1:0]  io_ifu_rresp;
    wire        io_ifu_rlast;
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
    wire        io_lsu_arready;
    wire        io_lsu_rready;   //R
    wire [31:0] io_lsu_rdata;
    wire        io_lsu_rvalid;
    wire [1:0]  io_lsu_rresp;
    wire [31:0] io_lsu_awaddr;   //AW
    wire        io_lsu_awvalid;
    wire [2:0]  io_lsu_awsize;
    wire        io_lsu_awready;
    wire [31:0] io_lsu_wdata;    //W
    wire [3:0]  io_lsu_wstrb;
    wire        io_lsu_wvalid;
    wire        io_lsu_wlast;
    wire        io_lsu_wready;
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
        .stall              (stall_IF),

        .io_clint_arvalid   (io_clint_arvalid),
        .io_clint_arready   (io_clint_arready),

        .redirect_valid     (flush_IF),
        .redirect_target    (ID_EX_next_pc),
        .resolve_valid      (ID_EX_fire),
        .resolve_pc         (ID_EX_pc),
        .resolve_inst       (ID_EX_inst),
        .resolve_next_pc    (ID_EX_next_pc),
        .resolve_branch_taken(branch_taken),
        .fence_i_en         (fence_redirect),
        .pc                 (pc),
        .snpc               (snpc),

        .inst_valid         (inst_valid),
        .inst               (inst_out),
        .predicted_next     (predicted_next),

        // ===== IFU Arbiter 接口 =====
        .io_ifu_arvalid     (io_ifu_arvalid),
        .io_ifu_araddr      (io_ifu_araddr),
        .io_ifu_arlen       (io_ifu_arlen),
        .io_ifu_arburst     (io_ifu_arburst),
        .io_ifu_arready     (io_ifu_arready),
        .io_ifu_rready      (io_ifu_rready),
        .io_ifu_rdata       (io_ifu_rdata),
        .io_ifu_rvalid      (io_ifu_rvalid),
        .io_ifu_rresp       (io_ifu_rresp),
        .io_ifu_rlast       (io_ifu_rlast),
        .io_ifu_awaddr      (io_ifu_awaddr),
        .io_ifu_awvalid     (io_ifu_awvalid),
        .io_ifu_wdata       (io_ifu_wdata),
        .io_ifu_wstrb       (io_ifu_wstrb),
        .io_ifu_wvalid      (io_ifu_wvalid),
        .io_ifu_bready      (io_ifu_bready)
    );

    // IF/ID 流水线寄存器
    IF_ID ysyx_25010003_IF_ID(
        .clock              (clock),
        .reset              (reset),
        .stall              (stall_ID),
        .flush              (flush_ID),
        .pc_in              (pc),
        .predicted_next_in  (predicted_next),
        .inst_in            (inst_out),
        .inst_valid_in      (inst_valid),
        .pc_out             (IF_ID_pc),
        .predicted_next_out (IF_ID_predicted_next),
        .inst_out           (IF_ID_inst),
        .inst_valid_out     (IF_ID_inst_valid)
    );

    Arbiter ysyx_25010003_Arbiter(
        .clock              (clock),
        .reset              (reset),
        // ===== IFU Master 接口 =====
        .io_ifu_arvalid     (io_ifu_arvalid), //AR
        .io_ifu_araddr      (io_ifu_araddr),
        .io_ifu_arlen       (io_ifu_arlen),
        .io_ifu_arburst     (io_ifu_arburst),
        .io_ifu_arready     (io_ifu_arready),
        .io_ifu_rready      (io_ifu_rready),  //R
        .io_ifu_rdata       (io_ifu_rdata),
        .io_ifu_rvalid      (io_ifu_rvalid),
        .io_ifu_rresp       (io_ifu_rresp),
        .io_ifu_rlast       (io_ifu_rlast),
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
        .io_lsu_arready     (io_lsu_arready),
        .io_lsu_rready      (io_lsu_rready),   //R
        .io_lsu_rdata       (io_lsu_rdata),
        .io_lsu_rvalid      (io_lsu_rvalid),
        .io_lsu_rresp       (io_lsu_rresp),
        .io_lsu_awvalid     (io_lsu_awvalid),  //AW
        .io_lsu_awaddr      (io_lsu_awaddr),
        .io_lsu_awsize      (io_lsu_awsize),
        .io_lsu_awready     (io_lsu_awready),
        .io_lsu_wvalid      (io_lsu_wvalid),   //W
        .io_lsu_wlast       (io_lsu_wlast),
        .io_lsu_wdata       (io_lsu_wdata),
        .io_lsu_wstrb       (io_lsu_wstrb),
        .io_lsu_wready      (io_lsu_wready),
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
        .io_master_rlast    (io_master_rlast),

        .io_master_arvalid  (io_master_arvalid),
        .io_master_araddr   (io_master_araddr),
        .io_master_arsize   (io_master_arsize),
        .io_master_arlen    (io_master_arlen),
        .io_master_arburst  (io_master_arburst),
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
        .pc                 (IF_ID_pc),
        .reset              (reset),
        .inst               (IF_ID_inst),
        .inst_valid         (IF_ID_inst_valid),
        .rs1_addr           (rs1_addr),
        .rs2_addr           (rs2_addr),
        .rd_addr            (rd_addr),
        .imm                (imm),
        .lsu_wmask          (lsu_wmask),
        .alu_op             (alu_op),
        .ebreak_en          (ebreak_en),
        .ecall_en           (ecall_en),
        .mret_en            (mret_en),
        .fence_i_en         (fence_i_en),
        .mem_read           (mem_read),
        .mem_write          (mem_write),
        .reg_write          (reg_write),
        .alu_src            (alu_src),
        .funct3             (funct3),
        .branch             (branch),
        .jal_en             (jal_en),
        .jalr_en            (jalr_en),
        .auipc_flag         (auipc_flag),
        .is_csr_op          (is_csr_op)
    );

    // ID/EX 流水线寄存器
    ID_EX ysyx_25010003_ID_EX(
        .clock              (clock),
        .reset              (reset),
        .stall              (stall_EX),
        .flush              (flush_EX),
        .data_valid_in      (IF_ID_inst_valid),    
        .pc_in              (IF_ID_pc),
        .predicted_next_in  (IF_ID_predicted_next),
        .inst_in            (IF_ID_inst),
        .rs1_data_in        (rs1_data),
        .rs2_data_in        (rs2_data),
        .imm_in             (imm),
        .rs1_addr_in        (rs1_addr),
        .rs2_addr_in        (rs2_addr),
        .rd_addr_in         (rd_addr),
        .wb_valid           (LSU_WB_data_valid && LSU_WB_reg_write),
        .wb_rd_addr         (LSU_WB_rd_addr),
        .wb_data            (wb_data),
        .alu_op_in          (alu_op),
        .mem_read_in        (mem_read),
        .mem_write_in       (mem_write),
        .reg_write_in       (reg_write),
        .alu_src_in         (alu_src),
        .branch_in          (branch),
        .jal_en_in          (jal_en),
        .jalr_en_in         (jalr_en),
        .ebreak_en_in       (ebreak_en),
        .ecall_en_in        (ecall_en),
        .mret_en_in         (mret_en),
        .auipc_flag_in      (auipc_flag),
        .is_csr_op_in       (is_csr_op),
        .fence_i_en_in      (fence_i_en),
        .funct3_in          (funct3),
        .lsu_wmask_in       (lsu_wmask),
        .data_valid_out     (ID_EX_data_valid),
        .pc_out             (ID_EX_pc),
        .predicted_next_out (ID_EX_predicted_next),
        .inst_out           (ID_EX_inst),
        .rs1_data_out       (ID_EX_rs1_data),
        .rs2_data_out       (ID_EX_rs2_data),
        .imm_out            (ID_EX_imm),
        .rs1_addr_out       (ID_EX_rs1_addr),
        .rs2_addr_out       (ID_EX_rs2_addr),
        .rd_addr_out        (ID_EX_rd_addr),
        .alu_op_out         (ID_EX_alu_op),
        .mem_read_out       (ID_EX_mem_read),
        .mem_write_out      (ID_EX_mem_write),
        .reg_write_out      (ID_EX_reg_write),
        .alu_src_out        (ID_EX_alu_src),
        .branch_out         (ID_EX_branch),
        .jal_en_out         (ID_EX_jal_en),
        .jalr_en_out        (ID_EX_jalr_en),
        .ebreak_en_out      (ID_EX_ebreak_en),
        .ecall_en_out       (ID_EX_ecall_en),
        .mret_en_out        (ID_EX_mret_en),
        .auipc_flag_out     (ID_EX_auipc_flag),
        .is_csr_op_out      (ID_EX_is_csr_op),
        .fence_i_en_out     (ID_EX_fence_i_en),
        .funct3_out         (ID_EX_funct3),
        .lsu_wmask_out      (ID_EX_lsu_wmask)
    );

    // 寄存器模块
    REG ysyx_25010003_REG(
        .clock              (clock),
        .reset              (reset),
        .mem_to_reg         (LSU_WB_mem_to_reg),
        .rs1_addr           (rs1_addr),
        .rs2_addr           (rs2_addr),
        .rd_addr            (LSU_WB_rd_addr),
        .rd_data            (wb_data),
        .rd_wen             (LSU_WB_reg_write),
        .rs1_data           (rs1_data),
        .rs2_data           (rs2_data)
    );
    
    // 执行单元
    EXU ysyx_25010003_EXU(
        .clock              (clock),
        .reset              (reset),
        .data_valid         (ID_EX_fire),
        .alu_op             (ID_EX_alu_op),
        .rs1_data           (forward_a),
        .rs2_data           (forward_b),
        .imm                (ID_EX_imm),
        .alu_src            (ID_EX_alu_src),
        .pc                 (ID_EX_pc),
        .branch             (ID_EX_branch),
        .jal_en             (ID_EX_fire && ID_EX_jal_en),
        .jalr_en            (ID_EX_fire && ID_EX_jalr_en),
        .ecall_en           (ID_EX_ecall_en),
        .mret_en            (ID_EX_mret_en),
        .mret_taken         (mret_taken),
        .mret_target        (mret_target),
        .ecall_taken        (ecall_taken),
        .ecall_target       (ecall_target),
        .auipc_flag         (ID_EX_auipc_flag),
        .is_csr_op          (ID_EX_is_csr_op),
        .alu_result         (alu_result),
        .branch_taken       (branch_taken),
        .branch_target      (branch_target)
    );

    // EX/LSU 流水线寄存器
    EX_LSU ysyx_25010003_EX_LSU(
        .clock              (clock),
        .reset              (reset),
        .stall              (1'b0),
        .flush              (flush_LSU),
        .data_valid_in      (ID_EX_fire),
        .pc_in              (ID_EX_pc),
        .next_pc_in         (ID_EX_next_pc),
        .inst_in            (ID_EX_inst),
        .alu_result_in      (alu_result),
        .rs2_data_in        (forward_b),
        .rd_addr_in         (ID_EX_rd_addr),
        .mem_read_in        (ID_EX_mem_read),
        .mem_write_in       (ID_EX_mem_write),
        .reg_write_in       (ID_EX_reg_write),
        .ebreak_in          (ID_EX_ebreak_en),
        .skip_ref_in        (ID_EX_skip_ref),
        .funct3_in          (ID_EX_funct3),
        .lsu_wmask_in       (ID_EX_lsu_wmask),
        .data_valid_out     (EX_LSU_data_valid),
        .pc_out             (EX_LSU_pc),
        .next_pc_out        (EX_LSU_next_pc),
        .inst_out           (EX_LSU_inst),
        .alu_result_out     (EX_LSU_alu_result),
        .rs2_data_out       (EX_LSU_rs2_data),
        .rd_addr_out        (EX_LSU_rd_addr),
        .mem_read_out       (EX_LSU_mem_read),
        .mem_write_out      (EX_LSU_mem_write),
        .reg_write_out      (EX_LSU_reg_write),
        .ebreak_out         (EX_LSU_ebreak),
        .skip_ref_out       (EX_LSU_skip_ref),
        .funct3_out         (EX_LSU_funct3),
        .lsu_wmask_out      (EX_LSU_lsu_wmask)
    );

    // 加载/存储单元
    LSU ysyx_25010003_LSU(
        .clock              (clock),
        .reset              (reset),
        .mem_read           (EX_LSU_mem_read),
        .mem_write          (EX_LSU_mem_write),
        .funct3             (EX_LSU_funct3),
        .addr               (EX_LSU_alu_result),
        .lsu_wmask          (EX_LSU_lsu_wmask),
        .store_data         (EX_LSU_rs2_data),
        .load_data          (load_data),
        .mem_to_reg         (mem_to_reg),
        .lsu_busy           (lsu_busy),
        .lsu_done           (lsu_done),
        .store_pending      (store_pending),
        .store_buffered     (store_buffered),
        .load_hit_forwardable(load_hit_forwardable),

        // ===== AXI读地址通道 =====
        .io_lsu_araddr      (io_lsu_araddr),
        .io_lsu_arsize      (io_lsu_arsize),
        .io_lsu_arvalid     (io_lsu_arvalid),
        .io_lsu_arready     (io_lsu_arready),

        // ===== AXI读数据通道 =====
        .io_lsu_rdata       (io_lsu_rdata),
        .io_lsu_rvalid      (io_lsu_rvalid),
        .io_lsu_rresp       (io_lsu_rresp),
        .io_lsu_rready      (io_lsu_rready),

        // ===== AXI写地址通道 =====
        .io_lsu_awaddr      (io_lsu_awaddr),
        .io_lsu_awsize      (io_lsu_awsize),
        .io_lsu_awvalid     (io_lsu_awvalid),
        .io_lsu_awready     (io_lsu_awready),

        // ===== AXI写数据通道 =====
        .io_lsu_wdata       (io_lsu_wdata),
        .io_lsu_wstrb       (io_lsu_wstrb),
        .io_lsu_wvalid      (io_lsu_wvalid),
        .io_lsu_wlast       (io_lsu_wlast),
        .io_lsu_wready      (io_lsu_wready),

        // ===== AXI写响应通道 =====
        .io_lsu_bresp       (io_lsu_bresp),
        .io_lsu_bvalid      (io_lsu_bvalid),
        .io_lsu_bready      (io_lsu_bready)
    );

    // LSU/WB 流水线寄存器
    LSU_WB ysyx_25010003_LSU_WB(
        .clock              (clock),
        .reset              (reset),
        .data_valid_in      (EX_LSU_complete),
        .pc_in              (EX_LSU_pc),
        .next_pc_in         (EX_LSU_next_pc),
        .inst_in            (EX_LSU_inst),
        .alu_result_in      (EX_LSU_alu_result),
        .load_data_in       (load_data),
        .rd_addr_in         (EX_LSU_rd_addr),
        .reg_write_in       (EX_LSU_reg_write),
        .mem_to_reg_in      (mem_to_reg),
        .ebreak_in          (EX_LSU_ebreak),
        .skip_ref_in        (EX_LSU_skip_ref),
        .data_valid_out     (LSU_WB_data_valid),
        .pc_out             (LSU_WB_pc),
        .next_pc_out        (LSU_WB_next_pc),
        .inst_out           (LSU_WB_inst),
        .alu_result_out     (LSU_WB_alu_result),
        .load_data_out      (LSU_WB_load_data),
        .rd_addr_out        (LSU_WB_rd_addr),
        .reg_write_out      (LSU_WB_reg_write),
        .mem_to_reg_out     (LSU_WB_mem_to_reg),
        .ebreak_out         (LSU_WB_ebreak),
        .skip_ref_out       (LSU_WB_skip_ref)
    );

    // 写回单元
    WBU ysyx_25010003_WBU(
        .alu_result         (LSU_WB_alu_result),
        .load_data          (LSU_WB_load_data),
        .mem_to_reg         (LSU_WB_mem_to_reg),
        .wb_data            (wb_data)
    );

    // 冒险检测单元
    Hazard ysyx_25010003_Hazard(
        .ID_EX_data_valid   (ID_EX_data_valid),
        .ID_EX_opcode       (ID_EX_inst[6:0]),
        .ID_EX_rs1          (ID_EX_rs1_addr),
        .ID_EX_rs2          (ID_EX_rs2_addr),
        .ID_EX_ordering     (ID_EX_fence_i_en || ID_EX_ecall_en ||
                             ID_EX_mret_en || ID_EX_ebreak_en),
        .EX_LSU_mem_read    (EX_LSU_mem_read),
        .EX_LSU_rd          (EX_LSU_rd_addr),
        .EX_LSU_load_forwardable(load_hit_forwardable),
        .redirect           (frontend_redirect),
        .lsu_busy           (lsu_busy),
        .lsu_done           (lsu_done),
        .store_pending      (store_pending),
        .stall_IF           (stall_IF),
        .stall_ID           (stall_ID),
        .stall_EX           (stall_EX),
        .flush_IF           (flush_IF),
        .flush_ID           (flush_ID),
        .flush_EX           (flush_EX),
        .flush_LSU          (flush_LSU),
        .load_use_interlock (load_use_interlock)
    );

    // 数据前递单元
    wire [31:0] EX_LSU_forward_data =
        (EX_LSU_mem_read && load_hit_forwardable) ?
        load_data : EX_LSU_alu_result;

    Forwarding ysyx_25010003_Forwarding(
        .ID_EX_rs1          (ID_EX_rs1_addr),
        .ID_EX_rs2          (ID_EX_rs2_addr),
        .ID_EX_rs1_data     (ID_EX_rs1_data),
        .ID_EX_rs2_data     (ID_EX_rs2_data),
        .EX_LSU_rd          (EX_LSU_rd_addr),
        .EX_LSU_reg_write   (EX_LSU_reg_write),
        .EX_LSU_alu_result  (EX_LSU_forward_data),
        .LSU_WB_rd          (LSU_WB_rd_addr),
        .LSU_WB_reg_write   (LSU_WB_reg_write),
        .LSU_WB_wb_data     (wb_data),
        .forward_a          (forward_a),
        .forward_b          (forward_b)
    );

`ifdef VERILATOR
import "DPI-C" function void commit_instruction(input int pc, input int next_pc,
                                                  input int inst, input int skip_ref);
import "DPI-C" function void ebreak(input int pc);
import "DPI-C" function void perf_pipeline_cycle(input int flags);
`endif

wire perf_mem_issue = ID_EX_fire && (ID_EX_mem_read || ID_EX_mem_write);
wire perf_redirect = frontend_redirect;
wire perf_jal = ID_EX_fire && ID_EX_jal_en;
wire perf_jalr = ID_EX_fire && ID_EX_jalr_en;
wire perf_call = (perf_jal || perf_jalr) && (ID_EX_inst[11:7] == 5'd1);
wire perf_return = perf_jalr && (ID_EX_inst[11:7] == 5'd0) &&
                   (ID_EX_inst[19:15] == 5'd1) &&
                   (ID_EX_inst[31:20] == 12'd0);
wire perf_store_ordering_wait = store_pending &&
                                (ID_EX_fence_i_en || ID_EX_ecall_en ||
                                 ID_EX_mret_en || ID_EX_ebreak_en);

// 在 WBU 的有效退休边界通知仿真框架；寄存器写回也在该时钟沿完成。
always @(posedge clock) begin
`ifdef VERILATOR
    perf_pipeline_cycle({12'b0, perf_store_ordering_wait,
                         load_use_interlock, store_buffered,
                         EX_LSU_mem_write, EX_LSU_mem_read,
                         perf_return, perf_call, perf_jalr, perf_jal,
                         (control_mispredict && ID_EX_branch),
                         control_mispredict, reset,
                         perf_redirect, perf_mem_issue,
                         LSU_WB_data_valid, EX_LSU_data_valid,
                         ID_EX_data_valid, IF_ID_inst_valid,
                         inst_valid, lsu_busy});
    if (!reset && LSU_WB_data_valid) begin
        commit_instruction(LSU_WB_pc, LSU_WB_next_pc, LSU_WB_inst,
                           {31'b0, LSU_WB_skip_ref});
        if (LSU_WB_ebreak)
            ebreak(LSU_WB_pc);
    end
`endif
end

endmodule
