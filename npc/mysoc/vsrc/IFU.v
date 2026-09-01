module IFU(
    input  wire clock,
    input  wire reset,
    input  wire stall,
    input  wire flush_IF,

    input wire  io_clint_arvalid,
    input wire  io_clint_arready,

    // 分支控制信号
    input  wire        mret_taken,     // MRET跳转标志
    input  wire [31:0] mret_target,    // MRET跳转目标地址
    input  wire        ecall_taken,
    input  wire [31:0] ecall_target,
    input  wire        branch_taken,
    input  wire [31:0] branch_target,
    input  wire        fence_i_en,     // FENCE.I使能信号

    output reg  [31:0] pc,
    output reg  [31:0] snpc,           // 静态下一个PC
    output wire [31:0] inst,           // 从指令存储器获取的
    output reg         inst_valid,

    //IFU Arbiter 接口
    output wire [31:0] io_ifu_araddr,  //AR
    output reg         io_ifu_arvalid,
    output wire [7:0]  io_ifu_arlen,
    output wire [1:0]  io_ifu_arburst,
    input  wire        io_ifu_arready,

    output reg         io_ifu_rready,  //R
    input  wire [31:0] io_ifu_rdata,
    input  wire        io_ifu_rvalid,
    input  wire [1:0]  io_ifu_rresp,
    input  wire        io_ifu_rlast,

    output wire [31:0] io_ifu_awaddr,  //AW
    output wire        io_ifu_awvalid,

    output wire [31:0] io_ifu_wdata,   //W
    output wire [3:0]  io_ifu_wstrb,
    output wire        io_ifu_wvalid,

    output wire        io_ifu_bready  //B
);
    // 状态定义
    localparam IDLE = 3'd0;
    localparam FETCH = 3'd1;
    localparam WAIT = 3'd2;

`ifdef VERILATOR
    import "DPI-C" function void perf_ifu_fetch();  // 性能计数器：IFU取指
    import "DPI-C" function void perf_ifu_stall_wait(); // IFU等待AXI响应
    import "DPI-C" function void perf_ifu_idle();       // IFU空闲
`endif


    reg [31:0] dnpc; // 动态下一个PC
    reg [31:0] dnpc_reg;
    reg [31:0] inst_reg;

    reg [2:0]  next_state;
    reg [2:0]  state;

    // ICache 请求信号（由IFU状态机控制）
    reg         icache_req_valid;
    wire [31:0] icache_req_addr;
    // ICache 响应信号（由ICache输出）
    wire        icache_resp_valid;
    wire [31:0] icache_resp_data;
    wire        icache_ready;
    wire        icache_arvalid;
    wire [31:0] icache_araddr;
    wire [2:0]  icache_arsize;
    wire [7:0]  icache_arlen;
    wire [1:0]  icache_arburst;
    wire        icache_rready;

    wire ar_handshake = (io_ifu_arvalid && io_ifu_arready) ||
                        (io_clint_arvalid && io_clint_arready);  // 读地址握手

    assign icache_req_addr = pc;
    // ICache的AXI接口连接到IFU的输出
    assign io_ifu_araddr = icache_araddr;
    assign io_ifu_arvalid = icache_arvalid;
    assign io_ifu_arlen = icache_arlen;
    assign io_ifu_arburst = icache_arburst;
    assign io_ifu_rready = icache_rready;
    assign inst = inst_reg;

    assign io_ifu_awaddr = 32'd0;
    assign io_ifu_awvalid = 1'b0;
    assign io_ifu_wdata = 32'd0;
    assign io_ifu_wstrb = 4'b0;
    assign io_ifu_wvalid = 1'b0;
    assign io_ifu_bready = 1'b0;

    // ICache 模块实例
    ICache #(
        .CACHE_SIZE(4),
        .BLOCK_SIZE(16),
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
    ) u_icache (
        .clock(clock),
        .reset(reset),
        .flush(fence_i_en),
        // IFU接口
        .ifu_req_valid(icache_req_valid),
        .ifu_req_addr(icache_req_addr),
        .ifu_resp_valid(icache_resp_valid),
        .ifu_resp_data(icache_resp_data),
        .ifu_ready(icache_ready),
        // AXI总线接口
        .ar_handshake(ar_handshake),
        .axi_arvalid(icache_arvalid),
        .axi_araddr(icache_araddr),
        .axi_arsize(icache_arsize),
        .axi_arlen(icache_arlen),
        .axi_arburst(icache_arburst),
        .axi_arready(io_ifu_arready),
        .axi_rvalid(io_ifu_rvalid),
        .axi_rdata(io_ifu_rdata),
        .axi_rlast(io_ifu_rlast),
        .axi_rready(icache_rready)
    );

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
            inst_reg <= 32'b0;
            inst_valid <= 1'b0;
            icache_req_valid <= 1'b0;
            next_state <= FETCH;
            dnpc_reg <= 32'h30000004;
        end
        else if (flush_IF) begin
            // 分支/跳转发生，采样dnpc并进入IDLE状态更新PC
            dnpc_reg <= dnpc;
            next_state <= IDLE;
            inst_valid <= 1'b0;
            icache_req_valid <= 1'b0;
        end
        else if (!stall) begin
            case(state)
                IDLE: begin
                    inst_valid <= 1'b0;
                    pc <= dnpc_reg;
                    next_state <= FETCH;
`ifdef VERILATOR
                    perf_ifu_idle();
`endif
                end
                FETCH: begin
                    icache_req_valid <= 1'b1;
                    inst_valid <= 1'b0;
                    if (icache_ready) begin
                        next_state <= WAIT;
                    end
                    else begin
                        next_state <= FETCH;
                    end
                end
                WAIT: begin
                    inst_valid <= 1'b0;
                    if(icache_resp_valid) begin
                        icache_req_valid <= 1'b0;
                        inst_valid <= 1'b1;
                        inst_reg <= icache_resp_data;
                        dnpc_reg <= dnpc;
`ifdef VERILATOR
                        perf_ifu_fetch();
`endif
                        next_state <= IDLE;
                    end
                    else begin
                        next_state <= WAIT;
                        if (icache_req_valid) begin
`ifdef VERILATOR
                            perf_ifu_stall_wait();
`endif
                        end
                    end
                end
                default: ;
            endcase
        end
    end


endmodule
