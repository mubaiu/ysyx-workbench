#include <am.h>
#include <klib.h>
#include <rtthread.h>

rt_base_t rt_hw_interrupt_disable(void) {
  // In Abstract Machine, we currently don't have fine-grained interrupt control
  // So we simply use the ienabled/iset mechanism
  rt_base_t level = (rt_base_t)ienabled();
  iset(0);  // Disable interrupts
  return level;
}

void rt_hw_interrupt_enable(rt_base_t level) {
  iset((bool)level);  // Restore interrupt state
}
