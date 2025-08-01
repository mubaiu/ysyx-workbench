#include <am.h>
#include <klib-macros.h>

int main(const char *args) {
  putstr("Testing etrace functionality...\n");
  
  // 故意访问非法地址来触发异常
  volatile int *illegal_ptr = (int*)0x12345678;
  
  putstr("About to access illegal address...\n");
  
  // 这应该会触发一个Load access fault异常
  volatile int value = *illegal_ptr;
  (void)value; // 避免未使用变量警告
  
  putstr("If you see this, etrace didn't work\n");
  return 0;
}
