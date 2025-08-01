/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>

#ifdef CONFIG_ETRACE

// RISC-V异常/中断编号定义
static const char* exception_names[] = {
  [0]  = "Instruction address misaligned",
  [1]  = "Instruction access fault", 
  [2]  = "Illegal instruction",
  [3]  = "Breakpoint",
  [4]  = "Load address misaligned",
  [5]  = "Load access fault",
  [6]  = "Store/AMO address misaligned", 
  [7]  = "Store/AMO access fault",
  [8]  = "Environment call from U-mode",
  [9]  = "Environment call from S-mode",
  [10] = "Reserved",
  [11] = "Environment call from M-mode",
  [12] = "Instruction page fault",
  [13] = "Load page fault",
  [14] = "Reserved",
  [15] = "Store/AMO page fault"
};

static const char* interrupt_names[] = {
  [0]  = "User software interrupt",
  [1]  = "Supervisor software interrupt", 
  [2]  = "Reserved",
  [3]  = "Machine software interrupt",
  [4]  = "User timer interrupt",
  [5]  = "Supervisor timer interrupt",
  [6]  = "Reserved",
  [7]  = "Machine timer interrupt",
  [8]  = "User external interrupt",
  [9]  = "Supervisor external interrupt",
  [10] = "Reserved", 
  [11] = "Machine external interrupt"
};

static const char* get_exception_name(word_t mcause) {
  bool is_interrupt = (mcause >> 31) & 1;  // RISC-V中断标志位在最高位
  word_t exception_code = mcause & 0x7FFFFFFF;  // 低31位为异常/中断代码
  
  if (is_interrupt) {
    if (exception_code < sizeof(interrupt_names) / sizeof(interrupt_names[0]) && 
        interrupt_names[exception_code] != NULL) {
      return interrupt_names[exception_code];
    }
    return "Unknown interrupt";
  } else {
    if (exception_code < sizeof(exception_names) / sizeof(exception_names[0]) && 
        exception_names[exception_code] != NULL) {
      return exception_names[exception_code];
    }
    return "Unknown exception";
  }
}

void etrace_exception(word_t mcause, vaddr_t epc, vaddr_t mtvec) {
  bool is_interrupt = (mcause >> 31) & 1;
  word_t exception_code = mcause & 0x7FFFFFFF;
  const char* type_str = is_interrupt ? "INTERRUPT" : "EXCEPTION";
  const char* name = get_exception_name(mcause);
  
  printf("\033[1;33m[ETRACE]\033[0m %s | NO: %2u | %-30s | EPC: " FMT_WORD " | Handler: " FMT_WORD "\n",
         type_str, exception_code, name, epc, mtvec);
}

#endif // CONFIG_ETRACE
