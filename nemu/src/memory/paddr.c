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

#include <memory/host.h>
#include <memory/paddr.h>
#include <device/mmio.h>
#include <isa.h>

#if defined(CONFIG_YSYXSOC)
static uint8_t sram[YSYXSOC_SRAM_SIZE] PG_ALIGN = {};
static uint8_t mrom[YSYXSOC_MROM_SIZE] PG_ALIGN = {};
static uint8_t flash[YSYXSOC_FLASH_SIZE] PG_ALIGN = {};
static uint8_t psram[YSYXSOC_PSRAM_SIZE] PG_ALIGN = {};
static uint8_t sdram[YSYXSOC_SDRAM_SIZE] PG_ALIGN = {};
#elif defined(CONFIG_PMEM_MALLOC)
static uint8_t *pmem = NULL;
#else // CONFIG_PMEM_GARRAY
static uint8_t pmem[CONFIG_MSIZE] PG_ALIGN = {};
#endif

#define MAX_NUM 100
typedef struct mem_log{
    bool type;
    paddr_t addr;
    uint8_t len;
    word_t data;
    struct mem_log *next;
}mem;

enum{
  READ, 
  WRITE
};  

mem memlog[MAX_NUM];
mem *lognow;

void init_memlog() {
  lognow = &memlog[MAX_NUM-1];
  for(int i = 0; i < MAX_NUM; i++){
    memlog[i].type = READ;
    memlog[i].addr = 0;
    memlog[i].len = 0;
    memlog[i].data = 0;
    memlog[i].next = &memlog[(i+1) % MAX_NUM];
  }
}

void read_log(paddr_t addr, int len, word_t data) {
  lognow->next->type = READ;
  lognow->next->addr = addr;
  lognow->next->len = len;
  lognow->next->data = data;
  lognow = lognow->next;
}

void write_log(paddr_t addr, int len, word_t data) {
  lognow->next->type = WRITE;
  lognow->next->addr = addr;
  lognow->next->len = len;
  lognow->next->data = data;
  lognow = lognow->next;
}

void print_log() {
  char printflog[MAX_NUM];
  char *ptr = printflog;
  mem *pmem = lognow->next;
  for(int i = 0; i < MAX_NUM; i++)
  {
    if(pmem->addr == 0){
      pmem = pmem->next;
      continue;
    }
    ptr += sprintf(ptr, "%s%s at " FMT_PADDR ", len : %d, data : " FMT_PADDR , pmem == lognow ? "--->" : "    " , pmem->type==WRITE ? "WRITE" : "READ", pmem->addr, pmem->len, pmem->data);
    pmem = pmem->next;
    puts(printflog);
    ptr = printflog;
  }
}


#ifdef CONFIG_YSYXSOC
uint8_t* guest_to_host(paddr_t paddr) {
  if (paddr - YSYXSOC_SRAM_BASE < YSYXSOC_SRAM_SIZE) {
    return sram + paddr - YSYXSOC_SRAM_BASE;
  }
  if (paddr - YSYXSOC_MROM_BASE < YSYXSOC_MROM_SIZE) {
    return mrom + paddr - YSYXSOC_MROM_BASE;
  }
  if (paddr - YSYXSOC_FLASH_BASE < YSYXSOC_FLASH_SIZE) {
    return flash + paddr - YSYXSOC_FLASH_BASE;
  }
  if (paddr - YSYXSOC_PSRAM_BASE < YSYXSOC_PSRAM_SIZE) {
    return psram + paddr - YSYXSOC_PSRAM_BASE;
  }
  if (paddr - YSYXSOC_SDRAM_BASE < YSYXSOC_SDRAM_SIZE) {
    return sdram + paddr - YSYXSOC_SDRAM_BASE;
  }
  panic("address = " FMT_PADDR " is outside the ysyxSoC memory map at pc = " FMT_WORD,
      paddr, cpu.pc);
}

static bool host_in_region(uint8_t *haddr, uint8_t *base, size_t size) {
  return (uintptr_t)haddr - (uintptr_t)base < size;
}

