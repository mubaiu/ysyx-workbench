#include <cpu/cpu.h>
#include <cpu/decode.h>
#include <cpu/difftest.h>
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

// Performance accounting starts with cpu_exec(), not during reset/warm-up.
static bool g_perf_enabled = false;

// Retired instruction classes.  Classification happens at the architectural
// retirement boundary, so replayed/stalled/squashed EX instructions cannot be
// counted twice.
static uint64_t g_retired_load_count = 0;
static uint64_t g_retired_store_count = 0;
static uint64_t g_retired_branch_count = 0;
static uint64_t g_retired_branch_taken_count = 0;
static uint64_t g_retired_jump_count = 0;
static uint64_t g_retired_csr_count = 0;
static uint64_t g_retired_system_count = 0;
static uint64_t g_retired_alu_count = 0;
static uint64_t g_retired_other_count = 0;

// Front-end and memory events.  Occupancy counters intentionally overlap and
// are printed as such; the no-retire breakdown below is exclusive.
static uint64_t g_ifu_fetch_count = 0;
static uint64_t g_ifu_request_wait_cycles = 0;
static uint64_t g_ifu_queue_empty_cycles = 0;
static uint64_t g_ifu_squashed_count = 0;
static uint64_t g_lsu_load_count = 0;
static uint64_t g_lsu_store_count = 0;
static uint64_t g_lsu_load_latency_total = 0;
static uint64_t g_lsu_store_latency_total = 0;

static uint64_t g_icache_access_count = 0;
static uint64_t g_icache_hit_count = 0;
static uint64_t g_icache_miss_count = 0;
static uint64_t g_icache_hit_cycles = 0;
static uint64_t g_icache_miss_cycles = 0;
static uint64_t g_dcache_access_count = 0;
static uint64_t g_dcache_cacheable_count = 0;
static uint64_t g_dcache_hit_count = 0;

// Exclusive cycle accounting for cycles with no retirement.
static uint64_t g_pipeline_cycles = 0;
static uint64_t g_reset_cycles = 0;
static uint64_t g_retire_cycles = 0;
static uint64_t g_no_retire_lsu_cycles = 0;
static uint64_t g_no_retire_frontend_cycles = 0;
static uint64_t g_no_retire_other_cycles = 0;
static uint64_t g_memory_issue_interlocks = 0;
static uint64_t g_redirect_events = 0;
static uint64_t g_control_mispredict_events = 0;
static uint64_t g_conditional_mispredict_events = 0;

void device_update();
void wp_difftest();
void free_symbol();
void print_log();

// DPI-C event hooks.
extern "C" void perf_ifu_fetch() {
  if (g_perf_enabled) g_ifu_fetch_count++;
}
extern "C" void perf_lsu_load() {
  if (g_perf_enabled) g_lsu_load_count++;
}
extern "C" void perf_lsu_store() {
  if (g_perf_enabled) g_lsu_store_count++;
}

// DPI-C函数：ICache性能计数
extern "C" void perf_icache_access() {
  if (g_perf_enabled) g_icache_access_count++;
}
extern "C" void perf_icache_hit(uint64_t cycles) {
    if (!g_perf_enabled) return;
    g_icache_hit_count++;
    g_icache_hit_cycles += cycles;
}
extern "C" void perf_icache_miss(uint64_t cycles) {
    if (!g_perf_enabled) return;
    g_icache_miss_count++;
    g_icache_miss_cycles += cycles;
}
extern "C" void perf_dcache_access(uint32_t hit, uint32_t cacheable) {
  if (!g_perf_enabled) return;
  g_dcache_access_count++;
  g_dcache_cacheable_count += (cacheable != 0);
  g_dcache_hit_count += (hit != 0);
}

extern "C" void perf_ifu_stall_wait() {
  if (g_perf_enabled) g_ifu_request_wait_cycles++;
}
extern "C" void perf_ifu_idle() {
  if (g_perf_enabled) g_ifu_queue_empty_cycles++;
}
extern "C" void perf_ifu_squash(uint32_t count) {
  if (g_perf_enabled) g_ifu_squashed_count += count;
}

