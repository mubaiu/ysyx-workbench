module sdram_16bit(
  input        clk,
  input        cke,
  input        cs,
  input        ras,
  input        cas,
  input        we,
  input [12:0] a,
  input [ 1:0] ba,
  input [ 1:0] dqm,
  inout [15:0] dq
);

  // SDRAM配置参数
  parameter ADDR_BITS = 13;  // 行地址位数
  parameter COL_BITS  = 9;   // 列地址位数
  parameter DQ_BITS   = 16;  // 数据位宽
  parameter BA_BITS   = 2;   // Bank位数
  parameter NUM_BANKS = 4;   // Bank数量 (2^BA_BITS)

  // 命令编码 {CS, RAS, CAS, WE}
  localparam CMD_NOP        = 4'b0111;
  localparam CMD_ACTIVE     = 4'b0011;
  localparam CMD_READ       = 4'b0101;
  localparam CMD_WRITE      = 4'b0100;
  localparam CMD_TERMINATE  = 4'b0110;
  localparam CMD_PRECHARGE  = 4'b0010;
  localparam CMD_REFRESH    = 4'b0001;
  localparam CMD_LOAD_MODE  = 4'b0000;

  // 存储阵列：4个Bank，每个Bank 8192行 × 512列 × 16位
  reg [DQ_BITS-1:0] mem_array [0:NUM_BANKS-1][0:(1<<ADDR_BITS)-1][0:(1<<COL_BITS)-1];

  // Mode寄存器
  reg [2:0] cas_latency;    // CAS延迟
  reg [2:0] burst_length;   // Burst长度

  // Bank状态
  reg [ADDR_BITS-1:0] active_row [0:NUM_BANKS-1];  // 每个Bank的激活行
  reg                 row_active [0:NUM_BANKS-1];  // 行是否激活

  // 读操作流水线
  reg [DQ_BITS-1:0] read_data_pipe [0:3];  // 支持最大CAS Latency=3
  reg               read_valid_pipe [0:3];
  reg [1:0]         read_dqm_pipe [0:3];

  // 写突发状态
  reg [2:0]          write_burst_cnt;      // 写突发剩余计数
  reg [COL_BITS-1:0] write_col_addr;        // 当前写列地址
  reg [BA_BITS-1:0]  write_bank;            // 当前写Bank
  reg                write_burst_active;    // 写突发是否激活

  // 读突发状态
  reg [2:0]          read_burst_cnt;       // 读突发剩余计数
  reg [COL_BITS-1:0] read_col_addr;         // 当前读列地址
  reg [BA_BITS-1:0]  read_bank;             // 当前读Bank
  reg                read_burst_active;     // 读突发是否激活

  // 输出数据控制
  reg [DQ_BITS-1:0] dq_out;
  reg               dq_out_en;

  // 命令解码
  wire [3:0] command = {cs, ras, cas, we};

  // DQ双向控制
  assign dq = dq_out_en ? dq_out : 16'bz;

  integer i;


  // initial begin
  //   for (i = 0; i < NUM_BANKS; i = i + 1) begin
  //     row_active[i] = 1'b0;
  //     active_row[i] = 0;
  //   end

  //   for (i = 0; i < 4; i = i + 1) begin
  //     read_valid_pipe[i] = 1'b0;
  //     read_dqm_pipe[i] = 2'b00;
  //   end
  // end


  always @(posedge clk) begin
    if (cke) begin
      read_valid_pipe[0] <= 1'b0;

      case (command)
        // LOAD MODE REGISTER命令
        CMD_LOAD_MODE: begin
          // Mode寄存器格式：A[12:0]
          // A[2:0]: Burst Length (000=1, 001=2, 010=4, 011=8, 111=Full Page)
          // A[3]: Burst Type (0=Sequential, 1=Interleaved)
          // A[6:4]: CAS Latency (010=2, 011=3)
          // A[8:7]: Operating Mode (00=Standard)
          // A[9]: Write Burst Mode (0=Programmed, 1=Single)
          burst_length <= a[2:0];
          cas_latency <= a[6:4];
        end

        // ACTIVE命令：激活指定Bank的指定行
        CMD_ACTIVE: begin
          active_row[ba] <= a;      
          row_active[ba] <= 1'b1;   
        end

        // READ命令：从激活的行读取数据
        CMD_READ: begin
          if (row_active[ba]) begin
            // 读取第一个数据并放入流水线
            read_data_pipe[0] <= mem_array[ba][active_row[ba]][a[COL_BITS-1:0]];
            read_valid_pipe[0] <= 1'b1;
            read_dqm_pipe[0] <= dqm;

            // 启动读突发
            read_burst_active <= 1'b1;
            read_burst_cnt <= burst_length ;  // 剩余读取次数
            read_col_addr <= a[COL_BITS-1:0] + 1;  // 下一个列地址
            read_bank <= ba;
          end
        end

        // WRITE命令：向激活的行写入数据
        CMD_WRITE: begin
          if (row_active[ba]) begin
            // 写入数据，考虑DQM掩码
            if (!dqm[0]) mem_array[ba][active_row[ba]][a[COL_BITS-1:0]][7:0] <= dq[7:0];
            if (!dqm[1]) mem_array[ba][active_row[ba]][a[COL_BITS-1:0]][15:8] <= dq[15:8];

            // 启动写突发（无论DQM如何都要启动）
            write_burst_active <= 1'b1;
            write_burst_cnt <= burst_length;  // 剩余写入次数
            write_col_addr <= a[COL_BITS-1:0] + 1;  // 下一个列地址
            write_bank <= ba;
          end
        end

        // PRECHARGE
        CMD_PRECHARGE: begin
          // if (a[10]) begin
          //   // All banks precharge
          //   for (i = 0; i < NUM_BANKS; i = i + 1) begin
          //     row_active[i] = 1'b0;
          //   end
          // end else begin
          //   // Single bank precharge
          //   row_active[ba] = 1'b0;
          // end
        end

        // REFRESH命令：
        CMD_REFRESH: begin
        end

        CMD_NOP: begin
          // // NOP命令，检查写突发状态
          // if(write_burst_active && row_active[ba] && write_end_flag) begin
          //     // 继续写入下一个数据
          //     if (!dqm[0]) begin
          //     write_data <= dq;
          //     mem_array[write_bank][active_row[write_bank]][write_col_addr][7:0] <= dq[7:0];
          //     end
          //     if (!dqm[1]) begin
          //     // write_data <= dq[15:8];
          //     mem_array[write_bank][active_row[write_bank]][write_col_addr][15:8] <= dq[15:8];
          //     // 写突发结束
          //     write_burst_active <= 1'b0;
          //   end
          //   write_end_flag <= 1'b0;
          // end
        end

        default: begin
        end
      endcase

      // 处理读突发延续
      if (read_burst_active && read_burst_cnt > 0) begin
        if (row_active[read_bank]) begin
          // 继续读取下一列数据并放入流水线
          read_data_pipe[0] <= mem_array[read_bank][active_row[read_bank]][read_col_addr];
          read_valid_pipe[0] <= 1'b1;
        end

        // 更新突发状态
        read_col_addr <= read_col_addr + 1;
        read_burst_cnt <= read_burst_cnt - 1;
      end else if (read_burst_active) begin
        // 突发结束
        read_burst_active <= 1'b0;
      end

      // 处理写突发延续
      if (write_burst_active && write_burst_cnt > 0) begin
        if (row_active[write_bank]) begin
          // 继续写入下一列数据
          if (!dqm[0]) mem_array[write_bank][active_row[write_bank]][write_col_addr][7:0] <= dq[7:0];
          if (!dqm[1]) mem_array[write_bank][active_row[write_bank]][write_col_addr][15:8] <= dq[15:8];
        end

        // 更新突发状态
        write_col_addr <= write_col_addr + 1;
        write_burst_cnt <= write_burst_cnt - 1;
      end else if (write_burst_active) begin
        // 突发结束
        write_burst_active <= 1'b0;
      end
    end
  end

  // 读数据流水线
  always @(posedge clk) begin
    if (cke) begin
      read_data_pipe[3] <= read_data_pipe[2];
      read_data_pipe[2] <= read_data_pipe[1];
      read_data_pipe[1] <= read_data_pipe[0];

      read_valid_pipe[3] <= read_valid_pipe[2];
      read_valid_pipe[2] <= read_valid_pipe[1];
      read_valid_pipe[1] <= read_valid_pipe[0];

      read_dqm_pipe[3] <= read_dqm_pipe[2];
      read_dqm_pipe[2] <= read_dqm_pipe[1];
      read_dqm_pipe[1] <= read_dqm_pipe[0];
    end
  end

  always @(*) begin
    case (cas_latency)
      3'd2: begin
        dq_out = read_data_pipe[2];
        dq_out_en = read_valid_pipe[2];
      end
      3'd3: begin
        dq_out = read_data_pipe[3];
        dq_out_en = read_valid_pipe[3];
      end
      default: begin
        dq_out = read_data_pipe[2];
        dq_out_en = read_valid_pipe[2];
      end
    endcase
  end

