module LSU(
    input  wire        clock,
    input  wire        reset,
    // 内存控制信号
    input  wire [31:0] io_lsu_rdata,
    input  wire        io_lsu_rvalid,
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire [2:0]  funct3, 
    // 地址和数据
    input  wire [31:0] addr,
    input  wire [3:0]  lsu_wmask, 
    input  wire [31:0] store_data,
    output reg  [31:0] load_data,
    output wire        mem_to_reg,
    // RAM接口
    output wire [31:0] io_lsu_araddr,
    output wire [31:0] io_lsu_awaddr,
    output reg  [31:0] io_lsu_wdata,
    output wire [2:0]  io_lsu_arsize,
    output wire [2:0]  io_lsu_awsize,
    output reg  [3:0]  io_lsu_wstrb,
    output wire        lsu_ready
);

`ifdef VERILATOR
    import "DPI-C" function void vaddr_write(input int addr, input int len, input int data);
    import "DPI-C" function int vaddr_read(input int addr, input int len);
    import "DPI-C" function void perf_mem_inst();
`endif
                               
    // 检测字节访问：lb/lbu/sb 指令不需要对齐
    // wire is_mrom_access = (addr_reg >= 32'h2000_0000 && addr_reg <= 32'h2000_0fff);
    // wire is_uart_access = (addr_reg >= 32'h1000_0000 && addr_reg <= 32'h1000_0fff);
    // wire is_psram_access = (addr_reg >= 32'h8000_0000 && addr_reg <= 32'h8fff_ffff);
    // wire is_sdram_access = (addr_reg >= 32'ha000_0000 && addr_reg <= 32'hbfff_ffff);
    // wire is_chiplink_access = (addr_reg >= 32'hc000_0000);
    // wire not_align = (is_uart_access || is_psram_access || is_sdram_access);
    // wire is_byte_read  = mem_read && (funct3 == 3'b000 || funct3 == 3'b100);  // lb/lbu
    // wire is_byte_write = mem_write && (lsu_wmask == 4'b0001);                 // sb
    // wire is_byte_access = is_byte_read || is_byte_write;

    // RAM控制信号：字节访问不对齐，字/半字访问对齐到4字节边界
    assign io_lsu_araddr = addr_reg;
    assign io_lsu_awaddr = addr_reg;
    assign io_lsu_arsize = lsu_size;
    assign io_lsu_awsize = lsu_size;
    assign lsu_ready     = lsu_ready_reg;
    assign mem_to_reg    = (io_lsu_rvalid && load_flag) ? 1'b1 : 1'b0;


    reg [31:0] addr_reg        ;
    reg [2:0]  lsu_size        ;
    reg        lsu_ready_reg   ;
    reg        load_flag       ;

    always @(posedge clock) begin
        if (mem_read) begin
            load_flag <= 1'b1;
`ifdef VERILATOR
            perf_mem_inst();
`endif
        end
        else if (mem_write) begin
