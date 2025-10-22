#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mpe.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.mpe_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"MPE entry returns"
	.align	2
.LC2:
	.string	" @ /home/mubai/ysyx-workbench/abstract-machine/am/src/platform/nemu/mpe.c:7  \n"
	.section	.text.mpe_init,"ax",@progbits
	.align	2
	.globl	mpe_init
	.hidden	mpe_init
	.type	mpe_init, @function
mpe_init:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	jalr	a0
	lla	s0,.LC0
	li	a0,65
.L2:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L2
	lla	s0,.LC1
	li	a0,77
.L3:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L3
	lla	s0,.LC2
	li	a0,32
.L4:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L4
	li	a0,1
	call	halt
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
	li	a2,5
	tail	__atomic_exchange_4
	.cfi_endproc
.LFE3:
	.size	atomic_xchg, .-atomic_xchg
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
