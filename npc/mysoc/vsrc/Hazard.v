module Hazard(

    // Memory-stage ownership
    input wire ID_EX_mem_read,
    input wire ID_EX_mem_write,

    // Control-flow misprediction/exception/fence redirect
    input wire redirect,

    // LSU访存停顿检测
    input wire lsu_busy,
    input wire lsu_done,

    // 输出控制信号
    output reg stall_IF,
    output reg stall_ID,
    output reg stall_EX,
    output reg flush_IF,
    output reg flush_ID,
    output reg flush_EX,
    output reg flush_LSU
);

    always @(*) begin
        // 默认不阻塞、不冲刷
        stall_IF = 1'b0;
        stall_ID = 1'b0;
        stall_EX = 1'b0;
        flush_IF = 1'b0;
        flush_ID = 1'b0;
        flush_EX = 1'b0;
        flush_LSU = 1'b0;

        // LSU访存停顿检测(优先级最高)
        if (lsu_busy) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            stall_EX = 1'b1;
        end

        // LSU访存完成后清除EX_LSU中的访存指令
        if (lsu_done) begin
            flush_LSU = 1'b1;
        end

        // A memory instruction moves to EX/LSU while the following
        // instruction remains in IF/ID.  This avoids latching a consumer in
        // ID/EX for an arbitrarily long AXI wait after its forwarding source
        // has already left WB.
        if (ID_EX_mem_read || ID_EX_mem_write) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            flush_EX = 1'b1;
        end

        // 控制冒险检测
        if (redirect) begin
            flush_IF = 1'b1;
            flush_ID = 1'b1;
            flush_EX = 1'b1;
        end
    end

endmodule
