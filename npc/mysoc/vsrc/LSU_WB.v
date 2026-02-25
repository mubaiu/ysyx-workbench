module LSU_WB(
    input wire clock,
    input wire reset,

    // 数据输入
    input wire [31:0] alu_result_in,
    input wire [31:0] load_data_in,
    input wire [3:0] rd_addr_in,

    // 控制信号输入
    input wire reg_write_in,
    input wire mem_to_reg_in,

    // 数据输出
    output reg [31:0] alu_result_out,
    output reg [31:0] load_data_out,
    output reg [3:0] rd_addr_out,

    // 控制信号输出
    output reg reg_write_out,
    output reg mem_to_reg_out
);

    always @(posedge clock) begin
        if (reset) begin
            reg_write_out <= 1'b0;
            mem_to_reg_out <= 1'b0;
            alu_result_out <= 32'h0;
            load_data_out <= 32'h0;
            rd_addr_out <= 4'h0;
        end
        else begin
            alu_result_out <= alu_result_in;
            load_data_out <= load_data_in;
            rd_addr_out <= rd_addr_in;
            reg_write_out <= reg_write_in;
            mem_to_reg_out <= mem_to_reg_in;
        end
    end

endmodule