paddr_t host_to_guest(uint8_t *haddr) {
  if (host_in_region(haddr, sram, sizeof(sram))) {
    return haddr - sram + YSYXSOC_SRAM_BASE;
  }
  if (host_in_region(haddr, mrom, sizeof(mrom))) {
    return haddr - mrom + YSYXSOC_MROM_BASE;
  }
  if (host_in_region(haddr, flash, sizeof(flash))) {
    return haddr - flash + YSYXSOC_FLASH_BASE;
  }
  if (host_in_region(haddr, psram, sizeof(psram))) {
    return haddr - psram + YSYXSOC_PSRAM_BASE;
  }
  if (host_in_region(haddr, sdram, sizeof(sdram))) {
    return haddr - sdram + YSYXSOC_SDRAM_BASE;
  }
  panic("host address %p is outside the ysyxSoC memory map", haddr);
}
#else
uint8_t* guest_to_host(paddr_t paddr) { return pmem + paddr - CONFIG_MBASE; }
paddr_t host_to_guest(uint8_t *haddr) { return haddr - pmem + CONFIG_MBASE; }
#endif

static word_t pmem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void pmem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

static void out_of_bound(paddr_t addr) {
#ifdef CONFIG_YSYXSOC
  panic("address = " FMT_PADDR " is outside the ysyxSoC memory map at pc = " FMT_WORD,
      addr, cpu.pc);
#else
  panic("address = " FMT_PADDR " is out of bound of pmem [" FMT_PADDR ", " FMT_PADDR "] at pc = " FMT_WORD,
      addr, PMEM_LEFT, PMEM_RIGHT, cpu.pc);
#endif
}

void init_mem() {
#if defined(CONFIG_YSYXSOC)
#ifdef CONFIG_MEM_RANDOM
  int seed = rand();
  memset(sram, seed, sizeof(sram));
  memset(mrom, seed, sizeof(mrom));
  memset(flash, seed, sizeof(flash));
  memset(psram, seed, sizeof(psram));
  memset(sdram, seed, sizeof(sdram));
#endif
  Log("ysyxSoC SRAM  [" FMT_PADDR ", " FMT_PADDR "]",
      (paddr_t)YSYXSOC_SRAM_BASE,
      (paddr_t)(YSYXSOC_SRAM_BASE + YSYXSOC_SRAM_SIZE - 1));
  Log("ysyxSoC MROM  [" FMT_PADDR ", " FMT_PADDR "]",
      (paddr_t)YSYXSOC_MROM_BASE,
      (paddr_t)(YSYXSOC_MROM_BASE + YSYXSOC_MROM_SIZE - 1));
  Log("ysyxSoC flash [" FMT_PADDR ", " FMT_PADDR "]",
      (paddr_t)YSYXSOC_FLASH_BASE,
      (paddr_t)(YSYXSOC_FLASH_BASE + YSYXSOC_FLASH_SIZE - 1));
  Log("ysyxSoC PSRAM [" FMT_PADDR ", " FMT_PADDR "]",
      (paddr_t)YSYXSOC_PSRAM_BASE,
      (paddr_t)(YSYXSOC_PSRAM_BASE + YSYXSOC_PSRAM_SIZE - 1));
  Log("ysyxSoC SDRAM [" FMT_PADDR ", " FMT_PADDR "]",
      (paddr_t)YSYXSOC_SDRAM_BASE,
      (paddr_t)(YSYXSOC_SDRAM_BASE + YSYXSOC_SDRAM_SIZE - 1));
#elif defined(CONFIG_PMEM_MALLOC)
  pmem = malloc(CONFIG_MSIZE);
  assert(pmem);
  IFDEF(CONFIG_MEM_RANDOM, memset(pmem, rand(), CONFIG_MSIZE));
  Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
#else
  IFDEF(CONFIG_MEM_RANDOM, memset(pmem, rand(), CONFIG_MSIZE));
  Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
#endif
}

word_t paddr_read(paddr_t addr, int len) {
  if (likely(in_pmem(addr)))
  {
    uint32_t data = pmem_read(addr, len);
    #ifdef CONFIG_MTRACE 
      read_log(addr, len, data);
    #endif
    return data;
  }
  IFDEF(CONFIG_DEVICE, return mmio_read(addr, len));
  out_of_bound(addr);
  
  return 0;
}

void paddr_write(paddr_t addr, int len, word_t data) {
  if (likely(in_pmem(addr))) { 
#ifdef CONFIG_YSYXSOC
    // XIP flash and MROM are read-only in ysyxSoC.  The CPU ignores the bus
    // error response, so the reference must leave their contents unchanged.
    if (addr - YSYXSOC_FLASH_BASE < YSYXSOC_FLASH_SIZE ||
        addr - YSYXSOC_MROM_BASE < YSYXSOC_MROM_SIZE) {
      return;
    }
#endif
    #ifdef CONFIG_MTRACE 
      write_log(addr, len, data);
    #endif
    pmem_write(addr, len, data); return; 
  }
  IFDEF(CONFIG_DEVICE, mmio_write(addr, len, data); return);
  out_of_bound(addr);
  
}
