#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"120.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9M120Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M120Writejh, @function
_ZL9M120Writejh:
.LFB7:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,511
	beq	a0,a5,.L7
	ret
.L7:
	andi	a5,a1,7
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	mv	a1,a5
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, _ZL3reg; sb a5, 0(a4);
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,2
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL9M120Writejh, .-_ZL9M120Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a0,32768
	li	a1,2
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M120Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M120Powerv, @function
_ZL9M120Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z7setprg8jj
	li	a1,2
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL9M120Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL9M120Powerv, .-_ZL9M120Powerv
	.section	.text._Z14Mapper120_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper120_InitP8CartInfo
	.hidden	_Z14Mapper120_InitP8CartInfo
	.type	_Z14Mapper120_InitP8CartInfo, @function
_Z14Mapper120_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL9M120Powerv
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
	.size	_Z14Mapper120_InitP8CartInfo, .-_Z14Mapper120_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
