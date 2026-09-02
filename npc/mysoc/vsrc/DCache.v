// Small blocking, write-through data cache.
//
// Each line holds one naturally aligned 32-bit word.  A one-word line keeps
// the AXI transaction protocol unchanged and makes partial-store coherence
// explicit.  Stores always reach AXI; a matching cached word is updated, and
// full-word stores may allocate a line.
module DCache #(
    parameter LINE_COUNT = 256,
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input  wire                  clock,
    input  wire                  reset,

    input  wire [ADDR_WIDTH-1:0] lookup_addr,
    output wire                  lookup_cacheable,
    output wire                  lookup_hit,
    output wire [DATA_WIDTH-1:0] lookup_data,

    input  wire                  fill_en,
    input  wire [ADDR_WIDTH-1:0] fill_addr,
    input  wire [DATA_WIDTH-1:0] fill_data,

    input  wire                  store_en,
    input  wire [ADDR_WIDTH-1:0] store_addr,
    input  wire [DATA_WIDTH-1:0] store_data,
    input  wire [3:0]            store_wstrb
);

    localparam INDEX_WIDTH = $clog2(LINE_COUNT);
    localparam TAG_WIDTH = ADDR_WIDTH - INDEX_WIDTH - 2;

    assign lookup_cacheable =
        ((lookup_addr >= 32'h0f000000) && (lookup_addr < 32'h0f002000)) ||
        ((lookup_addr >= 32'h30000000) && (lookup_addr < 32'h31000000)) ||
        ((lookup_addr >= 32'h80000000) && (lookup_addr < 32'h80400000)) ||
        ((lookup_addr >= 32'ha0000000) && (lookup_addr < 32'ha2000000));
    wire fill_cacheable =
        ((fill_addr >= 32'h0f000000) && (fill_addr < 32'h0f002000)) ||
        ((fill_addr >= 32'h30000000) && (fill_addr < 32'h31000000)) ||
        ((fill_addr >= 32'h80000000) && (fill_addr < 32'h80400000)) ||
        ((fill_addr >= 32'ha0000000) && (fill_addr < 32'ha2000000));
    wire store_cacheable =
        ((store_addr >= 32'h0f000000) && (store_addr < 32'h0f002000)) ||
        ((store_addr >= 32'h30000000) && (store_addr < 32'h31000000)) ||
        ((store_addr >= 32'h80000000) && (store_addr < 32'h80400000)) ||
        ((store_addr >= 32'ha0000000) && (store_addr < 32'ha2000000));

    wire [INDEX_WIDTH-1:0] lookup_index = lookup_addr[INDEX_WIDTH+1:2];
    wire [TAG_WIDTH-1:0] lookup_tag = lookup_addr[ADDR_WIDTH-1:INDEX_WIDTH+2];
    wire [INDEX_WIDTH-1:0] fill_index = fill_addr[INDEX_WIDTH+1:2];
    wire [TAG_WIDTH-1:0] fill_tag = fill_addr[ADDR_WIDTH-1:INDEX_WIDTH+2];
    wire [INDEX_WIDTH-1:0] store_index = store_addr[INDEX_WIDTH+1:2];
    wire [TAG_WIDTH-1:0] store_tag = store_addr[ADDR_WIDTH-1:INDEX_WIDTH+2];

    reg                  valid [0:LINE_COUNT-1];
    reg [TAG_WIDTH-1:0]  tag   [0:LINE_COUNT-1];
    reg [DATA_WIDTH-1:0] data  [0:LINE_COUNT-1];

    assign lookup_hit = lookup_cacheable && valid[lookup_index] &&
                        (tag[lookup_index] == lookup_tag);
    assign lookup_data = data[lookup_index];

    integer i;
    always @(posedge clock) begin
        if (reset) begin
            for (i = 0; i < LINE_COUNT; i = i + 1)
                valid[i] <= 1'b0;
        end
        else begin
            if (fill_en && fill_cacheable) begin
                valid[fill_index] <= 1'b1;
                tag[fill_index] <= fill_tag;
                data[fill_index] <= fill_data;
            end

            if (store_en && store_cacheable) begin
                if (store_wstrb == 4'b1111) begin
                    valid[store_index] <= 1'b1;
                    tag[store_index] <= store_tag;
                    data[store_index] <= store_data;
                end
                else if (valid[store_index] && tag[store_index] == store_tag) begin
                    if (store_wstrb[0]) data[store_index][7:0] <= store_data[7:0];
                    if (store_wstrb[1]) data[store_index][15:8] <= store_data[15:8];
                    if (store_wstrb[2]) data[store_index][23:16] <= store_data[23:16];
                    if (store_wstrb[3]) data[store_index][31:24] <= store_data[31:24];
                end
            end
        end
    end

endmodule
