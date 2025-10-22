module IFU(
    input wire clock,
    input wire reset,
    input wire io_ifu_respValid,
    input wire [31:0] io_ifu_rdata,
    input wire idu_ready,
    input wire mem_read, 
    input wire mem_write,
    input wire wbu_ready,
    input wire io_lsu_reqValid, 
    input wire io_lsu_respValid, // 来自LSU的内存响应信号

    // 分支控制信号
    input wire mret_taken, // MRET跳转标志
    input wire [31:0] mret_target, // MRET跳转目标地址
    input wire ecall_taken,
    input wire [31:0] ecall_target,
    input wire branch_taken,
    input wire [31:0] branch_target,
    
    output reg [31:0] pc,
    output reg [31:0] snpc, // 静态下一个PC
    // output wire [31:0] dnpc, // 动态下一个PC
    output wire inst_valid,
    output wire io_ifu_reqValid,
    output wire [31:0] io_ifu_addr,
    output wire [31:0] inst // 从指令存储器获取的
);
    // 状态定义
    localparam IDLE = 3'd0;
    localparam FETCH = 3'd1;
    localparam WAIT = 3'd2;
    localparam EXECUTE = 3'd3;

    import "DPI-C" function int intake(input int pc);
    import "DPI-C" function void set_snpc(input int pc);
    import "DPI-C" function void set_dnpc(input int pc);
    import "DPI-C" function void set_pc(input int pc);

    reg [31:0] dnpc; // 动态下一个PC
    reg [31:0] dnpc_reg;
    reg [2:0] state;
    reg [2:0] next_state;
    // reg [31:0] inst_reg;
    reg isu_ready_reg;
    
    assign io_ifu_addr = pc;
    assign inst = io_ifu_rdata;

    always @(*) begin
        snpc = pc + 32'd4;
    end

    // 动态PC（考虑分支/跳转的下一个PC）
    always @(*) begin
        dnpc = mret_taken ? mret_target :  // MRET优先级最高
                    ecall_taken ? ecall_target : 
                    branch_taken ? branch_target : 
                    snpc;
    end

     // 下一状态逻辑
    always @(*) begin
          state = next_state;
    end


    // PC更新逻辑
    always @(posedge clock) begin
        if (reset) begin
            pc <= 32'h30000000;
            inst_valid <= 1'b0;
            io_ifu_reqValid <= 1'b0;
            next_state <= FETCH;
            dnpc_reg <= 32'h30000004;
        end 
        else begin
            case(state)
                IDLE: begin
                        io_ifu_reqValid <= 1'b0;
                        inst_valid <= 1'b0;
                        pc <= dnpc_reg;
                        set_snpc(snpc);
                        set_dnpc(dnpc_reg);
                        set_pc(pc);
                        next_state <= FETCH;
                end
                FETCH: begin
                    // inst_reg <= intake(pc);
                    io_ifu_reqValid <= 1'b1;
                    inst_valid <= 1'b0;
                    next_state <= WAIT;
                end
                WAIT: begin
                    io_ifu_reqValid <= 1'b0;
                    inst_valid <= 1'b0;
                    if(io_ifu_respValid) begin
                        inst_valid <= 1'b1;
                        next_state <= EXECUTE;
                    end
                    else if(io_lsu_respValid)
                        next_state <= IDLE;
                    else 
                        next_state <= WAIT;
                end
                EXECUTE: begin
                    io_ifu_reqValid <= 1'b0;
                    inst_valid <= 1'b1;
                    dnpc_reg <= dnpc;
                    if (io_lsu_reqValid) begin
                        next_state <= WAIT; 
                        inst_valid <= 1'b0;       
                    end
                    else begin
                        next_state <= IDLE;
                        inst_valid <= 1'b0;
                    end
                end
                default: ;
            endcase
        end
    end


endmodule

