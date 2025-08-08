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

    import "DPI-C" function void vaddr_write(input int addr, input int len, input int data);
    import "DPI-C" function int vaddr_read(input int addr, input int len);

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
                3'b000: begin  // lb - load byte (sign extended)
                    temp_data = vaddr_read(addr, 1);
                    load_data = {{24{temp_data[7]}}, temp_data[7:0]};
                end
                3'b100: begin  // lbu - load byte unsigned
                    load_data = vaddr_read(addr, 1);
                end
                3'b001: begin  // lh - load halfword (sign extended)
                    temp_data = vaddr_read(addr, 2);
                    load_data = {{16{temp_data[15]}}, temp_data[15:0]};
                end
                3'b101: begin  // lhu - load halfword unsigned
                    load_data = vaddr_read(addr, 2);
                end
                3'b010: begin  // lw - load word
                    load_data = vaddr_read(addr, 4);
                end
                default: load_data = vaddr_read(addr, 4); // 默认按字读取
            endcase
        end 
        else if (mem_write) begin
            load_data = 32'h0; // 如果不是读操作，返回0
            case (funct3) 
                3'b000: vaddr_write(addr, 1, store_data); // sb
                3'b001: vaddr_write(addr, 2, store_data); // sh
                3'b010: vaddr_write(addr, 4, store_data); // sw
                default: vaddr_write(addr, 4, store_data); // 默认按字写入
            endcase
        end
        else begin
            load_data = 32'h0;
        end
    end

endmodule
