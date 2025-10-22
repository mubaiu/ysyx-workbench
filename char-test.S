.section .text
.globl _start
_start:
    # 设置栈指针
    lui sp, 0x20001     # 加载高20位 (0x20001000)
    addi sp, sp, -4     # 调整为0x20000FFC
    
    # 设置UART基地址
    lui a0, 0x10000     # UART基地址的高20位
    
    # 发送字符'A'
    addi a1, zero, 'A'  # 加载字符'A'到a1
    sb a1, 0(a0)        # 存储到UART_TX
    
    # 发送换行符
    # addi a1, zero, 10   # 加载换行符(ASCII 10)到a1
    # sb a1, 0(a0)        # 存储到UART_TX
    
    # 无限循环
loop:
    j loop              # 无限循环