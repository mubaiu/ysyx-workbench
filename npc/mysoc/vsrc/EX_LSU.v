module EX_LSU(
    input wire clock,
    input wire reset,
    input wire stall,
    input wire flush,
    input wire data_valid_in,

    // 数据输入
    input wire [31:0] alu_result_in,
    input wire [31:0] rs2_data_in,
    input wire [3:0] rd_addr_in,

    // 控制信号输入
    input wire mem_read_in,
    input wire mem_write_in,
    input wire reg_write_in,
    input wire [2:0] funct3_in,
    input wire [3:0] lsu_wmask_in,

    // 数据输出
    output reg [31:0] alu_result_out,
    output reg [31:0] rs2_data_out,
    output reg [3:0] rd_addr_out,

    // 控制信号输出
    output reg mem_read_out,
    output reg mem_write_out,
    output reg reg_write_out,
    output reg [2:0] funct3_out,
    output reg [3:0] lsu_wmask_out
);

    always @(posedge clock) begin
        if (reset || flush) begin
            reg_write_out <= 1'b0;
            mem_read_out <= 1'b0;
            mem_write_out <= 1'b0;
            funct3_out <= 3'b0;
            lsu_wmask_out <= 4'b0;
            alu_result_out <= 32'h0;
            rs2_data_out <= 32'h0;
            rd_addr_out <= 4'h0;
        end
        else if (data_valid_in) begin
            alu_result_out <= alu_result_in;
            rs2_data_out <= rs2_data_in;
            rd_addr_out <= rd_addr_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            reg_write_out <= reg_write_in;
            funct3_out <= funct3_in;
            lsu_wmask_out <= lsu_wmask_in;
        end
    end

endmodule
