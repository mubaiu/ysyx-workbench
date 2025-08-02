#include <am.h>
#include <klib-macros.h>

#define STACK_SIZE 4096
static char stack1[STACK_SIZE] __attribute__((aligned(16)));
static char stack2[STACK_SIZE] __attribute__((aligned(16)));

static Context *ctx1, *ctx2;
static Context *current_ctx = NULL;

void task1(void *arg) {
  for (int i = 0; i < 5; i++) {
    putstr("Task 1 running, iteration ");
    putch('0' + i);
    putch('\n');
    yield();  // Switch to other task
  }
  putstr("Task 1 completed\n");
  while(1) yield();  // Keep yielding
}

void task2(void *arg) {
  for (int i = 0; i < 5; i++) {
    putstr("Task 2 running, iteration ");
    putch('0' + i);
    putch('\n');
    yield();  // Switch to other task
  }
  putstr("Task 2 completed\n");
  while(1) yield();  // Keep yielding
}

Context *scheduler(Event ev, Context *ctx) {
  putstr("Scheduler called, event: ");
  putch('0' + ev.event);
  putch('\n');
  
  // Save current context
  if (current_ctx == ctx1) {
    ctx1 = ctx;
    current_ctx = ctx2;
    putstr("Switching to Task 2\n");
    return ctx2;
  } else {
    ctx2 = ctx;
    current_ctx = ctx1;
    putstr("Switching to Task 1\n");
    return ctx1;
  }
}

int main(const char *args) {
  putstr("Hello, AbstractMachine!\n");
  putstr("Testing cooperative multitasking with kcontext...\n");
  
  // Initialize CTE
  cte_init(scheduler);
  
  // Create two kernel contexts
  Area kstack1 = { .start = stack1, .end = stack1 + STACK_SIZE };
  Area kstack2 = { .start = stack2, .end = stack2 + STACK_SIZE };
  
  ctx1 = kcontext(kstack1, task1, "task1");
  ctx2 = kcontext(kstack2, task2, "task2");
  
  if (ctx1 != NULL && ctx2 != NULL) {
    putstr("Created both contexts successfully\n");
    
    // Set current context to task1 and start execution
    current_ctx = ctx1;
    putstr("Starting Task 1...\n");
    
    // Force a context switch to start the first task
    yield();
  } else {
    putstr("Failed to create contexts\n");
  }
  
  putstr("Main function completed\n");
  return 0;
}
