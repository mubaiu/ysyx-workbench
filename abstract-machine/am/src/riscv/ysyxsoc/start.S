# ============================================================================
# FSBL (First Stage Bootloader) - 在 flash 中执行
# ============================================================================
.section entry, "ax"
.globl _start
.type _start, @function

_start:
  mv s0, zero

  # 设置临时栈指针（使用 SRAM 的顶部）
  li sp, 0x0f002000      # SRAM 起始地址 + 8KB

  # 复制 SSBL 到 SRAM: Flash(LMA) → SRAM(VMA)
  la t0, _ssbl_lma       # t0 = 源地址(Flash)
  la t1, _ssbl_vma       # t1 = 目标地址(SRAM)
  la t2, ssbl_length     # t2 = 长度
  beqz t2, 2f            # 如果长度为0,跳过
1:                       # 复制循环
  lw a0, 0(t0)           # 从Flash读取4字节
  sw a0, 0(t1)           # 写入SRAM
  addi t0, t0, 4         # 源地址+4
  addi t1, t1, 4         # 目标地址+4
  addi t2, t2, -4        # 长度-4
  bnez t2, 1b            # 继续循环
2:                       # 复制完成

  # 跳转到 SSBL（在 SRAM 中）
  la t0, _ssbl_start
  jr t0

# ============================================================================
# SSBL (Second Stage Bootloader) - 在 SRAM 中执行
# ============================================================================
.section .ssbl, "ax"
.globl _ssbl_start
.type _ssbl_start, @function

_ssbl_start:
  # 设置正式栈指针（指向 PSRAM）
  la sp, _stack_pointer

  # 复制.text段: Flash(LMA) → PSRAM(VMA)
  la t0, _text_lma       # t0 = 源地址(Flash)
  la t1, _text_vma       # t1 = 目标地址(PSRAM)
  la t2, text_length     # t2 = 长度
  beqz t2, 4f            # 如果长度为0,跳过
3:                       # 复制循环
  lw a0, 0(t0)           # 从Flash读取4字节
  sw a0, 0(t1)           # 写入PSRAM
  addi t0, t0, 4         # 源地址+4
  addi t1, t1, 4         # 目标地址+4
  addi t2, t2, -4        # 长度-4
  bnez t2, 3b            # 继续循环
4:                       # 复制完成

  # 复制.data段: Flash(LMA) → PSRAM(VMA)
  la t0, _data_lma       # t0 = 源地址(Flash)
  la t1, _data_vma       # t1 = 目标地址(PSRAM)
  la t2, data_length     # t2 = 长度
  beqz t2, 6f            # 如果长度为0,跳过
5:                       # 复制循环
  lw a0, 0(t0)           # 从Flash读取4字节
  sw a0, 0(t1)           # 写入PSRAM
  addi t0, t0, 4         # 源地址+4
  addi t1, t1, 4         # 目标地址+4
  addi t2, t2, -4        # 长度-4
  bnez t2, 5b            # 继续循环
6:                       # 复制完成

  # 清零.bss段
  la t0, _bss_start      # t0 = bss起始地址
  la t1, _bss_end        # t1 = bss结束地址
  beq t0, t1, 8f         # 如果start==end,跳过
7:                       # 清零循环
  sw zero, 0(t0)         # 写入0 (4字节)
  addi t0, t0, 4         # 地址+4
  bne t0, t1, 7b         # 继续循环
8:                       # 清零完成

  # 跳转到程序入口
  call _trm_init
