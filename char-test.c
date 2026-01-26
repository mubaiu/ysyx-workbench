#define UART_BASE 0x10000000L
#define UART_TX   0x0
#define MROM_BASE 0x20000000L
#define MROM_SIZE 0x1000  // 假设MROM大小为16MB
#define STACK_TOP (MROM_BASE + MROM_SIZE - 4)  // 栈顶设在MROM区域末尾
void _start() {
  // asm volatile("li sp, %0" : : "i"(STACK_TOP) : );
  *(volatile char *)(UART_BASE + UART_TX) = 'A';
  *(volatile char *)(UART_BASE + UART_TX) = '\n';
  while (1);
}