extern "C" void perf_lsu_load_latency(uint64_t latency) {
  if (g_perf_enabled) g_lsu_load_latency_total += latency;
}
extern "C" void perf_lsu_store_latency(uint64_t latency) {
  if (g_perf_enabled) g_lsu_store_latency_total += latency;
}

enum {
  PIPE_LSU_BUSY  = 1u << 0,
  PIPE_IFU_VALID = 1u << 1,
  PIPE_IFID_VALID = 1u << 2,
  PIPE_IDEX_VALID = 1u << 3,
  PIPE_EXLSU_VALID = 1u << 4,
  PIPE_WB_VALID = 1u << 5,
  PIPE_MEM_ISSUE = 1u << 6,
  PIPE_REDIRECT = 1u << 7,
  PIPE_RESET = 1u << 8,
  PIPE_CONTROL_MISPREDICT = 1u << 9,
  PIPE_CONDITIONAL_MISPREDICT = 1u << 10,
};

extern "C" void perf_pipeline_cycle(uint32_t flags) {
  if (!g_perf_enabled) return;

  g_pipeline_cycles++;
  g_memory_issue_interlocks += ((flags & PIPE_MEM_ISSUE) != 0);
  g_redirect_events += ((flags & PIPE_REDIRECT) != 0);
  g_control_mispredict_events += ((flags & PIPE_CONTROL_MISPREDICT) != 0);
  g_conditional_mispredict_events +=
      ((flags & PIPE_CONDITIONAL_MISPREDICT) != 0);

  if (flags & PIPE_RESET) {
    g_reset_cycles++;
  }
  else if (flags & PIPE_WB_VALID) {
    g_retire_cycles++;
  }
  else if (flags & PIPE_LSU_BUSY) {
    g_no_retire_lsu_cycles++;
  }
  else if ((flags & (PIPE_IFU_VALID | PIPE_IFID_VALID |
                     PIPE_IDEX_VALID | PIPE_EXLSU_VALID)) == 0) {
    g_no_retire_frontend_cycles++;
  }
  else {
    g_no_retire_other_cycles++;
  }
}

