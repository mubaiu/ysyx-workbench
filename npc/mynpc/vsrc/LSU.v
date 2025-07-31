module LSU(

    
    // 内存控制信号
    input wire mem_read,
    input wire mem_write,
    input wire [2:0] funct3, 
    
    // 地址和数据
    input wire [31:0] addr,
    input wire [31:0] store_data,
    output reg [31:0] load_data,
    
    // RAM接口
    output wire ram_we,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata
);

    import "DPI-C" function void paddr_write(input int addr, input int len, input int data);
    import "DPI-C" function int paddr_read(input int addr, input int len);

    // RAM控制信号
    assign ram_we = mem_write;
    assign ram_addr = addr;
    assign ram_wdata = store_data;
    
    reg [31:0] temp_data;

    // 读内存操作
    always @(*) begin
        if (mem_read) begin
            temp_data = 32'h0; // 默认值
            case (funct3)
                3'b100: begin
                    load_data = paddr_read(addr, 1);   //lbu
                end
                3'b101: begin
                    load_data = paddr_read(addr, 2);   //lhu
                end
                3'b001: begin
                    temp_data = paddr_read(addr, 2);
                    load_data = {{16{temp_data[15]}}, temp_data[15:0]};   //lh
                end
                default: load_data = paddr_read(addr, 4); // 从计算出的地址读取数据

            endcase
        end 
        else if (mem_write) begin
            load_data = 32'h0; // 如果不是读操作，返回0
            case (funct3) 
                3'b000: paddr_write(addr, 1, store_data); // sb
                3'b001: paddr_write(addr, 2, store_data); // sh
                default: paddr_write(addr, 4, store_data); // sw
            endcase
        end
        else begin
            load_data = 32'h0;
        end
    end

endmodule
