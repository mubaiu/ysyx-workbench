module LSU(
    input wire clk,
    input wire rst,
    // 内存控制信号
    input wire reqValid,
    input wire mem_read,
    input wire mem_write,
    input wire [2:0] funct3, 
    // 地址和数据
    input wire [31:0] addr,
    input wire [31:0] len, 
    input wire [31:0] store_data,
    output reg [31:0] load_data,
    output wire respValid,
    output wire mem_to_reg,
    // RAM接口
    output wire ram_we,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata,

    output wire lsu_ready
);

    import "DPI-C" function void vaddr_write(input int addr, input int len, input int data);
    import "DPI-C" function int vaddr_read(input int addr, input int len);

    // RAM控制信号
    assign ram_we = mem_write;
    assign ram_addr = addr;
    assign ram_wdata = store_data;

    assign lsu_ready = lsu_ready_reg;
    // Memory mem (
    //     .clk(clk),
    //     .we(mem_write),
    //     .re(mem_read),
    //     .addr(addr[9:2]), // 256个位置
    //     .byte_sel(addr[1:0]),
    //     .wdata(store_data),
    //     .funct3(funct3),
    //     .rdata(load_data)
    // );

    reg lsu_ready_reg;
    reg [31:0] temp_data;

    always @(*) begin
        temp_data = 32'h0;
        lsu_ready_reg = (mem_read) ? 1'b0 : 1'b1;
        if (mem_read) begin
            temp_data = vaddr_read(addr, len);
        end
    end

    //读内存操作
    always @(posedge clk) begin
        if(!rst) begin
            mem_to_reg <= 1'b0;
            respValid <= 1'b0;
        end
        else if (mem_read) begin
            case (funct3)
                3'b000: begin  // lb - load byte (sign extended)
                    load_data <= {{24{temp_data[7]}}, temp_data[7:0]};
                end
                3'b100: begin  // lbu - load byte unsigned
                    load_data <= temp_data;
                end
                3'b001: begin  // lh - load halfword (sign extended)
                    load_data <= {{16{temp_data[15]}}, temp_data[15:0]};
                end
                3'b101: begin  // lhu - load halfword unsigned
                    load_data <= temp_data;
                end
                3'b010: begin  // lw - load word
                    load_data <= temp_data;
                end
                default: load_data <= temp_data;
            endcase
            respValid <= 1'b1;
            mem_to_reg <= 1'b1;
        end 
        else if (mem_write) begin
            load_data <= 32'h0; // 如果不是读操作，返回0
            mem_to_reg <= 1'b0;
            case (funct3) 
                3'b000: vaddr_write(addr, 1, store_data); // sb
                3'b001: vaddr_write(addr, 2, store_data); // sh
                3'b010: vaddr_write(addr, 4, store_data); // sw
                default: vaddr_write(addr, 4, store_data); // 默认按字写入
            endcase
            respValid <= 1'b1;
        end
        else begin
            load_data <= 32'h0;
            mem_to_reg <= 1'b0;
            respValid <= 1'b0;
        end
    end

endmodule
