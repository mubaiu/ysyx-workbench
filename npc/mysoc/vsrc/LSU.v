module LSU(
    input  wire        clock,
    input  wire        reset,
    // 内存控制信号
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire [2:0]  funct3,
    // 地址和数据
    input  wire [31:0] addr,
    input  wire [3:0]  lsu_wmask,
    input  wire [31:0] store_data,
    output reg  [31:0] load_data,
    output wire        mem_to_reg,
    output wire        lsu_busy,  // LSU忙信号
    output wire        lsu_done,  // LSU完成信号
    output wire        store_pending,
    output wire        store_buffered,

    // ===== AXI读地址通道 =====
    output wire [31:0] io_lsu_araddr,
    output wire [2:0]  io_lsu_arsize,
    output wire        io_lsu_arvalid,
    input  wire        io_lsu_arready,

    // ===== AXI读数据通道 =====
    input  wire [31:0] io_lsu_rdata,
    input  wire        io_lsu_rvalid,
    input  wire [1:0]  io_lsu_rresp,
    output reg         io_lsu_rready,

    // ===== AXI写地址通道 =====
    output wire [31:0] io_lsu_awaddr,
    output wire [2:0]  io_lsu_awsize,
    output wire        io_lsu_awvalid,
    input  wire        io_lsu_awready,

    // ===== AXI写数据通道 =====
    output wire [31:0] io_lsu_wdata,
    output wire [3:0]  io_lsu_wstrb,
    output wire        io_lsu_wvalid,
    output wire        io_lsu_wlast,
    input  wire        io_lsu_wready,

    // ===== AXI写响应通道 =====
    input  wire [1:0]  io_lsu_bresp,
    input  wire        io_lsu_bvalid,
    output reg         io_lsu_bready
);

`ifdef VERILATOR
    import "DPI-C" function void vaddr_write(input int addr, input int len, input int data);
    import "DPI-C" function int vaddr_read(input int addr, input int len);
    import "DPI-C" function void perf_lsu_load();   // LSU完成读操作
    import "DPI-C" function void perf_lsu_store();  // LSU完成写操作
    import "DPI-C" function void perf_lsu_load_latency(
        input longint latency,
        input longint address_wait,
        input int addr,
        input int hit,
        input int cacheable
    );
    import "DPI-C" function void perf_lsu_store_latency(
        input longint latency,
        input longint address_wait,
        input int addr,
        input int cacheable
    );
    import "DPI-C" function void perf_dcache_access(input int hit, input int cacheable);
`endif

    // ===== 状态机定义 =====
    localparam [1:0] IDLE  = 2'b00;
    localparam [1:0] READ  = 2'b01;
    localparam [1:0] WRITE = 2'b10;

    reg [1:0] state, next_state;
    reg [31:0] araddr_hold;
    reg        arvalid_hold;
    reg [31:0] awaddr_hold;
    reg        awvalid_hold;
    reg [31:0] wdata_hold;
    reg [3:0]  wstrb_hold;
    reg        wvalid_hold;
    reg        wlast_hold;

    wire        dcache_hit;
    wire        dcache_cacheable;
    wire [31:0] dcache_data;
    wire        direct_read_request = (state == IDLE) && mem_read &&
                                      !dcache_hit;
    wire        direct_store_request = (state == IDLE) && mem_write;
    wire        load_hit = ((state == IDLE) ||
                            ((state == WRITE) && store_released)) &&
                           mem_read && dcache_hit;
    wire        read_done = (state == READ) && io_lsu_rvalid && io_lsu_rready;
    wire        write_done = (state == WRITE) && io_lsu_bvalid && io_lsu_bready;
    wire        aw_fire = io_lsu_awvalid && io_lsu_awready;
    wire        w_fire = io_lsu_wvalid && io_lsu_wready;

    reg aw_accepted;
    reg w_accepted;
    reg store_released;

    wire write_payload_accepted = (direct_store_request ||
                                   (state == WRITE)) &&
                                  (aw_accepted || aw_fire) &&
                                  (w_accepted || w_fire);
    wire active_request_cacheable = direct_store_request ?
                                    dcache_cacheable : request_cacheable;
    wire buffered_store_done = active_request_cacheable && !store_released &&
                               write_payload_accepted;
    wire architectural_store_done = active_request_cacheable ?
                                     buffered_store_done : write_done;

    // ===== 状态转换 =====
    always @(posedge clock) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            IDLE: begin
                if (mem_read && !dcache_hit)
                    next_state = READ;
                else if (mem_write)
                    next_state = WRITE;
                else
                    next_state = IDLE;
            end
            READ: begin
                // 读操作：等待rvalid
                if (read_done)
                    next_state = IDLE;
                else
                    next_state = READ;
            end
            WRITE: begin
                // 写操作：等待bvalid
                if (write_done)
                    next_state = IDLE;
                else
                    next_state = WRITE;
            end
            default: next_state = IDLE;
        endcase
    end


    // ===== AXI握手信号控制 =====
    // 读地址通道
    always @(posedge clock) begin
        if (reset) begin
            arvalid_hold <= 1'b0;
        end else if (direct_read_request) begin
            arvalid_hold <= !io_lsu_arready;
        end else if (arvalid_hold && io_lsu_arready) begin
            arvalid_hold <= 1'b0;
        end
    end

    // 读数据通道
    always @(posedge clock) begin
        if (reset) begin
            io_lsu_rready <= 1'b0;
        end else if (state == IDLE && mem_read && !dcache_hit) begin
            io_lsu_rready <= 1'b1;
        end else if (read_done) begin
            io_lsu_rready <= 1'b0;
