module IFU(
    input  wire clock,
    input  wire reset,
    input  wire mem_read, 
    input  wire mem_write,

    input wire  io_clint_arvalid,
    input wire  io_clint_arready,

    input  wire io_master_arvalid,
    input  wire io_master_arready,

    input  wire io_master_awvalid,
    input  wire io_master_awready,
    input  wire io_master_wvalid,
    input  wire io_master_wready,

    // 分支控制信号
    input  wire        mret_taken,     // MRET跳转标志
    input  wire [31:0] mret_target,    // MRET跳转目标地址
    input  wire        ecall_taken,
    input  wire [31:0] ecall_target,
    input  wire        branch_taken,
    input  wire [31:0] branch_target,

    output reg  [31:0] pc,
    output reg  [31:0] snpc,           // 静态下一个PC
    output wire [31:0] inst,           // 从指令存储器获取的
    output reg         inst_valid,

    //IFU Arbiter 接口
    output wire [31:0] io_ifu_araddr,  //AR
    output reg         io_ifu_arvalid,

    output reg         io_ifu_rready,  //R
    input  wire [31:0] io_ifu_rdata,  
    input  wire        io_ifu_rvalid,
    input  wire [1:0]  io_ifu_rresp,

    output wire [31:0] io_ifu_awaddr,  //AW
    output wire        io_ifu_awvalid,

    output wire [31:0] io_ifu_wdata,   //W
    output wire [3:0]  io_ifu_wstrb,
    output wire        io_ifu_wvalid,

    output wire        io_ifu_bready,  //B

    //LSU Arbiter 接口
    output reg  io_lsu_arvalid,         //AR
    input  wire io_lsu_rvalid,          //R
    output reg  io_lsu_rready,   
    output reg  io_lsu_awvalid,         //AW
    output reg  io_lsu_wvalid,          //W
   
    output reg  io_lsu_bready,          //B
    input  wire io_lsu_bvalid
);
    // 状态定义
    localparam IDLE = 3'd0;
    localparam FETCH = 3'd1;
    localparam WAIT = 3'd2;
    localparam EXECUTE = 3'd3;
    localparam ACCESS = 3'd4;

`ifdef VERILATOR
    import "DPI-C" function int intake(input int pc);
    import "DPI-C" function void set_snpc(input int pc);
    import "DPI-C" function void set_dnpc(input int pc);
    import "DPI-C" function void set_pc(input int pc);
    import "DPI-C" function void perf_ifu_fetch();  // 性能计数器：IFU取指
    import "DPI-C" function void perf_lsu_load();   // 性能计数器：LSU读数据
    import "DPI-C" function void perf_lsu_store();  // 性能计数器：LSU写数据
    import "DPI-C" function void perf_ifu_stall_lsu();  // IFU因LSU而stall
    import "DPI-C" function void perf_ifu_stall_wait(); // IFU等待AXI响应
    import "DPI-C" function void perf_ifu_idle();       // IFU空闲
    import "DPI-C" function void perf_lsu_load_latency(input longint latency);   // LSU读延迟
    import "DPI-C" function void perf_lsu_store_latency(input longint latency);  // LSU写延迟
`endif


    reg [31:0] dnpc; // 动态下一个PC
    reg [31:0] dnpc_reg;
    reg [31:0] inst_reg;

    reg [2:0]  next_state;
    reg [2:0]  state;

    // LSU 延迟计数器
    reg [63:0] lsu_latency_counter;

    wire ar_handshake    = (io_master_arvalid && io_master_arready) || 
                            (io_clint_arvalid && io_clint_arready);  // 读地址握手
    wire ifu_r_handshake = io_ifu_rvalid     && io_ifu_rready    ;  // IFU读数据握手
    wire lsu_r_handshake = io_lsu_rvalid     && io_lsu_rready    ;  // LSU读数据握手
    wire aw_handshake    = io_master_awvalid && io_master_awready;  // 写地址握手
    wire w_handshake     = io_master_wvalid  && io_master_wready ;  // 写数据握手
    wire lsu_b_handshake = io_lsu_bvalid     && io_lsu_bready    ;  // 写响应握手

    assign io_ifu_araddr = pc;
    assign inst = inst_reg;

    assign io_ifu_awaddr = 32'd0;
    assign io_ifu_awvalid = 1'b0;
    assign io_ifu_wdata = 32'd0;
    assign io_ifu_wstrb = 4'b0;
    assign io_ifu_wvalid = 1'b0;
    assign io_ifu_bready = 1'b0;

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

    always @(posedge clock) begin
