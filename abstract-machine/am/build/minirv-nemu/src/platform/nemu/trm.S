#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"trm.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.putch,"ax",@progbits
	.align	2
	.globl	putch
	.hidden	putch
	.type	putch, @function
putch:
.LFB6:
	.cfi_startproc
	li	a5,-1610612736
	sb	a0,1016(a5)
	ret
	.cfi_endproc
.LFE6:
	.size	putch, .-putch
	.section	.text.halt,"ax",@progbits
	.align	2
	.globl	halt
	.hidden	halt
	.type	halt, @function
halt:
.LFB7:
	.cfi_startproc
#APP
# 15 "/home/mubai/ysyx-workbench/abstract-machine/am/src/platform/nemu/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L4:
	j	.L4
	.cfi_endproc
.LFE7:
	.size	halt, .-halt
	.section	.text._trm_init,"ax",@progbits
	.align	2
	.globl	_trm_init
	.hidden	_trm_init
	.type	_trm_init, @function
_trm_init:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a0,mainargs
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	main
#APP
# 15 "/home/mubai/ysyx-workbench/abstract-machine/am/src/platform/nemu/trm.c" 1
	mv a0, a0; ebreak
# 0 "" 2
#NO_APP
.L6:
	j	.L6
	.cfi_endproc
.LFE8:
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
