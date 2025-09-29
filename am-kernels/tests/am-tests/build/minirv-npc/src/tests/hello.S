#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hello.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.hello.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello, AM World @ minirv\n"
	.section	.text.hello,"ax",@progbits
	.align	2
	.globl	hello
	.hidden	hello
	.type	hello, @function
hello:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	li	s0,10
.L2:
	lla	s1,.LC0
	li	a0,72
.L3:
	call	putch
	lbu	a0,1(s1)
	addi	s1,s1,1
	bne	a0,zero,.L3
	addi	s0,s0,-1
	bne	s0,zero,.L2
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	hello, .-hello
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
