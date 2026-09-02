#include <cpu/perf.h>
#include <common.h>

#define NUMBERIC_FMT MUXDEF(CONFIG_TARGET_AM, "%", "%'") PRIu64

enum LoadPath {
  LOAD_PATH_DCACHE_HIT,
  LOAD_PATH_DCACHE_MISS,
  LOAD_PATH_UNCACHED,
  LOAD_PATH_COUNT,
};

enum MemoryRegion {
  MEM_REGION_SRAM,
  MEM_REGION_CLINT,
  MEM_REGION_UART,
  MEM_REGION_FLASH,
  MEM_REGION_PSRAM,
  MEM_REGION_SDRAM,
  MEM_REGION_OTHER,
  MEM_REGION_COUNT,
};

// Must match the bit packing at the perf_pipeline_cycle() call site in RTL.
enum PipelineFlag {
  PIPE_LSU_BUSY = 1u << 0,
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
  PIPE_JAL = 1u << 11,
  PIPE_JALR = 1u << 12,
  PIPE_CALL = 1u << 13,
  PIPE_RETURN = 1u << 14,
  PIPE_EXLSU_LOAD = 1u << 15,
  PIPE_EXLSU_STORE = 1u << 16,
  PIPE_STORE_BUFFERED = 1u << 17,
};

typedef struct {
  uint64_t alu;
  uint64_t load;
  uint64_t store;
  uint64_t branch;
  uint64_t branch_taken;
  uint64_t jump;
  uint64_t csr;
  uint64_t system;
  uint64_t other;
} RetiredMix;

typedef struct {
  uint64_t pipeline_cycles;
  uint64_t reset_cycles;
  uint64_t retire_cycles;
  uint64_t no_retire_lsu_cycles;
  uint64_t no_retire_frontend_cycles;
  uint64_t no_retire_other_cycles;
  uint64_t no_retire_memory_issue_cycles;
  uint64_t no_retire_redirect_cycles;
  uint64_t no_retire_pipeline_cycles;

  uint64_t lsu_busy_load_cycles;
  uint64_t lsu_busy_store_cycles;
  uint64_t lsu_busy_buffer_conflict_cycles;
  uint64_t lsu_busy_other_cycles;

  uint64_t memory_issue_events;
  uint64_t redirect_events;
  uint64_t control_mispredict_events;
  uint64_t conditional_mispredict_events;

  uint64_t load_path_count[LOAD_PATH_COUNT];
  uint64_t load_path_latency[LOAD_PATH_COUNT];
  uint64_t load_path_address_wait[LOAD_PATH_COUNT];
  uint64_t load_region_count[LOAD_PATH_COUNT][MEM_REGION_COUNT];
  uint64_t load_region_latency[LOAD_PATH_COUNT][MEM_REGION_COUNT];

  uint64_t store_count;
  uint64_t store_latency;
  uint64_t store_address_wait;
  uint64_t store_cacheable_count;
  uint64_t store_region_count[MEM_REGION_COUNT];
  uint64_t store_region_latency[MEM_REGION_COUNT];
} PerfWindow;

static bool g_enabled = false;
static bool g_timed_window_started = false;
static RetiredMix g_retired = {};
static PerfWindow g_all = {};
static PerfWindow g_timed = {};

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

static uint64_t g_jal_resolve_events = 0;
static uint64_t g_jal_mispredict_events = 0;
static uint64_t g_jalr_resolve_events = 0;
static uint64_t g_jalr_mispredict_events = 0;
static uint64_t g_call_resolve_events = 0;
static uint64_t g_call_mispredict_events = 0;
static uint64_t g_return_resolve_events = 0;
static uint64_t g_return_mispredict_events = 0;

static const char *g_load_path_name[LOAD_PATH_COUNT] = {
  "D-cache hit", "D-cache miss", "Uncached load"
};

static const char *g_memory_region_name[MEM_REGION_COUNT] = {
  "SRAM", "CLINT", "UART", "Flash", "PSRAM", "SDRAM", "Other"
};

