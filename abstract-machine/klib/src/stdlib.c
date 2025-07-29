#include <am.h>
#include <klib.h>
#include <klib-macros.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)
static unsigned long int next = 1;

int rand(void) {
  // RAND_MAX assumed to be 32767
  next = next * 1103515245 + 12345;
  return (unsigned int)(next/65536) % 32768;
}

void srand(unsigned int seed) {
  next = seed;
}

int abs(int x) {
  return (x < 0 ? -x : x);
}

int atoi(const char* nptr) {
  int x = 0;
  while (*nptr == ' ') { nptr ++; }
  while (*nptr >= '0' && *nptr <= '9') {
    x = x * 10 + *nptr - '0';
    nptr ++;
  }
  return x;
}

void *malloc(size_t size) {
  // On native, malloc() will be called during initializaion of C runtime.
  // Therefore do not call panic() here, else it will yield a dead recursion:
  //   panic() -> putchar() -> (glibc) -> malloc() -> panic()
#if !(defined(__ISA_NATIVE__) && defined(__NATIVE_USE_KLIB__))
  static void *addr = NULL;
  
  // 首次调用时初始化addr
  if (addr == NULL) {
    addr = heap.start;  // 初始化为堆区起始位置
  }
  
  // 内存对齐处理（按8字节对齐）
  size_t aligned_size = (size + 7) & ~7;
  
  // 保存当前地址作为返回值
  void *ret = addr;
  
  // 更新addr指向下一个可用位置
  addr = (void *)((char *)addr + aligned_size);
  
  // 确保没有超出堆的范围
  if (addr > heap.end) {
    panic("Out of memory");
  }
  
  return ret;
#endif
  return NULL;
}

void free(void *ptr) {
}

#endif
