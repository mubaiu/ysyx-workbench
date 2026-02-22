module ICache #(
    parameter CACHE_SIZE = 16,      // cache块数量
    parameter BLOCK_SIZE = 4,       // 块大小（字节）
    parameter ADDR_WIDTH = 32,      // 地址位宽
    parameter DATA_WIDTH = 32       // 数据位宽
)(
    input  wire                  clock,
    input  wire                  reset,

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
    input  wire                  axi_arready,      // 读地址就绪

    input  wire                  axi_rvalid,       // 读数据有效
    input  wire [DATA_WIDTH-1:0] axi_rdata,        // 读数据
    output reg                   axi_rready        // 读数据就绪
);

    // DPI-C函数声明
    import "DPI-C" function void perf_icache_access();
    import "DPI-C" function void perf_icache_hit(longint unsigned cycles);
    import "DPI-C" function void perf_icache_miss(longint unsigned cycles);

    wire r_handshake  = axi_rvalid  && axi_rready;

    // 周期计数器（64位以匹配DPI-C函数参数）
    reg [63:0] access_cycle_count;

    // 参数计算
    localparam INDEX_WIDTH = $clog2(CACHE_SIZE);   // 4位
    localparam OFFSET_WIDTH = $clog2(BLOCK_SIZE);  // 2位
    localparam TAG_WIDTH = ADDR_WIDTH - INDEX_WIDTH - OFFSET_WIDTH; // 26位

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
    reg [DATA_WIDTH-1:0]   data  [0:CACHE_SIZE-1];  // 数据

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

    integer i;

    // 状态寄存器更新（时序逻辑）
    always @(posedge clock) begin
        if (reset) begin
            state <= IDLE;
            access_cycle_count <= 0;
        end
        else begin
            state <= next_state;

            // 周期计数和性能统计
            if (state == IDLE && ifu_req_valid) begin
                // 新请求开始，重置计数器并统计访问次数
                access_cycle_count <= 1;
                perf_icache_access();
            end
            else if (state == LOOKUP && cache_hit) begin
                // Cache命中，统计命中次数和周期数
                perf_icache_hit(access_cycle_count + 1);
            end
            else if (state == REFILL && axi_rvalid) begin
                // Cache缺失，统计缺失次数和周期数
                perf_icache_miss(access_cycle_count + 1);
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
                if (ifu_req_valid)
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
                if (axi_rvalid && axi_rready)
                    next_state = IDLE;  // 取回数据后直接返回IDLE
            end

            default: next_state = IDLE;
        endcase
    end

    // IFU接口输出控制（组合逻辑）
    always @(*) begin
        case (state)
            IDLE: begin
                ifu_resp_valid = 1'b0;
                ifu_ready = 1'b1;
                ifu_resp_data = {DATA_WIDTH{1'b0}};
            end

            LOOKUP: begin
                if (cache_hit) begin
                    // cache hit时立即返回数据
                    ifu_resp_valid = 1'b1;
                    ifu_resp_data = data[current_index];
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
                if (axi_rvalid && axi_rready) begin
                    // 取回数据时立即返回
                    ifu_resp_valid = 1'b1;
                    ifu_resp_data = axi_rdata;
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
        end
        else if (state == IDLE && ifu_req_valid) begin
            current_index <= req_index;
            current_tag <= req_tag;
        end
    end

    always @(*) begin
        cache_hit = valid[current_index] && (tag[current_index] == current_tag);
    end

    // Cache存储阵列初始化
    always @(posedge clock) begin
        if (reset) begin
            for (i = 0; i < CACHE_SIZE; i = i + 1) begin
                valid[i] <= 1'b0;
                tag[i] <= {TAG_WIDTH{1'b0}};
                data[i] <= {DATA_WIDTH{1'b0}};
            end
        end
        else if (state == REFILL && axi_rvalid) begin
            // Cache填充
            valid[current_index] <= 1'b1;
            tag[current_index] <= current_tag;
            data[current_index] <= axi_rdata;
        end
    end

    // AXI读地址通道控制
    always @(posedge clock) begin
        if (reset) begin
            axi_arvalid <= 1'b0;
            axi_rready <= 1'b0;
            axi_araddr <= {ADDR_WIDTH{1'b0}};
            axi_arsize <= 3'b010; // 4字节
        end
        else if (state == LOOKUP && !cache_hit) begin
            axi_arvalid <= 1'b1;
            axi_rready <= 1'b1;
            axi_araddr <= {current_tag, current_index, {OFFSET_WIDTH{1'b0}}};
            axi_arsize <= 3'b010; // 4字节传输
        end
        else if (ar_handshake && state != IDLE) begin
            axi_arvalid <= 1'b0;
        end
        else if (r_handshake && state != IDLE) begin
            axi_rready <= 1'b0;
        end
    end

endmodule