void perf_set_enabled(bool enabled) {
  g_enabled = enabled;
}

void perf_count_retired_instruction(uint32_t pc, uint32_t next_pc,
                                    uint32_t inst) {
  switch (inst & 0x7fu) {
    case 0x03: // LOAD
      g_retired.load++;
      break;
    case 0x23: // STORE
      g_retired.store++;
      break;
    case 0x63: // Conditional branch
      g_retired.branch++;
      g_retired.branch_taken += (next_pc != pc + 4u);
      break;
    case 0x6f: // JAL
    case 0x67: // JALR
      g_retired.jump++;
      break;
    case 0x73: // SYSTEM/CSR
      if (((inst >> 12) & 0x7u) != 0)
        g_retired.csr++;
      else
        g_retired.system++;
      break;
    case 0x13: // OP-IMM
    case 0x17: // AUIPC
    case 0x33: // OP
    case 0x37: // LUI
      g_retired.alu++;
      break;
    default:
      g_retired.other++;
      break;
  }
}

static MemoryRegion classify_memory_region(uint32_t addr) {
  if (addr >= 0x0f000000u && addr < 0x0f002000u) return MEM_REGION_SRAM;
  if (addr >= 0x02000000u && addr < 0x02010000u) return MEM_REGION_CLINT;
  if (addr >= 0x10000000u && addr < 0x10001000u) return MEM_REGION_UART;
  if (addr >= 0x30000000u && addr < 0x31000000u) return MEM_REGION_FLASH;
  if (addr >= 0x80000000u && addr < 0x80400000u) return MEM_REGION_PSRAM;
  if (addr >= 0xa0000000u && addr < 0xa2000000u) return MEM_REGION_SDRAM;
  return MEM_REGION_OTHER;
}

static void count_load(PerfWindow *window, LoadPath path,
                       MemoryRegion region, uint64_t latency,
                       uint64_t address_wait) {
  window->load_path_count[path]++;
  window->load_path_latency[path] += latency;
  window->load_path_address_wait[path] += address_wait;
  window->load_region_count[path][region]++;
  window->load_region_latency[path][region] += latency;
}

static void count_store(PerfWindow *window, MemoryRegion region,
                        uint64_t latency, uint64_t address_wait,
                        bool cacheable) {
  window->store_count++;
  window->store_latency += latency;
  window->store_address_wait += address_wait;
  window->store_cacheable_count += cacheable;
  window->store_region_count[region]++;
  window->store_region_latency[region] += latency;
}

static void count_pipeline_cycle(PerfWindow *window, uint32_t flags) {
  window->pipeline_cycles++;
  window->memory_issue_events += ((flags & PIPE_MEM_ISSUE) != 0);
  window->redirect_events += ((flags & PIPE_REDIRECT) != 0);
  window->control_mispredict_events +=
      ((flags & PIPE_CONTROL_MISPREDICT) != 0);
  window->conditional_mispredict_events +=
      ((flags & PIPE_CONDITIONAL_MISPREDICT) != 0);

  if (flags & PIPE_RESET) {
    window->reset_cycles++;
  }
  else if (flags & PIPE_WB_VALID) {
    window->retire_cycles++;
  }
  else if (flags & PIPE_LSU_BUSY) {
    window->no_retire_lsu_cycles++;
    if ((flags & PIPE_STORE_BUFFERED) &&
        (flags & (PIPE_EXLSU_LOAD | PIPE_EXLSU_STORE)))
      window->lsu_busy_buffer_conflict_cycles++;
    else if (flags & PIPE_EXLSU_LOAD)
      window->lsu_busy_load_cycles++;
    else if (flags & PIPE_EXLSU_STORE)
      window->lsu_busy_store_cycles++;
    else
      window->lsu_busy_other_cycles++;
  }
  else if ((flags & (PIPE_IFU_VALID | PIPE_IFID_VALID |
                     PIPE_IDEX_VALID | PIPE_EXLSU_VALID)) == 0) {
    window->no_retire_frontend_cycles++;
  }
  else {
    window->no_retire_other_cycles++;
    if (flags & PIPE_MEM_ISSUE)
      window->no_retire_memory_issue_cycles++;
    else if (flags & PIPE_REDIRECT)
      window->no_retire_redirect_cycles++;
    else
      window->no_retire_pipeline_cycles++;
  }
}

