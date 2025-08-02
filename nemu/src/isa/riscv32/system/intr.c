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
  
  // 实现特权级转换逻辑
  word_t mstatus = cpu.csr.mstatus;
  
  // 保存当前的MIE位到MPIE位
  word_t mie = (mstatus >> 3) & 0x1;  // 提取MIE位
  mstatus &= ~(1UL << 7);             // 清除MPIE位
  mstatus |= (mie << 7);              // 设置MPIE位为原MIE值
  
  // 保存当前特权级到MPP字段 (假设当前在Machine模式)
  // MPP位于mstatus的[12:11]位
  mstatus &= ~(0x3UL << 11);          // 清除MPP字段
  mstatus |= (3UL << 11);             // 设置MPP为Machine模式(11b)
  
  // 清除MIE位，禁用中断
  mstatus &= ~(1UL << 3);             // 清除MIE位
  
  // 更新mstatus寄存器
  cpu.csr.mstatus = mstatus;
  
  // 根据mtvec模式计算异常处理程序入口地址
  vaddr_t handler_addr = (cpu.csr.mtvec & 0x3) == 0 ? 
    cpu.csr.mtvec & ~0x3 :                              // 直接模式
    (cpu.csr.mtvec & ~0x3) + 4 * NO;                    // 向量模式
  
  // 记录异常处理踪迹
  IFDEF(CONFIG_ETRACE, etrace_exception(NO, epc, handler_addr));
  
  return handler_addr; // 返回异常处理程序入口地址
}

word_t isa_query_intr() {
  return INTR_EMPTY;
}
