#include <cpu/cpu.h>
#include <cpu/decode.h>
#include <cpu/difftest.h>
#include <cpu/perf.h>
#include <locale.h>
#include <verilated.h>
#include <verilated_fst_c.h>
#include "VysyxSoCFull.h"
#include <nvboard.h>
#define MAX_INST_TO_PRINT 10
#define MAX_iring 20

extern uint64_t sim_time;
static Decode d = {};

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
void wp_difftest();
void free_symbol();
void print_log();
// 在cpu-exec.c中初始化CPU
CPU_state cpu = {};
riscv32e_CPU_state npc = {};
static bool g_print_step = false;
static uint64_t g_timer = 0; // unit: us
uint64_t g_nr_guest_inst = 0;
static uint64_t g_nr_cycles = 0;  // 周期计数器

typedef struct {
  bool valid;
  vaddr_t pc;
  vaddr_t next_pc;
  uint32_t inst;
  bool skip_ref;
} CommitEvent;

static CommitEvent commit_event = {};

// RTL 只在 WBU 有效退休时调用一次。事件在 eval() 返回后处理，确保同一
// 个时钟沿上的寄存器写回已经通过 set_reg_value() 更新到 npc.gpr。
extern "C" void commit_instruction(uint32_t pc, uint32_t next_pc,
                                   uint32_t inst, uint32_t skip_ref) {
  Assert(!commit_event.valid,
         "unhandled commit before pc = " FMT_WORD, pc);
  commit_event.valid = true;
  commit_event.pc = pc;
  commit_event.next_pc = next_pc;
  commit_event.inst = inst;
  commit_event.skip_ref = (skip_ref != 0);
}

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

static void exec_once(Decode *d, vaddr_t pc, vaddr_t next_pc, uint32_t inst) {
  d->pc = pc;
  d->snpc = pc + 4;
  d->dnpc = next_pc;
  d->isa.inst = inst;

  // mysoc 的 isa_exec_once() 只处理 ftrace；指令本身来自退休流水级，
  // 不能再按当前取指 PC 从主机侧内存猜测。
  isa_exec_once(d);
  
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
extern VysyxSoCFull* ysyxSoCFull;
extern VerilatedFstC* tfp;

static void process_commit() {
  CommitEvent event = commit_event;
  commit_event.valid = false;

  perf_count_retired_instruction(event.pc, event.next_pc, event.inst);
  g_nr_guest_inst++;
  npc.pc = event.next_pc;
  exec_once(&d, event.pc, event.next_pc, event.inst);

#ifdef CONFIG_DIFFTEST
  if (event.skip_ref) {
    difftest_skip_ref();
  }
#endif
  trace_and_difftest(&d, event.next_pc);
}

static void step_cycle() {
  nvboard_update();
  ysyxSoCFull->clock = 0;
  ysyxSoCFull->eval();
  IF(ENABLE_WAVE_TRACE, tfp->dump(sim_time++));

  ysyxSoCFull->clock = 1;
  ysyxSoCFull->eval();
  IF(ENABLE_WAVE_TRACE, tfp->dump(sim_time++));
  g_nr_cycles++;
}

static void execute(uint64_t n) {
  uint64_t nr_retired = 0;

  while (nr_retired < n) {
    if (!commit_event.valid && nemu_state.state == NEMU_RUNNING) {
      step_cycle();
    }

    // EBREAK 和 commit 在同一个 WBU 时钟沿到达。即使 EBREAK 已把状态改成
    // NEMU_END，也要先完成该退休事件的 trace/difftest。
    if (commit_event.valid) {
      process_commit();
      nr_retired++;
    }

    if (nemu_state.state != NEMU_RUNNING) {
      break;
    }
  }
}

static void statistic() {
  IFNDEF(CONFIG_TARGET_AM, setlocale(LC_NUMERIC, ""));
#define NUMBERIC_FMT MUXDEF(CONFIG_TARGET_AM, "%", "%'") PRIu64
  Log("host time spent = " NUMBERIC_FMT " us", g_timer);
  Log("total guest instructions = " NUMBERIC_FMT, g_nr_guest_inst);
  Log("total cycles = " NUMBERIC_FMT, g_nr_cycles);
  if (g_nr_cycles > 0) {
    double ipc = (double)g_nr_guest_inst / g_nr_cycles;
    double cpi = (double)g_nr_cycles / g_nr_guest_inst;
    Log(ANSI_FG_CYAN "IPC (Instructions Per Cycle) = %.3f", ipc);
    Log(ANSI_FG_CYAN "CPI (Cycles Per Instruction) = %.3f", cpi);
  }
  if (g_timer > 0) Log(ANSI_FG_CYAN "simulation frequency = " NUMBERIC_FMT " inst/s", g_nr_guest_inst * 1000000 / g_timer);
  else Log(ANSI_FG_CYAN "Finish running in less than 1 us and can not calculate the simulation frequency");
  perf_report(g_nr_cycles, g_nr_guest_inst);
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

  perf_set_enabled(true);
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
          IFDEF(CONFIG_ITRACE, printf_iringbuf());
          // exit(0);

          
          IFDEF(CONFIG_MTRACE, print_log());
          
          IFDEF(CONFIG_FTRACE, free_symbol());
      // fall through
    case NEMU_QUIT: statistic();
  }
}
