module LSU_WB(
    input wire clock,
    input wire reset,
    input wire data_valid_in,

    // 数据输入
    input wire [31:0] pc_in,
    input wire [31:0] next_pc_in,
    input wire [31:0] inst_in,
    input wire [31:0] alu_result_in,
    input wire [31:0] load_data_in,
    input wire [3:0] rd_addr_in,

    // 控制信号输入
    input wire reg_write_in,
    input wire mem_to_reg_in,
    input wire ebreak_in,
    input wire skip_ref_in,

    // 数据输出
    output reg [31:0] pc_out,
    output reg [31:0] next_pc_out,
    output reg [31:0] inst_out,
    output reg [31:0] alu_result_out,
    output reg [31:0] load_data_out,
    output reg [3:0] rd_addr_out,

    // 控制信号输出
    output reg data_valid_out,
    output reg reg_write_out,
    output reg mem_to_reg_out,
    output reg ebreak_out,
    output reg skip_ref_out
);

    always @(posedge clock) begin
        if (reset) begin
            data_valid_out <= 1'b0;
            reg_write_out <= 1'b0;
            mem_to_reg_out <= 1'b0;
            ebreak_out <= 1'b0;
            skip_ref_out <= 1'b0;
            pc_out <= 32'h0;
            next_pc_out <= 32'h0;
            inst_out <= 32'h0;
            alu_result_out <= 32'h0;
            load_data_out <= 32'h0;
            rd_addr_out <= 4'h0;
        end
        else begin
            data_valid_out <= data_valid_in;
            if (data_valid_in) begin
                pc_out <= pc_in;
                next_pc_out <= next_pc_in;
                inst_out <= inst_in;
                alu_result_out <= alu_result_in;
                load_data_out <= load_data_in;
                rd_addr_out <= rd_addr_in;
                reg_write_out <= reg_write_in;
                mem_to_reg_out <= mem_to_reg_in;
                ebreak_out <= ebreak_in;
                skip_ref_out <= skip_ref_in;
            end
            else begin
                reg_write_out <= 1'b0;
                mem_to_reg_out <= 1'b0;
                ebreak_out <= 1'b0;
                skip_ref_out <= 1'b0;
            end
        end
    end

endmodule