static void count_retired_instruction(uint32_t pc, uint32_t next_pc,
                                      uint32_t inst) {
  switch (inst & 0x7fu) {
    case 0x03: // LOAD
      g_retired_load_count++;
      break;
    case 0x23: // STORE
      g_retired_store_count++;
      break;
    case 0x63: // conditional branch
      g_retired_branch_count++;
      g_retired_branch_taken_count += (next_pc != pc + 4u);
      break;
    case 0x6f: // JAL
    case 0x67: // JALR
      g_retired_jump_count++;
      break;
    case 0x73: // SYSTEM/CSR
      if (((inst >> 12) & 0x7u) != 0)
        g_retired_csr_count++;
      else
        g_retired_system_count++;
      break;
    case 0x13: // OP-IMM
    case 0x17: // AUIPC
    case 0x33: // OP
    case 0x37: // LUI
      g_retired_alu_count++;
      break;
    default:
      g_retired_other_count++;
      break;
  }
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

  count_retired_instruction(event.pc, event.next_pc, event.inst);
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
  uint64_t classified = g_retired_load_count + g_retired_store_count +
      g_retired_branch_count + g_retired_jump_count + g_retired_csr_count +
      g_retired_system_count + g_retired_alu_count + g_retired_other_count;

  Log("");
  Log(ANSI_FMT("=== Retired Instruction Mix ===", ANSI_FG_YELLOW));
  Log("ALU (OP/OP-IMM/LUI/AUIPC): " NUMBERIC_FMT, g_retired_alu_count);
  Log("Loads: " NUMBERIC_FMT, g_retired_load_count);
  Log("Stores: " NUMBERIC_FMT, g_retired_store_count);
  Log("Conditional branches: " NUMBERIC_FMT, g_retired_branch_count);
  if (g_retired_branch_count > 0) {
    Log("Taken conditional branches: " NUMBERIC_FMT " (%.2f%%)",
        g_retired_branch_taken_count,
        100.0 * g_retired_branch_taken_count / g_retired_branch_count);
  }
  Log("JAL/JALR: " NUMBERIC_FMT, g_retired_jump_count);
  Log("CSR: " NUMBERIC_FMT, g_retired_csr_count);
  Log("Other system instructions: " NUMBERIC_FMT, g_retired_system_count);
  Log("Other instructions: " NUMBERIC_FMT, g_retired_other_count);
  Log("Classified retired instructions: " NUMBERIC_FMT "%s", classified,
      classified == g_nr_guest_inst ? " (matches total)" : " (MISMATCH)");

  Log("");
  Log(ANSI_FMT("=== Pipeline Cycle Breakdown ===", ANSI_FG_CYAN));
  if (g_pipeline_cycles > 0) {
    uint64_t accounted = g_reset_cycles + g_retire_cycles + g_no_retire_lsu_cycles +
        g_no_retire_frontend_cycles + g_no_retire_other_cycles;
    Log("Measured RTL cycles: " NUMBERIC_FMT "%s", g_pipeline_cycles,
        g_pipeline_cycles == g_nr_cycles ? " (matches driver)" : " (driver mismatch)");
    Log("Reset synchronization cycles: " NUMBERIC_FMT " (%.2f%%)",
        g_reset_cycles, 100.0 * g_reset_cycles / g_pipeline_cycles);
    Log(ANSI_FG_GREEN "Retirement cycles: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
        g_retire_cycles, 100.0 * g_retire_cycles / g_pipeline_cycles);
    Log(ANSI_FG_RED "No-retire, LSU busy: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
        g_no_retire_lsu_cycles,
        100.0 * g_no_retire_lsu_cycles / g_pipeline_cycles);
    Log(ANSI_FG_RED "No-retire, pipeline empty: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
        g_no_retire_frontend_cycles,
        100.0 * g_no_retire_frontend_cycles / g_pipeline_cycles);
    Log("No-retire, fill/hazard/control: " NUMBERIC_FMT " (%.2f%%)",
        g_no_retire_other_cycles,
        100.0 * g_no_retire_other_cycles / g_pipeline_cycles);
    Log("Exclusive cycle classes: " NUMBERIC_FMT "%s", accounted,
        accounted == g_pipeline_cycles ? " (matches total)" : " (MISMATCH)");
    Log("Memory instructions issued: " NUMBERIC_FMT, g_memory_issue_interlocks);
    Log("EX redirect events: " NUMBERIC_FMT, g_redirect_events);
    Log("Control-flow mispredictions: " NUMBERIC_FMT, g_control_mispredict_events);
    Log("Conditional-branch mispredictions: " NUMBERIC_FMT,
        g_conditional_mispredict_events);
    if (g_retired_branch_count > 0) {
      Log("Conditional-branch prediction accuracy: %.2f%%",
          100.0 * (g_retired_branch_count -
                   g_conditional_mispredict_events) /
          g_retired_branch_count);
    }
    uint64_t jump_mispredicts = g_control_mispredict_events -
                                g_conditional_mispredict_events;
    if (g_retired_jump_count > 0) {
      Log("JAL/JALR prediction accuracy: %.2f%%",
          100.0 * (g_retired_jump_count - jump_mispredicts) /
          g_retired_jump_count);
    }
    uint64_t control_instructions = g_retired_branch_count + g_retired_jump_count;
    if (control_instructions > 0) {
      Log("Control-flow prediction accuracy: %.2f%%",
          100.0 * (control_instructions - g_control_mispredict_events) /
          control_instructions);
    }
  }

  Log("");
  Log(ANSI_FMT("=== Front-end ===", ANSI_FG_CYAN));
  Log("I-cache requests launched: " NUMBERIC_FMT, g_icache_access_count);
  Log("Instruction responses queued: " NUMBERIC_FMT, g_ifu_fetch_count);
  Log("Wrong-path queued/in-flight requests squashed: " NUMBERIC_FMT,
      g_ifu_squashed_count);
  if (g_pipeline_cycles > 0) {
    Log("I-cache request service cycles: " NUMBERIC_FMT " (%.2f%%, non-exclusive)",
        g_ifu_request_wait_cycles,
        100.0 * g_ifu_request_wait_cycles / g_pipeline_cycles);
    Log("Fetch queue empty cycles: " NUMBERIC_FMT " (%.2f%%, non-exclusive)",
        g_ifu_queue_empty_cycles,
        100.0 * g_ifu_queue_empty_cycles / g_pipeline_cycles);
  }

  Log("");
  Log(ANSI_FMT("=== LSU and D-cache ===", ANSI_FG_CYAN));
  Log("Completed loads: " NUMBERIC_FMT, g_lsu_load_count);
  Log("Completed stores: " NUMBERIC_FMT, g_lsu_store_count);
  if (g_lsu_load_count > 0) {
    double avg_load_latency = (double)g_lsu_load_latency_total / g_lsu_load_count;
    Log(ANSI_FG_GREEN "Average load latency: %.2f cycles" ANSI_NONE, avg_load_latency);
    Log("Total load latency: " NUMBERIC_FMT " cycles", g_lsu_load_latency_total);
  }
  if (g_lsu_store_count > 0) {
    double avg_store_latency = (double)g_lsu_store_latency_total / g_lsu_store_count;
    Log(ANSI_FG_MAGENTA "Average store latency: %.2f cycles" ANSI_NONE, avg_store_latency);
    Log("Total store latency: " NUMBERIC_FMT " cycles", g_lsu_store_latency_total);
  }

  if (g_dcache_access_count > 0) {
    uint64_t dcache_misses = g_dcache_cacheable_count - g_dcache_hit_count;
    uint64_t uncached_loads = g_dcache_access_count - g_dcache_cacheable_count;
    Log("D-cache load lookups: " NUMBERIC_FMT, g_dcache_access_count);
    Log("Cacheable load lookups: " NUMBERIC_FMT, g_dcache_cacheable_count);
    if (g_dcache_cacheable_count > 0) {
      Log(ANSI_FG_GREEN "D-cache hits: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
          g_dcache_hit_count,
          100.0 * g_dcache_hit_count / g_dcache_cacheable_count);
    }
    Log(ANSI_FG_RED "D-cache misses: " NUMBERIC_FMT ANSI_NONE, dcache_misses);
    Log("Uncached loads: " NUMBERIC_FMT, uncached_loads);
  }

  Log("");
  Log(ANSI_FMT("=== I-cache ===", ANSI_FG_CYAN));
  uint64_t icache_completed = g_icache_hit_count + g_icache_miss_count;
  if (icache_completed > 0) {
    double hit_rate = (double)g_icache_hit_count / icache_completed;
    double amat = (double)(g_icache_hit_cycles + g_icache_miss_cycles) /
                  icache_completed;

    Log("Completed accesses: " NUMBERIC_FMT, icache_completed);
    Log(ANSI_FG_GREEN "Hits: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
        g_icache_hit_count, hit_rate * 100.0);
    Log(ANSI_FG_RED "Misses: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
        g_icache_miss_count, 100.0 * g_icache_miss_count / icache_completed);

    if (g_icache_hit_count > 0) {
      double avg_hit_cycles = (double)g_icache_hit_cycles / g_icache_hit_count;
      Log(ANSI_FG_GREEN "Average hit latency: %.2f cycles" ANSI_NONE, avg_hit_cycles);
    }
    if (g_icache_miss_count > 0) {
      double avg_miss_cycles = (double)g_icache_miss_cycles / g_icache_miss_count;
      Log(ANSI_FG_RED "Average miss penalty: %.2f cycles" ANSI_NONE, avg_miss_cycles);
    }

    Log(ANSI_FG_YELLOW "AMAT: %.2f cycles" ANSI_NONE, amat);
  }
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

  g_perf_enabled = true;
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
