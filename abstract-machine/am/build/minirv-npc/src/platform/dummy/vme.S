#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vme.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.vme_init,"ax",@progbits
	.align	2
	.globl	vme_init
	.hidden	vme_init
	.type	vme_init, @function
vme_init:
.LFB0:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE0:
	.size	vme_init, .-vme_init
	.section	.text.protect,"ax",@progbits
	.align	2
	.globl	protect
	.hidden	protect
	.type	protect, @function
protect:
.LFB1:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE1:
	.size	protect, .-protect
	.section	.text.unprotect,"ax",@progbits
	.align	2
	.globl	unprotect
	.hidden	unprotect
	.type	unprotect, @function
unprotect:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	unprotect, .-unprotect
	.section	.text.map,"ax",@progbits
	.align	2
	.globl	map
	.hidden	map
	.type	map, @function
map:
.LFB3:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE3:
	.size	map, .-map
	.section	.text.ucontext,"ax",@progbits
	.align	2
	.globl	ucontext
	.hidden	ucontext
	.type	ucontext, @function
ucontext:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-8
	.cfi_def_cfa_offset 8
	li	a0,0
	addi	sp,sp,8
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	ucontext, .-ucontext
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
