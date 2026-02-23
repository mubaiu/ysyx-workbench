module axi4_delayer(
  input         clock,
  input         reset,

  output        in_arready,
  input         in_arvalid,
  input  [3:0]  in_arid,
  input  [31:0] in_araddr,
  input  [7:0]  in_arlen,
  input  [2:0]  in_arsize,
  input  [1:0]  in_arburst,
  input         in_rready,
  output        in_rvalid,
  output [3:0]  in_rid,
  output [31:0] in_rdata,
  output [1:0]  in_rresp,
  output        in_rlast,
  output        in_awready,
  input         in_awvalid,
  input  [3:0]  in_awid,
  input  [31:0] in_awaddr,
  input  [7:0]  in_awlen,
  input  [2:0]  in_awsize,
  input  [1:0]  in_awburst,
  output        in_wready,
  input         in_wvalid,
  input  [31:0] in_wdata,
  input  [3:0]  in_wstrb,
  input         in_wlast,
                in_bready,
  output        in_bvalid,
  output [3:0]  in_bid,
  output [1:0]  in_bresp,

  input         out_arready,
  output        out_arvalid,
  output [3:0]  out_arid,
  output [31:0] out_araddr,
  output [7:0]  out_arlen,
  output [2:0]  out_arsize,
  output [1:0]  out_arburst,
  output        out_rready,
  input         out_rvalid,
  input  [3:0]  out_rid,
  input  [31:0] out_rdata,
  input  [1:0]  out_rresp,
  input         out_rlast,
  input         out_awready,
  output        out_awvalid,
  output [3:0]  out_awid,
  output [31:0] out_awaddr,
  output [7:0]  out_awlen,
  output [2:0]  out_awsize,
  output [1:0]  out_awburst,
  input         out_wready,
  output        out_wvalid,
  output [31:0] out_wdata,
  output [3:0]  out_wstrb,
  output        out_wlast,
                out_bready,
  input         out_bvalid,
  input  [3:0]  out_bid,
  input  [1:0]  out_bresp
);

  // 延迟参数
  parameter DELAY_RATIO = 6;

  // 状态机
  localparam IDLE = 2'd0;
  localparam READ_WAIT = 2'd1;
  localparam READ_DELAY = 2'd2;
  localparam WRITE_WAIT = 2'd3;

  reg [1:0] state, next_state;
  reg [15:0] timer;
  reg [15:0] read_start_time;
  reg [15:0] read_delay_counter;
  reg [15:0] read_target_time;
  reg [15:0] write_start_time;
  reg [15:0] write_delay_counter;
  reg [15:0] write_target_time;

  reg [3:0]  rid_buf;
  reg [31:0] rdata_buf;
  reg [1:0]  rresp_buf;
  reg        rlast_buf;
  reg        rvalid_delayed;

  reg [3:0]  bid_buf;
  reg [1:0]  bresp_buf;
  reg        bvalid_delayed;
  reg        is_write;

  assign in_arready = out_arready;
  assign out_arvalid = in_arvalid;
  assign out_arid = in_arid;
  assign out_araddr = in_araddr;
  assign out_arlen = in_arlen;
  assign out_arsize = in_arsize;
  assign out_arburst = in_arburst;
  
  assign out_rready = in_rready;
  assign in_rvalid = out_rvalid;
  assign in_rid = out_rid;
  assign in_rdata = out_rdata;
  assign in_rresp = out_rresp;
  assign in_rlast = out_rlast;

  // assign out_rready = (state == READ_WAIT) ? 1'b1 : 1'b0;
  // assign in_rvalid = rvalid_delayed;
  // assign in_rid = rid_buf;
  // assign in_rdata = rdata_buf;
  // assign in_rresp = rresp_buf;
  // assign in_rlast = rlast_buf;

  assign in_awready = out_awready;
  assign out_awvalid = in_awvalid;
  assign out_awid = in_awid;
  assign out_awaddr = in_awaddr;
  assign out_awlen = in_awlen;
  assign out_awsize = in_awsize;
  assign out_awburst = in_awburst;
  assign in_wready = out_wready;
  assign out_wvalid = in_wvalid;
  assign out_wdata = in_wdata;
  assign out_wstrb = in_wstrb;
  assign out_wlast = in_wlast;
  
  assign out_bready = in_bready;
  assign in_bvalid = out_bvalid;
  assign in_bid = out_bid;
  assign in_bresp = out_bresp;

  // assign out_bready = (state == WRITE_WAIT) ? 1'b1 : 1'b0;
  // assign in_bvalid = bvalid_delayed;
  // assign in_bid = bid_buf;
  // assign in_bresp = bresp_buf;

  // 全局时间计数器
  always @(posedge clock) begin
    if (reset)
      timer <= 16'd0;
    else
      timer <= timer + 16'd1;
  end

  // 状态机转换
  always @(posedge clock) begin
    if (reset)
      state <= IDLE;
    else
      state <= next_state;
  end

  // 状态机逻辑
  always @(*) begin
    next_state = state;
    case (state)
      IDLE: begin
        if (in_arvalid && out_arready)
          next_state = READ_WAIT;
        else if (in_awvalid && out_awready)
          next_state = WRITE_WAIT;
      end

      READ_WAIT: begin
        if (out_rvalid)
          next_state = READ_DELAY;
      end

      READ_DELAY: begin
        if (is_write && write_delay_counter >= write_target_time && in_bready) begin
          next_state = IDLE;
        end
        else if (!is_write && read_delay_counter >= read_target_time) begin
          if (rlast_buf && in_rready)
            next_state = IDLE;
          else if (!rlast_buf && in_rready)
            next_state = READ_WAIT;
        end
      end

      WRITE_WAIT: begin
        if (out_bvalid)
          next_state = READ_DELAY;
      end

      default: next_state = IDLE;
    endcase
  end

  // 记录事务开始时间和计算延迟
  always @(posedge clock) begin
    if (reset) begin
      read_start_time <= 16'd0;
      read_target_time <= 16'd0;
      write_start_time <= 16'd0;
      write_target_time <= 16'd0;
      is_write <= 1'b0;
    end
    else begin
      case (state)
        IDLE: begin
          if (in_arvalid && out_arready) begin
            read_start_time <= timer;
            is_write <= 1'b0;
          end
          else if (in_awvalid && out_awready) begin
            write_start_time <= timer;
            is_write <= 1'b1;
          end
        end

        READ_WAIT: begin
          if (out_rvalid)
            read_target_time <= (timer - read_start_time) * DELAY_RATIO;
        end

        WRITE_WAIT: begin
          if (out_bvalid)
            write_target_time <= (timer - write_start_time) * DELAY_RATIO;
        end

        default: begin
        end
      endcase
    end
  end

  // 延迟计数器
  always @(posedge clock) begin
    if (reset) begin
      read_delay_counter <= 16'd0;
      write_delay_counter <= 16'd0;
    end
    else begin
      case (state)
        READ_DELAY: begin
          if (!is_write && read_delay_counter < read_target_time)
            read_delay_counter <= read_delay_counter + 16'd1;
          else if (!is_write && in_rready && rvalid_delayed)
            read_delay_counter <= 16'd0;

          if (is_write && write_delay_counter < write_target_time)
            write_delay_counter <= write_delay_counter + 16'd1;
          else if (is_write && in_bready && bvalid_delayed)
            write_delay_counter <= 16'd0;
        end
        default: begin
          read_delay_counter <= 16'd0;
          write_delay_counter <= 16'd0;
        end
      endcase
    end
  end

  // 缓存读响应数据
  always @(posedge clock) begin
    if (reset) begin
      rid_buf <= 4'd0;
      rdata_buf <= 32'd0;
      rresp_buf <= 2'd0;
      rlast_buf <= 1'b0;
    end
    else if (state == READ_WAIT && out_rvalid) begin
      rid_buf <= out_rid;
      rdata_buf <= out_rdata;
      rresp_buf <= out_rresp;
      rlast_buf <= out_rlast;
    end
  end

  // 缓存写响应数据
  always @(posedge clock) begin
    if (reset) begin
      bid_buf <= 4'd0;
      bresp_buf <= 2'd0;
    end
    else if (state == WRITE_WAIT && out_bvalid) begin
      bid_buf <= out_bid;
      bresp_buf <= out_bresp;
    end
  end

  // 控制读响应输出
  always @(posedge clock) begin
    if (reset)
      rvalid_delayed <= 1'b0;
    else begin
      case (state)
        READ_DELAY: begin
          if (!is_write && read_delay_counter >= read_target_time)
            rvalid_delayed <= 1'b1;
          else
            rvalid_delayed <= 1'b0;
        end
        default:
          rvalid_delayed <= 1'b0;
      endcase
    end
  end

  // 控制写响应输出
  always @(posedge clock) begin
    if (reset)
      bvalid_delayed <= 1'b0;
    else begin
      case (state)
        READ_DELAY: begin
          if (is_write && write_delay_counter >= write_target_time)
            bvalid_delayed <= 1'b1;
          else
            bvalid_delayed <= 1'b0;
        end
        default:
          bvalid_delayed <= 1'b0;
      endcase
    end
  end

endmodule
