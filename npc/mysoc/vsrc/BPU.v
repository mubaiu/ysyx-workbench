// Front-end branch prediction unit.
//
// Query is combinational so placing the predictor behind this module boundary
// does not add a fetch stage. Predictor state is updated only when an
// instruction really executes in EX (resolve_valid).
module BPU #(
    parameter BHT_ENTRIES = 256,
    parameter [2:0] BHT_USE_THRESHOLD = 3'd2,
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

    localparam BHT_INDEX_WIDTH = $clog2(BHT_ENTRIES);
    localparam BHT_TAG_WIDTH = 12;
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

    // Conditional-direction table. Cold entries use backward-taken,
    // forward-not-taken. A learned direction is selected only after its
    // usefulness counter shows that it consistently beats the static rule.
    reg                         bht_valid   [0:BHT_ENTRIES-1];
    reg [1:0]                   bht_counter [0:BHT_ENTRIES-1];
    reg [2:0]                   bht_useful  [0:BHT_ENTRIES-1];
    reg [BHT_TAG_WIDTH-1:0]     bht_tag     [0:BHT_ENTRIES-1];

    wire [BHT_INDEX_WIDTH-1:0] query_bht_index =
        query_pc[BHT_INDEX_WIDTH+1:2];
    wire [BHT_TAG_WIDTH-1:0] query_bht_tag =
        {query_pc[31:28], query_pc[17:10]};
    wire query_bht_hit = bht_valid[query_bht_index] &&
                         (bht_tag[query_bht_index] == query_bht_tag);
    wire query_static_taken = query_bimm[31];
    wire query_dynamic_taken = bht_counter[query_bht_index][1];
    wire query_branch_taken =
        (query_bht_hit && bht_useful[query_bht_index] >=
         BHT_USE_THRESHOLD) ?
        query_dynamic_taken : query_static_taken;

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

    wire [BHT_INDEX_WIDTH-1:0] resolve_bht_index =
        resolve_pc[BHT_INDEX_WIDTH+1:2];
    wire [BHT_TAG_WIDTH-1:0] resolve_bht_tag =
        {resolve_pc[31:28], resolve_pc[17:10]};
    wire resolve_bht_hit = bht_valid[resolve_bht_index] &&
                           (bht_tag[resolve_bht_index] == resolve_bht_tag);
    wire resolve_static_taken = resolve_inst[31];

    integer bht_i;
    always @(posedge clock) begin
        if (reset) begin
            for (bht_i = 0; bht_i < BHT_ENTRIES; bht_i = bht_i + 1)
                bht_valid[bht_i] <= 1'b0;
        end
        else if (resolve_valid && resolve_is_branch) begin
            bht_valid[resolve_bht_index] <= 1'b1;
            if (!resolve_bht_hit) begin
                bht_tag[resolve_bht_index] <= resolve_bht_tag;
                bht_counter[resolve_bht_index] <=
                    resolve_branch_taken ? 2'b10 : 2'b01;
                bht_useful[resolve_bht_index] <= 3'b000;
            end
            else begin
                if (resolve_branch_taken &&
                    bht_counter[resolve_bht_index] != 2'b11)
                    bht_counter[resolve_bht_index] <=
                        bht_counter[resolve_bht_index] + 2'b01;
                else if (!resolve_branch_taken &&
                         bht_counter[resolve_bht_index] != 2'b00)
                    bht_counter[resolve_bht_index] <=
                        bht_counter[resolve_bht_index] - 2'b01;

                if (bht_counter[resolve_bht_index][1] !=
                    resolve_static_taken) begin
                    if ((bht_counter[resolve_bht_index][1] ==
                         resolve_branch_taken) &&
                        bht_useful[resolve_bht_index] != 3'b111)
                        bht_useful[resolve_bht_index] <=
                            bht_useful[resolve_bht_index] + 3'b001;
                    else if ((resolve_static_taken ==
                              resolve_branch_taken) &&
                             bht_useful[resolve_bht_index] != 3'b000)
                        bht_useful[resolve_bht_index] <=
                            bht_useful[resolve_bht_index] - 3'b001;
                end
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
