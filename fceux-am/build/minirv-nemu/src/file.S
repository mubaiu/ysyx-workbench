#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"file.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._Z10FCEU_fopenPKcS0_S0_PciPS0_Pi.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/file.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.align	2
.LC2:
	.string	"rb"
	.align	2
.LC3:
	.string	"wb"
	.align	2
.LC4:
	.string	"invalid file open mode specified (only wb and rb are supported)"
	.section	.text._Z10FCEU_fopenPKcS0_S0_PciPS0_Pi,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.hidden	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.type	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi, @function
_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	bne	a1,zero,.L21
	lla	a1,.LC2
	mv	s2,a0
	mv	a0,a2
	mv	s0,a2
	call	strcmp
	mv	s1,a0
	lla	a1,.LC3
	mv	a0,s0
	call	strcmp
	bne	s1,zero,.L3
	beq	a0,zero,.L4
	mv	a1,s0
	mv	a0,s2
	call	_Z18FCEUD_UTF8_fstreamPKcS0_
	mv	s0,a0
	beq	a0,zero,.L7
	li	a0,20
	call	malloc
	li	a5,-1
	sw	a5,8(a0)
	sw	a5,4(a0)
	lw	a5,32(s0)
	sw	s0,0(a0)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	not	a4,a5
	srai	a4,a4,31
	and	a5,a5,a4
	sw	a5,12(a0)
	lw	a5,32(s0)
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	srai	a4,a5,31
	and	a5,a5,a4
	sw	a5,28(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L3:
	.cfi_restore_state
	beq	a0,zero,.L7
.L4:
	lla	a0,.LC4
	call	printf
.L7:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L21:
	.cfi_restore_state
	li	a2,37
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE46:
	.size	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi, .-_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	.section	.text._Z11FCEU_fcloseP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z11FCEU_fcloseP8FCEUFILE
	.hidden	_Z11FCEU_fcloseP8FCEUFILE
	.type	_Z11FCEU_fcloseP8FCEUFILE, @function
_Z11FCEU_fcloseP8FCEUFILE:
.LFB47:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	lw	a0,0(a0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	beq	a0,zero,.L23
	call	free
.L23:
	mv	a0,s0
	call	free
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE47:
	.size	_Z11FCEU_fcloseP8FCEUFILE, .-_Z11FCEU_fcloseP8FCEUFILE
	.globl	__mulsi3
	.section	.text._Z10FCEU_freadPvjjP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_freadPvjjP8FCEUFILE
	.hidden	_Z10FCEU_freadPvjjP8FCEUFILE
	.type	_Z10FCEU_freadPvjjP8FCEUFILE, @function
_Z10FCEU_freadPvjjP8FCEUFILE:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	mv	a5,a1
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lw	s1,0(a3)
	sw	s3,12(sp)
	mv	a1,a2
	.cfi_offset 19, -20
	mv	s3,a0
	mv	a0,a5
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	call	__mulsi3
	lw	a5,28(s1)
	lw	s0,32(s1)
	mv	s2,a0
	sub	s0,s0,a5
	bleu	s0,a0,.L29
	mv	s0,a0
.L29:
	lw	a1,0(s1)
	mv	a2,s0
	mv	a0,s3
	add	a1,a1,a5
	call	memcpy
	lw	a5,28(s1)
	add	a5,a5,s0
	sw	a5,28(s1)
	bleu	s2,s0,.L30
	li	a5,1
	sb	a5,24(s1)
.L30:
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	li	a1,0
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	_Z10FCEU_freadPvjjP8FCEUFILE, .-_Z10FCEU_freadPvjjP8FCEUFILE
	.section	.text._Z10FCEU_fseekP8FCEUFILEli,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_fseekP8FCEUFILEli
	.hidden	_Z10FCEU_fseekP8FCEUFILEli
	.type	_Z10FCEU_fseekP8FCEUFILEli, @function
_Z10FCEU_fseekP8FCEUFILEli:
.LFB49:
	.cfi_startproc
	li	a4,1
	lw	a5,0(a0)
	beq	a2,a4,.L33
	li	a4,2
	beq	a2,a4,.L34
	beq	a2,zero,.L35
	lw	a0,28(a5)
.L36:
	blt	a0,zero,.L38
	lw	a4,32(a5)
	bge	a4,a0,.L32
	sw	a4,28(a5)
	mv	a0,a4
.L32:
	ret
.L34:
	lw	a0,32(a5)
	sw	a0,28(a5)
	bge	a0,zero,.L32
.L38:
	sw	zero,28(a5)
	li	a0,0
	ret
.L33:
	lw	a4,28(a5)
	add	a0,a1,a4
	sw	a0,28(a5)
	j	.L36
.L35:
	sw	a1,28(a5)
	mv	a0,a1
	j	.L36
	.cfi_endproc
.LFE49:
	.size	_Z10FCEU_fseekP8FCEUFILEli, .-_Z10FCEU_fseekP8FCEUFILEli
	.section	.text._Z10FCEU_ftellP8FCEUFILE,"ax",@progbits
	.align	2
	.globl	_Z10FCEU_ftellP8FCEUFILE
	.hidden	_Z10FCEU_ftellP8FCEUFILE
	.type	_Z10FCEU_ftellP8FCEUFILE, @function
_Z10FCEU_ftellP8FCEUFILE:
.LFB50:
	.cfi_startproc
	lw	a5,0(a0)
	lw	a0,28(a5)
	srai	a1,a0,31
	ret
	.cfi_endproc
.LFE50:
	.size	_Z10FCEU_ftellP8FCEUFILE, .-_Z10FCEU_ftellP8FCEUFILE
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
