module gpio_top_apb(
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

  output [15:0] gpio_out,
  input  [15:0] gpio_in,
  output [7:0]  gpio_seg_0,
  output [7:0]  gpio_seg_1,
  output [7:0]  gpio_seg_2,
  output [7:0]  gpio_seg_3,
  output [7:0]  gpio_seg_4,
  output [7:0]  gpio_seg_5,
  output [7:0]  gpio_seg_6,
  output [7:0]  gpio_seg_7
);

  // 寄存器定义
  reg [15:0] led_reg;      // 0x0: LED 灯寄存器
  reg [31:0] seg_reg;      // 0x8: 7段数码管寄存器
  reg [31:0] prdata_reg;   // 读数据寄存器

  // APB 总线地址解码
  wire addr_led = (in_paddr[3:0] == 4'h0);  // 0x0
  wire addr_sw  = (in_paddr[3:0] == 4'h4);  // 0x4
  wire addr_seg = (in_paddr[3:0] == 4'h8);  // 0x8

  // APB 写操作
  wire apb_write = in_psel && in_penable && in_pwrite;

  always @(posedge clock) begin
    if (reset) begin
      led_reg <= 16'haaaa;
      seg_reg <= 32'h17d9f53;
    end else if (apb_write) begin
      if (addr_led) begin
        led_reg <= in_pwdata[15:0];
      end else if (addr_seg) begin
        seg_reg <= in_pwdata;
      end
    end
  end

  // APB 读操作
  wire apb_read = in_psel && !in_pwrite;

  always @(*) begin
    if (apb_read) begin
      case (in_paddr[3:0])
        4'h0: prdata_reg = {16'h0, led_reg};
        4'h4: prdata_reg = {16'h0, gpio_in};
        4'h8: prdata_reg = seg_reg;
        default: prdata_reg = 32'h0;
      endcase
    end else begin
      prdata_reg = 32'h0;
    end
  end

  // 十六进制到7段显示编码的译码器
  // 输入：4位十六进制数字 (0-F)
  // 输出：8位7段显示编码 {a, b, c, d, e, f, g, dp}
  // 编码格式：共阳极，0点亮，1熄灭
  function [7:0] hex_to_7seg;
    input [3:0] hex;
    begin
      case (hex)
        4'h0: hex_to_7seg = 8'b00000011; // 0: 点亮a,b,c,d,e,f
        4'h1: hex_to_7seg = 8'b10011111; // 1: 点亮b,c
        4'h2: hex_to_7seg = 8'b00100101; // 2: 点亮a,b,d,e,g
        4'h3: hex_to_7seg = 8'b00001101; // 3: 点亮a,b,c,d,g
        4'h4: hex_to_7seg = 8'b10011001; // 4: 点亮b,c,f,g
        4'h5: hex_to_7seg = 8'b01001001; // 5: 点亮a,c,d,f,g
        4'h6: hex_to_7seg = 8'b01000001; // 6: 点亮a,c,d,e,f,g
        4'h7: hex_to_7seg = 8'b00011111; // 7: 点亮a,b,c
        4'h8: hex_to_7seg = 8'b00000001; // 8: 点亮a,b,c,d,e,f,g
        4'h9: hex_to_7seg = 8'b00001001; // 9: 点亮a,b,c,d,f,g
        4'hA: hex_to_7seg = 8'b00010001; // A: 点亮a,b,c,e,f,g
        4'hB: hex_to_7seg = 8'b11000001; // b: 点亮c,d,e,f,g
        4'hC: hex_to_7seg = 8'b01100011; // C: 点亮a,d,e,f
        4'hD: hex_to_7seg = 8'b10000101; // d: 点亮b,c,d,e,g
        4'hE: hex_to_7seg = 8'b01100001; // E: 点亮a,d,e,f,g
        4'hF: hex_to_7seg = 8'b01110001; // F: 点亮a,e,f,g
        default: hex_to_7seg = 8'b11111111; // 全灭
      endcase
    end
  endfunction

  // 输出连接
  assign gpio_out = led_reg;
  // 使用译码器将十六进制数字转换为7段显示编码
  assign gpio_seg_0 = hex_to_7seg(seg_reg[3:0]);
  assign gpio_seg_1 = hex_to_7seg(seg_reg[7:4]);
  assign gpio_seg_2 = hex_to_7seg(seg_reg[11:8]);
  assign gpio_seg_3 = hex_to_7seg(seg_reg[15:12]);
  assign gpio_seg_4 = hex_to_7seg(seg_reg[19:16]);
  assign gpio_seg_5 = hex_to_7seg(seg_reg[23:20]);
  assign gpio_seg_6 = hex_to_7seg(seg_reg[27:24]);
  assign gpio_seg_7 = hex_to_7seg(seg_reg[31:28]);

  // APB 响应信号
  assign in_pready = 1'b1;
  assign in_prdata = prdata_reg;
  assign in_pslverr = 1'b0;

endmodule
