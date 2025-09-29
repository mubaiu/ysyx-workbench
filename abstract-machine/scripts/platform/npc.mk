AM_SRCS := riscv/npc/start.S \
		   riscv/npc/trm.c \
		   riscv/npc/ioe.c \
		   riscv/npc/timer.c \
		   riscv/npc/input.c \
		   riscv/npc/cte.c \
		   riscv/npc/trap.S \
		   platform/dummy/vme.c \
		   platform/dummy/mpe.c

CFLAGS    += -fdata-sections -ffunction-sections
LDSCRIPTS += $(AM_HOME)/scripts/linker.ld
LDFLAGS   += --defsym=_pmem_start=0x80000000 --defsym=_entry_offset=0x0
LDFLAGS   += --gc-sections -e _start

NPC_HOME = /home/mubai/ysyx-workbench/npc/mynpc

MAINARGS_MAX_LEN = 64
MAINARGS_PLACEHOLDER = the_insert-arg_rule_in_Makefile_will_insert_mainargs_here
CFLAGS += -DMAINARGS_MAX_LEN=$(MAINARGS_MAX_LEN) -DMAINARGS_PLACEHOLDER=\""$(MAINARGS_PLACEHOLDER)"\"

NEW_IMAGE := $(shell pwd)/new

insert-arg: image
	@echo MAINARGS_MAX_LEN = $(MAINARGS_MAX_LEN) MAINARGS_PLACEHOLDER = $(MAINARGS_PLACEHOLDER) mainargs = "$(mainargs)"
	@python $(AM_HOME)/tools/insert-arg.py $(NEW_IMAGE).bin $(MAINARGS_MAX_LEN) $(MAINARGS_PLACEHOLDER) "$(mainargs)"

image: image-dep
	@$(OBJDUMP) -d $(IMAGE).elf > $(IMAGE).txt
# 	@echo + OBJCOPY "->" $(IMAGE_REL).bin
#     @$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(IMAGE).elf $(IMAGE).bin
	@echo object.elf = $(IMAGE).elf
	@bash /home/mubai/ysyx-workbench/ysyxSoC/ready-to-run/D-stage/gen.sh  $(IMAGE).elf
	@echo NEW_IMAGE = $(NEW_IMAGE);

run: insert-arg
	$(MAKE) -C $(NPC_HOME) run  IMG=$(NEW_IMAGE).bin

.PHONY: insert-arg