`ifdef VERILATOR
            perf_mem_inst();
`endif
        end
        else if (io_lsu_rvalid)
            load_flag <= 1'b0;
    end

    always @(posedge clock) begin
        if (reset)
            lsu_ready_reg <= 1'b1;
        else if (mem_read || mem_write) begin
            lsu_ready_reg <= 1'b0;
            addr_reg <= addr;
        end
        else if (io_lsu_rvalid)
            lsu_ready_reg <= 1'b1;
    end

    always @(posedge clock) begin
        if (mem_read) begin
            lsu_size <= (funct3 == 3'b000 || funct3 == 3'b100) ? 3'b000 : // byte
                      (funct3 == 3'b001 || funct3 == 3'b101) ? 3'b001 : // halfword
                      3'b010; // word
        end
        else if (mem_write) begin
            lsu_size <= (lsu_wmask == 4'b0001) ? 3'b000 : // byte
                      (lsu_wmask == 4'b0011) ? 3'b001 : // halfword
                      3'b010; // word
            case (lsu_wmask) 
                4'b0001: begin //SB
                    case (addr[1:0])
                        2'b00: io_lsu_wstrb <= 4'b0001;  // 字节0
                        2'b01: io_lsu_wstrb <= 4'b0010;  // 字节1
                        2'b10: io_lsu_wstrb <= 4'b0100;  // 字节2
                        2'b11: io_lsu_wstrb <= 4'b1000;  // 字节3
                    endcase
                end
                4'b0011: begin //SH
                    case (addr[1]) 
                        1'b0: io_lsu_wstrb <= 4'b0011;  // 半字0-1
                        1'b1: io_lsu_wstrb <= 4'b1100;  // 半字2-3
                    endcase
                end
                4'b1111: io_lsu_wstrb <= 4'b1111; //SW
                default: io_lsu_wstrb <= 4'b0000; // 默认按
            endcase

            case (lsu_wmask)
                4'b0001: begin
                    case (addr[1:0])
                        2'b00: io_lsu_wdata <= {24'b0, store_data[7:0]};  // 字节0
                        2'b01: io_lsu_wdata <= {16'b0, store_data[7:0], 8'b0};  // 字节1
                        2'b10: io_lsu_wdata <= {8'b0, store_data[7:0], 16'b0};  // 字节2
                        2'b11: io_lsu_wdata <= {store_data[7:0], 24'b0};  // 字节3
                    endcase
                end
                4'b0011: begin
                    case (addr[1])
                        1'b0: io_lsu_wdata <= {16'b0, store_data[15:0]};  // 半字0-1
                        1'b1: io_lsu_wdata <= {store_data[15:0], 16'b0};  // 半字2-3
                    endcase
                end
                4'b1111: io_lsu_wdata <= store_data; //SW
                default: io_lsu_wdata <= 32'b0; // 默认按
            endcase
        end
    end

    always @(*) begin
        load_data = 32'b0;
        if (io_lsu_rvalid && load_flag) begin
            case(funct3)
                3'b000: begin // lb
                    case (addr_reg[1:0])
                        2'b00: load_data = {{24{io_lsu_rdata[7]}}, io_lsu_rdata[7:0]};
                        2'b01: load_data = {{24{io_lsu_rdata[15]}}, io_lsu_rdata[15:8]};
                        2'b10: load_data = {{24{io_lsu_rdata[23]}}, io_lsu_rdata[23:16]};
                        2'b11: load_data = {{24{io_lsu_rdata[31]}}, io_lsu_rdata[31:24]};
                    endcase
                end
                3'b100: begin // lbu
                    case (addr_reg[1:0])
                        2'b00: load_data = {24'b0, io_lsu_rdata[7:0]};
                        2'b01: load_data = {24'b0, io_lsu_rdata[15:8]};
                        2'b10: load_data = {24'b0, io_lsu_rdata[23:16]};
                        2'b11: load_data = {24'b0, io_lsu_rdata[31:24]};
                    endcase
                end
                3'b001: begin // lh
                    case (addr_reg[1])
                        1'b0: load_data = {{16{io_lsu_rdata[15]}}, io_lsu_rdata[15:0]};
                        1'b1: load_data = {{16{io_lsu_rdata[31]}}, io_lsu_rdata[31:16]};
                    endcase
                end
                3'b101: begin // lhu
                    case (addr_reg[1])
                        1'b0: load_data = {16'b0, io_lsu_rdata[15:0]};
                        1'b1: load_data = {16'b0, io_lsu_rdata[31:16]};
                    endcase 
                end
                3'b010: load_data = io_lsu_rdata; // lw
                default: load_data = io_lsu_rdata;
            endcase
        end
    end

    // always @(*) begin
    //     load_data = 32'b0;
    //     if (io_lsu_rvalid && load_flag) begin
    //         case(funct3)
    //             3'b000: load_data = {{24{io_lsu_rdata[7]}}, io_lsu_rdata[7:0]}; // lb
    //             3'b100: load_data = io_lsu_rdata; // lbu 
    //             3'b001: load_data = {{16{io_lsu_rdata[15]}}, io_lsu_rdata[15:0]}; // lh
    //             3'b101: load_data = io_lsu_rdata; // lhu
    //             3'b010: load_data = io_lsu_rdata; // lw
    //             default: load_data = io_lsu_rdata;
    //         endcase
    //     end
    // end
    //读内存操作
    // always @(posedge clock) begin
    //     if(reset) begin
    //         mem_to_reg <= 1'b0;
    //         respValid <= 1'b0;
    //     end
    //     else if (mem_read) begin
    //         case (funct3)
    //             3'b000: begin  // lb - load byte (sign extended)
    //                 load_data <= {{24{temp_data[7]}}, temp_data[7:0]};
    //             end
    //             3'b100: begin  // lbu - load byte unsigned
    //                 load_data <= temp_data;
    //             end
    //             3'b001: begin  // lh - load halfword (sign extended)
    //                 load_data <= {{16{temp_data[15]}}, temp_data[15:0]};
    //             end
    //             3'b101: begin  // lhu - load halfword unsigned
    //                 load_data <= temp_data;
    //             end
    //             3'b010: begin  // lw - load word
    //                 load_data <= temp_data;
    //             end
    //             default: load_data <= temp_data;
    //         endcase
    //         respValid <= 1'b1;
    //         mem_to_reg <= 1'b1;
    //     end 
    //     else if (mem_write) begin
    //         load_data <= 32'h0; // 如果不是读操作，返回0
    //         mem_to_reg <= 1'b0;
    //         case (funct3) 
    //             3'b000: vaddr_write(addr, 1, store_data); // sb
    //             3'b001: vaddr_write(addr, 2, store_data); // sh
    //             3'b010: vaddr_write(addr, 4, store_data); // sw
    //             default: vaddr_write(addr, 4, store_data); // 默认按字写入
    //         endcase
    //         respValid <= 1'b1;
    //     end
    //     else begin
    //         load_data <= 32'h0;
    //         mem_to_reg <= 1'b0;
    //         respValid <= 1'b0;
    //     end
    // end

endmodule
