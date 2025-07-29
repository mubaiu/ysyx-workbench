module decode(
    input wire [31:0] inst,
    output wire [4:0] rs1,
    output wire [4:0] rs2,
    output wire [4:0] rd,
    output reg [31:0] imm
);

    // 操作码
    wire [6:0] opcode = inst[6:0];
    
    // 寄存器地址
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign rd = inst[11:7];
    
    // 立即数生成
    always @(*) begin
        case (opcode)
            7'b0110111: imm = {inst[31:12], 12'b0};                          // LUI
            7'b0010111: imm = {inst[31:12], 12'b0};                          // AUIPC
            7'b1101111: imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0}; // JAL
            7'b1100111: imm = {{21{inst[31]}}, inst[30:20]};                 // JALR
            7'b1100011: imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};  // 分支指令
            7'b0000011: imm = {{21{inst[31]}}, inst[30:20]};                 // 加载指令
            7'b0100011: imm = {{21{inst[31]}}, inst[30:25], inst[11:7]};     // 存储指令
            7'b0010011: imm = {{21{inst[31]}}, inst[30:20]};                 // 立即数运算指令
            default:    imm = 32'b0;
        endcase
    end

endmodule
