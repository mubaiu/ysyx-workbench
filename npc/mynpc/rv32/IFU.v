module IFU(
    input wire clk,
    input wire rst,
    
    // 分支控制信号
    input wire branch_taken,
    input wire [31:0] branch_target,
    
    // PC输出
    output reg [31:0] pc,
    output wire [31:0] snpc,   // 静态下一个PC
    output wire [31:0] dnpc,   // 动态下一个PC
    
    // 从指令存储器获取的指令
    input wire [31:0] inst,
    output wire [31:0] inst_out
);

    // 静态PC（顺序执行的下一个PC）
    assign snpc = pc + 32'd4;
    
    // 动态PC（考虑分支/跳转的下一个PC）
    assign dnpc = branch_taken ? branch_target : snpc;
    
    // 指令传递
    assign inst_out = inst;
    
    // PC更新逻辑
    always @(posedge clk) begin
        if (rst) begin
            pc <= 32'h0;
        end else begin
            pc <= dnpc;
        end
    end

endmodule