`ifdef VERILATOR
            perf_lsu_load();
            perf_lsu_load_latency(load_latency_counter,
                                  load_address_wait_counter,
                                  addr_reg,
                                  32'b0,
                                  {31'b0, request_cacheable});
`endif
        end
    end

    // 写地址通道
    always @(posedge clock) begin
        if (reset) begin
            awvalid_hold <= 1'b0;
        end else if (direct_store_request) begin
            awvalid_hold <= !io_lsu_awready;
        end else if (awvalid_hold && io_lsu_awready) begin
            awvalid_hold <= 1'b0;
        end
    end

    // 写数据通道
    always @(posedge clock) begin
        if (reset) begin
            wvalid_hold <= 1'b0;
            wlast_hold  <= 1'b0;
        end else if (direct_store_request) begin
            wvalid_hold <= !io_lsu_wready;
            wlast_hold  <= !io_lsu_wready;
        end else if (wvalid_hold && io_lsu_wready) begin
            wvalid_hold <= 1'b0;
            wlast_hold  <= 1'b0;
        end
    end

    // 写响应通道
    always @(posedge clock) begin
        if (reset) begin
            io_lsu_bready <= 1'b0;
        end else if (state == IDLE && mem_write) begin
            io_lsu_bready <= 1'b1;
        end else if (write_done) begin
            io_lsu_bready <= 1'b0;
