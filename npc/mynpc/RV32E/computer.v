module computer(
    input wire clock,
    input wire reset,
    input wire io_interrupt
);

    //读地址/数据通道
    wire [31:0] io_slave_araddr;
    wire        io_slave_arvalid;
    wire        io_slave_rready;
    wire        io_slave_arready;
    wire [31:0] io_slave_rdata;
    wire [1:0]  io_slave_rresp;
    wire        io_slave_rvalid;

    // 写地址/数据通道
    wire [1:0]  io_slave_size;

    wire [31:0] io_slave_awaddr;
    wire        io_slave_awvalid;
    wire [31:0] io_slave_wdata;
    wire [3:0]  io_slave_wstrb;
    wire        io_slave_wvalid;
    wire        io_slave_bready;

    wire        io_slave_awready;
    wire        io_slave_wready;
    wire [1:0]  io_slave_bresp;
    wire        io_slave_bvalid;

ysyx_25010003 cpu(
    .clock              (clock),
    .reset              (reset),
    .io_interrupt       (io_interrupt),

    //读地址/数据通道
    .io_master_araddr   (io_slave_araddr),
    .io_master_arvalid  (io_slave_arvalid),
    .io_master_rready   (io_slave_rready),
    .io_master_arready  (io_slave_arready),
    .io_master_rdata    (io_slave_rdata),
    .io_master_rresp    (io_slave_rresp),
    .io_master_rvalid   (io_slave_rvalid),

    // 写地址/数据通道
    .io_master_size     (io_slave_size),

    .io_master_awaddr   (io_slave_awaddr),
    .io_master_awvalid  (io_slave_awvalid),
    .io_master_wdata    (io_slave_wdata),
    .io_master_wstrb    (io_slave_wstrb),
    .io_master_wvalid   (io_slave_wvalid),
    .io_master_bready   (io_slave_bready),

    .io_master_awready  (io_slave_awready),
    .io_master_wready   (io_slave_wready),
    .io_master_bresp    (io_slave_bresp),
    .io_master_bvalid   (io_slave_bvalid)
);

Memory sdram(
    .clock              (clock),
    .reset              (reset),

    //读地址/数据通道
    .io_slave_araddr    (io_slave_araddr),
    .io_slave_arvalid   (io_slave_arvalid),
    .io_slave_rready    (io_slave_rready),
    .io_slave_arready   (io_slave_arready),
    .io_slave_rdata     (io_slave_rdata),
    .io_slave_rresp     (io_slave_rresp),
    .io_slave_rvalid    (io_slave_rvalid),

    // 写地址/数据通道
    .io_slave_size      (io_slave_size),

    .io_slave_awaddr    (io_slave_awaddr),
    .io_slave_awvalid   (io_slave_awvalid),
    .io_slave_wdata     (io_slave_wdata),
    .io_slave_wstrb     (io_slave_wstrb),
    .io_slave_wvalid    (io_slave_wvalid),
    .io_slave_bready    (io_slave_bready),

    .io_slave_awready   (io_slave_awready),
    .io_slave_wready    (io_slave_wready),
    .io_slave_bresp     (io_slave_bresp),
    .io_slave_bvalid    (io_slave_bvalid)
);

endmodule
