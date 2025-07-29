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
#include <elf.h>
#include <memory/paddr.h>
#include <getopt.h>
#ifndef CONFIG_TARGET_AM


void init_rand();
void init_log(const char *log_file);
void init_mem();
void init_difftest(char *ref_so_file, long img_size, int port);
void init_device();
void init_sdb();
void init_disasm();
void init_iringbuf();
void init_memlog();

static void welcome() {
  Log("Trace: %s", MUXDEF(CONFIG_TRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));\
  Log("Itrace: %s", MUXDEF(CONFIG_ITRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));\
  Log("Ftrace: %s", MUXDEF(CONFIG_FTRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));\
  Log("Mtrace: %s", MUXDEF(CONFIG_MTRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));\
  Log("Dtrace: %s", MUXDEF(CONFIG_DTRACE, ANSI_FMT("ON", ANSI_FG_GREEN), ANSI_FMT("OFF", ANSI_FG_RED)));\
  IFDEF(CONFIG_TRACE, Log("If trace is enabled, a log file will be generated "
        "to record the trace. This may lead to a large log file. "
        "If it is not necessary, you can disable it in menuconfig"));
  Log("Build time: %s, %s", __TIME__, __DATE__);
  printf("Welcome to %s-NEMU!\n", ANSI_FMT(str(__GUEST_ISA__), ANSI_FG_YELLOW ANSI_BG_RED));
  printf("For help, type \"help\"\n");
}


typedef struct {
  char name[64];
  paddr_t addr;
  Elf32_Xword size;
}Symbol;

Symbol *symbol = NULL;
int func_num;
// int *pfuncnum = &func_num;

void parse_elf(const char *elf_file)
{
  if(elf_file == NULL) return;
  

  FILE *fp;
  fp = fopen(elf_file, "rb");

  if(fp == NULL)
  {
    printf("failed to open elf file \n");
    exit(0);
  }

  func_num = 0;
  Elf32_Ehdr ehdr;
  if(fread(&ehdr, sizeof(Elf32_Ehdr), 1, fp) <= 0)
  {
    printf("failed to read elf_header\n");
    exit(0);
  }

  if(ehdr.e_ident[0] != 0x7f || ehdr.e_ident[1] != 'E' || ehdr.e_ident[2] != 'L' || ehdr.e_ident[3] != 'F')
  {
    printf("The file is not an ELF file\n");
    exit(0);
  }

  fseek(fp, ehdr.e_shoff, SEEK_SET);

  Elf32_Shdr shdr;
  char *string_table = NULL;

  for(int i = 0; i < ehdr.e_shnum; i++)
  {
    if(fread(&shdr, sizeof(Elf32_Shdr), 1, fp) <= 0)
    {
      printf("failed to read section header\n");
      exit(0);
    }

    if(shdr.sh_type == SHT_STRTAB)
    {
      string_table = malloc(shdr.sh_size);
      fseek(fp, shdr.sh_offset, SEEK_SET);
      if(fread(string_table, shdr.sh_size, 1, fp) <= 0)
      {
        printf("failed to read string table\n");
        exit(0);
      }
    }
  }

  fseek(fp, ehdr.e_shoff, SEEK_SET);

  for(int i = 0; i < ehdr.e_shnum; i++)
  {
    if(fread(&shdr, sizeof(Elf32_Shdr), 1, fp) <= 0)
    {
      printf("failed to read section header\n");
      exit(0);
    }

    if(shdr.sh_type == SHT_SYMTAB)
    {
      fseek(fp, shdr.sh_offset, SEEK_SET);

      Elf32_Sym sym;

      size_t sym_count = shdr.sh_size / shdr.sh_entsize;
      symbol = malloc(sym_count * sizeof(Symbol));

      for(size_t j = 0; j < sym_count; j++)
      {
        if(fread(&sym, sizeof(Elf32_Sym), 1, fp) <= 0)
        {
          printf("failed to read symbol table\n");
          exit(0);
        }

        if(ELF32_ST_TYPE(sym.st_info) == STT_FUNC)
        {
          const char *name = string_table + sym.st_name;
          strncpy(symbol[func_num].name, name, sizeof(symbol[func_num].name) - 1);
          symbol[func_num].addr = sym.st_value;
          symbol[func_num].size = sym.st_size;
          func_num++;
        }
      }
    }
  }
  fclose(fp);
  free(string_table);
}


int rec_depth = 1;