// These functions are called directly from RTL through DPI-C.
extern "C" void perf_ifu_fetch() {
  if (g_enabled) g_ifu_fetch_count++;
}

extern "C" void perf_ifu_stall_wait() {
  if (g_enabled) g_ifu_request_wait_cycles++;
}

extern "C" void perf_ifu_idle() {
  if (g_enabled) g_ifu_queue_empty_cycles++;
}

extern "C" void perf_ifu_squash(uint32_t count) {
  if (g_enabled) g_ifu_squashed_count += count;
}

extern "C" void perf_lsu_load() {
  if (g_enabled) g_lsu_load_count++;
}

extern "C" void perf_lsu_store() {
  if (g_enabled) g_lsu_store_count++;
}

extern "C" void perf_lsu_load_latency(uint64_t latency,
                                       uint64_t address_wait,
                                       uint32_t addr,
                                       uint32_t hit,
                                       uint32_t cacheable) {
  if (!g_enabled) return;

  LoadPath path = hit ? LOAD_PATH_DCACHE_HIT :
                  cacheable ? LOAD_PATH_DCACHE_MISS : LOAD_PATH_UNCACHED;
  MemoryRegion region = classify_memory_region(addr);
  if (region == MEM_REGION_CLINT) g_timed_window_started = true;

  g_lsu_load_latency_total += latency;
  count_load(&g_all, path, region, latency, address_wait);
  if (g_timed_window_started)
    count_load(&g_timed, path, region, latency, address_wait);
}

extern "C" void perf_lsu_store_latency(uint64_t latency,
                                        uint64_t address_wait,
                                        uint32_t addr,
                                        uint32_t cacheable) {
  if (!g_enabled) return;

  MemoryRegion region = classify_memory_region(addr);
  g_lsu_store_latency_total += latency;
  count_store(&g_all, region, latency, address_wait, cacheable != 0);
  if (g_timed_window_started)
    count_store(&g_timed, region, latency, address_wait, cacheable != 0);
}

extern "C" void perf_icache_access() {
  if (g_enabled) g_icache_access_count++;
}

extern "C" void perf_icache_hit(uint64_t cycles) {
  if (!g_enabled) return;
  g_icache_hit_count++;
  g_icache_hit_cycles += cycles;
}

extern "C" void perf_icache_miss(uint64_t cycles) {
  if (!g_enabled) return;
  g_icache_miss_count++;
  g_icache_miss_cycles += cycles;
}

extern "C" void perf_dcache_access(uint32_t hit, uint32_t cacheable) {
  if (!g_enabled) return;
  g_dcache_access_count++;
  g_dcache_cacheable_count += (cacheable != 0);
  g_dcache_hit_count += (hit != 0);
}

extern "C" void perf_pipeline_cycle(uint32_t flags) {
  if (!g_enabled) return;

  bool control_mispredict = (flags & PIPE_CONTROL_MISPREDICT) != 0;
  if (flags & PIPE_JAL) {
    g_jal_resolve_events++;
    g_jal_mispredict_events += control_mispredict;
  }
  if (flags & PIPE_JALR) {
    g_jalr_resolve_events++;
    g_jalr_mispredict_events += control_mispredict;
  }
  if (flags & PIPE_CALL) {
    g_call_resolve_events++;
    g_call_mispredict_events += control_mispredict;
  }
  if (flags & PIPE_RETURN) {
    g_return_resolve_events++;
    g_return_mispredict_events += control_mispredict;
  }

  count_pipeline_cycle(&g_all, flags);
  if (g_timed_window_started)
    count_pipeline_cycle(&g_timed, flags);
}

