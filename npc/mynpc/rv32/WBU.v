module WBU(
    // 写回数据选择
    input wire [31:0] alu_result,
    input wire [31:0] load_data,
    input wire [31:0] snpc,     // 静态PC，替代pc_plus4
    
    input wire mem_to_reg,
    input wire jump,
    
    // 输出写回数据
    output reg [31:0] wb_data
);

    always @(*) begin
        if (jump) begin
            wb_data = snpc;     // JAL/JALR指令存储返回地址
        end else if (mem_to_reg) begin
            wb_data = load_data; // 加载指令
        end else begin
            wb_data = alu_result; // ALU操作
        end
    end

endmodule
