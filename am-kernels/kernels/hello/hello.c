#include <am.h>
#include <klib-macros.h>

#define STACK_SIZE 4096
static char stack1[STACK_SIZE] __attribute__((aligned(16)));

static Context *task_ctx = NULL;
static int switch_count = 0;

void task_function(void *arg) {
  putstr("Task function started! arg = ");
  putstr((char*)arg);
  putch('\n');
  
  for (int i = 0; i < 3; i++) {
    putstr("Task iteration ");
    putch('0' + i);
    putch('\n');
    yield();  // Switch back to main
  }
  
  putstr("Task function completed\n");
  // Tasks should not return, but if they do, panic
}

Context *simple_scheduler(Event ev, Context *ctx) {
  switch_count++;
  putstr("Scheduler called ");
  putch('0' + switch_count);
  putstr(", event: ");
  putch('0' + ev.event);
  putch('\n');
  
  if (switch_count == 1) {
    // First call from main's yield() - switch to task
    putstr("Switching to task\n");
    return task_ctx;
  } else if (switch_count <= 4) {
    // Task is yielding back - switch back to main (return original context)
    putstr("Task yielding, continuing in main\n");
    return ctx;
  } else {
    // After task completes, just return current context
    putstr("Staying in current context\n");
    return ctx;
  }
}

int main(const char *args) {
  putstr("Hello, AbstractMachine!\n");
  putstr("Testing cooperative multitasking with kcontext...\n");
  
  // Initialize CTE
  cte_init(simple_scheduler);
  
  // Create a kernel context
  Area kstack = { .start = stack1, .end = stack1 + STACK_SIZE };
  task_ctx = kcontext(kstack, task_function, "hello_task");
  
  if (task_ctx != NULL) {
    putstr("Created context successfully\n");
    
    putstr("Main: About to yield to start task\n");
    yield();  // This should switch to the task
    
    putstr("Main: Back from first yield\n");
    yield();  // This should switch to task again
    
    putstr("Main: Back from second yield\n");
    yield();  // Task should yield back
    
    putstr("Main: Back from third yield\n");
    yield();  // Final yield
    
    putstr("Main: All done!\n");
  } else {
    putstr("Failed to create context\n");
  }
  
  putstr("Program completed\n");
  return 0;
}