`ifdef VERILATOR
        set_snpc(snpc);
        set_dnpc(dnpc_reg);
        set_pc(pc);
`endif
    end

    // PC更新逻辑
    always @(posedge clock) begin
        if (reset) begin
            pc <= 32'h30000000;
            inst_reg <= 32'b0;
            inst_valid <= 1'b0;
            io_ifu_arvalid <= 1'b0;
            io_ifu_rready <= 1'b0;
            next_state <= FETCH;
            dnpc_reg <= 32'h20000004;
            lsu_latency_counter <= 0;  // 初始化延迟计数器
        end 
        else begin
            case(state)
                IDLE: begin
                        inst_valid <= 1'b0;
                        pc <= dnpc_reg;
                        next_state <= FETCH;
`ifdef VERILATOR
                        perf_ifu_idle();  // IFU空闲周期
`endif
                end
                FETCH: begin
                    // inst_reg <= intake(pc);
                        io_ifu_arvalid <= 1'b1;
                        inst_valid <= 1'b0;
                    if (ar_handshake) begin
                        io_ifu_arvalid <= 1'b0;
                        io_ifu_rready <= 1'b1;
                        next_state <= WAIT;
                    end
                    else begin
                        next_state <= FETCH;
                        // IFU无法取指，可能是LSU占用总线
                        if (mem_read || mem_write) begin
`ifdef VERILATOR
                            perf_ifu_stall_lsu();  // 因LSU而stall
`endif
                        end
                    end
                end
                WAIT: begin
                    inst_valid <= 1'b0;
                    if(ifu_r_handshake) begin
                        io_ifu_rready <= 1'b0;
                        inst_valid <= 1'b1;
                        inst_reg <= io_ifu_rdata;
`ifdef VERILATOR
                        perf_ifu_fetch();  // 性能计数：IFU取到指令
`endif
                        next_state <= EXECUTE;
                    end
                    else if(lsu_r_handshake) begin
                        io_lsu_rready <= 1'b0;
`ifdef VERILATOR
                        perf_lsu_load();  // 性能计数：LSU读到数据
                        perf_lsu_load_latency(lsu_latency_counter);  // 记录读延迟
`endif
                        next_state <= IDLE;
                    end
                    else if(lsu_b_handshake) begin
                        io_lsu_bready <= 1'b0;
`ifdef VERILATOR
                        perf_lsu_store();  // 性能计数：LSU写完成
                        perf_lsu_store_latency(lsu_latency_counter);  // 记录写延迟
`endif
                        next_state <= IDLE;
                    end
                    else begin
                        next_state <= WAIT;
                        // 如果在等待LSU响应，递增延迟计数器
                        if (io_lsu_rready || io_lsu_bready) begin
                            lsu_latency_counter <= lsu_latency_counter + 1;
                        end
                        // 只有当IFU在等待自己的取指响应时才计数
                        if (io_ifu_rready) begin
`ifdef VERILATOR
                            perf_ifu_stall_wait();  // IFU等待AXI响应
`endif
                        end
                    end
                end
                ACCESS: begin
                    lsu_latency_counter <= lsu_latency_counter + 1;  // 延迟计数递增
                    if (ar_handshake) begin
                            io_lsu_rready <= 1'b1;
                            io_lsu_arvalid <= 1'b0;
                            next_state <= WAIT;
                        end
                    else if (aw_handshake) begin
                            io_lsu_awvalid <= 1'b0;
                        if (w_handshake) begin
                                io_lsu_wvalid <= 1'b0;
                                io_lsu_bready <= 1'b1;
                                next_state <= WAIT;
                        end
                    end
                    else begin
                        next_state <= ACCESS;
                    end
                end
                EXECUTE: begin
                    inst_valid <= 1'b1;
                    dnpc_reg <= dnpc;
                    if (mem_read) begin
                        io_lsu_arvalid <= 1'b1;
                        lsu_latency_counter <= 0;  // 初始化延迟计数器
                        next_state <= ACCESS;
                        inst_valid <= 1'b0;
                    end
                    else if (mem_write) begin
                        io_lsu_awvalid <= 1'b1;
                        io_lsu_wvalid <= 1'b1;
                        lsu_latency_counter <= 0;  // 初始化延迟计数器
                        next_state <= ACCESS;
                        inst_valid <= 1'b0;
                    end
                    else begin
                        next_state <= IDLE;
                        inst_valid <= 1'b0;
                    end
                end
                default: ;
            endcase
        end
    end


endmodule

