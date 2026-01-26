.section entry, "ax"
.globl _start
.type _start, @function

_start:
  mv s0, zero
  la sp, _stack_pointer

#   # 复制.data段: ROM(LMA) → RAM(VMA)
#   la t0, _data_lma      # t0 = 源地址(ROM)
#   la t1, _data_vma      # t1 = 目标地址(RAM)
#   la t2, data_lenth     # t2 = 长度值(符号值就是长度!)
#   beqz t2, 2f           # 如果长度为0,跳过
# 1:                      # 复制循环
#   lbu a0, 0(t0)         # 从ROM读取字节
#   sb a0, 0(t1)          # 写入RAM
#   addi t0, t0, 1        # 源地址+1
#   addi t1, t1, 1        # 目标地址+1
#   addi t2, t2, -1       # 长度-1
#   bnez t2, 1b           # 继续循环
# 2:                      # 复制完成

#   # 清零.bss段
#   la t0, _bss_start     # t0 = bss起始地址
#   la t1, _bss_end       # t1 = bss结束地址
#   beq t0, t1, 4f        # 如果start==end,跳过
# 3:                      # 清零循环
#   sb zero, 0(t0)        # 写入0
#   addi t0, t0, 1        # 地址+1
#   bne t0, t1, 3b        # 继续循环
# 4:                      # 清零完成

  call _trm_init
