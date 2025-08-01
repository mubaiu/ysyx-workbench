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
  
  // 设置中断状态标志 - 只修改MIE和MPIE位，保持其他位不变
  uint32_t mstatus_val = cpu.csr.mstatus;
  
  // 保存当前MIE位到MPIE位
  if (mstatus_val & (1 << 3)) {  // 如果当前MIE位为1
    mstatus_val |= (1 << 7);     // 设置MPIE位为1
  } else {
    mstatus_val &= ~(1 << 7);    // 设置MPIE位为0
  }
  
  // 清除MIE位
  mstatus_val &= ~(1 << 3);
  
  // 更新mstatus寄存器
  cpu.csr.mstatus = mstatus_val;
  
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
