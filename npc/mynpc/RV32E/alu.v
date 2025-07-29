module alu(
    input wire [3:0] alu_op,
    input wire [31:0] in1,
    input wire [31:0] in2,
    output reg [31:0] out,
    output wire zero
);

    // ALU操作码定义
    parameter ALU_ADD  = 4'b0000;
    parameter ALU_SUB  = 4'b0001;
    parameter ALU_SLL  = 4'b0010;
    parameter ALU_SLT  = 4'b0011;
    parameter ALU_SLTU = 4'b0100;
    parameter ALU_XOR  = 4'b0101;
    parameter ALU_SRL  = 4'b0110;
    parameter ALU_SRA  = 4'b0111;
    parameter ALU_OR   = 4'b1000;
    parameter ALU_AND  = 4'b1001;

    // 零标志 - 放在always块中计算
    reg zero_r;
    assign zero = zero_r;

    // ALU操作
    always @(*) begin
        case (alu_op)
            ALU_ADD:  out = in1 + in2;
            ALU_SUB:  out = in1 - in2;
            ALU_SLL:  out = in1 << in2[4:0];
            ALU_SLT:  out = ($signed(in1) < $signed(in2)) ? 32'b1 : 32'b0;
            ALU_SLTU: out = (in1 < in2) ? 32'b1 : 32'b0;
            ALU_XOR:  out = in1 ^ in2;
            ALU_SRL:  out = in1 >> in2[4:0];
            ALU_SRA:  out = $signed(in1) >>> in2[4:0];
            ALU_OR:   out = in1 | in2;
            ALU_AND:  out = in1 & in2;
            default:  out = 0;
        endcase
        zero_r = (out == 0);
    end

endmodule
