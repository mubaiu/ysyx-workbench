module Hazard(

    // Memory-stage ownership
    input wire ID_EX_data_valid,
    input wire [6:0] ID_EX_opcode,
    input wire [3:0] ID_EX_rs1,
    input wire [3:0] ID_EX_rs2,
    input wire ID_EX_ordering,

    input wire EX_LSU_mem_read,
    input wire [3:0] EX_LSU_rd,
    input wire EX_LSU_load_forwardable,

    // Control-flow misprediction/exception/fence redirect
    input wire redirect,

    // LSU访存停顿检测
    input wire lsu_busy,
    input wire lsu_done,
    input wire store_pending,

    // 输出控制信号
    output reg stall_IF,
    output reg stall_ID,
    output reg stall_EX,
    output reg flush_IF,
    output reg flush_ID,
    output reg flush_EX,
    output reg flush_LSU,
    output wire load_use_interlock
);

    wire id_ex_uses_rs1 = (ID_EX_opcode == 7'b0110011) || // OP
                          (ID_EX_opcode == 7'b0010011) || // OP-IMM
                          (ID_EX_opcode == 7'b0000011) || // LOAD
                          (ID_EX_opcode == 7'b0100011) || // STORE
                          (ID_EX_opcode == 7'b1100011) || // BRANCH
                          (ID_EX_opcode == 7'b1100111) || // JALR
                          (ID_EX_opcode == 7'b1110011);   // register CSR
    wire id_ex_uses_rs2 = (ID_EX_opcode == 7'b0110011) || // OP
                          (ID_EX_opcode == 7'b0100011) || // STORE
                          (ID_EX_opcode == 7'b1100011);   // BRANCH
    wire load_use_hazard = ID_EX_data_valid && EX_LSU_mem_read && lsu_done &&
                           !EX_LSU_load_forwardable &&
                           (EX_LSU_rd != 4'h0) &&
                           ((id_ex_uses_rs1 && ID_EX_rs1 == EX_LSU_rd) ||
                            (id_ex_uses_rs2 && ID_EX_rs2 == EX_LSU_rd));
    assign load_use_interlock = load_use_hazard;

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

        // On a load-use dependency, retire the completed load into WB while
        // retaining its consumer in ID/EX for one cycle. The next cycle uses
        // the existing WB forwarding path, avoiding an AXI-to-EX critical path.
        if (load_use_hazard) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            stall_EX = 1'b1;
        end

        // A buffered cacheable store may overlap ordinary ALU/control work,
        // but ordering points must wait until its AXI B response arrives.
        if (store_pending && ID_EX_ordering) begin
            stall_IF = 1'b1;
            stall_ID = 1'b1;
            stall_EX = 1'b1;
        end

        // 控制冒险检测
        if (redirect) begin
            flush_IF = 1'b1;
            flush_ID = 1'b1;
            flush_EX = 1'b1;
        end
    end

endmodule
