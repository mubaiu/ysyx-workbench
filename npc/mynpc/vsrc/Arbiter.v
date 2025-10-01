/***************************************************************************************
* AXI4-Lite Arbiter Module
* 
* 功能描述:
* - 实现两个Master(IFU和LSU)到单个Slave的仲裁
* - 支持AXI4-Lite协议的读写通道
* - 优先级: LSU写 > IFU读 > LSU读
* 
* 优化特性:
* - 使用单周期状态机，减少延迟
* - 地址握手完成后立即锁定事务
* - 组合逻辑直通，降低延迟
* - 分离的握手逻辑，避免时序问题
***************************************************************************************/

module Arbiter (
    input wire clock,
    input wire reset,
    
    // ===== IFU Master 接口 =====
    input wire        io_ifu_arvalid, //AR
    input wire [31:0] io_ifu_araddr,

    input wire        io_ifu_rready,  //R
    output wire [31:0] io_ifu_rdata,
    output wire        io_ifu_rvalid,
    output wire [1:0]  io_ifu_rresp,

    input wire [31:0] io_ifu_awaddr,  //AW
    input wire        io_ifu_awvalid,

    input wire [31:0] io_ifu_wdata,   //W
    input wire [3:0]  io_ifu_wstrb,
    input wire        io_ifu_wvalid,

    input wire        io_ifu_bready,  //B

    // ===== LSU Master 接口 =====
    input wire        io_lsu_arvalid,  //AR
    input wire [31:0] io_lsu_araddr,

    input wire        io_lsu_rready,   //R
    output wire [31:0] io_lsu_rdata,
    output wire        io_lsu_rvalid,
    output wire [1:0]  io_lsu_rresp,

    input wire        io_lsu_awvalid,  //AW
    input wire [31:0] io_lsu_awaddr,

    input wire        io_lsu_wvalid,   //W
    input wire [31:0] io_lsu_wdata,
    input wire [3:0]  io_lsu_wstrb,

    input wire        io_lsu_bready,  //B
    output wire [1:0]  io_lsu_bresp,
    output wire        io_lsu_bvalid,

    // ===== Slave 接口 =====
    input wire        io_master_arready,
    input wire        io_master_rvalid,
    input wire [31:0] io_master_rdata,
    input wire [1:0]  io_master_rresp,

    output wire       io_master_arvalid,
    output wire[31:0] io_master_araddr,
    output wire       io_master_rready,
    
    input wire        io_master_awready,
    input wire        io_master_wready,
    input wire        io_master_bvalid,
    input wire [1:0]  io_master_bresp,

    output wire       io_master_awvalid,
    output wire[31:0] io_master_awaddr,
    output wire       io_master_wvalid,
    output wire[31:0] io_master_wdata,
    output wire[3:0]  io_master_wstrb,
    output wire       io_master_bready
);

    // =========================================================================
    // 状态机定义
    // =========================================================================
    localparam [1:0] IDLE       = 2'd0;  // 空闲，等待请求
    localparam [1:0] IFU_ACTIVE = 2'd1;  // IFU读事务进行中
    localparam [1:0] LSU_READ   = 2'd2;  // LSU读事务进行中
    localparam [1:0] LSU_WRITE  = 2'd3;  // LSU写事务进行中

    reg [1:0] state, next_state;
    
    always @(posedge clock) begin
        state <= next_state;
    end

    
    // =========================================================================
    // 状态转换组合逻辑 - 优化版
    // =========================================================================
    wire ar_handshake = io_master_arvalid && io_master_arready;  // 读地址握手
    wire r_handshake  = io_master_rready  && io_master_rvalid;     // 读数据握手
    wire aw_handshake = io_master_awvalid && io_master_awready;  // 写地址握手
    wire w_handshake  = io_master_wvalid  && io_master_wready;     // 写数据握手
    wire b_handshake  = io_master_bready  && io_master_bvalid;     // 写响应握手

    wire lsu_write_req = io_lsu_awvalid && io_lsu_wvalid;      // LSU写请求
    
    always @(*) begin
        if(reset) begin
            next_state = IDLE;
        end
        else begin
            next_state = state;
            case (state)
                IDLE: begin
                    // 仲裁优先级: LSU写 > IFU读 > LSU读
                    if (lsu_write_req) begin
                        next_state = LSU_WRITE;
                    end else if (io_ifu_arvalid) begin
                        next_state = IFU_ACTIVE;
                    end else if (io_lsu_arvalid) begin
                        next_state = LSU_READ;
                    end
                end
                
                IFU_ACTIVE: begin
                    // 读数据握手完成，返回IDLE
                    if (r_handshake) begin
                        next_state = IDLE;
                    end
                end
                
                LSU_READ: begin
                    // 读数据握手完成，返回IDLE
                    if (r_handshake) begin
                        next_state = IDLE;
                    end
                end
                
                LSU_WRITE: begin
                    // 写响应握手完成，返回IDLE
                    if (b_handshake) begin
                        next_state = IDLE;
                    end
                end
                
                default: next_state = IDLE;
            endcase      
        end
    end
    
    // =========================================================================
    // 读地址/数据通道仲裁 - 直通式组合逻辑
    // =========================================================================
    assign io_master_arvalid = (state == IFU_ACTIVE) ? io_ifu_arvalid :
                          (state == LSU_READ)   ? io_lsu_arvalid :
                          1'b0;

    assign io_master_araddr = (state == IFU_ACTIVE) ? io_ifu_araddr : io_lsu_araddr;

    // =========================================================================
    // 读数据通道响应 - 直通式组合逻辑
    // =========================================================================
    assign io_master_rready = (state == IFU_ACTIVE) ? io_ifu_rready :
                          (state == LSU_READ)   ? io_lsu_rready :
                          1'b0;
    assign io_ifu_rdata = io_master_rdata;
    assign io_ifu_rvalid = (state == IFU_ACTIVE) ? io_master_rvalid : 1'b0;
    assign io_ifu_rresp = io_master_rresp;

    assign io_lsu_rdata = io_master_rdata;
    assign io_lsu_rvalid = (state == LSU_READ) ? io_master_rvalid : 1'b0;
    assign io_lsu_rresp = io_master_rresp;

    // =========================================================================
    // 写地址/数据通道仲裁 - 直通式组合逻辑
    // =========================================================================
    assign io_master_awvalid = (state == LSU_WRITE) ? io_lsu_awvalid : io_ifu_awvalid;
    assign io_master_awaddr  = (state == LSU_WRITE) ? io_lsu_awaddr : io_ifu_awaddr;
    assign io_master_wvalid  = (state == LSU_WRITE) ? io_lsu_wvalid : io_ifu_wvalid;
    assign io_master_wdata   = (state == LSU_WRITE) ? io_lsu_wdata : io_ifu_wdata;
    assign io_master_wstrb   = (state == LSU_WRITE) ? io_lsu_wstrb : io_ifu_wstrb;

    // =========================================================================
    // 写响应通道 - 直通式组合逻辑
    // =========================================================================
    assign io_master_bready = (state == LSU_WRITE) ? io_lsu_bready : io_ifu_bready;

    assign io_lsu_bresp  = io_master_bresp;
    assign io_lsu_bvalid = (state == LSU_WRITE) ? io_master_bvalid : 1'b0;

endmodule
