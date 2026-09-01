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

#ifndef __MEMORY_PADDR_H__
#define __MEMORY_PADDR_H__

#include <common.h>

#ifdef CONFIG_YSYXSOC
#define YSYXSOC_SRAM_BASE   0x0f000000u
#define YSYXSOC_SRAM_SIZE   0x00002000u
#define YSYXSOC_MROM_BASE   0x20000000u
#define YSYXSOC_MROM_SIZE   0x00001000u
#define YSYXSOC_FLASH_BASE  0x30000000u
#define YSYXSOC_FLASH_SIZE  0x01000000u
#define YSYXSOC_PSRAM_BASE  0x80000000u
#define YSYXSOC_PSRAM_SIZE  0x00400000u
#define YSYXSOC_SDRAM_BASE  0xa0000000u
#define YSYXSOC_SDRAM_SIZE  0x02000000u

// PMEM_LEFT/RIGHT describe the outer bounds only; the actual map is sparse.
#define PMEM_LEFT  ((paddr_t)YSYXSOC_SRAM_BASE)
#define PMEM_RIGHT ((paddr_t)(YSYXSOC_SDRAM_BASE + YSYXSOC_SDRAM_SIZE - 1))
#define RESET_VECTOR ((paddr_t)(YSYXSOC_FLASH_BASE + CONFIG_PC_RESET_OFFSET))
#else
#define PMEM_LEFT  ((paddr_t)CONFIG_MBASE)
#define PMEM_RIGHT ((paddr_t)CONFIG_MBASE + CONFIG_MSIZE - 1)
#define RESET_VECTOR (PMEM_LEFT + CONFIG_PC_RESET_OFFSET)
#endif

/* convert the guest physical address in the guest program to host virtual address in NEMU */
uint8_t* guest_to_host(paddr_t paddr);
/* convert the host virtual address in NEMU to guest physical address in the guest program */
paddr_t host_to_guest(uint8_t *haddr);

static inline bool in_pmem(paddr_t addr) {
#ifdef CONFIG_YSYXSOC
  return addr - YSYXSOC_SRAM_BASE  < YSYXSOC_SRAM_SIZE  ||
         addr - YSYXSOC_MROM_BASE  < YSYXSOC_MROM_SIZE  ||
         addr - YSYXSOC_FLASH_BASE < YSYXSOC_FLASH_SIZE ||
         addr - YSYXSOC_PSRAM_BASE < YSYXSOC_PSRAM_SIZE ||
         addr - YSYXSOC_SDRAM_BASE < YSYXSOC_SDRAM_SIZE;
#else
  return addr - CONFIG_MBASE < CONFIG_MSIZE;
#endif
}

word_t paddr_read(paddr_t addr, int len);
void paddr_write(paddr_t addr, int len, word_t data);

#endif
