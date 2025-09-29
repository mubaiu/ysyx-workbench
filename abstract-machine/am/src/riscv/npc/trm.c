#include <am.h>
#include <klib-macros.h>

#define DEVICE_BASE 0xa0000000
#define RTC_ADDR        (DEVICE_BASE + 0x0000048)
#define SERIAL_PORT     (0x10000000)

extern char _heap_start;
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (128 * 1024 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, PMEM_END);
static const char mainargs[MAINARGS_MAX_LEN] = MAINARGS_PLACEHOLDER; // defined in CFLAGS

void putch(char ch) {
  volatile uint8_t *lsr = (uint8_t *)(SERIAL_PORT + 5);
  // 等待THR空
  while ((*lsr & 0x20) == 0);
  *((volatile char *)SERIAL_PORT) = ch;
}

void halt(int code) {
  asm volatile("mv a0, %0; ebreak" : :"r"(code));
  while (1);
}

void uart_init(uint32_t base, uint16_t divisor) {
  volatile uint8_t *dl = (uint8_t *)(base + 0);

  *dl = divisor & 0xff;
}

void _trm_init() {
  uart_init(SERIAL_PORT, 1);
  int ret = main(mainargs);
  halt(ret);
}
