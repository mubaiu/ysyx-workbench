module Memory (
    input wire clk,            // 添加时钟输入
    input wire we,             // 写使能
    input wire re,             // 读使能
    input wire [7:0] addr,     // 8位地址（256个位置）
    input wire [1:0] byte_sel, // 字节选择
    input wire [31:0] wdata,   // 写数据
    input wire [2:0] funct3,   // 功能码
    output reg [31:0] rdata    // 读数据
);
    // 256 x 32bit 存储器阵列
    reg [31:0] mem [0:255];
    
    always @(*) begin
        if (re) begin
            case(funct3)
                3'b000: begin // lb - 符号扩展
                    case(byte_sel)
                        2'b00: rdata = {{24{mem[addr][7]}}, mem[addr][7:0]};
                        2'b01: rdata = {{24{mem[addr][15]}}, mem[addr][15:8]};
                        2'b10: rdata = {{24{mem[addr][23]}}, mem[addr][23:16]};
                        2'b11: rdata = {{24{mem[addr][31]}}, mem[addr][31:24]};
                    endcase
                end
                3'b001: begin // lh - 符号扩展
                    case(byte_sel[1])
                        1'b0: rdata = {{16{mem[addr][15]}}, mem[addr][15:0]};
                        1'b1: rdata = {{16{mem[addr][31]}}, mem[addr][31:16]};
                    endcase
                end
                3'b010: begin // lw
                    rdata = mem[addr];
                end
                3'b100: begin // lbu - 零扩展
                    case(byte_sel)
                        2'b00: rdata = {24'b0, mem[addr][7:0]};
                        2'b01: rdata = {24'b0, mem[addr][15:8]};
                        2'b10: rdata = {24'b0, mem[addr][23:16]};
                        2'b11: rdata = {24'b0, mem[addr][31:24]};
                    endcase
                end
                3'b101: begin // lhu - 零扩展
                    case(byte_sel[1])
                        1'b0: rdata = {16'b0, mem[addr][15:0]};
                        1'b1: rdata = {16'b0, mem[addr][31:16]};
                    endcase
                end
                default: rdata = mem[addr]; // 默认读字
            endcase
        end
        else begin
            rdata = 32'h0; 
        end
    end
    
    // 写操作 - 时序逻辑
    always @(posedge clk) begin
        if (we) begin
            case (funct3)
                3'b000: begin // sb
                    case(byte_sel)
                        2'b00: mem[addr][7:0] <= wdata[7:0];
                        2'b01: mem[addr][15:8] <= wdata[7:0];
                        2'b10: mem[addr][23:16] <= wdata[7:0];
                        2'b11: mem[addr][31:24] <= wdata[7:0];
                    endcase
                end
                3'b001: begin // sh
                    case(byte_sel[1])
                        1'b0: mem[addr][15:0] <= wdata[15:0];
                        1'b1: mem[addr][31:16] <= wdata[15:0];
                    endcase
                end
                3'b010: begin // sw
                    mem[addr] <= wdata;
                end
                default: mem[addr] <= wdata; // 默认写字
            endcase
        end
    end

endmodule