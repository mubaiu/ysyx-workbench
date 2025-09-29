#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"42.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10M42IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M42IRQHooki, @function
_ZL10M42IRQHooki:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L1
	lla	a5,_ZL8IRQCount
	lw	a3,0(a5)
	li	a4,32768
	add	a0,a0,a3
	bltu	a0,a4,.L3
	sub	a0,a0,a4
.L3:
	sw	a0,0(a5)
	li	a5,24576
	bltu	a0,a5,.L4
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L1:
	ret
.L4:
	li	a0,1
	tail	_Z12X6502_IRQEndi
	.cfi_endproc
.LFE9:
	.size	_ZL10M42IRQHooki, .-_ZL10M42IRQHooki
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, _ZL4creg; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M42Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M42Powerv, @function
_ZL8M42Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4preg; sb zero, 0(a5);
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,1
	lla	s0,_ZL4mirr
	li	a1,0
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, _ZL4creg; lbu a0, 0(a0);
	call	_Z7setchr8j
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z9setmirrori
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL8M42Writejh
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M42Powerv, .-_ZL8M42Powerv
	.section	.text._ZL8M42Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M42Writejh, @function
_ZL8M42Writejh:
.LFB7:
	.cfi_startproc
	li	a5,57344
	addi	a5,a5,3
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,57344
	and	a0,a0,a5
	sw	ra,12(sp)
	addi	a4,a4,1
	mv	a5,a1
	.cfi_offset 1, -4
	beq	a0,a4,.L12
	bgtu	a0,a4,.L13
	li	a4,32768
	beq	a0,a4,.L14
	li	a3,57344
	bne	a0,a3,.L11
	andi	a5,a1,15
	mv	a1,a5
	li	a0,24576
	la a4, _ZL4preg; sb a5, 0(a4);
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, _ZL4creg; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L13:
	.cfi_restore_state
	li	a4,57344
	addi	a4,a4,2
	bne	a0,a4,.L11
	andi	a1,a1,2
	la a5, _ZL4IRQa; sw a1, 0(a5);
	bne	a1,zero,.L18
	la a5, _ZL8IRQCount; sw zero, 0(a5);
.L18:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z12X6502_IRQEndi
.L11:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_restore_state
	sw	s0,8(sp)
	la a1, _ZL4preg; lbu a1, 0(a1);
	.cfi_offset 8, -8
	lla	s0,_ZL4creg
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	call	_Z7setchr8j
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L12:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	srli	a5,a1,3
	xori	a5,a5,1
	sw	s0,8(sp)
	.cfi_offset 8, -8
	andi	a5,a5,1
	lla	s0,_ZL4mirr
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	la a0, _ZL4creg; lbu a0, 0(a0);
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
	.size	_ZL8M42Writejh, .-_ZL8M42Writejh
	.section	.text._Z13Mapper42_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper42_InitP8CartInfo
	.hidden	_Z13Mapper42_InitP8CartInfo
	.type	_Z13Mapper42_InitP8CartInfo, @function
_Z13Mapper42_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL8M42Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10M42IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z13Mapper42_InitP8CartInfo, .-_Z13Mapper42_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	_ZL4IRQa
	.word	4
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
