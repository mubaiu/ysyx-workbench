#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mp.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.mp_print.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d"
	.section	.text.mp_print,"ax",@progbits
	.align	2
	.globl	mp_print
	.hidden	mp_print
	.type	mp_print, @function
mp_print:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,.LC0
.L2:
	call	cpu_current
	mv	a1,a0
	mv	a0,s0
	call	printf
	j	.L2
	.cfi_endproc
.LFE0:
	.size	mp_print, .-mp_print
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
