#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"trm.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.putch,"ax",@progbits
	.align	2
	.globl	putch
	.hidden	putch
	.type	putch, @function
putch:
.LFB0:
	.cfi_startproc
	li	a4,268435456
	addi	a4,a4,5
.L2:
	lbu	a5,0(a4)
	andi	a5,a5,32
	beq	a5,zero,.L2
	li	a5,268435456
	sb	a0,0(a5)
	ret
	.cfi_endproc
.LFE0:
	.size	putch, .-putch
	.section	.text.halt,"ax",@progbits
	.align	2
	.globl	halt
	.hidden	halt
	.type	halt, @function
halt:
.LFB1:
	.cfi_startproc
#APP
# 26 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L7:
	j	.L7
	.cfi_endproc
.LFE1:
	.size	halt, .-halt
	.section	.text.uart_init,"ax",@progbits
	.align	2
	.globl	uart_init
	.hidden	uart_init
	.type	uart_init, @function
uart_init:
.LFB2:
	.cfi_startproc
	andi	a1,a1,0xff
	sb	a1,0(a0)
	ret
	.cfi_endproc
.LFE2:
	.size	uart_init, .-uart_init
	.section	.text._trm_init,"ax",@progbits
	.align	2
	.globl	_trm_init
	.hidden	_trm_init
	.type	_trm_init, @function
_trm_init:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	li	a5,268435456
	li	a4,1
	sb	a4,0(a5)
	lla	a0,mainargs
	call	main
#APP
# 26 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L10:
	j	.L10
	.cfi_endproc
.LFE3:
	.size	_trm_init, .-_trm_init
	.section	.rodata.mainargs,"a"
	.align	2
	.type	mainargs, @object
	.size	mainargs, 64
mainargs:
	.string	"the_insert-arg_rule_in_Makefile_will_insert_mainargs_here"
	.zero	6
	.hidden	heap
	.globl	heap
	.section	.sdata.heap,"aw"
	.align	2
	.type	heap, @object
	.size	heap, 8
heap:
	.word	_heap_start
	.word	_pmem_start+134217728
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
