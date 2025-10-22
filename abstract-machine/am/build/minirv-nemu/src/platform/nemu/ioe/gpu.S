#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"gpu.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_gpu_init,"ax",@progbits
	.align	2
	.globl	__am_gpu_init
	.hidden	__am_gpu_init
	.type	__am_gpu_init, @function
__am_gpu_init:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	__am_gpu_init, .-__am_gpu_init
	.section	.text.__am_gpu_config,"ax",@progbits
	.align	2
	.globl	__am_gpu_config
	.hidden	__am_gpu_config
	.type	__am_gpu_config, @function
__am_gpu_config:
.LFB7:
	.cfi_startproc
	li	a5,1
	sh	a5,0(a0)
	sw	zero,4(a0)
	sw	zero,8(a0)
	sw	zero,12(a0)
	ret
	.cfi_endproc
.LFE7:
	.size	__am_gpu_config, .-__am_gpu_config
	.section	.text.__am_gpu_fbdraw,"ax",@progbits
	.align	2
	.globl	__am_gpu_fbdraw
	.hidden	__am_gpu_fbdraw
	.type	__am_gpu_fbdraw, @function
__am_gpu_fbdraw:
.LFB8:
	.cfi_startproc
	lbu	a5,20(a0)
	beq	a5,zero,.L4
	li	a5,-1610612736
	li	a4,1
	sw	a4,260(a5)
.L4:
	ret
	.cfi_endproc
.LFE8:
	.size	__am_gpu_fbdraw, .-__am_gpu_fbdraw
	.section	.text.__am_gpu_status,"ax",@progbits
	.align	2
	.globl	__am_gpu_status
	.hidden	__am_gpu_status
	.type	__am_gpu_status, @function
__am_gpu_status:
.LFB9:
	.cfi_startproc
	li	a5,1
	sb	a5,0(a0)
	ret
	.cfi_endproc
.LFE9:
	.size	__am_gpu_status, .-__am_gpu_status
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