`ifdef VERILATOR
            perf_lsu_store();
            perf_lsu_store_latency(store_latency_counter,
                                   store_address_wait_counter,
                                   addr_reg,
                                   {31'b0, request_cacheable});
`endif
        end
    end

    assign io_lsu_araddr = direct_read_request ? aligned_addr : araddr_hold;
    assign io_lsu_arvalid = direct_read_request || arvalid_hold;
    assign io_lsu_arsize = direct_read_request ? request_size : size_reg;
    assign io_lsu_awaddr = direct_store_request ? aligned_addr : awaddr_hold;
    assign io_lsu_awvalid = direct_store_request || awvalid_hold;
    assign io_lsu_awsize = direct_store_request ? request_size : size_reg;
    assign io_lsu_wdata = direct_store_request ? direct_wdata : wdata_hold;
    assign io_lsu_wstrb = direct_store_request ? direct_wstrb : wstrb_hold;
    assign io_lsu_wvalid = direct_store_request || wvalid_hold;
    assign io_lsu_wlast = direct_store_request || wlast_hold;
    assign mem_to_reg = load_hit || read_done;
    // Include the request-accept cycle.  Looking only at the registered FSM
    // state leaves a one-cycle hole in which IF/ID can overwrite the
    // instruction behind a newly arrived memory operation.
    // The completion cycle can admit the next instruction into ID/EX; the
    // completing operation itself is removed from EX/LSU by lsu_done.
    assign lsu_busy = ((state == READ) && !lsu_done) ||
                      ((state == WRITE) && !lsu_done &&
                       (!store_released || mem_read || mem_write)) ||
                      ((state == IDLE) && !lsu_done &&
                       ((mem_read && !load_hit) || mem_write));
    assign lsu_done = load_hit || read_done || architectural_store_done;
    assign store_pending = (state == WRITE) || direct_store_request;
    assign store_buffered = (state == WRITE) && store_released;

    reg [31:0] addr_reg;
    reg [2:0]  request_size;
    reg [2:0]  size_reg;
    reg [2:0]  funct3_reg;
    reg        request_cacheable;
    reg [63:0] load_latency_counter;
    reg [63:0] load_address_wait_counter;
    reg [63:0] store_latency_counter;
    reg [63:0] store_address_wait_counter;

    always @(posedge clock) begin
        if (reset) begin
            aw_accepted <= 1'b0;
            w_accepted <= 1'b0;
            store_released <= 1'b0;
        end
        else begin
            if (state == IDLE && mem_write) begin
                aw_accepted <= aw_fire;
                w_accepted <= w_fire;
                store_released <= buffered_store_done;
            end
            else if (state == WRITE) begin
                if (aw_fire)
                    aw_accepted <= 1'b1;
                if (w_fire)
                    w_accepted <= 1'b1;
                if (buffered_store_done)
                    store_released <= 1'b1;
                if (write_done) begin
                    aw_accepted <= 1'b0;
                    w_accepted <= 1'b0;
                    store_released <= 1'b0;
                end
            end
        end
    end

    // 地址对齐和锁存
    wire [31:0] aligned_addr = (request_size == 3'b010) ? {addr[31:2], 2'b00} :  // 字对齐
                               (request_size == 3'b001) ? {addr[31:1], 1'b0} :   // 半字对齐
                               addr;                                          // 字节不对齐

    always @(posedge clock) begin
        if (reset) begin
            araddr_hold <= 32'b0;
            awaddr_hold <= 32'b0;
            addr_reg <= 32'b0;
            funct3_reg <= 3'b0;
            size_reg <= 3'b010;
            request_cacheable <= 1'b0;
        end
        else if (state == IDLE && mem_read && !dcache_hit) begin
            araddr_hold <= aligned_addr;
            addr_reg <= addr;
            funct3_reg <= funct3;
            size_reg <= request_size;
            request_cacheable <= dcache_cacheable;
        end
        else if (state == IDLE && mem_write) begin
            awaddr_hold <= aligned_addr;
            addr_reg <= addr;
            size_reg <= request_size;
            request_cacheable <= dcache_cacheable;
        end
    end

    // lsu_size计算（在IDLE状态根据funct3或lsu_wmask计算）
    always @(*) begin
        if (mem_read) begin
            request_size = (funct3 == 3'b000 || funct3 == 3'b100) ? 3'b000 : // byte
                      (funct3 == 3'b001 || funct3 == 3'b101) ? 3'b001 : // halfword
                      3'b010; // word
        end else if (mem_write) begin
            request_size = (lsu_wmask == 4'b0001) ? 3'b000 : // byte
                      (lsu_wmask == 4'b0011) ? 3'b001 : // halfword
                      3'b010; // word
        end else begin
            request_size = 3'b010;
        end
    end

    // Load 延迟计数
    always @(posedge clock) begin
        if (reset) begin
            load_latency_counter <= 64'h0;
            load_address_wait_counter <= 64'h0;
        end else if (load_hit) begin
            load_latency_counter <= 64'h1;
            load_address_wait_counter <= 64'h0;
`ifdef VERILATOR
            perf_lsu_load();
            perf_lsu_load_latency(64'd1, 64'd0, addr, 32'd1, 32'd1);
`endif
        end else if (state == IDLE && mem_read) begin
            load_latency_counter <= 64'h1;  // 开始计数
            load_address_wait_counter <= io_lsu_arready ? 64'h0 : 64'h1;
        end else if (state == READ && !io_lsu_rvalid) begin
            load_latency_counter <= load_latency_counter + 1;
            if (io_lsu_arvalid && !io_lsu_arready)
                load_address_wait_counter <= load_address_wait_counter + 1;
        end
    end

    // Store 延迟计数
    always @(posedge clock) begin
        if (reset) begin
            store_latency_counter <= 64'h0;
            store_address_wait_counter <= 64'h0;
        end else if (state == IDLE && mem_write) begin
            store_latency_counter <= 64'h1;  // 开始计数
            store_address_wait_counter <=
                (io_lsu_awready && io_lsu_wready) ? 64'h0 : 64'h1;
        end else if (state == WRITE && !io_lsu_bvalid) begin
            store_latency_counter <= store_latency_counter + 1;
            if ((io_lsu_awvalid && !io_lsu_awready) ||
                (io_lsu_wvalid && !io_lsu_wready))
                store_address_wait_counter <=
                    store_address_wait_counter + 1;
        end
    end

    // 写数据和字节使能在首拍直接生成；若下游未接收，则锁存保持。
    reg [31:0] direct_wdata;
    reg [3:0] direct_wstrb;
    always @(*) begin
        direct_wstrb = 4'b0;
        direct_wdata = 32'b0;
        if (mem_write) begin
            case (lsu_wmask)
                4'b0001: begin //SB
                    case (addr[1:0])
                        2'b00: begin
                            direct_wstrb = 4'b0001;
                            direct_wdata = {24'b0, store_data[7:0]};
                        end
                        2'b01: begin
                            direct_wstrb = 4'b0010;
                            direct_wdata = {16'b0, store_data[7:0], 8'b0};
                        end
                        2'b10: begin
                            direct_wstrb = 4'b0100;
                            direct_wdata = {8'b0, store_data[7:0], 16'b0};
                        end
                        2'b11: begin
                            direct_wstrb = 4'b1000;
                            direct_wdata = {store_data[7:0], 24'b0};
                        end
                    endcase
                end
                4'b0011: begin //SH
                    case (addr[1])
                        1'b0: begin
                            direct_wstrb = 4'b0011;
                            direct_wdata = {16'b0, store_data[15:0]};
                        end
                        1'b1: begin
                            direct_wstrb = 4'b1100;
                            direct_wdata = {store_data[15:0], 16'b0};
                        end
                    endcase
                end
                4'b1111: begin //SW
                    direct_wstrb = 4'b1111;
                    direct_wdata = store_data;
                end
                default: begin
                    direct_wstrb = 4'b0000;
                    direct_wdata = 32'b0;
                end
            endcase
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            wstrb_hold <= 4'b0;
            wdata_hold <= 32'b0;
        end
        else if (direct_store_request) begin
            wstrb_hold <= direct_wstrb;
            wdata_hold <= direct_wdata;
        end
    end

    DCache #(
        .LINE_COUNT(512),
        .ADDR_WIDTH(32),
        .DATA_WIDTH(32)
    ) u_dcache (
        .clock       (clock),
        .reset       (reset),
        .lookup_addr (addr),
        .lookup_cacheable(dcache_cacheable),
        .lookup_hit  (dcache_hit),
        .lookup_data (dcache_data),
        .fill_en     (read_done),
        .fill_addr   (addr_reg),
        .fill_data   (io_lsu_rdata),
        .store_en    (buffered_store_done),
        .store_addr  (direct_store_request ? addr : addr_reg),
        .store_data  (io_lsu_wdata),
        .store_wstrb (io_lsu_wstrb)
    );

`ifdef VERILATOR
    always @(posedge clock) begin
        if (!reset && (load_hit ||
                       ((state == IDLE) && mem_read && !dcache_hit)))
            perf_dcache_access({31'b0, dcache_hit}, {31'b0, dcache_cacheable});
    end
`endif

    wire [31:0] selected_load_word = load_hit ? dcache_data : io_lsu_rdata;
    wire [2:0] selected_funct3 = load_hit ? funct3 : funct3_reg;
    wire [1:0] selected_offset = load_hit ? addr[1:0] : addr_reg[1:0];

    // 读数据处理
    always @(*) begin
        load_data = 32'b0;
        if (load_hit || read_done) begin
            case(selected_funct3)
                3'b000: begin // lb
                    case (selected_offset)
                        2'b00: load_data = {{24{selected_load_word[7]}}, selected_load_word[7:0]};
                        2'b01: load_data = {{24{selected_load_word[15]}}, selected_load_word[15:8]};
                        2'b10: load_data = {{24{selected_load_word[23]}}, selected_load_word[23:16]};
                        2'b11: load_data = {{24{selected_load_word[31]}}, selected_load_word[31:24]};
                    endcase
                end
                3'b100: begin // lbu
                    case (selected_offset)
                        2'b00: load_data = {24'b0, selected_load_word[7:0]};
                        2'b01: load_data = {24'b0, selected_load_word[15:8]};
                        2'b10: load_data = {24'b0, selected_load_word[23:16]};
                        2'b11: load_data = {24'b0, selected_load_word[31:24]};
                    endcase
                end
                3'b001: begin // lh
                    case (selected_offset[1])
                        1'b0: load_data = {{16{selected_load_word[15]}}, selected_load_word[15:0]};
                        1'b1: load_data = {{16{selected_load_word[31]}}, selected_load_word[31:16]};
                    endcase
                end
                3'b101: begin // lhu
                    case (selected_offset[1])
                        1'b0: load_data = {16'b0, selected_load_word[15:0]};
                        1'b1: load_data = {16'b0, selected_load_word[31:16]};
                    endcase
                end
                3'b010: load_data = selected_load_word; // lw
                default: load_data = selected_load_word;
            endcase
        end
    end

endmodule
