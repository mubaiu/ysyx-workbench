module Hazard(
    input wire clock,

    // Load-Use冒险检测
    input wire ID_EX_mem_read,
    input wire [3:0] ID_EX_rd,
    input wire [3:0] ID_rs1,
    input wire [3:0] ID_rs2,

    // 控制冒险检测
    input wire branch_taken,
    input wire jal_en,
    input wire jalr_en,
    input wire ecall_taken,
    input wire mret_taken,

    // LSU访存停顿检测
    input wire lsu_busy,
    input wire lsu_done,

    // 输出控制信号
    output reg stall_IF,
    output reg stall_ID,
    output reg stall_EX,
    output reg stall_LSU,
    output reg flush_IF,
    output reg flush_ID,
    output reg flush_EX,
    output reg flush_LSU
);

`ifdef VERILATOR
    import "DPI-C" function void perf_ifu_stall_lsu();  // IFU被LSU阻塞
`endif

    always @(*) begin
        // 默认不阻塞、不冲刷
        stall_IF = 1'b0;
        stall_ID = 1'b0;
        stall_EX = 1'b0;
        stall_LSU = 1'b0;
        flush_IF = 1'b0;
        flush_ID = 1'b0;
        flush_EX = 1'b0;
        flush_LSU = 1'b0;

        // LSU访存停顿检测(优先级最高)
        if (lsu_busy) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            stall_EX = 1'b1;
            stall_LSU = 1'b1;  // 阻止EX_LSU寄存器更新
        end

        // LSU访存完成后清除ID_EX和EX_LSU中的访存指令
        if (lsu_done) begin
            flush_ID = 1'b1;
            flush_EX = 1'b1;
            flush_LSU = 1'b1;
        end

        // Load-Use冒险检测
        if (ID_EX_mem_read && ID_EX_rd != 4'h0 &&
            (ID_EX_rd == ID_rs1 || ID_EX_rd == ID_rs2)) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            flush_EX = 1'b1;  // 在EX阶段插入气泡
        end

        // 控制冒险检测
        if (branch_taken || jal_en || jalr_en || ecall_taken || mret_taken) begin
            flush_IF = 1'b1;
            flush_ID = 1'b1;
            flush_EX = 1'b1;
        end
    end

    // IFU被LSU阻塞计数
    always @(posedge clock) begin
        if (lsu_busy) begin
`ifdef VERILATOR
            perf_ifu_stall_lsu();
`endif
        end
    end

endmodule
