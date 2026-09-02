// Front-end branch prediction unit.
//
// Query is combinational so placing the predictor behind this module boundary
// does not add a fetch stage. Predictor state is updated only when an
// instruction really executes in EX (resolve_valid).
module BPU #(
    parameter LOCAL_HISTORY_ENTRIES = 256,
    parameter LOCAL_HISTORY_BITS = 8,
    parameter JALR_BTB_ENTRIES = 64,
    parameter RAS_DEPTH = 8
)(
    input  wire        clock,
    input  wire        reset,

    // Fetch-side query.
    input  wire        query_valid,
    input  wire [31:0] query_pc,
    input  wire [31:0] query_inst,
    output wire [31:0] predicted_next_pc,

    // Execute-side resolution. resolve_branch_taken is meaningful for a
    // conditional branch; resolve_next_pc supplies the actual JALR target.
    input  wire        resolve_valid,
    input  wire [31:0] resolve_pc,
    input  wire [31:0] resolve_inst,
    input  wire [31:0] resolve_next_pc,
    input  wire        resolve_branch_taken
);

    localparam LOCAL_HISTORY_INDEX_WIDTH = $clog2(LOCAL_HISTORY_ENTRIES);
    localparam LOCAL_PATTERN_ENTRIES = 1 << LOCAL_HISTORY_BITS;
    localparam JALR_BTB_INDEX_WIDTH = $clog2(JALR_BTB_ENTRIES);
    localparam JALR_BTB_TAG_WIDTH = 14;
    localparam RAS_PTR_WIDTH = $clog2(RAS_DEPTH);
    localparam RAS_COUNT_WIDTH = $clog2(RAS_DEPTH + 1);

    localparam [6:0] OPCODE_BRANCH = 7'b1100011;
    localparam [6:0] OPCODE_JAL = 7'b1101111;
    localparam [6:0] OPCODE_JALR = 7'b1100111;

    // ---------------------------------------------------------------------
    // Fetch-side prediction
    // ---------------------------------------------------------------------
    wire [6:0] query_opcode = query_inst[6:0];
    wire [31:0] query_bimm = {{19{query_inst[31]}}, query_inst[31],
                              query_inst[7], query_inst[30:25],
                              query_inst[11:8], 1'b0};
    wire [31:0] query_jimm = {{11{query_inst[31]}}, query_inst[31],
                              query_inst[19:12], query_inst[20],
                              query_inst[30:21], 1'b0};

    // Per-PC outcome histories index a shared table of two-bit counters.
    // Cold entries retain backward-taken, forward-not-taken behavior.
    reg                         local_history_valid
                                [0:LOCAL_HISTORY_ENTRIES-1];
    reg [LOCAL_HISTORY_BITS-1:0] local_history
                                [0:LOCAL_HISTORY_ENTRIES-1];
    reg                         local_pattern_valid
                                [0:LOCAL_PATTERN_ENTRIES-1];
    reg [1:0]                   local_pattern_counter
                                [0:LOCAL_PATTERN_ENTRIES-1];

    wire [LOCAL_HISTORY_INDEX_WIDTH-1:0] query_local_index =
        query_pc[LOCAL_HISTORY_INDEX_WIDTH+1:2];
    wire [LOCAL_HISTORY_BITS-1:0] query_local_history =
        local_history_valid[query_local_index] ?
        local_history[query_local_index] : {LOCAL_HISTORY_BITS{1'b0}};
    wire query_static_taken = query_bimm[31];
    wire query_local_hit = local_history_valid[query_local_index] &&
        local_pattern_valid[query_local_history];
    wire query_dynamic_taken =
        local_pattern_counter[query_local_history][1];
    wire query_branch_taken =
        query_local_hit ? query_dynamic_taken : query_static_taken;

    // Return-address stack. Updates are non-speculative, so wrong-path calls
    // and returns cannot corrupt it.
    reg [31:0] return_stack [0:RAS_DEPTH-1];
    reg [RAS_PTR_WIDTH-1:0] return_stack_ptr;
    reg [RAS_COUNT_WIDTH-1:0] return_stack_count;
    wire [RAS_PTR_WIDTH-1:0] return_stack_top_index =
        return_stack_ptr - 1'b1;
    wire [31:0] return_stack_top = return_stack[return_stack_top_index];

    wire query_is_canonical_return = (query_opcode == OPCODE_JALR) &&
                                     (query_inst[11:7] == 5'd0) &&
                                     (query_inst[19:15] == 5'd1) &&
                                     (query_inst[31:20] == 12'd0);
    wire query_is_return = query_is_canonical_return &&
                           (return_stack_count != 0);
    wire query_is_indirect_jump = (query_opcode == OPCODE_JALR) &&
                                  (query_inst[11:7] == 5'd0) &&
                                  !query_is_canonical_return;

    // Returns use the RAS and do not pollute this non-return target cache.
    reg                             jalr_btb_valid  [0:JALR_BTB_ENTRIES-1];
    reg [JALR_BTB_TAG_WIDTH-1:0]    jalr_btb_tag    [0:JALR_BTB_ENTRIES-1];
    reg [31:0]                      jalr_btb_target [0:JALR_BTB_ENTRIES-1];

    reg [JALR_BTB_INDEX_WIDTH-1:0] indirect_jump_history;
    wire [JALR_BTB_INDEX_WIDTH-1:0] rotated_indirect_jump_history =
        (indirect_jump_history << 3) |
        (indirect_jump_history >> (JALR_BTB_INDEX_WIDTH - 3));
    wire [JALR_BTB_INDEX_WIDTH-1:0] query_jalr_btb_index =
        query_pc[JALR_BTB_INDEX_WIDTH+1:2] ^
        (query_is_indirect_jump ? indirect_jump_history :
                                  {JALR_BTB_INDEX_WIDTH{1'b0}});
    wire [JALR_BTB_TAG_WIDTH-1:0] query_jalr_btb_tag =
        {query_pc[31:28], query_pc[17:8]};
    wire query_jalr_btb_hit = jalr_btb_valid[query_jalr_btb_index] &&
        (jalr_btb_tag[query_jalr_btb_index] == query_jalr_btb_tag);

    wire query_is_jal = query_opcode == OPCODE_JAL;
    wire query_is_jalr = query_opcode == OPCODE_JALR;
    wire query_is_branch = query_opcode == OPCODE_BRANCH;
    wire predict_taken = query_is_jal || query_is_return ||
                         (query_is_jalr && query_jalr_btb_hit) ||
                         (query_is_branch && query_branch_taken);
    wire [31:0] predicted_target = query_is_return ? return_stack_top :
        query_is_jal ? query_pc + query_jimm :
        query_is_jalr ? jalr_btb_target[query_jalr_btb_index] :
                        query_pc + query_bimm;

    assign predicted_next_pc = query_valid && predict_taken ?
                               predicted_target : query_pc + 32'd4;

    // ---------------------------------------------------------------------
    // Execute-side training
    // ---------------------------------------------------------------------
    wire [6:0] resolve_opcode = resolve_inst[6:0];
    wire resolve_is_branch = resolve_opcode == OPCODE_BRANCH;
    wire resolve_is_jal = resolve_opcode == OPCODE_JAL;
    wire resolve_is_jalr = resolve_opcode == OPCODE_JALR;
    wire resolve_is_call = (resolve_is_jal || resolve_is_jalr) &&
                           (resolve_inst[11:7] == 5'd1);
    wire resolve_is_return = resolve_is_jalr &&
                             (resolve_inst[11:7] == 5'd0) &&
                             (resolve_inst[19:15] == 5'd1) &&
                             (resolve_inst[31:20] == 12'd0);
    wire resolve_is_indirect_jump = resolve_is_jalr &&
                                    (resolve_inst[11:7] == 5'd0) &&
                                    !resolve_is_return;

    wire [LOCAL_HISTORY_INDEX_WIDTH-1:0] resolve_local_index =
        resolve_pc[LOCAL_HISTORY_INDEX_WIDTH+1:2];
    wire [LOCAL_HISTORY_BITS-1:0] resolve_local_history =
        local_history_valid[resolve_local_index] ?
        local_history[resolve_local_index] : {LOCAL_HISTORY_BITS{1'b0}};

    integer local_history_i;
    integer local_pattern_i;
    always @(posedge clock) begin
        if (reset) begin
            for (local_history_i = 0;
                 local_history_i < LOCAL_HISTORY_ENTRIES;
                 local_history_i = local_history_i + 1)
                local_history_valid[local_history_i] <= 1'b0;
            for (local_pattern_i = 0;
                 local_pattern_i < LOCAL_PATTERN_ENTRIES;
                 local_pattern_i = local_pattern_i + 1)
                local_pattern_valid[local_pattern_i] <= 1'b0;
        end
        else if (resolve_valid && resolve_is_branch) begin
            local_history_valid[resolve_local_index] <= 1'b1;
            local_history[resolve_local_index] <=
                {resolve_local_history[LOCAL_HISTORY_BITS-2:0],
                 resolve_branch_taken};

            local_pattern_valid[resolve_local_history] <= 1'b1;
            if (!local_pattern_valid[resolve_local_history]) begin
                local_pattern_counter[resolve_local_history] <=
                    resolve_branch_taken ? 2'b10 : 2'b01;
            end
            else begin
                if (resolve_branch_taken &&
                    local_pattern_counter[resolve_local_history] != 2'b11)
                    local_pattern_counter[resolve_local_history] <=
                        local_pattern_counter[resolve_local_history] + 2'b01;
                else if (!resolve_branch_taken &&
                         local_pattern_counter[resolve_local_history] != 2'b00)
                    local_pattern_counter[resolve_local_history] <=
                        local_pattern_counter[resolve_local_history] - 2'b01;
            end
        end
    end

    wire [JALR_BTB_INDEX_WIDTH-1:0] resolve_jalr_btb_index =
        resolve_pc[JALR_BTB_INDEX_WIDTH+1:2] ^
        (resolve_is_indirect_jump ? indirect_jump_history :
                                    {JALR_BTB_INDEX_WIDTH{1'b0}});
    wire [JALR_BTB_TAG_WIDTH-1:0] resolve_jalr_btb_tag =
        {resolve_pc[31:28], resolve_pc[17:8]};

    integer jalr_btb_i;
    always @(posedge clock) begin
        if (reset) begin
            indirect_jump_history <= {JALR_BTB_INDEX_WIDTH{1'b0}};
            for (jalr_btb_i = 0; jalr_btb_i < JALR_BTB_ENTRIES;
                 jalr_btb_i = jalr_btb_i + 1)
                jalr_btb_valid[jalr_btb_i] <= 1'b0;
        end
        else if (resolve_valid && resolve_is_jalr && !resolve_is_return) begin
            jalr_btb_valid[resolve_jalr_btb_index] <= 1'b1;
            jalr_btb_tag[resolve_jalr_btb_index] <= resolve_jalr_btb_tag;
            jalr_btb_target[resolve_jalr_btb_index] <= resolve_next_pc;
            if (resolve_is_indirect_jump)
                indirect_jump_history <=
                    rotated_indirect_jump_history ^
                    resolve_next_pc[JALR_BTB_INDEX_WIDTH+1:2];
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            return_stack_ptr <= {RAS_PTR_WIDTH{1'b0}};
            return_stack_count <= {RAS_COUNT_WIDTH{1'b0}};
        end
        else if (resolve_valid && resolve_is_call) begin
            return_stack[return_stack_ptr] <= resolve_pc + 32'd4;
            return_stack_ptr <= return_stack_ptr + 1'b1;
            if (return_stack_count != RAS_COUNT_WIDTH'(RAS_DEPTH))
                return_stack_count <= return_stack_count + 1'b1;
        end
        else if (resolve_valid && resolve_is_return &&
                 return_stack_count != 0) begin
            return_stack_ptr <= return_stack_ptr - 1'b1;
            return_stack_count <= return_stack_count - 1'b1;
        end
    end

endmodule
