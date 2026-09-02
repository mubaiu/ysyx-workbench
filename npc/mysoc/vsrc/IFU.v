module IFU(
    input  wire clock,
    input  wire reset,
    input  wire stall,

    // Kept in the interface for compatibility with the top level. CLINT
    // transactions are independent of the I-cache request handshake.
    input  wire io_clint_arvalid,
    input  wire io_clint_arready,

    // Mispredictions/exceptions are resolved in EX.
    input  wire        redirect_valid,
    input  wire [31:0] redirect_target,
    input  wire        resolve_valid,
    input  wire [31:0] resolve_pc,
    input  wire [31:0] resolve_inst,
    input  wire [31:0] resolve_next_pc,
    input  wire        resolve_branch_taken,
    input  wire        fence_i_en,

    output wire [31:0] pc,
    output wire [31:0] snpc,
    output wire [31:0] inst,
    output wire        inst_valid,
    output wire [31:0] predicted_next,

    // IFU AXI read interface.
    output wire [31:0] io_ifu_araddr,
    output wire        io_ifu_arvalid,
    output wire [7:0]  io_ifu_arlen,
    output wire [1:0]  io_ifu_arburst,
    input  wire        io_ifu_arready,

    output wire        io_ifu_rready,
    input  wire [31:0] io_ifu_rdata,
    input  wire        io_ifu_rvalid,
    input  wire [1:0]  io_ifu_rresp,
    input  wire        io_ifu_rlast,

    output wire [31:0] io_ifu_awaddr,
    output wire        io_ifu_awvalid,
    output wire [31:0] io_ifu_wdata,
    output wire [3:0]  io_ifu_wstrb,
    output wire        io_ifu_wvalid,
    output wire        io_ifu_bready
);

