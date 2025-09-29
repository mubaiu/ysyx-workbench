#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"general.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z6uppow2j,"ax",@progbits
	.align	2
	.globl	_Z6uppow2j
	.hidden	_Z6uppow2j
	.type	_Z6uppow2j, @function
_Z6uppow2j:
.LFB0:
	.cfi_startproc
	mv	a2,a0
	blt	a0,zero,.L6
	li	a5,31
	li	a0,-1
	li	a1,1
.L3:
	addi	a5,a5,-1
	sll	a4,a1,a5
	and	a3,a4,a2
	beq	a5,a0,.L10
	beq	a3,zero,.L3
	mv	a0,a4
	beq	a2,a0,.L1
.L11:
	addi	a5,a5,1
	li	a4,1
	sll	a0,a4,a5
	ret
.L10:
	mv	a0,a2
.L1:
	ret
.L6:
	li	a0,-2147483648
	li	a5,31
	beq	a2,a0,.L1
	j	.L11
	.cfi_endproc
.LFE0:
	.size	_Z6uppow2j, .-_Z6uppow2j
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
