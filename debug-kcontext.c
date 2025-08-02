#include <am.h>
#include <klib.h>
#include <stdio.h>

#define STACK_SIZE (4096 * 8)
typedef union {
  uint8_t stack[STACK_SIZE];
  struct { Context *cp; };
} PCB;
static PCB pcb[2], pcb_boot, *current = &pcb_boot;

static int task_count = 0;

static void f(void *arg) {
  int id = (int)(uintptr_t)arg;
  printf("Task %d started\n", id);
  
  for (int i = 0; i < 3; i++) {
    printf("Task %d: iteration %d\n", id, i);
    task_count++;
    yield();
  }
  
  printf("Task %d finished\n", id);
  while(1) yield(); // Keep yielding to avoid returning
}

static Context *schedule(Event ev, Context *prev) {
  printf("Scheduler called, switching context\n");
  current->cp = prev;
  current = (current == &pcb[0] ? &pcb[1] : &pcb[0]);
  return current->cp;
}

int main() {
  printf("Starting kcontext test\n");
  
  cte_init(schedule);
  
  printf("Creating contexts\n");
  pcb[0].cp = kcontext((Area) { pcb[0].stack, &pcb[0] + 1 }, f, (void *)1L);
  pcb[1].cp = kcontext((Area) { pcb[1].stack, &pcb[1] + 1 }, f, (void *)2L);
  
  printf("Starting main loop, task_count = %d\n", task_count);
  
  yield();
  
  printf("After first yield, task_count = %d\n", task_count);
  
  // Give tasks some time to run
  for (int i = 0; i < 10; i++) {
    yield();
    printf("Main: after yield %d, task_count = %d\n", i+1, task_count);
  }
  
  printf("Test completed, task_count = %d\n", task_count);
  return 0;
}
