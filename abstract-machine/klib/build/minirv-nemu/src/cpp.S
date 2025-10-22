#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cpp.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__dso_handle,"ax",@progbits
	.align	2
	.globl	__dso_handle
	.hidden	__dso_handle
	.type	__dso_handle, @function
__dso_handle:
.LFB0:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE0:
	.size	__dso_handle, .-__dso_handle
	.section	.text.__cxa_guard_acquire,"ax",@progbits
	.align	2
	.globl	__cxa_guard_acquire
	.hidden	__cxa_guard_acquire
	.type	__cxa_guard_acquire, @function
__cxa_guard_acquire:
.LFB5:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE5:
	.size	__cxa_guard_acquire, .-__cxa_guard_acquire
	.section	.text.__cxa_guard_release,"ax",@progbits
	.align	2
	.globl	__cxa_guard_release
	.hidden	__cxa_guard_release
	.type	__cxa_guard_release, @function
__cxa_guard_release:
.LFB7:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE7:
	.size	__cxa_guard_release, .-__cxa_guard_release
	.section	.rodata.__cxa_atexit.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/abstract-machine/klib/src/cpp.c"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text.__cxa_atexit,"ax",@progbits
	.align	2
	.globl	__cxa_atexit
	.hidden	__cxa_atexit
	.type	__cxa_atexit, @function
__cxa_atexit:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,16
	lla	a1,.LC0
	lla	a0,.LC1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE3:
	.size	__cxa_atexit, .-__cxa_atexit
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
