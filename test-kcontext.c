#include <am.h>
#include <klib.h>
#include <klib-macros.h>

#define STACK_SIZE 4096

static char stack[STACK_SIZE] __attribute__((aligned(16)));

void test_function(void *arg) {
  printf("Hello from kernel context! arg = %s\n", (char*)arg);
  // This should cause a panic since kernel contexts should not return
}

Context *simple_handler(Event ev, Context *ctx) {
  printf("Event: %d\n", ev.event);
  return ctx;
}

int main() {
  printf("Testing kcontext implementation\n");
  
  // Initialize CTE
  cte_init(simple_handler);
  
  // Create a kernel context
  Area kstack = { .start = stack, .end = stack + STACK_SIZE };
  Context *ctx = kcontext(kstack, test_function, "test_arg");
  
  printf("Created context at %p\n", ctx);
  printf("Context mepc: %p\n", (void*)ctx->mepc);
  printf("Context GPR1: %p\n", (void*)ctx->GPR1);
  printf("Context gpr[1]: %p\n", (void*)ctx->gpr[1]);
  
  printf("Test completed\n");
  return 0;
}
