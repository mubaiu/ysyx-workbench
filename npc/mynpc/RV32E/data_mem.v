module data_mem(
    input wire clk,
    input wire [31:0] addr,
    input wire [31:0] wdata,
    input wire we,
    input wire re,
    input wire [2:0] funct3,
    output reg [31:0] rdata
);

    import "DPI-C" function int vaddr_read(input int addr, input int len);
    import "DPI-C" function void vaddr_write(input int addr, input int data, input int len);

    // 使用32位临时变量以匹配vaddr_read返回值
    /* verilator lint_off UNUSEDSIGNAL */
    reg [31:0] temp_val;
    /* verilator lint_on UNUSEDSIGNAL */
    
    // 存储器读取 - 修复WIDTHTRUNC警告
    always @(*) begin
        // 默认值，防止latch推断
        temp_val = 32'h0;
        rdata = 32'b0;
        
        if (re) begin
            case (funct3)
                3'b000: begin // LB
                    // 使用32位临时变量存储vaddr_read的结果
                    temp_val = vaddr_read(addr, 1);
                    rdata = {{24{temp_val[7]}}, temp_val[7:0]};
                end
                3'b001: begin // LH
                    temp_val = vaddr_read(addr, 2);
                    rdata = {{16{temp_val[15]}}, temp_val[15:0]};
                end
                3'b010: begin // LW
                    rdata = vaddr_read(addr, 4);
                end
                3'b100: begin // LBU
                    temp_val = vaddr_read(addr, 1);
                    rdata = {24'b0, temp_val[7:0]};
                end
                3'b101: begin // LHU
                    temp_val = vaddr_read(addr, 2);
                    rdata = {16'b0, temp_val[15:0]};
                end
                default: rdata = vaddr_read(addr, 4);
            endcase
        end
    end
    
    // 存储器写入 - 修复WIDTHEXPAND警告
    always @(posedge clk) begin
        if (we) begin
            case (funct3)
                3'b000: begin // SB
                    // 使用32位值而不是8位，修复WIDTHEXPAND警告
                    vaddr_write(addr, {{24{1'b0}}, wdata[7:0]}, 1);
                end
                3'b001: begin // SH
                    // 使用32位值而不是16位，修复WIDTHEXPAND警告
                    vaddr_write(addr, {{16{1'b0}}, wdata[15:0]}, 2);
                end
                3'b010: begin // SW
                    vaddr_write(addr, wdata, 4);
                end
                default: vaddr_write(addr, wdata, 4);
            endcase
        end
    end

endmodule
