VSRC = $(wildcard ./vsrc/*.v)
# 查找csrc目录下所有的.c和.cpp文件，包括子目录
CSRC = $(shell find ./csrc -name "*.c" -o -name "*.cpp")

# 定义包含路径列表
INC_PATH = /home/mubai/ysyx-workbench/npc/mynpc/include


# 定义build目录
BUILD_DIR := $(shell pwd)/build

# 添加日志文件参数
NPC_LOGFILE := $(BUILD_DIR)/npc-log.txt
NPC_ARGS ?= --log=$(NPC_LOGFILE)

# 指定NEMU的动态库路径
NEMU_HOME ?= /home/mubai/ysyx-workbench/nemu
DIFFTEST_REF_SO := $(NEMU_HOME)/build/riscv32-nemu-interpreter-so -b

# 使用addprefix为每个路径添加-I前缀
INCLUDES = $(addprefix -I, $(INC_PATH))

CFLAGS += -D__GUEST_ISA__=riscv32  # 或者其他ISA
CFLAGS += -DNPC_PROJECT
CFLAGS_TRACE += -DITRACE_COND=$(if $(CONFIG_ITRACE_COND),$(call remove_quote,$(CONFIG_ITRACE_COND)),true)
LDFLAGS +=-lreadline -lhistory
LDFLAGS += $(shell sdl2-config --libs)
run: $(IMG)
	$(call git_commit, "sim RTL") # DO NOT REMOVE THIS LINE!!!
	@echo $(VSRC)
	@echo $(CSRC)
	@bash -c 'ELF_FILE=$(basename $(IMG)).elf && \
		echo "ELF file: $$ELF_FILE" && \
		verilator --cc --exe --build --timing --trace-fst --top-module top --CFLAGS "$(INCLUDES) $(CFLAGS) $(CFLAGS_TRACE)" -LDFLAGS "$(LDFLAGS) -ldl" $(VSRC) $(CSRC) && \
		./obj_dir/Vtop -e $$ELF_FILE $(NPC_ARGS) -d $(DIFFTEST_REF_SO) $(IMG) '

include ../Makefile