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

word_t isa_raise_intr(word_t NO, vaddr_t epc) {
  /* 触发中断/异常，并返回中断/异常向量地址 */
  
  // 保存异常PC到mepc CSR
  cpu.csr.mepc = epc;
  
  // 保存中断/异常原因到mcause CSR
  cpu.csr.mcause = NO;
  
  // 设置中断状态标志 - 将MIE位保存到MPIE位，然后清除MIE位
  uint32_t mstatus_val = cpu.csr.mstatus;
  // printf("isa_raise_intr: mstatus before=0x%x\n", mstatus_val);
  
  // 保存当前MIE位的状态
  bool current_mie = (mstatus_val & (1 << 3)) != 0;
  // printf("isa_raise_intr: current_mie=%d\n", current_mie);
  
  // 清除MPIE位，然后根据保存的MIE位状态设置MPIE位
  mstatus_val &= ~(1 << 7);        // 清除MPIE位
  if (current_mie) {               // 如果原来的MIE位为1
    mstatus_val |= (1 << 7);       // 设置MPIE位为1
  }
  // 如果原来的MIE位为0，MPIE位保持0
  
  // 清除MIE位
  mstatus_val &= ~(1 << 3);
  
  // 更新mstatus寄存器
  cpu.csr.mstatus = mstatus_val;
  // printf("isa_raise_intr: mstatus after=0x%x\n", mstatus_val);
  
  // 确定异常处理程序入口地址
  // 根据mtvec的模式位(最低两位)决定入口地址
  if ((cpu.csr.mtvec & 0x3) == 0) {
    // 直接模式：所有异常使用同一个入口
    return cpu.csr.mtvec & ~0x3;
  } else {
    // 向量模式：根据异常类型计算不同的入口地址
    return (cpu.csr.mtvec & ~0x3) + 4 * NO;
  }
}

word_t isa_query_intr() {
  return INTR_EMPTY;
}
