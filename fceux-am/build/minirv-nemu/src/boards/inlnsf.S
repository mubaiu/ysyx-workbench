#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"inlnsf.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL8M31Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M31Writejh, @function
_ZL8M31Writejh:
.LFB7:
	.cfi_startproc
	li	a5,-20480
	add	a5,a0,a5
	li	a4,4096
	bltu	a5,a4,.L10
	ret
.L10:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	andi	a0,a0,7
	.cfi_offset 9, -12
	lla	s1,_ZL4regs
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	add	a0,s1,a0
	sb	a1,0(a0)
	li	s0,32768
	li	s3,4096
	li	s2,65536
.L3:
	lbu	a1,0(s1)
	mv	a0,s0
	add	s0,s0,s3
	call	_Z7setprg4jj
	addi	s1,s1,1
	bne	s0,s2,.L3
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_ZL8M31Writejh, .-_ZL8M31Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	lla	s1,_ZL4regs
	li	s0,32768
	li	s3,4096
	li	s2,65536
.L12:
	lbu	a1,0(s1)
	mv	a0,s0
	add	s0,s0,s3
	call	_Z7setprg4jj
	addi	s1,s1,1
	bne	s0,s2,.L12
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M31Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M31Powerv, @function
_ZL8M31Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	li	a0,0
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	call	_Z7setchr8j
	lla	s1,_ZL4regs
	li	a5,-1
	sb	a5,7(s1)
	li	s0,32768
	li	s3,4096
	li	s2,65536
.L16:
	lbu	a1,0(s1)
	mv	a0,s0
	add	s0,s0,s3
	call	_Z7setprg4jj
	addi	s1,s1,1
	bne	s0,s2,.L16
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	li	a1,24576
	lla	a2,_ZL8M31Writejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M31Powerv, .-_ZL8M31Powerv
	.section	.text._Z13Mapper31_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper31_InitP8CartInfo
	.hidden	_Z13Mapper31_InitP8CartInfo
	.type	_Z13Mapper31_InitP8CartInfo, @function
_Z13Mapper31_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL8M31Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z13Mapper31_InitP8CartInfo, .-_Z13Mapper31_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
