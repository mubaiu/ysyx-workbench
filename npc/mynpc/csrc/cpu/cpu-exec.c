#include <cpu/cpu.h>
#include <cpu/decode.h>
#include <cpu/difftest.h>
#include <locale.h>
#include <verilated.h>
#include <verilated_fst_c.h>
#include "Vtop.h"
#define MAX_INST_TO_PRINT 10
#define MAX_iring 20
#define IF(cond, then_clause) ((cond) ? (then_clause) : (void)0)
extern uint64_t sim_time;
Decode d = {d.pc = 0x80000000};

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
// 在cpu-exec.c中初始化CPU
CPU_state cpu = {};
riscv32e_CPU_state npc = {};
static bool g_print_step = false;
static uint64_t g_timer = 0; // unit: us
uint64_t g_nr_guest_inst = 0;

void device_update();
void wp_difftest();
void free_symbol();
void print_log();

typedef struct ItraceNode
{
  paddr_t pc;
  uint32_t inst;
  struct ItraceNode* next;
}Node;

Node iringbuf[MAX_iring];
Node *iringbufnow;


void init_iringbuf()
{
  iringbufnow = &iringbuf[MAX_iring-1];
  for(int i = 0; i < MAX_iring; i++)
  {
    iringbuf[i].pc = 0;
    iringbuf[i].inst = 0;
    iringbuf[i].next = &iringbuf[(i+1) % MAX_iring];
  }
}

void push_inst(paddr_t pc, uint32_t inst)
{
  // printf("DEBUG: Adding instruction at PC=%08x, inst=%08x\n", pc, inst);
  iringbufnow->next->pc = pc;
  iringbufnow->next->inst = inst;
  iringbufnow = iringbufnow->next;
}

void printf_iringbuf()
{
  char printfbuf[128];
  char *p = printfbuf;
  Node *pnode = iringbufnow->next;
  for(int i = 0; i < MAX_iring; i++)
  {
    if (pnode->pc == 0){
    pnode = pnode->next;
    continue;
    }
    p += sprintf(p, "%sPC: " FMT_PADDR ": ", pnode == iringbufnow ? "--->" : "    ", pnode->pc);
    for(int j = 3; j >= 0; j--){
      p += sprintf(p, "%02x ", ((uint8_t*)&pnode->inst)[j]);
    }
    int ilen_max = MUXDEF(CONFIG_ISA_x86, 8, 4);
    int space_len = ilen_max - 4;
    if (space_len < 0) space_len = 0;
    space_len = space_len * 3 + 1;
    memset(p, ' ', space_len);
    p += space_len;

    disassemble(p, printfbuf + sizeof(printfbuf) - p,
        pnode->pc, (uint8_t *)&pnode->inst, 4);
        pnode = pnode->next;
        puts(printfbuf);
        p = printfbuf;
  }
}



static void trace_and_difftest(Decode *_this, vaddr_t dnpc) {
#ifdef CONFIG_ITRACE_COND
  if (ITRACE_COND) { log_write("%s\n", _this->logbuf); }
#endif
  if (g_print_step) { IFDEF(CONFIG_ITRACE, puts(_this->logbuf)); }
  
  IFDEF(CONFIG_DIFFTEST, difftest_step(_this->pc, dnpc));
  IFDEF(CONFIG_WATCHPOINT, wp_difftest());
}



