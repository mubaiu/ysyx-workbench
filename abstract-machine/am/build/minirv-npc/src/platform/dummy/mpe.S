#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mpe.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.mpe_init,"ax",@progbits
	.align	2
	.globl	mpe_init
	.hidden	mpe_init
	.type	mpe_init, @function
mpe_init:
.LFB0:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE0:
	.size	mpe_init, .-mpe_init
	.section	.text.cpu_count,"ax",@progbits
	.align	2
	.globl	cpu_count
	.hidden	cpu_count
	.type	cpu_count, @function
cpu_count:
.LFB1:
	.cfi_startproc
	li	a0,1
	ret
	.cfi_endproc
.LFE1:
	.size	cpu_count, .-cpu_count
	.section	.text.cpu_current,"ax",@progbits
	.align	2
	.globl	cpu_current
	.hidden	cpu_current
	.type	cpu_current, @function
cpu_current:
.LFB2:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE2:
	.size	cpu_current, .-cpu_current
	.section	.text.atomic_xchg,"ax",@progbits
	.align	2
	.globl	atomic_xchg
	.hidden	atomic_xchg
	.type	atomic_xchg, @function
atomic_xchg:
.LFB3:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE3:
	.size	atomic_xchg, .-atomic_xchg
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
