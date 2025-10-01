#include <am.h>
#include <klib.h>
#include <rtthread.h>
#include <rthw.h>

// Global variables to manage context switching
static rt_ubase_t *from_sp = NULL;
static rt_ubase_t *to_sp = NULL;
static rt_bool_t need_switch = RT_FALSE;

static Context* ev_handler(Event e, Context *c) {
  switch (e.event) {
    case EVENT_YIELD:
      if (need_switch && to_sp != NULL) {
        // Save current context to 'from' if it exists
        if (from_sp != NULL) {
          *from_sp = (rt_ubase_t)c;
        }
        
        // Switch to new context
        Context *new_ctx = (Context *)(*to_sp);
        need_switch = RT_FALSE;
        from_sp = NULL;
        to_sp = NULL;
        return new_ctx;
      }
      break;
    default: 
      printf("Unhandled event ID = %d\n", e.event); 
      assert(0);
  }
  return c;
}

void __am_cte_init() {
  cte_init(ev_handler);
}

void rt_hw_context_switch_to(rt_ubase_t to) {
  rt_ubase_t *new_sp = (rt_ubase_t *)to;
  
  // Validate pointer
  if (new_sp == NULL || *new_sp == 0) {
    assert(0);
  }
  
  rt_base_t level = rt_hw_interrupt_disable();
  
  from_sp = NULL;  // No previous context to save
  to_sp = new_sp;
  need_switch = RT_TRUE;
  
  // Re-enable interrupts before yield
  rt_hw_interrupt_enable(level);
  
  yield();
  
  assert(0);
}

void rt_hw_context_switch(rt_ubase_t from, rt_ubase_t to) {
  rt_ubase_t *old_sp = (rt_ubase_t *)from;
  rt_ubase_t *new_sp = (rt_ubase_t *)to;
  
  if (old_sp == NULL || new_sp == NULL || *new_sp == 0) {
    assert(0);
  }
  
  rt_base_t level = rt_hw_interrupt_disable();
  
  from_sp = old_sp;  
  to_sp = new_sp;   
  need_switch = RT_TRUE;
  
  rt_hw_interrupt_enable(level);
  
  yield();
  
}

void rt_hw_context_switch_interrupt(rt_ubase_t from, rt_ubase_t to, rt_thread_t from_thread, rt_thread_t to_thread) {
  assert(0);
}

rt_uint8_t *rt_hw_stack_init(void *tentry, void *parameter, rt_uint8_t *stack_addr, void *texit) {
  
  if (tentry == NULL || stack_addr == NULL) {
    return NULL;
  }
  

  Area kstack;

  kstack.start = (void *)((rt_ubase_t)stack_addr - 8192); // Reasonable stack space
  kstack.end = (void *)stack_addr;
  
  Context *ctx = kcontext(kstack, (void (*)(void *))tentry, parameter);
  
  if (ctx == NULL) {
    return NULL;
  }
  
  ctx->gpr[1] = (uintptr_t)texit;  // ra (x1)
  
  return (rt_uint8_t *)ctx;
}
