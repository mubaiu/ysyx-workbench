module ID_EX(
    input wire clock,
    input wire reset,
    input wire stall,
    input wire flush,
    input wire data_valid_in,

    // 数据输入
    input wire [31:0] pc_in,
    input wire [31:0] inst_in,
    input wire [31:0] rs1_data_in,
    input wire [31:0] rs2_data_in,
    input wire [31:0] imm_in,
    input wire [3:0] rs1_addr_in,
    input wire [3:0] rs2_addr_in,
    input wire [3:0] rd_addr_in,

    // 控制信号输入
    input wire [3:0] alu_op_in,
    input wire alu_src_in,
    input wire mem_read_in,
    input wire mem_write_in,
    input wire reg_write_in,
    input wire branch_in,
    input wire jal_en_in,
    input wire jalr_en_in,
    input wire [2:0] funct3_in,
    input wire [3:0] lsu_wmask_in,
    input wire ebreak_en_in,
    input wire ecall_en_in,
    input wire mret_en_in,
    input wire auipc_flag_in,
    input wire is_csr_op_in,

    // 数据输出
    output reg [31:0] pc_out,
    output reg [31:0] inst_out,
    output reg [31:0] rs1_data_out,
    output reg [31:0] rs2_data_out,
    output reg [31:0] imm_out,
    output reg [3:0] rs1_addr_out,
    output reg [3:0] rs2_addr_out,
    output reg [3:0] rd_addr_out,

    // 控制信号输出
    output reg data_valid_out,
    output reg [3:0] alu_op_out,
    output reg alu_src_out,
    output reg mem_read_out,
    output reg mem_write_out,
    output reg reg_write_out,
    output reg branch_out,
    output reg jal_en_out,
    output reg jalr_en_out,
    output reg [2:0] funct3_out,
    output reg [3:0] lsu_wmask_out,
    output reg ebreak_en_out,
    output reg ecall_en_out,
    output reg mret_en_out,
    output reg auipc_flag_out,
    output reg is_csr_op_out
);

    always @(posedge clock) begin
        if (reset || flush) begin
            // 清零所有控制信号（插入气泡）
            data_valid_out <= 1'b0;
            reg_write_out <= 1'b0;
            mem_read_out <= 1'b0;
            mem_write_out <= 1'b0;
            branch_out <= 1'b0;
            jal_en_out <= 1'b0;
            jalr_en_out <= 1'b0;
            ebreak_en_out <= 1'b0;
            ecall_en_out <= 1'b0;
            mret_en_out <= 1'b0;
            is_csr_op_out <= 1'b0;
            alu_op_out <= 4'b0;
            alu_src_out <= 1'b0;
            funct3_out <= 3'b0;
            lsu_wmask_out <= 4'b0;
            auipc_flag_out <= 1'b0;
            pc_out <= 32'h0;
            inst_out <= 32'h0;
            rs1_data_out <= 32'h0;
            rs2_data_out <= 32'h0;
            imm_out <= 32'h0;
            rs1_addr_out <= 4'h0;
            rs2_addr_out <= 4'h0;
            rd_addr_out <= 4'h0;
        end
        else if (!stall) begin
            data_valid_out <= data_valid_in;
            pc_out <= pc_in;
            inst_out <= inst_in;
            rs1_data_out <= rs1_data_in;
            rs2_data_out <= rs2_data_in;
            imm_out <= imm_in;
            rs1_addr_out <= rs1_addr_in;
            rs2_addr_out <= rs2_addr_in;
            rd_addr_out <= rd_addr_in;
            alu_op_out <= alu_op_in;
            alu_src_out <= alu_src_in;
            mem_read_out <= mem_read_in;
            mem_write_out <= mem_write_in;
            reg_write_out <= reg_write_in;
            branch_out <= branch_in;
            jal_en_out <= jal_en_in;
            jalr_en_out <= jalr_en_in;
            funct3_out <= funct3_in;
            lsu_wmask_out <= lsu_wmask_in;
            ebreak_en_out <= ebreak_en_in;
            ecall_en_out <= ecall_en_in;
            mret_en_out <= mret_en_in;
            auipc_flag_out <= auipc_flag_in;
            is_csr_op_out <= is_csr_op_in;
        end
    end

endmodule
