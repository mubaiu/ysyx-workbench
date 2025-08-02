#include <am.h>
#include <riscv/riscv.h>
#include <klib.h>
#include <klib-macros.h>

static Context* (*user_handler)(Event, Context*) = NULL;

Context* __am_irq_handle(Context *c) {
  if (user_handler) {
    Event ev = {0};
    switch (c->mcause) {
      case 11: ev.event = EVENT_YIELD; break;  // Machine mode environment call (ecall)
      default: ev.event = EVENT_ERROR; break;
    }

    c = user_handler(ev, c);
    assert(c != NULL);
  }

  return c;
}

extern void __am_asm_trap(void);
extern void __am_kcontext_start(void);

bool cte_init(Context*(*handler)(Event, Context*)) {
  // initialize exception entry
  asm volatile("csrw mtvec, %0" : : "r"(__am_asm_trap));

  // register event handler
  user_handler = handler;

  return true;
}

Context *kcontext(Area kstack, void (*entry)(void *), void *arg) {
  // Create context at the bottom of the stack
  Context *ctx = (Context *)((char *)kstack.end - sizeof(Context));
  
  // Initialize the context to zeros
  memset(ctx, 0, sizeof(Context));
  
  // Set up the program counter to start at __am_kcontext_start
  extern void __am_kcontext_start(void);
  ctx->mepc = (uintptr_t)__am_kcontext_start;
  
  // Set up argument in GPR1 (a7 for RV32I/RV64I, a5 for RV32E)
  ctx->GPR1 = (uintptr_t)arg;
  
  // Set up entry function address in x1 (ra register)
  ctx->gpr[1] = (uintptr_t)entry;
  
  // Set up stack pointer - note x2 (sp) is not saved in gpr array,
  // it's handled specially by the trap handler
  // When context is restored, sp will be set to the context location
  
  // Set up machine status register for machine mode
  ctx->mstatus = 0x1800; // MPP = 11 (machine mode), other bits 0
  
  return ctx;
}

void yield() {
#ifdef __riscv_e
  asm volatile("li a5, -1; ecall");
#else
  asm volatile("li a7, -1; ecall");
#endif
}

bool ienabled() {
  return false;
}

void iset(bool enable) {
}

void __am_panic_on_return() {
  panic("kernel context returns");
}
