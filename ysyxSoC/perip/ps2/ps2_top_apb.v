module ps2_top_apb(
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

  input         ps2_clk,
  input         ps2_data
);

  // PS2接收逻辑（参考NVBoard示例）
  reg [9:0] buffer;        // PS2数据缓冲：起始位+8数据位+奇偶校验位
  reg [3:0] count;         // 位计数器
  reg [2:0] ps2_clk_sync;  // PS2时钟同步寄存器

  // FIFO缓冲区（8字节）
  reg [7:0] fifo [0:7];    // FIFO数据
  reg [2:0] fifo_wr_ptr;   // 写指针
  reg [2:0] fifo_rd_ptr;   // 读指针
  reg [3:0] fifo_count;    // FIFO中的数据量（0-8）

  // 同步PS2时钟到系统时钟域
  always @(posedge clock) begin
    ps2_clk_sync <= {ps2_clk_sync[1:0], ps2_clk};
  end

  // 检测PS2时钟上升沿
  wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];

  // PS2数据接收状态机
  always @(posedge clock) begin
    if (reset) begin
      count <= 4'd0;
      fifo_wr_ptr <= 3'd0;
      fifo_rd_ptr <= 3'd0;
      fifo_count <= 4'd0;
    end else begin
      if (sampling) begin
        if (count == 4'd10) begin
          // 接收完10位数据，验证帧格式
          if ((buffer[0] == 0) &&      // 起始位为0
              (ps2_data) &&            // 停止位为1
              (^buffer[9:1])) begin    // 奇偶校验

            // 写入FIFO
              fifo[fifo_wr_ptr] <= buffer[8:1];
              fifo_wr_ptr <= fifo_wr_ptr + 3'd1;
              fifo_count <= fifo_count + 4'd1;
          end
          count <= 4'd0;
        end else begin
          buffer[count] <= ps2_data;   // 采样数据位
          count <= count + 4'd1;
        end
      end
    end
  end

  // APB总线读操作
  reg [31:0] prdata_reg;
  wire apb_read = in_psel && !in_pwrite;
  wire addr_data = (in_paddr[2:0] == 3'h0);  // 地址0x0：读取扫描码

  always @(*) begin
    if (apb_read && in_penable && addr_data && (fifo_count > 0)) begin
      // Acess
      prdata_reg = {24'h0, fifo[fifo_rd_ptr]};
      // $display("APB Read: FIFO count=%d, rd_ptr=%d, data=0x%02x", fifo_count, fifo_rd_ptr, fifo[fifo_rd_ptr]);
    end else begin
      prdata_reg = 32'h0;
    end
  end

  // 读取后更新FIFO指针（只在Access阶段）
  always @(posedge clock) begin
    if (reset) begin
      // 复位时不操作
    end else if (apb_read && in_penable && addr_data && (fifo_count > 0)) begin
      fifo_rd_ptr <= fifo_rd_ptr + 3'd1;
      fifo_count <= fifo_count - 4'd1;
    end
  end

  // APB响应信号
  assign in_pready = 1'b1;
  assign in_prdata = prdata_reg;
  assign in_pslverr = 1'b0;

endmodule
