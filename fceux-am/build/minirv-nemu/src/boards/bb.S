#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bb.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10UNLBBPowerv,"ax",@progbits
	.align	2
	.type	_ZL10UNLBBPowerv, @function
_ZL10UNLBBPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,-1
	lla	s0,_ZL3chr
	li	a1,3
	li	a0,24576
	la a4, _ZL3reg; sb a5, 0(a4);
	sb	zero,0(s0)
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	andi	a0,a0,3
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL10UNLBBWritejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL10UNLBBPowerv, .-_ZL10UNLBBPowerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	la a1, _ZL3reg; lbu a1, 0(a1);
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	andi	a1,a1,3
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL3chr; lbu a0, 0(a0);
	andi	a0,a0,3
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10UNLBBWritejh,"ax",@progbits
	.align	2
	.type	_ZL10UNLBBWritejh, @function
_ZL10UNLBBWritejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,36864
	and	a0,a0,a5
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a4,32768
	mv	a5,a1
	beq	a0,a4,.L10
	andi	a5,a1,1
	la a1, _ZL3reg; lbu a1, 0(a1);
.L8:
	lla	s0,_ZL3chr
	andi	a1,a1,3
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,-1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a0,a0,3
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L10:
	.cfi_restore_state
	la a4, _ZL3reg; sb a1, 0(a4);
	j	.L8
	.cfi_endproc
.LFE7:
	.size	_ZL10UNLBBWritejh, .-_ZL10UNLBBWritejh
	.section	.text._Z10UNLBB_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10UNLBB_InitP8CartInfo
	.hidden	_Z10UNLBB_InitP8CartInfo
	.type	_Z10UNLBB_InitP8CartInfo, @function
_Z10UNLBB_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL10UNLBBPowerv
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
	.size	_Z10UNLBB_InitP8CartInfo, .-_Z10UNLBB_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL3chr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.type	_ZL3chr, @object
	.size	_ZL3chr, 1
_ZL3chr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
