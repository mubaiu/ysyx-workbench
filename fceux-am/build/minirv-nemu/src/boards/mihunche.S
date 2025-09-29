#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mihunche.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,32768
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	la a4, CHRsize; lw a4, 0(a4);
	li	a5,8192
	lla	s0,_ZL6latche
	beq	a4,a5,.L6
	lhu	a0,0(s0)
	andi	a0,a0,1
	call	_Z7setchr8j
	lhu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L6:
	.cfi_restore_state
	lhu	a1,0(s0)
	li	a0,0
	andi	a1,a1,1
	call	_Z7setchr4jj
	lhu	a1,0(s0)
	li	a0,4096
	andi	a1,a1,1
	call	_Z7setchr4jj
	lhu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13UNLCC21Write2jh,"ax",@progbits
	.align	2
	.type	_ZL13UNLCC21Write2jh, @function
_ZL13UNLCC21Write2jh:
.LFB8:
	.cfi_startproc
	la a5, _ZL6latche; sh a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL13UNLCC21Write2jh, .-_ZL13UNLCC21Write2jh
	.section	.text._ZL13UNLCC21Write1jh,"ax",@progbits
	.align	2
	.type	_ZL13UNLCC21Write1jh, @function
_ZL13UNLCC21Write1jh:
.LFB7:
	.cfi_startproc
	la a5, _ZL6latche; sh a0, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL13UNLCC21Write1jh, .-_ZL13UNLCC21Write1jh
	.section	.text._ZL12UNLCC21Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLCC21Powerv, @function
_ZL12UNLCC21Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL6latche; sh zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,32768
	addi	a1,s0,-1
	lla	a2,_ZL13UNLCC21Write1jh
	addi	a0,a0,1
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL13UNLCC21Write2jh
	li	a1,32768
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL12UNLCC21Powerv, .-_ZL12UNLCC21Powerv
	.section	.text._Z12UNLCC21_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLCC21_InitP8CartInfo
	.hidden	_Z12UNLCC21_InitP8CartInfo
	.type	_Z12UNLCC21_InitP8CartInfo, @function
_Z12UNLCC21_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL12UNLCC21Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z12UNLCC21_InitP8CartInfo, .-_Z12UNLCC21_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL6latche
	.word	2
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL6latche,"aw",@nobits
	.align	1
	.type	_ZL6latche, @object
	.size	_ZL6latche, 2
_ZL6latche:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
