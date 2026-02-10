module apb_delayer(
  input         clock,
  input         reset,
  input  [31:0] in_paddr,
  input         in_psel,
  input         in_penable,
  input  [2:0]  in_pprot,
  input         in_pwrite,
  input  [31:0] in_pwdata,
  input  [3:0]  in_pstrb,
  output        in_pready,
  output [31:0] in_prdata,
  output        in_pslverr,

  output [31:0] out_paddr,
  output        out_psel,
  output        out_penable,
  output [2:0]  out_pprot,
  output        out_pwrite,
  output [31:0] out_pwdata,
  output [3:0]  out_pstrb,
  input         out_pready,
  input  [31:0] out_prdata,
  input         out_pslverr
);

  // 延迟参数：r = 7 (735MHz / 100MHz ≈ 7)
  // 延迟倍数 = r - 1 = 6
  parameter DELAY_RATIO = 1;

  // 状态机
  localparam IDLE = 2'd0;
  localparam WAIT_DEVICE = 2'd1;
  localparam DELAYING = 2'd2;

  reg [1:0] state, next_state;
  reg [15:0] start_time;      // 记录事务开始时间
  reg [15:0] response_time;   // 记录设备响应时间
  reg [15:0] delay_counter;   // 延迟计数器
  reg [15:0] delay_cycles;    // 需要延迟的周期数
  reg [15:0] timer;           // 全局时间计数器

  // 缓存设备响应
  reg [31:0] prdata_buf;
  reg        pslverr_buf;
  reg        pready_delayed;

  // 直通信号（不需要延迟）
  assign out_paddr   = in_paddr;
  assign out_psel    = in_psel;
  assign out_penable = in_penable;
  assign out_pprot   = in_pprot;
  assign out_pwrite  = in_pwrite;
  assign out_pwdata  = in_pwdata;
  assign out_pstrb   = in_pstrb;
  assign in_pready   = out_pready;
  assign in_prdata   = out_prdata;
  assign in_pslverr  = out_pslverr;
  // 延迟后的响应信号
  // assign in_pready  = pready_delayed;
  // assign in_prdata  = prdata_buf;
  // assign in_pslverr = pslverr_buf;

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
        // 检测 APB 事务开始（SETUP 阶段）
        if (in_psel && !in_penable) begin
          next_state = WAIT_DEVICE;
        end
      end

      WAIT_DEVICE: begin
        // 等待设备响应
        if (out_pready) begin
          next_state = DELAYING;
        end
      end

      DELAYING: begin
        // 延迟计数完成
        if (delay_counter == delay_cycles) begin
          next_state = IDLE;
        end
      end

      default: next_state = IDLE;
    endcase
  end

  // 记录事务开始时间和计算延迟
  always @(posedge clock) begin
    if (reset) begin
      start_time <= 16'd0;
      response_time <= 16'd0;
      delay_cycles <= 16'd0;
    end
    else begin
      case (state)
        IDLE: begin
          if (in_psel && !in_penable) begin
            // 记录事务开始时间
            start_time <= timer;
          end
        end

        WAIT_DEVICE: begin
          if (out_pready) begin
            // 计算设备响应时间：t1 - t0
            response_time <= timer - start_time;
            // 计算需要延迟的周期数：(t1 - t0) * (r - 1)
            delay_cycles <= (timer - start_time) * DELAY_RATIO;
          end
        end

        default: begin
          // DELAYING 状态和其他状态不需要更新这些寄存器
        end
      endcase
    end
  end

  // 延迟计数器
  always @(posedge clock) begin
    if (reset) begin
      delay_counter <= 16'd0;
    end
    else begin
      case (state)
        DELAYING: begin
          delay_counter <= delay_counter + 16'd1;
        end
        default: begin
          delay_counter <= 16'd0;
        end
      endcase
    end
  end

  // 缓存设备响应数据
  always @(posedge clock) begin
    if (reset) begin
      prdata_buf <= 32'd0;
      pslverr_buf <= 1'b0;
    end
    else if (state == WAIT_DEVICE && out_pready) begin
      // 设备响应时缓存数据
      prdata_buf <= out_prdata;
      pslverr_buf <= out_pslverr;
    end
  end

  // 控制 pready 输出
  always @(posedge clock) begin
    if (reset) begin
      pready_delayed <= 1'b0;
    end
    else begin
      case (state)
        DELAYING: begin
          // 延迟计数完成时返回 pready
          if (delay_counter == delay_cycles) begin
            pready_delayed <= 1'b1;
          end
          else begin
            pready_delayed <= 1'b0;
          end
        end
        default: begin
          pready_delayed <= 1'b0;
        end
      endcase
    end
  end

endmodule
