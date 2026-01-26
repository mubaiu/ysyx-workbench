// #include "trap.h"

// #define SRAM_BASE 0x0f000000
// #define SRAM_LENTH (0x01000000)
// #DEFINE MAX_COUNT 7

// int test_data[] = {0x0, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};
// int ans[] = {0x0, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};

// // #define NR_DATA LENGTH(test_data)

// int main() {
//     int w_point = 0;
//     int r_point = 0;
//     int i = 0;

// 	for(w_point = 0; w_point < SRAM_LENTH; w_point ++) {
// 		*(uint8_t*)(SRAM_BASE + w_point) = test_data[i++];
//         if (i == MAX_COUNT) i = 0;
// 		// check(j == NR_DATA);
// 	}

// 	// check(i == NR_DATA);
//     i = 0;
// 	for(r_point = 0; r_point < SRAM_LENTH; r_point ++) {
// 		int data = *(uint8_t*)(SRAM_BASE + r_point);
// 		// check(data == ans[r_point]);
//         if (i == MAX_COUNT) i = 0;
// 	}

// 	return 0;
// }
#include "trap.h"

#define SRAM_BASE  0x0f000000
#define SRAM_LEN   4 * 1024
#define PSRAM_BASE 0x80000000
//#define PSRAM_LEN  4 * 1024 * 1024//4MB（跑到天昏地暗都没结束）
#define PSRAM_LEN  4 * 1024
#define SDRAM_BASE 0xa0002000
//#define SDRAM_LEN  512 * 1024 * 1024//512MB(明天起床能看到它跑完吗）
#define SDRAM_LEN  16
//#define LEN 0x10

#define MASK8  0xff
#define MASK16 0xffff
#define MASK32 0xffffffff
#define MASK64 0xffffffffffffffffULL

void sram_test8() {
  uint8_t *mem = (uint8_t *)SRAM_BASE;
  for (int i = 0; i < SRAM_LEN; i++) {
    mem[i] = i & MASK8;
  }
  for (int i = 0; i < SRAM_LEN; i++) {
    check(mem[i] == (i & MASK8));
  }
}

void sram_test16() {
  uint16_t *mem = (uint16_t *)SRAM_BASE;
  for (int i = 0; i < SRAM_LEN / 2; i++) {
    mem[i] = (i * 2) & MASK16;
  }
  for (int i = 0; i < SRAM_LEN / 2; i++) {
    check(mem[i] == ((i * 2) & MASK16));
  }
}

void sram_test32() {
  uint32_t *mem = (uint32_t *)SRAM_BASE;
  for (int i = 0; i < SRAM_LEN / 4; i++) {
    mem[i] = (i * 4) & MASK32;
  }
  for (int i = 0; i < SRAM_LEN / 4; i++) {
    check(mem[i] == ((i * 4) & MASK32));
  }
}

void sram_test64() {
  uint64_t *mem = (uint64_t *)SRAM_BASE;
  for (int i = 0; i < SRAM_LEN / 8; i++) {
    mem[i] = ((uint64_t)(i * 8)) & MASK64;
  }
  for (int i = 0; i < SRAM_LEN / 8; i++) {
    check(mem[i] == (((uint64_t)(i * 8)) & MASK64));
  }
}

// void sdram_test8() {
//   uint8_t *mem = (uint8_t *)SDRAM_BASE;
//   for (int i = 0; i < SDRAM_LEN; i++) {
//     mem[i] = i & MASK8;
//   }
//   for (int i = 0; i < SDRAM_LEN; i++) {
//     check(mem[i] == (i & MASK8));
//   }
// }

// void sdram_test16() {
//   uint16_t *mem = (uint16_t *)SDRAM_BASE;
//   for (int i = 0; i < SDRAM_LEN / 2; i++) {
//     mem[i] = (i * 2) & MASK16;
//   }
//   for (int i = 0; i < SDRAM_LEN / 2; i++) {
//     check(mem[i] == ((i * 2) & MASK16));
//   }
// }

// void sdram_test32() {
//   uint32_t *mem = (uint32_t *)SDRAM_BASE;
//   for (int i = 0; i < SDRAM_LEN / 4; i++) {
//     mem[i] = (i * 4) & MASK32;
//   }
//   for (int i = 0; i < SDRAM_LEN / 4; i++) {
//     check(mem[i] == ((i * 4) & MASK32));
//   }
// }

// void sdram_test64() {
//   uint64_t *mem = (uint64_t *)SDRAM_BASE;
//   for (int i = 0; i < SDRAM_LEN / 8; i++) {
//     mem[i] = ((uint64_t)(i * 8)) & MASK64;
//   }
//   for (int i = 0; i < SDRAM_LEN / 8; i++) {
//     check(mem[i] == (((uint64_t)(i * 8)) & MASK64));
//   }
// }

// void psram_test8() {
//   uint8_t *mem = (uint8_t *)PSRAM_BASE;
//   for (int i = 0; i < PSRAM_LEN; i++) {
//     mem[i] = i & MASK8;
//   }
//   for (int i = 0; i < PSRAM_LEN; i++) {
//     check(mem[i] == (i & MASK8));
//   }
// }

// void psram_test16() {
//   uint16_t *mem = (uint16_t *)PSRAM_BASE;
//   for (int i = 0; i < PSRAM_LEN / 2; i++) {
//     mem[i] = (i * 2) & MASK16;
//   }
//   for (int i = 0; i < PSRAM_LEN / 2; i++) {
//     check(mem[i] == ((i * 2) & MASK16));
//   }
// }

// void psram_test32() {
//   uint32_t *mem = (uint32_t *)PSRAM_BASE;
//   for (int i = 0; i < PSRAM_LEN / 4; i++) {
//     mem[i] = (i * 4) & MASK32;
//   }
//   for (int i = 0; i < PSRAM_LEN / 4; i++) {
//     check(mem[i] == ((i * 4) & MASK32));
//   }
// }

// void psram_test64() {
//   uint64_t *mem = (uint64_t *)PSRAM_BASE;
//   for (int i = 0; i < PSRAM_LEN / 8; i++) {
//     mem[i] = ((uint64_t)(i * 8)) & MASK64;
//   }
//   for (int i = 0; i < PSRAM_LEN / 8; i++) {
//     check(mem[i] == (((uint64_t)(i * 8)) & MASK64));
//   }
// }

int main() {
    sram_test8();
    sram_test16();
    sram_test32();
    sram_test64();
    // printf("SRAM PASS\n");

//   psram_test8();
//   psram_test16();
//   psram_test32();
//   psram_test64();
//   printf("PSRAM PASS\n");
//   sdram_test8();
//   sdram_test16();
//   sdram_test32();
//   sdram_test64();
//   printf("SDRAM PASS\n");  
  return 0;
}