endmodule

//=============================================================================
// 32位SDRAM包装模块 - 通过位扩展实现（2个16位芯片并联）
//=============================================================================
module sdram_32bit(
  input        clk,
  input        cke,
  input        cs,
  input        ras,
  input        cas,
  input        we,
  input [12:0] a,
  input [ 1:0] ba,
  input [ 3:0] dqm,      // 4位：[1:0]给chip0，[3:2]给chip1
  inout [31:0] dq        // 32位：[15:0]给chip0，[31:16]给chip1
);

  // 实例化chip0（低16位）
  sdram_16bit chip0 (
    .clk(clk),
    .cke(cke),
    .cs(cs),
    .ras(ras),
    .cas(cas),
    .we(we),
    .a(a),
    .ba(ba),
    .dqm(dqm[1:0]),
    .dq(dq[15:0])
  );

  // 实例化chip1（高16位）
  sdram_16bit chip1 (
    .clk(clk),
    .cke(cke),
    .cs(cs),
    .ras(ras),
    .cas(cas),
    .we(we),
    .a(a),
    .ba(ba),
    .dqm(dqm[3:2]),
    .dq(dq[31:16])
  );

endmodule

//=============================================================================
// 字扩展SDRAM模块 - 4个16位芯片（2对位扩展后再字扩展）
//=============================================================================
module sdram(
  input        clk,
  input        cke,
  input        cs,
  input        ras,
  input        cas,
  input        we,
  input [13:0] a,        // 14位地址，a[13]用于字扩展片选
  input [ 1:0] ba,
  input [ 3:0] dqm,
  inout [31:0] dq
);

  // 命令解码
  wire [3:0] command = {cs, ras, cas, we};
  localparam CMD_ACTIVE     = 4'b0011;
  localparam CMD_READ       = 4'b0101;
  localparam CMD_WRITE      = 4'b0100;

  // 记录当前激活的地址空间（在ACTIVE命令时更新）
  reg active_space_high_reg;

  always @(posedge clk) begin
    if (cke && command == CMD_ACTIVE) begin
      active_space_high_reg <= a[13];
    end
  end

  // 组合逻辑：ACTIVE命令时立即使用a[13]
  wire active_space_high = (command == CMD_ACTIVE) ? a[13] : active_space_high_reg;

  // 判断是否为数据访问命令
  wire is_data_access = (command == CMD_ACTIVE) || (command == CMD_READ) || (command == CMD_WRITE);

  wire cs_low  = is_data_access ? (cs | active_space_high) : cs;
  wire cs_high = is_data_access ? (cs | ~active_space_high) : cs;

  // 低地址空间：chip0+chip1位扩展
  sdram_32bit sdram_low (
    .clk(clk),
    .cke(cke),
    .cs(cs_low),
    .ras(ras),
    .cas(cas),
    .we(we),
    .a(a[12:0]),
    .ba(ba),
    .dqm(dqm),
    .dq(dq)
  );

  // 高地址空间：chip2+chip3位扩展
  sdram_32bit sdram_high (
    .clk(clk),
    .cke(cke),
    .cs(cs_high),
    .ras(ras),
    .cas(cas),
    .we(we),
    .a(a[12:0]),
    .ba(ba),
    .dqm(dqm),
    .dq(dq)
  );

endmodule