void exec_once(Decode *d, vaddr_t pc) {
  // d->pc = pc;
  // printf("get_pc:%x\n",d->pc);
  // d->snpc = pc;
  // printf("npc->pc: %x   snpc: %x    dnpc: %x\n", npc.pc, d->snpc, d->dnpc);

  isa_exec_once(d); //  取指
  // printf("get_dnpc: %x\n", d->dnpc);
  // npc.pc = d->dnpc;
  
#ifdef CONFIG_ITRACE
  char *p = d->logbuf;
  p += snprintf(p, sizeof(d->logbuf), FMT_WORD ":", d->pc);
  int ilen = 4;
  int i;
  uint8_t *inst = (uint8_t *)&d->isa.inst;
#ifdef CONFIG_ISA_x86
  for (i = 0; i < ilen; i ++) {
#else
  for (i = ilen - 1; i >= 0; i --) {
#endif
    p += snprintf(p, 4, " %02x", inst[i]);
  }
  int ilen_max = MUXDEF(CONFIG_ISA_x86, 8, 4);
  int space_len = ilen_max - ilen;
  if (space_len < 0) space_len = 0;
  space_len = space_len * 3 + 1;
  memset(p, ' ', space_len);
  p += space_len;
  // printf("log_pc: %x\n", d->pc);
  disassemble(p, d->logbuf + sizeof(d->logbuf) - p,
      MUXDEF(CONFIG_ISA_x86, d->snpc, d->pc), (uint8_t *)&d->isa.inst, ilen);
      push_inst(d->pc, d->isa.inst);
#endif
}



extern VerilatedContext* contextp;
extern Vtop* top;
extern VerilatedFstC* tfp;

static void execute(uint64_t n) {


  for (;n > 0; n --) {
    g_nr_guest_inst ++;
    
    top->clk = !top->clk;
    #ifdef CONFIG_DIFFTEST
    if(top->clk){
      trace_and_difftest(&d, d.dnpc);
    }
    #endif
    
    top->eval(); 
    
    IF(ENABLE_WAVE_TRACE, tfp->dump(sim_time++));
    if(top->clk){
      exec_once(&d, npc.pc);
    }
    

    // if(g_nr_guest_inst == 25){
    //   break;
    // }
    if (nemu_state.state != NEMU_RUNNING) break;
    }
    // IFDEF(CONFIG_DEVICE, device_update());
    for (int i = 0; i < 2; i++) {
        top->clk = !top->clk;
        top->eval();
        IF(ENABLE_WAVE_TRACE, tfp->dump(sim_time++));
    }
    exec_once(&d, npc.pc);
}

static void statistic() {
  IFNDEF(CONFIG_TARGET_AM, setlocale(LC_NUMERIC, ""));
#define NUMBERIC_FMT MUXDEF(CONFIG_TARGET_AM, "%", "%'") PRIu64
  Log("host time spent = " NUMBERIC_FMT " us", g_timer);
  Log("total guest instructions = " NUMBERIC_FMT, g_nr_guest_inst);
  if (g_timer > 0) Log("simulation frequency = " NUMBERIC_FMT " inst/s", g_nr_guest_inst * 1000000 / g_timer);
  else Log("Finish running in less than 1 us and can not calculate the simulation frequency");
}

void assert_fail_msg() {
  isa_reg_display();
  statistic();
}

void cpu_exec(uint64_t n) {
  
  g_print_step = (n < MAX_INST_TO_PRINT);
  switch (nemu_state.state) {
    case NEMU_END: case NEMU_ABORT: case NEMU_QUIT:
      printf("Program execution has ended. To restart the program, exit NEMU and run again.\n");
      return;
    default: nemu_state.state = NEMU_RUNNING;
  }

  uint64_t timer_start = get_time();
  
  execute(n);
  // printf("Final state: %d, halt_ret: %d\n", nemu_state.state, nemu_state.halt_ret);

  uint64_t timer_end = get_time();
  g_timer += timer_end - timer_start;

  switch (nemu_state.state) {
    case NEMU_RUNNING: nemu_state.state = NEMU_STOP; break;

    case NEMU_END: case NEMU_ABORT:
      Log("npc: %s at pc = " FMT_WORD,
          (nemu_state.state == NEMU_ABORT ? ANSI_FMT("ABORT", ANSI_FG_RED) :
           (nemu_state.halt_ret == 0 ? ANSI_FMT("HIT GOOD TRAP", ANSI_FG_GREEN) :
            ANSI_FMT("HIT BAD TRAP", ANSI_FG_RED))),
          nemu_state.halt_pc);
          printf_iringbuf();
          // exit(0);

          
          IFDEF(CONFIG_MTRACE, print_log());
          
          IFDEF(CONFIG_FTRACE, free_symbol());
      // fall through
    case NEMU_QUIT: statistic();
  }
}