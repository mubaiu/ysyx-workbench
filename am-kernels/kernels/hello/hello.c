#include <am.h>
#include <klib-macros.h>

#define STACK_SIZE 4096
static char stack[STACK_SIZE] __attribute__((aligned(16)));

void test_function(void *arg) {
  putstr("Hello from kernel context! arg = ");
  putstr((char*)arg);
  putch('\n');
  // This should cause a panic since kernel contexts should not return
}

Context *simple_handler(Event ev, Context *ctx) {
  putstr("Event occurred\n");
  return ctx;
}

int main(const char *args) {
  const char *fmt =
    "Hello, AbstractMachine!\n"
    "mainargs = '%'.\n"
    "Testing kcontext implementation...\n";

  for (const char *p = fmt; *p; p++) {
    (*p == '%') ? putstr(args) : putch(*p);
  }
  
  // Initialize CTE
  cte_init(simple_handler);
  
  // Create a kernel context
  Area kstack = { .start = stack, .end = stack + STACK_SIZE };
  Context *ctx = kcontext(kstack, test_function, "test_arg");
  
  putstr("Created context at: ");
  // Print context address (simplified hex output)
  putstr("0x"); 
  // Note: We can't easily print hex without printf, so just indicate success
  if (ctx != NULL) {
    putstr("SUCCESS\n");
  } else {
    putstr("FAILED\n");
  }
  
  putstr("Test completed\n");
  return 0;
}
