module CLINT(
    input  wire        clock,
    input  wire        reset,
    
    //读地址/数据通道
    input  wire [31:0] io_slave_araddr,
    input  wire        io_slave_arvalid,
    input  wire        io_slave_rready,
    output reg         io_slave_arready,
    output reg  [31:0] io_slave_rdata,
    output reg  [1:0]  io_slave_rresp,
    output reg         io_slave_rvalid, 

    // 写地址/数据通道
    input  wire [31:0] io_slave_awaddr,
    input  wire        io_slave_awvalid,
    input  wire [31:0] io_slave_wdata,
    input  wire [3:0]  io_slave_wstrb,
    input  wire        io_slave_wvalid,
    input  wire        io_slave_bready,

    output reg         io_slave_awready,
    output reg         io_slave_wready,
    output reg  [1:0]  io_slave_bresp,
    output reg         io_slave_bvalid
);

    // 64位mtime计数器
    reg [63:0] mtime;
    
    localparam [31:0] CLINT_BASE = 32'ha0000048;
    localparam [31:0] CLINT_END  = 32'ha000004c;

    wire ar_handshake = io_slave_arvalid && io_slave_arready;  // 读地址握手
    wire r_handshake  = io_slave_rvalid  && io_slave_rready ;  // 读数据握手

    // 读请求状态
    reg ar_ready;
    reg read_req;
    reg [31:0] read_addr;
    
    // mtime计数器 - 每个时钟周期加1
    always @(posedge clock) begin
        if (reset) begin
            mtime <= 64'h0;
        end else begin
            mtime <= mtime + 64'h1;
        end
    end
    
    //读地址/数据通道
    always @(posedge clock) begin
        if (reset) begin
            io_slave_arready <= 1'b1 ;
            io_slave_rdata   <= 32'b0;
            io_slave_rresp   <= 2'b0 ;
            io_slave_rvalid  <= 1'b0 ;
        end 
        else if (ar_handshake) begin
            io_slave_rvalid  <= 1'b1;
            io_slave_arready <= 1'b0;

            // 根据地址返回不同的mtime部分
            case (io_slave_araddr)
                32'ha0000048: io_slave_rdata <= mtime[31:0];   // 低32位
                32'ha000004c: io_slave_rdata <= mtime[63:32];  // 高32位
                default:      io_slave_rdata <= 32'h0;         // 无效地址返回0
            endcase
        end 
        else if (r_handshake) begin
            // 读数据握手完成
            io_slave_rvalid  <= 1'b0;
            io_slave_arready <= 1'b1;  // 恢复读地址 ready
        end
    end

    // 写通道 - 实现空接口（mtime只读）
    assign io_slave_awready = 1'b1;
    assign io_slave_wready = 1'b1;
    assign io_slave_bresp = 2'b00;
    assign io_slave_bvalid = 1'b0;

endmodule