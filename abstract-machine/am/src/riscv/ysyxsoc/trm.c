#include <am.h>
#include <klib-macros.h>
#include <klib.h>
#include <riscv/riscv.h>

#define DEVICE_BASE 0xa0000000
#define RTC_ADDR        (DEVICE_BASE + 0x0000048)
#define UART_BASE 0x10000000
#define UART_TX   0x0

#define DLL (UART_BASE + 0x00)  // Divisor Latch Low
#define DLH (UART_BASE + 0x01)  // Divisor Latch High
#define IER (UART_BASE + 0x01)  // Interrupt Enable Register
#define FCR (UART_BASE + 0x02)  // FIFO Control Register
#define LCR (UART_BASE + 0x03)  // Line Control Register
#define MCR (UART_BASE + 0x04)  // Modem Control Register
#define LSR (UART_BASE + 0x05)  // Line Status Register

extern char _heap_start;
extern char _heap_end;
extern char _data_lma;      // LMA地址
extern char _data_vma;      // VMA地址
extern char data_lenth;     // 长度
extern char _bss_start;     // .bss起始地址
extern char _bss_end;       // .bss结束地址
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (128 * 1024 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, &_heap_end);
static const char mainargs[MAINARGS_MAX_LEN] = MAINARGS_PLACEHOLDER; // defined in CFLAGS

void putch(char ch) {
  // 等待THR空
  while ((inb(LSR) & 0x20) == 0x00);
  *(volatile char *)(UART_BASE + UART_TX) = ch;
}

void halt(int code) {
  asm volatile("mv a0, %0; ebreak" : :"r"(code));
  while (1);
}

void uart_init(uint32_t base, uint16_t divisor) {

  outb(LCR, 0x80); // DLAB=1
  outb(DLL, 0x01); // 低字节
  outb(DLH, 0x00); //

  outb(LCR, 0x03);  // 8N1, DLAB=0
  outb(FCR, 0x07);  // Enable FIFO, clear RX/TX FIFO
  outb(MCR, 0x03);  // IRQs enabled, RTS/DSR set
  outb(IER, 0x00);
}

void _trm_init() {
  // 复制.data段: ROM → RAM
  memcpy(&_data_vma, &_data_lma, (size_t)&data_lenth);
  // 清零.bss段
  memset(&_bss_start, 0, (size_t)(&_bss_end - &_bss_start));
  uart_init(UART_BASE, 1); 
  int ret = main(mainargs);
  halt(ret);
}
