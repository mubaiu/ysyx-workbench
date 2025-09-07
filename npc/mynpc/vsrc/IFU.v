module IFU(
    input wire clk,
    input wire rst,
    input wire idu_ready,
    input wire mem_read, 
    input wire wbu_ready,
    input wire respValid, // 来自LSU的内存响应信号

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
    output wire [31:0] inst // 从指令存储器获取的
);
    // 状态定义
    localparam IDLE = 3'd0;
    localparam FETCH = 3'd1;
    localparam WAIT = 3'd2;

    import "DPI-C" function int intake(input int pc);
    import "DPI-C" function void set_snpc(input int pc);
    import "DPI-C" function void set_dnpc(input int pc);
    import "DPI-C" function void set_pc(input int pc);

    reg [31:0] dnpc; // 动态下一个PC
    reg [2:0] state;
    reg [2:0] next_state;
    reg [31:0] inst_reg;
    reg isu_ready_reg;
    

    assign inst = inst_reg;

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
          if(mem_read) state = WAIT;
    end


    // PC更新逻辑
    always @(posedge clk) begin
        if (!rst) begin
            pc <= 32'h80000000;
            inst_reg <= 32'h0;
            inst_valid <= 1'b0;
            next_state <= FETCH;
        end 
        else begin
            case(state)
                IDLE: begin
                        inst_reg <= 32'h0;
                        inst_valid <= 1'b0;
                        pc <= dnpc;
                        set_snpc(snpc);
                        set_dnpc(dnpc);
                        set_pc(pc);
                        next_state <= FETCH;
                end
                FETCH: begin
                    inst_reg <= intake(pc);
                    inst_valid <= 1'b1;
                    next_state <= IDLE;
                end
                WAIT: begin
                    inst_valid <= 1'b0;
                    if(respValid)
                        next_state <= IDLE;
                    else 
                        next_state <= WAIT;
                end
                default: ;
            endcase
        end
    end


endmodule

