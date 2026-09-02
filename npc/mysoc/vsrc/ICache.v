module ICache #(
    parameter CACHE_SIZE = 4,      // cache块数量
    parameter BLOCK_SIZE = 16,      // 块大小（字节），默认为总线数据位宽的4倍
    parameter ADDR_WIDTH = 32,      // 地址位宽
    parameter DATA_WIDTH = 32       // 数据位宽
)(
    input  wire                  clock,
    input  wire                  reset,
    input  wire                  flush,        // FENCE.I flush信号

    // IFU接口
    input  wire                  ar_handshake,
    input  wire                  ifu_req_valid,    // IFU请求有效
    input  wire [ADDR_WIDTH-1:0] ifu_req_addr,     // IFU请求地址
    output reg                   ifu_resp_valid,   // ICache响应有效
    output reg  [DATA_WIDTH-1:0] ifu_resp_data,    // ICache响应数据
    output reg                   ifu_ready,        // ICache就绪信号

    // AXI总线接口（读通道）
    output reg                   axi_arvalid,      // 读地址有效
    output reg  [ADDR_WIDTH-1:0] axi_araddr,       // 读地址
    output reg  [2:0]            axi_arsize,       // 读传输大小
    output reg  [7:0]            axi_arlen,        // 突发长度-1
    output reg  [1:0]            axi_arburst,      // 突发类型
    input  wire                  axi_arready,      // 读地址就绪

    input  wire                  axi_rvalid,       // 读数据有效
    input  wire [DATA_WIDTH-1:0] axi_rdata,        // 读数据
    input  wire                  axi_rlast,        // 最后一次传输
    output reg                   axi_rready        // 读数据就绪
);

`ifdef VERILATOR
    // DPI-C函数声明
    import "DPI-C" function void perf_icache_access();
    import "DPI-C" function void perf_icache_hit(longint unsigned cycles);
    import "DPI-C" function void perf_icache_miss(longint unsigned cycles);
`endif

    wire r_handshake  = axi_rvalid  && axi_rready;

    // 周期计数器（64位以匹配DPI-C函数参数）
    reg [63:0] access_cycle_count;

    // 参数计算
    localparam INDEX_WIDTH = $clog2(CACHE_SIZE);   // 4位
    localparam OFFSET_WIDTH = $clog2(BLOCK_SIZE);  // 4位（16字节）
    localparam TAG_WIDTH = ADDR_WIDTH - INDEX_WIDTH - OFFSET_WIDTH; // 24位
    localparam WORDS_PER_BLOCK = BLOCK_SIZE / (DATA_WIDTH/8);  // 每块字数：4
    localparam WORD_OFFSET_WIDTH = $clog2(WORDS_PER_BLOCK);    // 字偏移位宽：2位
    localparam [WORD_OFFSET_WIDTH-1:0] LAST_WORD = WORD_OFFSET_WIDTH'(WORDS_PER_BLOCK - 1);  // 最后一个字的索引

    // 地址解析
    wire [TAG_WIDTH-1:0]   req_tag;
    wire [INDEX_WIDTH-1:0] req_index;
    wire [OFFSET_WIDTH-1:0] req_offset;

    assign req_tag    = ifu_req_addr[ADDR_WIDTH-1:INDEX_WIDTH+OFFSET_WIDTH];
    assign req_index  = ifu_req_addr[INDEX_WIDTH+OFFSET_WIDTH-1:OFFSET_WIDTH];
    assign req_offset = ifu_req_addr[OFFSET_WIDTH-1:0];

    // Cache存储阵列
    reg                    valid [0:CACHE_SIZE-1];  // 有效位
    reg [TAG_WIDTH-1:0]    tag   [0:CACHE_SIZE-1];  // 标签
    reg [BLOCK_SIZE*8-1:0] data  [0:CACHE_SIZE-1];  // 数据（整个块）

    // The arrays are read combinationally and captured by the IFU response
    // queue on the clock edge.  Hits therefore sustain one lookup per cycle;
    // misses still use the blocking refill FSM below.
    wire request_hit = valid[req_index] && (tag[req_index] == req_tag);
    wire [DATA_WIDTH-1:0] request_data =
        data[req_index][req_offset[OFFSET_WIDTH-1:2]*DATA_WIDTH +: DATA_WIDTH];

    // 状态机
    localparam IDLE   = 3'd0;
    localparam LOOKUP = 3'd1;
    localparam MISS   = 3'd2;
    localparam REFILL = 3'd3;

    reg [2:0] state, next_state;

    // 查找结果
    reg cache_hit;
    reg [INDEX_WIDTH-1:0] current_index;
    reg [TAG_WIDTH-1:0]   current_tag;
    reg [WORD_OFFSET_WIDTH-1:0] current_word_offset;

    // REFILL计数器和突发传输控制
    reg [WORD_OFFSET_WIDTH-1:0] word_count;
    reg use_burst;  // 是否使用突发传输
    reg discard_refill;
    wire refill_done = (state == REFILL) && r_handshake &&
                       (use_burst ? axi_rlast : (word_count == LAST_WORD));

    // SDRAM地址范围判断：0xa0000000-0xbfffffff
    wire is_sdram = (ifu_req_addr[31:28] == 4'ha) || (ifu_req_addr[31:28] == 4'hb);

    integer i;

    // 状态寄存器更新（时序逻辑）
    always @(posedge clock) begin
        if (reset) begin
            state <= IDLE;
            access_cycle_count <= 0;
            word_count <= 0;
            discard_refill <= 1'b0;
        end
        else begin
            state <= next_state;

            if (refill_done)
                discard_refill <= 1'b0;
            else if (flush && state != IDLE)
                discard_refill <= 1'b1;

            // word_count更新
            if (state == MISS && axi_arvalid && axi_arready)
                word_count <= 0;
            else if (state == REFILL && r_handshake)
                word_count <= word_count + 1;

            // 周期计数和性能统计
            if (state == IDLE && ifu_req_valid) begin
                // 新请求开始，重置计数器并统计访问次数
                access_cycle_count <= 1;
