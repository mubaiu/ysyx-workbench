module LSU(
    input wire clk,
    input wire rst,
    
    // 内存控制信号
    input wire mem_read,
    input wire mem_write,
    
    // 地址和数据
    input wire [31:0] addr,
    input wire [31:0] store_data,
    output reg [31:0] load_data,
    
    // RAM接口
    output wire ram_we,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata,
    input wire [31:0] ram_rdata
);

    // RAM控制信号
    assign ram_we = mem_write;
    assign ram_addr = addr;
    assign ram_wdata = store_data;
    
    // 读内存操作
    always @(*) begin
        if (mem_read) begin
            load_data = ram_rdata;
        end else begin
            load_data = 32'h0;
        end
    end

endmodule
