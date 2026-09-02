#ifndef NPC_CPU_PERF_H
#define NPC_CPU_PERF_H

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void perf_set_enabled(bool enabled);
void perf_count_retired_instruction(uint32_t pc, uint32_t next_pc,
                                    uint32_t inst);
void perf_report(uint64_t driver_cycles, uint64_t guest_instructions);

#ifdef __cplusplus
}
#endif

#endif
