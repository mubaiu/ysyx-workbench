module Memory (
    input  wire        clock,            // 添加时钟输入
    input  wire        reset,            // 添加复位输入

    //读地址/数据通道
    input  wire [31:0] io_slave_araddr,
    input  wire        io_slave_arvalid,
    input  wire        io_slave_rready,
    output reg         io_slave_arready,
    output reg  [31:0] io_slave_rdata,
    output reg  [1:0]  io_slave_rresp,
    output reg         io_slave_rvalid, 

    // 写地址/数据通道
    input  wire [1:0]  io_slave_size,
    
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

`ifdef VERILATOR
import "DPI-C" function int intake(input int pc);
import "DPI-C" function void vaddr_write(input int addr, input int len, input int data);
import "DPI-C" function int vaddr_read(input int addr, input int len);
`endif

wire [31:0] len;
wire [31:0] aligned_addr;

wire ar_handshake = io_slave_arvalid && io_slave_arready;  // 读地址握手
wire r_handshake  = io_slave_rvalid  && io_slave_rready ;  // 读数据握手
wire aw_handshake = io_slave_awvalid && io_slave_awready;  // 写地址握手
wire w_handshake  = io_slave_wvalid  && io_slave_wready ;  // 写数据握手
wire b_handshake  = io_slave_bvalid  && io_slave_bready ;  // 写响应握手

assign len = (io_slave_size == 2'b00) ? 32'd1 : // byte
             (io_slave_size == 2'b01) ? 32'd2 : // half-word
             (io_slave_size == 2'b10) ? 32'd4 : // word
             32'd0; // default to byte for safety

assign aligned_addr = {io_slave_araddr[31:2], 2'b00}; // 字对齐(4字节)

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
`ifdef VERILATOR
        io_slave_rdata   <= vaddr_read(aligned_addr, 4);
`else
        io_slave_rdata   <= 32'h0;
`endif
    end 
    else if (r_handshake) begin
        // 读数据握手完成
        io_slave_rvalid  <= 1'b0;
        io_slave_arready <= 1'b1;  // 恢复读地址 ready
    end
end

// 写地址/数据通道
always @(posedge clock) begin
    if (reset) begin
        io_slave_awready <= 1'b1;
        io_slave_wready  <= 1'b1;
        io_slave_bresp   <= 2'b0;
        io_slave_bvalid  <= 1'b0;
    end else if (aw_handshake) begin
        // 写操作握手
        io_slave_awready <= 1'b0;  // 只拉低写地址 ready
        if (w_handshake) begin
            io_slave_wready <= 1'b0;  // 写地址和写数据都握手成功，拉低写数据 ready
`ifdef VERILATOR
            vaddr_write(io_slave_awaddr, len, io_slave_wdata);
`endif
            io_slave_bvalid <= 1'b1;  // 写响应
        end
    end else if (b_handshake) begin
        // 写响应完成
        io_slave_bvalid  <= 1'b0;
        io_slave_wready  <= 1'b1;  // 恢复写数据 ready
        io_slave_awready <= 1'b1;  // 恢复写地址 ready
    end
end


endmodule