static void report_lsu_busy_breakdown(const PerfWindow *window) {
  Log("  Load service: " NUMBERIC_FMT, window->lsu_busy_load_cycles);
  Log("  Store service: " NUMBERIC_FMT, window->lsu_busy_store_cycles);
  Log("  Buffered-store conflict: " NUMBERIC_FMT,
      window->lsu_busy_buffer_conflict_cycles);
  Log("  Other LSU busy: " NUMBERIC_FMT, window->lsu_busy_other_cycles);
}

static void report_other_pipeline_breakdown(const PerfWindow *window) {
  Log("  Memory-issue interlock: " NUMBERIC_FMT,
      window->no_retire_memory_issue_cycles);
  Log("  Redirect recovery: " NUMBERIC_FMT,
      window->no_retire_redirect_cycles);
  Log("  Other pipeline/fill: " NUMBERIC_FMT,
      window->no_retire_pipeline_cycles);
}

static void report_store_samples(const PerfWindow *window,
                                 bool show_address_wait) {
  if (window->store_count == 0) return;

  if (show_address_wait) {
    Log("Store address-wait average: %.2f cycles",
        (double)window->store_address_wait / window->store_count);
  }
  Log("Cacheable stores: " NUMBERIC_FMT, window->store_cacheable_count);
  for (int region = 0; region < MEM_REGION_COUNT; region++) {
    if (window->store_region_count[region] == 0) continue;
    Log("  %s: " NUMBERIC_FMT " accesses, %.2f cycle average",
        g_memory_region_name[region], window->store_region_count[region],
        (double)window->store_region_latency[region] /
        window->store_region_count[region]);
  }
}

static void report_load_samples(const PerfWindow *window,
                                bool show_address_wait) {
  for (int path = 0; path < LOAD_PATH_COUNT; path++) {
    if (window->load_path_count[path] == 0) continue;
    if (show_address_wait) {
      Log("%s: " NUMBERIC_FMT " accesses, %.2f cycle average, "
          "%.2f address-wait average", g_load_path_name[path],
          window->load_path_count[path],
          (double)window->load_path_latency[path] /
          window->load_path_count[path],
          (double)window->load_path_address_wait[path] /
          window->load_path_count[path]);
    }
    else {
      Log("%s: " NUMBERIC_FMT " accesses, %.2f cycle average",
          g_load_path_name[path], window->load_path_count[path],
          (double)window->load_path_latency[path] /
          window->load_path_count[path]);
    }
    for (int region = 0; region < MEM_REGION_COUNT; region++) {
      if (window->load_region_count[path][region] == 0) continue;
      Log("  %s: " NUMBERIC_FMT " accesses, %.2f cycle average",
          g_memory_region_name[region],
          window->load_region_count[path][region],
          (double)window->load_region_latency[path][region] /
          window->load_region_count[path][region]);
    }
  }
}

static void report_retired_mix(uint64_t guest_instructions) {
  uint64_t classified = g_retired.load + g_retired.store + g_retired.branch +
      g_retired.jump + g_retired.csr + g_retired.system + g_retired.alu +
      g_retired.other;

  Log("");
  Log(ANSI_FMT("=== Retired Instruction Mix ===", ANSI_FG_YELLOW));
  Log("ALU (OP/OP-IMM/LUI/AUIPC): " NUMBERIC_FMT, g_retired.alu);
  Log("Loads: " NUMBERIC_FMT, g_retired.load);
  Log("Stores: " NUMBERIC_FMT, g_retired.store);
  Log("Conditional branches: " NUMBERIC_FMT, g_retired.branch);
  if (g_retired.branch > 0) {
    Log("Taken conditional branches: " NUMBERIC_FMT " (%.2f%%)",
        g_retired.branch_taken,
        100.0 * g_retired.branch_taken / g_retired.branch);
  }
  Log("JAL/JALR: " NUMBERIC_FMT, g_retired.jump);
  Log("CSR: " NUMBERIC_FMT, g_retired.csr);
  Log("Other system instructions: " NUMBERIC_FMT, g_retired.system);
  Log("Other instructions: " NUMBERIC_FMT, g_retired.other);
  Log("Classified retired instructions: " NUMBERIC_FMT "%s", classified,
      classified == guest_instructions ? " (matches total)" : " (MISMATCH)");
}