`ifdef VERILATOR
    import "DPI-C" function void perf_ifu_fetch();
    import "DPI-C" function void perf_ifu_stall_wait();
    import "DPI-C" function void perf_ifu_idle();
    import "DPI-C" function void perf_ifu_squash(input int count);
`endif

    // A two-entry response queue decouples the cache from IF/ID. There is at
    // most one cache request in flight, so queue_count + in_flight never
    // exceeds two. This removes the old per-instruction IDLE/FETCH/WAIT
    // bubbles while retaining simple, explicit ownership.
    reg [31:0] fetch_addr;
    reg [31:0] request_addr;
    reg        request_inflight;
    reg        discard_inflight;

    reg [31:0] queue_pc   [0:1];
    reg [31:0] queue_inst [0:1];
    reg [31:0] queue_predicted_next [0:1];
    reg        queue_head;
    reg        queue_tail;
    reg [1:0]  queue_count;

    wire        icache_req_valid;
    wire [31:0] icache_req_addr;
    wire        icache_resp_valid;
    wire [31:0] icache_resp_data;
    wire        icache_ready;
    wire        icache_arvalid;
    wire [31:0] icache_araddr;
    wire [2:0]  icache_arsize;
    wire [7:0]  icache_arlen;
    wire [1:0]  icache_arburst;
    wire        icache_rready;

    // Do not launch a sequential request in the cycle an EX redirect arrives.
    assign icache_req_valid = !reset && !redirect_valid && !request_inflight &&
                              ((queue_count != 2) || dequeue);
    assign icache_req_addr = fetch_addr;

    wire request_fire = icache_req_valid && icache_ready;
    wire immediate_response = request_fire && icache_resp_valid;
    wire response_keep = icache_resp_valid && !redirect_valid &&
                         (immediate_response ||
                          (request_inflight && !discard_inflight));
    wire response_drop = icache_resp_valid && request_inflight &&
                         (discard_inflight || redirect_valid);
    wire dequeue = (queue_count != 0) && !stall && !redirect_valid;

    wire [31:0] response_pc = immediate_response ? fetch_addr : request_addr;
    wire [31:0] response_predicted_next;

    BPU u_bpu (
        .clock                  (clock),
        .reset                  (reset),
        .query_valid            (icache_resp_valid),
        .query_pc               (response_pc),
        .query_inst             (icache_resp_data),
        .predicted_next_pc      (response_predicted_next),
        .resolve_valid          (resolve_valid),
        .resolve_pc             (resolve_pc),
        .resolve_inst           (resolve_inst),
        .resolve_next_pc        (resolve_next_pc),
        .resolve_branch_taken   (resolve_branch_taken)
    );

    assign pc = (queue_count != 0) ? queue_pc[queue_head] : fetch_addr;
    assign snpc = pc + 32'd4;
    assign inst = (queue_count != 0) ? queue_inst[queue_head] : 32'b0;
    assign inst_valid = (queue_count != 0);
    assign predicted_next = (queue_count != 0) ?
                            queue_predicted_next[queue_head] : fetch_addr;

    assign io_ifu_araddr = icache_araddr;
    assign io_ifu_arvalid = icache_arvalid;
    assign io_ifu_arlen = icache_arlen;
    assign io_ifu_arburst = icache_arburst;
    assign io_ifu_rready = icache_rready;

    assign io_ifu_awaddr = 32'b0;
    assign io_ifu_awvalid = 1'b0;
    assign io_ifu_wdata = 32'b0;
    assign io_ifu_wstrb = 4'b0;
    assign io_ifu_wvalid = 1'b0;
    assign io_ifu_bready = 1'b0;

    ICache #(
        // 512 direct-mapped lines x 16 B = 8 KiB. The old 4-line (64 B)
        // cache thrashed even on the small cpu-tests loops.
        .CACHE_SIZE(512),
        .BLOCK_SIZE(16),
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
    ) u_icache (
        .clock(clock),
        .reset(reset),
        .flush(fence_i_en),
        .ifu_req_valid(icache_req_valid),
        .ifu_req_addr(icache_req_addr),
        .ifu_resp_valid(icache_resp_valid),
        .ifu_resp_data(icache_resp_data),
        .ifu_ready(icache_ready),
        .ar_handshake(io_ifu_arvalid && io_ifu_arready),
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

    always @(posedge clock) begin
        if (reset) begin
            fetch_addr <= 32'h30000000;
            request_addr <= 32'b0;
            request_inflight <= 1'b0;
            discard_inflight <= 1'b0;
            queue_head <= 1'b0;
            queue_tail <= 1'b0;
            queue_count <= 2'd0;
        end
        else if (redirect_valid) begin
            // Buffered instructions are younger than the redirecting EX
            // instruction. A cache transaction cannot be cancelled on AXI,
            // so remember to discard its eventual response.
            fetch_addr <= redirect_target;
            queue_head <= 1'b0;
            queue_tail <= 1'b0;
            queue_count <= 2'd0;
`ifdef VERILATOR
            perf_ifu_squash({29'b0,
                             (request_inflight && !discard_inflight),
                             queue_count});
`endif
            if (icache_resp_valid && request_inflight) begin
                request_inflight <= 1'b0;
                discard_inflight <= 1'b0;
            end
            else if (request_inflight) begin
                discard_inflight <= 1'b1;
            end
        end
        else begin
            if (request_fire) begin
                if (icache_resp_valid)
                    fetch_addr <= response_predicted_next;
                else begin
                    fetch_addr <= fetch_addr + 32'd4;
                    request_addr <= fetch_addr;
                    request_inflight <= 1'b1;
                end
            end

            if (icache_resp_valid && request_inflight) begin
                request_inflight <= 1'b0;
                discard_inflight <= 1'b0;
            end

            if (response_keep) begin
                queue_pc[queue_tail] <= immediate_response ? fetch_addr : request_addr;
                queue_inst[queue_tail] <= icache_resp_data;
                queue_predicted_next[queue_tail] <= response_predicted_next;
                queue_tail <= queue_tail + 1'b1;
                if (!immediate_response)
                    fetch_addr <= response_predicted_next;
`ifdef VERILATOR
                perf_ifu_fetch();
`endif
            end

            if (dequeue)
                queue_head <= queue_head + 1'b1;

            case ({response_keep, dequeue})
                2'b10: queue_count <= queue_count + 2'd1;
                2'b01: queue_count <= queue_count - 2'd1;
                default: queue_count <= queue_count;
            endcase

`ifdef VERILATOR
            if (request_inflight && !icache_resp_valid)
                perf_ifu_stall_wait();
            if ((queue_count == 0) && !response_keep)
                perf_ifu_idle();
`endif
        end
    end

    // These inputs are intentionally unused by the IFU datapath.
    wire _unused_ok = &{1'b0, io_clint_arvalid, io_clint_arready,
                        io_ifu_rresp, icache_arsize, response_drop};

endmodule
