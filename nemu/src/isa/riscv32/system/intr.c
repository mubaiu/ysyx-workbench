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
void etrace_exception(word_t mcause, vaddr_t epc, vaddr_t mtvec);
#endif

word_t isa_raise_intr(word_t NO, vaddr_t epc) {
  /* 触发中断/异常，并返回中断/异常向量地址 */
  
  // 保存异常PC到mepc CSR
  cpu.csr.mepc = epc;
  
  // 保存中断/异常原因到mcause CSR
  cpu.csr.mcause = NO;
  
  // 简化的中断处理：在Machine-only模式下禁用中断
  // cpu.csr.mstatus &= ~(1 << 3);  // 清除MIE位，禁用中断
  
  // // 根据mtvec模式计算异常处理程序入口地址
  // vaddr_t handler_addr = (cpu.csr.mtvec & 0x3) == 0 ? 
  //   cpu.csr.mtvec & ~0x3 :                              // 直接模式
  //   (cpu.csr.mtvec & ~0x3) + 4 * NO;                    // 向量模式
  
  // 记录异常处理踪迹
  IFDEF(CONFIG_ETRACE, etrace_exception(NO, epc, handler_addr));
  
  return cpu.csr.mtvec; // 返回异常处理程序入口地址
}

word_t isa_query_intr() {
  return INTR_EMPTY;
}
