#include <am.h>
#include <klib-macros.h>
#include <klib.h>

#define DEVICE_BASE 0xa0000000
#define RTC_ADDR        (DEVICE_BASE + 0x0000048)
#define UART_BASE 0x10000000
#define UART_TX   0x0

extern char _heap_start;
extern char _heap_end;
extern char _data_lma;      // LMA地址
extern char _data_vma;      // VMA地址
extern char data_lenth;     // 长度
extern char _bss_start;     // .bss起始地址
extern char _bss_end;       // .bss结束地址
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (4 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, &_heap_end);
static const char mainargs[MAINARGS_MAX_LEN] = MAINARGS_PLACEHOLDER; // defined in CFLAGS

void putch(char ch) {
  *(volatile char *)(UART_BASE + UART_TX) = ch;
}

void halt(int code) {
  asm volatile("mv a0, %0; ebreak" : :"r"(code));
  while (1);
}

void _trm_init() {
  // 复制.data段: ROM → RAM
  memcpy(&_data_vma, &_data_lma, (size_t)&data_lenth);

  // 清零.bss段
  memset(&_bss_start, 0, (size_t)(&_bss_end - &_bss_start));

  int ret = main(mainargs);
  halt(ret);
}