void display_callfunc(word_t pc, word_t func_addr){
  int i = 0;
  for( ;i < func_num; i++){
    if(func_addr >= symbol[i].addr && func_addr < (symbol[i].addr + symbol[i].size))
    {
      break;
    }
  }
  printf("0x%08x:", pc);
  for(int j = 0; j < rec_depth; j++) printf("   ");
  rec_depth++;
  printf("call [%s@0x%08x]\n", symbol[i].name, func_addr);
}

void display_retfunc(word_t pc) {
  int i = 0;
  for(; i < func_num; i++){
    if(pc >= symbol[i].addr && pc < (symbol[i].addr + symbol[i].size))
    {
      break;
    }
  }
  printf("0x%08x:", pc);
  rec_depth--;
  for(int j = 0; j < rec_depth; j++) {
    printf("   ");
  }
  printf("ret [%s]\n", symbol[i].name);
}


void free_symbol() {
  free(symbol);
}




void sdb_set_batch_mode();

static char *log_file = NULL;
static char *diff_so_file = NULL;
static char *img_file = NULL;
static char *elf_file = NULL;
static int difftest_port = 1234;

static long load_img() {
  if (img_file == NULL) {
    Log("No image is given. Use the default build-in image.");
    return 4096; // built-in image size
  }

  FILE *fp = fopen(img_file, "rb");
  Assert(fp, "Can not open '%s'", img_file);

  fseek(fp, 0, SEEK_END);
  long size = ftell(fp); //返回当前指针的位置，即文件大小

  Log("The image is %s, size = %ld", img_file, size);

  fseek(fp, 0, SEEK_SET);
  int ret = fread(guest_to_host(RESET_VECTOR), size, 1, fp);
  assert(ret == 1);

  fclose(fp);
  return size;
}

static int parse_args(int argc, char *argv[]) {
  const struct option table[] = {
    {"batch"    , no_argument      , NULL, 'b'},
    {"log"      , required_argument, NULL, 'l'},
    {"diff"     , required_argument, NULL, 'd'},
    {"port"     , required_argument, NULL, 'p'},
    {"help"     , no_argument      , NULL, 'h'},
    {"elf"      , required_argument, NULL, 'e'},
    {0          , 0                , NULL,  0 },
  };
  int o;
  while ( (o = getopt_long(argc, argv, "-bhl:d:p:e:", table, NULL)) != -1) {
    switch (o) {
      case 'b': sdb_set_batch_mode(); break;
      case 'p': sscanf(optarg, "%d", &difftest_port); break;
      case 'l': log_file = optarg; break;
      case 'd': diff_so_file = optarg; break;
      case 'e': elf_file = optarg; break;
      case 1: img_file = optarg; return 0;
      default:
        printf("Usage: %s [OPTION...] IMAGE [args]\n\n", argv[0]);
        printf("\t-b,--batch              run with batch mode\n");
        printf("\t-l,--log=FILE           output log to FILE\n");
        printf("\t-d,--diff=REF_SO        run DiffTest with reference REF_SO\n");
        printf("\t-p,--port=PORT          run DiffTest with port PORT\n");
        printf("\t-e,--elf=FILE           parse elf file\n");
        printf("\n");
        exit(0);
    }
  }
  return 0;
}

void init_monitor(int argc, char *argv[]) {
  /* Perform some global initialization. */

  /* Parse arguments. */
  parse_args(argc, argv);

  /* Set random seed. */
  init_rand();

/*instruction trace*/
  IFDEF(CONFIG_ITRACE, init_iringbuf(););
  

  /*memory log*/
  IFDEF(CONFIG_MTRACE, init_memlog());

  /* Parse elf file. */
  IFDEF(CONFIG_FTRACE, parse_elf(elf_file));

  /* Open the log file. */
  init_log(log_file);

  /* Initialize memory. */
  init_mem();

  /* Initialize devices. */
  IFDEF(CONFIG_DEVICE, init_device());

  /* Perform ISA dependent initialization. */
  init_isa();

  /* Load the image to memory. This will overwrite the built-in image. */
  long img_size = load_img();

  /* Initialize differential testing. */
  init_difftest(diff_so_file, img_size, difftest_port);

  /* Initialize the simple debugger. */
  init_sdb();

  IFDEF(CONFIG_ITRACE, init_disasm());

  /* Display welcome message. */
  welcome();
}
#else // CONFIG_TARGET_AM
static long load_img() {
  extern char bin_start, bin_end;
  size_t size = &bin_end - &bin_start;
  Log("img size = %ld", size);
  memcpy(guest_to_host(RESET_VECTOR), &bin_start, size);
  return size;
}

void am_init_monitor() {
  init_rand();
  init_mem();
  init_isa();
  load_img();
  IFDEF(CONFIG_DEVICE, init_device());
  welcome();
}
#endif
