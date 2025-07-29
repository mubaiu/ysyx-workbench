module inst_mem(
    input wire clk,
    input wire rst,
    input wire [31:0] pc,
    output reg [31:0] inst
);

    import "DPI-C" function int vaddr_read(input int addr, input int len);
    
    // 添加指令预取逻辑
    reg [31:0] next_pc;
    reg [31:0] next_inst;
    
    // 在复位时初始化，并在每个时钟周期预取下一条指令
    always @(posedge clk) begin
        if (rst) begin
            // 复位时初始化为启动地址的指令
            inst <= vaddr_read(32'h80000000, 4);
            next_pc <= 32'h80000004; // 预取下一条指令的地址
            next_inst <= vaddr_read(32'h80000004, 4);
        end else begin
            // 输出当前指令（已预取好的）
            if (pc == next_pc) begin
                // 如果当前PC等于预取的PC，直接使用预取的指令
                inst <= next_inst;
            end else begin
                // 否则需要立即获取当前PC的指令
                inst <= vaddr_read(pc, 4);
            end
            
            // 预取下一条指令
            next_pc <= pc + 4;
            next_inst <= vaddr_read(pc + 4, 4);
        end
    end

endmodule