`ifdef VERILATOR
                perf_icache_access();
                if (request_hit)
                    perf_icache_hit(64'd1);
`endif
            end
            else if (refill_done) begin
                // Cache缺失，统计缺失次数和周期数
`ifdef VERILATOR
                perf_icache_miss(access_cycle_count + 1);
`endif
            end
            else if (state != IDLE) begin
                // 非IDLE状态，递增周期计数器
                access_cycle_count <= access_cycle_count + 1;
            end
        end
    end

    // 状态转移逻辑（组合逻辑）
    always @(*) begin
        next_state = state;  // 默认保持当前状态
        case (state)
            IDLE: begin
                if (ifu_req_valid && !request_hit)
                    next_state = LOOKUP;
            end

            LOOKUP: begin
                if (cache_hit)
                    next_state = IDLE;  // cache hit时直接返回IDLE
                else
                    next_state = MISS;
            end

            MISS: begin
                if (axi_arready)
                    next_state = REFILL;
            end

            REFILL: begin
                if (refill_done)
                    next_state = IDLE;  // 突发传输完成或单次传输完成
            end

            default: next_state = IDLE;
        endcase
    end

    // IFU接口输出控制（组合逻辑）
    always @(*) begin
        case (state)
            IDLE: begin
                ifu_resp_valid = ifu_req_valid && request_hit;
                ifu_ready = 1'b1;
                ifu_resp_data = request_hit ? request_data : {DATA_WIDTH{1'b0}};
            end

            LOOKUP: begin
                if (cache_hit) begin
                    // cache hit时立即返回数据，根据word_offset选择正确的字
                    ifu_resp_valid = 1'b1;
                    ifu_resp_data = data[current_index][current_word_offset*DATA_WIDTH +: DATA_WIDTH];
                    ifu_ready = 1'b0;
                end
                else begin
                    ifu_resp_valid = 1'b0;
                    ifu_resp_data = {DATA_WIDTH{1'b0}};
                    ifu_ready = 1'b0;
                end
            end

            MISS: begin
                ifu_ready = 1'b0;
                ifu_resp_valid = 1'b0;
                ifu_resp_data = {DATA_WIDTH{1'b0}};
            end

            REFILL: begin
                if (refill_done) begin
                    // 突发传输完成或单次传输完成时返回请求的字
                    ifu_resp_valid = 1'b1;
                    ifu_resp_data = (word_count == current_word_offset) ? axi_rdata :
                                    data[current_index][current_word_offset*DATA_WIDTH +: DATA_WIDTH];
                    ifu_ready = 1'b0;
                end
                else begin
                    ifu_resp_valid = 1'b0;
                    ifu_resp_data = {DATA_WIDTH{1'b0}};
                    ifu_ready = 1'b0;
                end
            end

            default: begin
                ifu_resp_valid = 1'b0;
                ifu_ready = 1'b1;
                ifu_resp_data = {DATA_WIDTH{1'b0}};
            end
        endcase
    end

    // Cache查找逻辑
    always @(posedge clock) begin
        if (reset) begin
            current_index <= {INDEX_WIDTH{1'b0}};
            current_tag <= {TAG_WIDTH{1'b0}};
            current_word_offset <= {WORD_OFFSET_WIDTH{1'b0}};
            use_burst <= 1'b0;
        end
        else if (state == IDLE && ifu_req_valid) begin
            current_index <= req_index;
            current_tag <= req_tag;
            current_word_offset <= req_offset[OFFSET_WIDTH-1:2];
            use_burst <= is_sdram;
        end
    end

    always @(*) begin
        cache_hit = valid[current_index] && (tag[current_index] == current_tag);
    end

    // Cache存储阵列初始化
    always @(posedge clock) begin
        if (reset || flush) begin
            // flush时清空所有valid位
            for (i = 0; i < CACHE_SIZE; i = i + 1) begin
                valid[i] <= 1'b0;
            end
        end
        else if (state == REFILL && r_handshake) begin
            // Cache填充：将读取的字存储到块的正确位置
            data[current_index][word_count*DATA_WIDTH +: DATA_WIDTH] <= axi_rdata;
            // 突发传输完成或单次传输完成时设置valid和tag
            if (refill_done && !discard_refill) begin
                valid[current_index] <= 1'b1;
                tag[current_index] <= current_tag;
            end
        end
    end

    // AXI读地址通道控制
    always @(posedge clock) begin
        if (reset) begin
            axi_arvalid <= 1'b0;
            axi_rready <= 1'b0;
            axi_araddr <= {ADDR_WIDTH{1'b0}};
            axi_arsize <= 3'b010;
            axi_arlen <= 8'b0;
            axi_arburst <= 2'b0;
        end
        else if (state == LOOKUP && !cache_hit) begin
            axi_arvalid <= 1'b1;
            axi_rready <= 1'b1;
            axi_araddr <= {current_tag, current_index, {OFFSET_WIDTH{1'b0}}};
            axi_arsize <= 3'b010;
            axi_arlen <= use_burst ? 8'd3 : 8'd0;  // 突发传输4次或单次传输
            axi_arburst <= use_burst ? 2'b01 : 2'b00;  // INCR或FIXED
        end
        else if (state == REFILL && !use_burst && r_handshake && word_count < LAST_WORD) begin
            // 非突发传输时，继续读取下一个字
            axi_arvalid <= 1'b1;
            axi_araddr <= {current_tag, current_index, {OFFSET_WIDTH{1'b0}}} + (32'(word_count + 1) << 2);
        end
        else if (ar_handshake && state != IDLE) begin
            axi_arvalid <= 1'b0;
        end
        else if (r_handshake && state != IDLE && (use_burst ? axi_rlast : (word_count == LAST_WORD))) begin
            axi_rready <= 1'b0;
        end
    end

endmodule
