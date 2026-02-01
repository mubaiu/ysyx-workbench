#include <reg.h>
#include <stdio.h>
#include <string.h>
#include <isa.h>
#include <cpu/decode.h>
#include <cpu/ifetch.h>

extern Decode d;
extern bool callfunc;
extern bool retfunc;


// Flash memory simulation (16MB)
#define FLASH_SIZE (16 * 1024 * 1024)  // 16MB
#define FLASH_BASE 0x30000000
uint8_t* guest_to_host(paddr_t paddr);

// Initialize flash memory with test data
void init_flash() {
  // Get flash memory pointer
  uint8_t *flash_mem = (uint8_t *)(guest_to_host(FLASH_BASE));

  // Clear flash memory
  memset(flash_mem, 0, FLASH_SIZE);

  // Load char-test.bin into flash
  // const char *bin_file = "/home/mubai/ysyx-workbench/am-kernels/tests/cpu-tests/build/char-test-riscv32e-ysyxsoc.bin";
  // FILE *fp = fopen(bin_file, "rb");

  // if (fp == NULL) {
    // Log("Warning: Cannot open %s, using default test data\n", bin_file);
    // Fallback to test data
    uint32_t *flash_words = (uint32_t *)flash_mem;
    flash_words[0] = 0x12345678;
    flash_words[1] = 0xABCDEF00;
    flash_words[2] = 0xDEADBEEF;
    flash_words[3] = 0xCAFEBABE;
  // } else {
  //   // Read file size
  //   fseek(fp, 0, SEEK_END);
  //   long file_size = ftell(fp);
  //   fseek(fp, 0, SEEK_SET);

  //   // Read file content into flash
  //   int ret = fread(guest_to_host(FLASH_BASE), file_size, 1, fp);
  //   assert(ret == 1);

  //   fclose(fp);
  //   Log("Flash memory loaded: %ld bytes from %s\n", file_size, bin_file);
  // }

  Log("Flash memory initialized: %d bytes at 0x%08x\n", FLASH_SIZE, FLASH_BASE);
}

const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

void isa_reg_display() {
  int length =  sizeof(regs) / sizeof(regs[0]);
  for(int i = 0  ; i < length ; i ++)
      printf("reg$%s ---> 0x%08x\n",regs[i], npc.gpr[i]);
}

word_t isa_reg_str2val(const char *s, bool *success) {
  return 0;
}

// DPI-C接口函数，从Verilog获取寄存器值
extern "C" uint32_t get_reg_value(int idx) {
  if (idx < 0 || idx >= NR_REG) return 0;
  return npc.gpr[idx];
}

// DPI-C接口函数，设置寄存器值
extern "C" void set_reg_value(int32_t idx, uint32_t val) {
  if (idx < 0 || idx >= NR_REG) return;
  if (idx == 0) return; // r0始终为0
  npc.gpr[idx] = val;
}

// extern "C" void set_gpr_ptr(int gpr_0, int gpr_1, int gpr_2, int gpr_3,
//                            int gpr_4, int gpr_5, int gpr_6, int gpr_7,
//                            int gpr_8, int gpr_9, int gpr_10, int gpr_11,
//                            int gpr_12, int gpr_13, int gpr_14, int gpr_15) {
//   npc.gpr[0] = gpr_0;
//   npc.gpr[1] = gpr_1;
//   npc.gpr[2] = gpr_2;
//   npc.gpr[3] = gpr_3;
//   npc.gpr[4] = gpr_4;
//   npc.gpr[5] = gpr_5;
//   npc.gpr[6] = gpr_6;
//   npc.gpr[7] = gpr_7;
//   npc.gpr[8] = gpr_8;
//   npc.gpr[9] = gpr_9;
//   npc.gpr[10] = gpr_10;
//   npc.gpr[11] = gpr_11;
//   npc.gpr[12] = gpr_12;
//   npc.gpr[13] = gpr_13;
//   npc.gpr[14] = gpr_14;
//   npc.gpr[15] = gpr_15;
//   // RV32E只有16个寄存器，剩余寄存器设为0
//   for (int i = 16; i < 32; i++) {
//     npc.gpr[i] = 0;
//   }
// }

// DPI-C接口函数，获取PC值
extern "C" uint32_t get_pc() {
  return npc.pc;
}

// DPI-C接口函数，设置PC值
extern "C" void set_snpc(uint32_t pc) {
  d.snpc = pc;
  // printf("set_snpc: %x\n", pc);
}

// DPI-C接口函数，设置PC值
extern "C" void set_dnpc(uint32_t pc) {
  d.dnpc = pc;
  // printf("set_dnpc: %x\n", pc);
}

// DPI-C接口函数，设置PC值
extern "C" void set_pc(uint32_t pc) {
  d.pc = pc;
  npc.pc = pc;
  // printf("set_pc: %x\n", pc);
}

extern "C" void set_callfunc() {
  callfunc = true;
}

extern "C" void set_retfunc() {
  retfunc = true;
}

extern  "C" uint32_t intake(uint32_t pc){
  vaddr_t vaddr = pc;
  return inst_fetch(&vaddr, 4); 
}

extern "C" void flash_read(int32_t addr, int32_t *data) {
  uint32_t offset = addr + FLASH_BASE;

  if (addr >= FLASH_SIZE) {
    printf("Warning: flash_read out of range: addr=0x%08x , offset = 0x%08x\n", addr, offset);
    *data = 0;
    return;
  }

  *data = *(uint32_t *)(guest_to_host(offset));
  return;
}

extern "C" void mrom_read(int32_t addr, int32_t *data) { 
  *data = vaddr_read(addr,4); 
  return;
}