#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_input_keybrd,"ax",@progbits
	.align	2
	.globl	__am_input_keybrd
	.hidden	__am_input_keybrd
	.type	__am_input_keybrd, @function
__am_input_keybrd:
.LFB6:
	.cfi_startproc
	sb	zero,0(a0)
	sw	zero,4(a0)
	ret
	.cfi_endproc
.LFE6:
	.size	__am_input_keybrd, .-__am_input_keybrd
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