static void report_pipeline(uint64_t driver_cycles) {
  Log("");
  Log(ANSI_FMT("=== Pipeline Cycle Breakdown ===", ANSI_FG_CYAN));
  if (g_all.pipeline_cycles == 0) return;

  uint64_t accounted = g_all.reset_cycles + g_all.retire_cycles +
      g_all.no_retire_lsu_cycles + g_all.no_retire_frontend_cycles +
      g_all.no_retire_other_cycles;
  Log("Measured RTL cycles: " NUMBERIC_FMT "%s", g_all.pipeline_cycles,
      g_all.pipeline_cycles == driver_cycles ?
      " (matches driver)" : " (driver mismatch)");
  Log("Reset synchronization cycles: " NUMBERIC_FMT " (%.2f%%)",
      g_all.reset_cycles, 100.0 * g_all.reset_cycles / g_all.pipeline_cycles);
  Log(ANSI_FG_GREEN "Retirement cycles: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
      g_all.retire_cycles,
      100.0 * g_all.retire_cycles / g_all.pipeline_cycles);
  Log(ANSI_FG_RED "No-retire, LSU busy: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
      g_all.no_retire_lsu_cycles,
      100.0 * g_all.no_retire_lsu_cycles / g_all.pipeline_cycles);
  report_lsu_busy_breakdown(&g_all);
  Log(ANSI_FG_RED "No-retire, pipeline empty: " NUMBERIC_FMT
      " (%.2f%%)" ANSI_NONE, g_all.no_retire_frontend_cycles,
      100.0 * g_all.no_retire_frontend_cycles / g_all.pipeline_cycles);
  Log("No-retire, fill/hazard/control: " NUMBERIC_FMT " (%.2f%%)",
      g_all.no_retire_other_cycles,
      100.0 * g_all.no_retire_other_cycles / g_all.pipeline_cycles);
  report_other_pipeline_breakdown(&g_all);
  Log("Exclusive cycle classes: " NUMBERIC_FMT "%s", accounted,
      accounted == g_all.pipeline_cycles ? " (matches total)" : " (MISMATCH)");
  Log("Memory instructions issued: " NUMBERIC_FMT, g_all.memory_issue_events);
  Log("EX redirect events: " NUMBERIC_FMT, g_all.redirect_events);
  Log("Control-flow mispredictions: " NUMBERIC_FMT,
      g_all.control_mispredict_events);
  Log("Conditional-branch mispredictions: " NUMBERIC_FMT,
      g_all.conditional_mispredict_events);

  if (g_retired.branch > 0) {
    Log("Conditional-branch prediction accuracy: %.2f%%",
        100.0 * (g_retired.branch - g_all.conditional_mispredict_events) /
        g_retired.branch);
  }
  uint64_t jump_mispredicts = g_all.control_mispredict_events -
                              g_all.conditional_mispredict_events;
  if (g_retired.jump > 0) {
    Log("JAL/JALR prediction accuracy: %.2f%%",
        100.0 * (g_retired.jump - jump_mispredicts) / g_retired.jump);
  }
  if (g_jal_resolve_events > 0) {
    Log("  JAL: " NUMBERIC_FMT " resolved, " NUMBERIC_FMT
        " mispredictions (%.2f%% accuracy)",
        g_jal_resolve_events, g_jal_mispredict_events,
        100.0 * (g_jal_resolve_events - g_jal_mispredict_events) /
        g_jal_resolve_events);
  }
  if (g_jalr_resolve_events > 0) {
    Log("  JALR: " NUMBERIC_FMT " resolved, " NUMBERIC_FMT
        " mispredictions (%.2f%% accuracy)",
        g_jalr_resolve_events, g_jalr_mispredict_events,
        100.0 * (g_jalr_resolve_events - g_jalr_mispredict_events) /
        g_jalr_resolve_events);
  }
  if (g_call_resolve_events > 0) {
    Log("  Calls: " NUMBERIC_FMT " resolved, " NUMBERIC_FMT
        " mispredictions", g_call_resolve_events, g_call_mispredict_events);
  }
  if (g_return_resolve_events > 0) {
    Log("  Returns: " NUMBERIC_FMT " resolved, " NUMBERIC_FMT
        " mispredictions", g_return_resolve_events,
        g_return_mispredict_events);
  }
  uint64_t control_instructions = g_retired.branch + g_retired.jump;
  if (control_instructions > 0) {
    Log("Control-flow prediction accuracy: %.2f%%",
        100.0 * (control_instructions - g_all.control_mispredict_events) /
        control_instructions);
  }
}

