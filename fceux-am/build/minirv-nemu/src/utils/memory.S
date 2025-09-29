#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"memory.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._Z12FCEU_gmallocj.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Error allocating memory!  Doing a hard exit."
	.align	2
.LC1:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/utils/memory.cpp"
	.align	2
.LC2:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z12FCEU_gmallocj,"ax",@progbits
	.align	2
	.globl	_Z12FCEU_gmallocj
	.hidden	_Z12FCEU_gmallocj
	.type	_Z12FCEU_gmallocj, @function
_Z12FCEU_gmallocj:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s1,a0
	call	malloc
	beq	a0,zero,.L5
	mv	a1,s1
	li	a2,1
	mv	s0,a0
	call	_Z15FCEU_MemoryRandPhjb
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_restore_state
	lla	a0,.LC0
	call	printf
	li	a2,37
	lla	a1,.LC1
	lla	a0,.LC2
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE6:
	.size	_Z12FCEU_gmallocj, .-_Z12FCEU_gmallocj
	.section	.rodata._Z11FCEU_mallocj.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"Error allocating memory!"
	.section	.text._Z11FCEU_mallocj,"ax",@progbits
	.align	2
	.globl	_Z11FCEU_mallocj
	.hidden	_Z11FCEU_mallocj
	.type	_Z11FCEU_mallocj, @function
_Z11FCEU_mallocj:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a0
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L10
	mv	a2,s1
	li	a1,0
	call	memset
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	lla	a0,.LC3
	call	printf
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_Z11FCEU_mallocj, .-_Z11FCEU_mallocj
	.section	.text._Z10FCEU_gfreePv,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_gfreePv
	.hidden	_Z10FCEU_gfreePv
	.type	_Z10FCEU_gfreePv, @function
_Z10FCEU_gfreePv:
.LFB8:
	.cfi_startproc
	tail	free
	.cfi_endproc
.LFE8:
	.size	_Z10FCEU_gfreePv, .-_Z10FCEU_gfreePv
	.section	.text._Z9FCEU_freePv,"ax",@progbits
	.align	2
	.globl	_Z9FCEU_freePv
	.hidden	_Z9FCEU_freePv
	.type	_Z9FCEU_freePv, @function
_Z9FCEU_freePv:
.LFB13:
	.cfi_startproc
	tail	free
	.cfi_endproc
.LFE13:
	.size	_Z9FCEU_freePv, .-_Z9FCEU_freePv
	.section	.text._Z12FCEU_dmallocj,"ax",@progbits
	.align	2
	.globl	_Z12FCEU_dmallocj
	.hidden	_Z12FCEU_dmallocj
	.type	_Z12FCEU_dmallocj, @function
_Z12FCEU_dmallocj:
.LFB10:
	.cfi_startproc
	tail	malloc
	.cfi_endproc
.LFE10:
	.size	_Z12FCEU_dmallocj, .-_Z12FCEU_dmallocj
	.section	.text._Z10FCEU_dfreePv,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_dfreePv
	.hidden	_Z10FCEU_dfreePv
	.type	_Z10FCEU_dfreePv, @function
_Z10FCEU_dfreePv:
.LFB15:
	.cfi_startproc
	tail	free
	.cfi_endproc
.LFE15:
	.size	_Z10FCEU_dfreePv, .-_Z10FCEU_dfreePv
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
