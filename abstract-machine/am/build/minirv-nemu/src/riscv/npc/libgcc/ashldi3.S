#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ashldi3.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__ashldi3,"ax",@progbits
	.align	2
	.globl	__ashldi3
	.type	__ashldi3, @function
__ashldi3:
.LFB0:
	.cfi_startproc
	beq	a2,zero,.L2
	li	a5,32
	sub	a5,a5,a2
	ble	a5,zero,.L7
	srl	a5,a0,a5
	sll	a1,a1,a2
	sll	a0,a0,a2
	or	a1,a1,a5
.L2:
	ret
.L7:
	addi	a2,a2,-32
	sll	a1,a0,a2
	li	a0,0
	ret
	.cfi_endproc
.LFE0:
	.size	__ashldi3, .-__ashldi3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