static void report_frontend() {
  Log("");
  Log(ANSI_FMT("=== Front-end ===", ANSI_FG_CYAN));
  Log("I-cache requests launched: " NUMBERIC_FMT, g_icache_access_count);
  Log("Instruction responses queued: " NUMBERIC_FMT, g_ifu_fetch_count);
  Log("Wrong-path queued/in-flight requests squashed: " NUMBERIC_FMT,
      g_ifu_squashed_count);
  if (g_all.pipeline_cycles > 0) {
    Log("I-cache request service cycles: " NUMBERIC_FMT
        " (%.2f%%, non-exclusive)", g_ifu_request_wait_cycles,
        100.0 * g_ifu_request_wait_cycles / g_all.pipeline_cycles);
    Log("Fetch queue empty cycles: " NUMBERIC_FMT
        " (%.2f%%, non-exclusive)", g_ifu_queue_empty_cycles,
        100.0 * g_ifu_queue_empty_cycles / g_all.pipeline_cycles);
  }
}

static void report_lsu() {
  Log("");
  Log(ANSI_FMT("=== LSU and D-cache ===", ANSI_FG_CYAN));
  Log("Completed loads: " NUMBERIC_FMT, g_lsu_load_count);
  Log("Completed stores: " NUMBERIC_FMT, g_lsu_store_count);
  if (g_lsu_load_count > 0) {
    Log(ANSI_FG_GREEN "Average load latency: %.2f cycles" ANSI_NONE,
        (double)g_lsu_load_latency_total / g_lsu_load_count);
    Log("Total load latency: " NUMBERIC_FMT " cycles",
        g_lsu_load_latency_total);
  }
  if (g_lsu_store_count > 0) {
    Log(ANSI_FG_MAGENTA "Average store latency: %.2f cycles" ANSI_NONE,
        (double)g_lsu_store_latency_total / g_lsu_store_count);
    Log("Total store latency: " NUMBERIC_FMT " cycles",
        g_lsu_store_latency_total);
    report_store_samples(&g_all, true);
  }
  report_load_samples(&g_all, true);

  if (g_dcache_access_count > 0) {
    uint64_t dcache_misses = g_dcache_cacheable_count - g_dcache_hit_count;
    uint64_t uncached_loads = g_dcache_access_count - g_dcache_cacheable_count;
    Log("D-cache load lookups: " NUMBERIC_FMT, g_dcache_access_count);
    Log("Cacheable load lookups: " NUMBERIC_FMT, g_dcache_cacheable_count);
    if (g_dcache_cacheable_count > 0) {
      Log(ANSI_FG_GREEN "D-cache hits: " NUMBERIC_FMT
          " (%.2f%%)" ANSI_NONE, g_dcache_hit_count,
          100.0 * g_dcache_hit_count / g_dcache_cacheable_count);
    }
    Log(ANSI_FG_RED "D-cache misses: " NUMBERIC_FMT ANSI_NONE,
        dcache_misses);
    Log("Uncached loads: " NUMBERIC_FMT, uncached_loads);
  }
}

