module IF_ID(
    input wire clock,
    input wire reset,
    input wire stall,
    input wire flush,

    input wire [31:0] pc_in,
    input wire [31:0] inst_in,
    input wire inst_valid_in,

    output reg [31:0] pc_out,
    output reg [31:0] inst_out,
    output reg inst_valid_out
);

    always @(posedge clock) begin
        inst_valid_out <= inst_valid_in;
        if (reset || flush) begin
            pc_out <= 32'h0;
            inst_out <= 32'h0;
            inst_valid_out <= 1'b0;
        end
        else if (!stall && inst_valid_in) begin
            pc_out <= pc_in;
            inst_out <= inst_in;
        end
    end

endmodule
