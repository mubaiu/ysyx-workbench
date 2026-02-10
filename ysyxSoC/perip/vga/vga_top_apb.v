module vga_top_apb(
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

  output [7:0]  vga_r,
  output [7:0]  vga_g,
  output [7:0]  vga_b,
  output        vga_hsync,
  output        vga_vsync,
  output        vga_valid
);

  // VGA时序参数（640x480@60Hz）
  localparam H_DISPLAY = 640;  // 水平显示区
  localparam H_FRONT   = 16;   // 水平前肩
  localparam H_SYNC    = 96;   // 水平同步
  localparam H_BACK    = 48;   // 水平后肩
  localparam H_TOTAL   = 800;  // 水平总计

  localparam V_DISPLAY = 480;  // 垂直显示区
  localparam V_FRONT   = 10;   // 垂直前肩
  localparam V_SYNC    = 2;    // 垂直同步
  localparam V_BACK    = 33;   // 垂直后肩
  localparam V_TOTAL   = 525;  // 垂直总计

  // 帧缓冲参数
  localparam FB_WIDTH  = 640;
  localparam FB_HEIGHT = 480;
  localparam FB_SIZE   = FB_WIDTH * FB_HEIGHT;  // 307200像素

  // 帧缓冲存储器（每个像素32位：RGBA或0RGB）
  reg [31:0] framebuffer [0:FB_SIZE-1];

  // APB接口信号
  wire apb_write = in_psel && in_penable && in_pwrite;
  wire apb_read  = in_psel && in_penable && !in_pwrite;

  // 地址解码：将APB地址转换为帧缓冲索引
  // APB地址是字节地址，需要除以4得到字索引
  wire [18:0] fb_index = in_paddr[20:2];  // 取bit[20:2]作为字索引（19位）
  wire fb_valid = (fb_index < FB_SIZE);

  // APB写操作：将数据写入帧缓冲
  always @(posedge clock) begin
    if (apb_write && fb_valid) begin
      // 根据pstrb写入对应的字节
      if (in_pstrb[0]) framebuffer[fb_index][7:0]   <= in_pwdata[7:0];
      if (in_pstrb[1]) framebuffer[fb_index][15:8]  <= in_pwdata[15:8];
      if (in_pstrb[2]) framebuffer[fb_index][23:16] <= in_pwdata[23:16];
      if (in_pstrb[3]) framebuffer[fb_index][31:24] <= in_pwdata[31:24];
    end
  end

  // APB读操作：从帧缓冲读取数据
  reg [31:0] prdata_reg;
  always @(*) begin
    if (apb_read && fb_valid) begin
      prdata_reg = framebuffer[fb_index];
    end else begin
      prdata_reg = 32'h0;
    end
  end

  // APB响应信号
  assign in_pready = 1'b1;  // 总是准备好
  assign in_prdata = prdata_reg;
  assign in_pslverr = 1'b0;  // 无错误

  // VGA时序生成器
  reg [9:0] h_count;  // 水平计数器（0~799）
  reg [9:0] v_count;  // 垂直计数器（0~524）

  // 水平计数器
  always @(posedge clock) begin
    if (reset) begin
      h_count <= 10'd0;
    end else begin
      if (h_count == H_TOTAL - 1) begin
        h_count <= 10'd0;
      end else begin
        h_count <= h_count + 10'd1;
      end
    end
  end

  // 垂直计数器
  always @(posedge clock) begin
    if (reset) begin
      v_count <= 10'd0;
    end else begin
      if (h_count == H_TOTAL - 1) begin
        if (v_count == V_TOTAL - 1) begin
          v_count <= 10'd0;
        end else begin
          v_count <= v_count + 10'd1;
        end
      end
    end
  end

  // 生成同步信号
  // hsync在水平同步期间为低（负极性）
  wire hsync_pulse = (h_count >= H_DISPLAY + H_FRONT) &&
                     (h_count < H_DISPLAY + H_FRONT + H_SYNC);
  // vsync在垂直同步期间为低（负极性）
  wire vsync_pulse = (v_count >= V_DISPLAY + V_FRONT) &&
                     (v_count < V_DISPLAY + V_FRONT + V_SYNC);

  assign vga_hsync = ~hsync_pulse;  // 负极性
  assign vga_vsync = ~vsync_pulse;  // 负极性

  // 显示区域判断
  wire h_valid = (h_count < H_DISPLAY);
  wire v_valid = (v_count < V_DISPLAY);
  assign vga_valid = h_valid && v_valid;

  // 像素读取逻辑
  // 计算当前像素在帧缓冲中的索引
  wire [18:0] pixel_index = v_count[9:0] * 10'd640 + {9'd0, h_count[9:0]};

  // 从帧缓冲读取像素数据
  wire [31:0] pixel_data = (vga_valid) ? framebuffer[pixel_index] : 32'h0;

  // 输出RGB信号（假设像素格式为0RGB，每个颜色8位）
  assign vga_r = vga_valid ? pixel_data[23:16] : 8'h0;
  assign vga_g = vga_valid ? pixel_data[15:8]  : 8'h0;
  assign vga_b = vga_valid ? pixel_data[7:0]   : 8'h0;

endmodule