static void report_timed_window() {
  if (!g_timed_window_started || g_timed.pipeline_cycles == 0) return;

  Log("");
  Log(ANSI_FMT("=== Timed Workload (after first CLINT read) ===",
               ANSI_FG_CYAN));
  Log("Cycles: " NUMBERIC_FMT, g_timed.pipeline_cycles);
  Log("Retirement cycles: " NUMBERIC_FMT " (%.2f%%)",
      g_timed.retire_cycles,
      100.0 * g_timed.retire_cycles / g_timed.pipeline_cycles);
  Log("No-retire, LSU busy: " NUMBERIC_FMT " (%.2f%%)",
      g_timed.no_retire_lsu_cycles,
      100.0 * g_timed.no_retire_lsu_cycles / g_timed.pipeline_cycles);
  report_lsu_busy_breakdown(&g_timed);
  Log("No-retire, pipeline empty: " NUMBERIC_FMT " (%.2f%%)",
      g_timed.no_retire_frontend_cycles,
      100.0 * g_timed.no_retire_frontend_cycles / g_timed.pipeline_cycles);
  Log("No-retire, fill/hazard/control: " NUMBERIC_FMT " (%.2f%%)",
      g_timed.no_retire_other_cycles,
      100.0 * g_timed.no_retire_other_cycles / g_timed.pipeline_cycles);
  report_other_pipeline_breakdown(&g_timed);
  Log("Memory instructions issued: " NUMBERIC_FMT,
      g_timed.memory_issue_events);
  Log("EX redirect events: " NUMBERIC_FMT, g_timed.redirect_events);
  Log("Control-flow mispredictions: " NUMBERIC_FMT,
      g_timed.control_mispredict_events);
  if (g_timed.store_count > 0) {
    Log("Stores: " NUMBERIC_FMT " accesses, %.2f cycle average",
        g_timed.store_count,
        (double)g_timed.store_latency / g_timed.store_count);
    report_store_samples(&g_timed, false);
  }
  report_load_samples(&g_timed, false);
}

static void report_icache() {
  Log("");
  Log(ANSI_FMT("=== I-cache ===", ANSI_FG_CYAN));
  uint64_t completed = g_icache_hit_count + g_icache_miss_count;
  if (completed == 0) return;

  double hit_rate = (double)g_icache_hit_count / completed;
  double amat = (double)(g_icache_hit_cycles + g_icache_miss_cycles) /
                completed;
  Log("Completed accesses: " NUMBERIC_FMT, completed);
  Log(ANSI_FG_GREEN "Hits: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
      g_icache_hit_count, hit_rate * 100.0);
  Log(ANSI_FG_RED "Misses: " NUMBERIC_FMT " (%.2f%%)" ANSI_NONE,
      g_icache_miss_count, 100.0 * g_icache_miss_count / completed);
  if (g_icache_hit_count > 0) {
    Log(ANSI_FG_GREEN "Average hit latency: %.2f cycles" ANSI_NONE,
        (double)g_icache_hit_cycles / g_icache_hit_count);
  }
  if (g_icache_miss_count > 0) {
    Log(ANSI_FG_RED "Average miss penalty: %.2f cycles" ANSI_NONE,
        (double)g_icache_miss_cycles / g_icache_miss_count);
  }
  Log(ANSI_FG_YELLOW "AMAT: %.2f cycles" ANSI_NONE, amat);
}

void perf_report(uint64_t driver_cycles, uint64_t guest_instructions) {
  report_retired_mix(guest_instructions);
  report_pipeline(driver_cycles);
  report_frontend();
  report_lsu();
  report_timed_window();
  report_icache();
}
