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
#include <time.h>
#include <stdio.h>

# define DEVICE_BASE 0xa0000000
#define RTC_ADDR        (DEVICE_BASE + 0x0000048)
#define SERIAL_PORT     (DEVICE_BASE + 0x00003f8)

#if   defined(CONFIG_PMEM_MALLOC)
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


uint8_t* guest_to_host(paddr_t paddr) { return pmem + paddr - CONFIG_MBASE; }
paddr_t host_to_guest(uint8_t *haddr) { return haddr - pmem + CONFIG_MBASE; }

static word_t pmem_read(paddr_t addr, int len) {
  word_t ret = host_read(guest_to_host(addr), len);
  return ret;
}

static void pmem_write(paddr_t addr, int len, word_t data) {
  host_write(guest_to_host(addr), len, data);
}

static void out_of_bound(paddr_t addr) {
  // panic("address = " FMT_PADDR " is out of bound of pmem [" FMT_PADDR ", " FMT_PADDR "] at pc = " FMT_WORD,
  //     addr, PMEM_LEFT, PMEM_RIGHT, cpu.pc);
  panic("address = " FMT_PADDR " is out of bound of pmem [" FMT_PADDR ", " FMT_PADDR "] at pc = " FMT_WORD,
      addr, PMEM_LEFT, PMEM_RIGHT, npc.pc);
}

void init_mem() {
#if   defined(CONFIG_PMEM_MALLOC)
  pmem = malloc(CONFIG_MSIZE);
  assert(pmem);
#endif
  IFDEF(CONFIG_MEM_RANDOM, memset(pmem, rand(), CONFIG_MSIZE));
  Log("physical memory area [" FMT_PADDR ", " FMT_PADDR "]", PMEM_LEFT, PMEM_RIGHT);
}

word_t paddr_read(paddr_t addr, int len) {
  if (likely(in_pmem(addr)))
  {
    word_t data = pmem_read(addr, len);
    #ifdef CONFIG_MTRACE 
      read_log(addr, len, data);
    #endif
    return data;
  }
  if(addr == RTC_ADDR || addr == RTC_ADDR + 4) {
    // 获取当前时间戳
    uint64_t rtc_val = get_time();
    if(addr == RTC_ADDR) {
      // 返回低32位
      return (word_t)rtc_val;
    } else {
      // 返回高32位
      return (word_t)(rtc_val >> 32);
    }
  }
  // IFDEF(CONFIG_DEVICE, return mmio_read(addr, len));
  out_of_bound(addr);
  
  return 0;
}

void paddr_write(paddr_t addr, int len, word_t data) {
  if (likely(in_pmem(addr))) { 
    #ifdef CONFIG_MTRACE 
      write_log(addr, len, data);
    #endif
    pmem_write(addr, len, data); return; 
  }
  
  // 处理串口输出
  if(addr == SERIAL_PORT) {
    putchar((char)data);
    fflush(stdout); // 确保立即显示
    return;
  }
  
  // IFDEF(CONFIG_DEVICE, mmio_write(addr, len, data); return);
  out_of_bound(addr);
}