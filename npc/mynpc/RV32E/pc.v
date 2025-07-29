module pc(
    input wire clk,
    input wire rst,
    input wire [31:0] dnpc,
    output reg [31:0] pc,
    output wire [31:0] snpc
);

    // 顺序PC = PC + 4
    assign snpc = pc + 4;

    always @(posedge clk) begin
        if (rst) begin
            pc <= 32'h80000000;  // 初始PC值
        end
        else begin
            pc <= dnpc;
        end
    end

endmodule
