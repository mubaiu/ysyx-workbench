#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"189.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9M189Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M189Powerv, @function
_ZL9M189Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL9M189Writejh
	addi	a1,a1,-1
	addi	a0,a0,288
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL9M189Powerv, .-_ZL9M189Powerv
	.section	.text._ZL9M189Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M189Writejh, @function
_ZL9M189Writejh:
.LFB7:
	.cfi_startproc
	srli	a5,a1,4
	or	a1,a5,a1
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE7:
	.size	_ZL9M189Writejh, .-_ZL9M189Writejh
	.section	.text._ZL6M189PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M189PWjh, @function
_ZL6M189PWjh:
.LFB6:
	.cfi_startproc
	la a1, EXPREGS; lbu a1, 0(a1);
	andi	a1,a1,7
	li	a0,32768
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE6:
	.size	_ZL6M189PWjh, .-_ZL6M189PWjh
	.section	.rodata._Z14Mapper189_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper189_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper189_InitP8CartInfo
	.hidden	_Z14Mapper189_InitP8CartInfo
	.type	_Z14Mapper189_InitP8CartInfo, @function
_Z14Mapper189_InitP8CartInfo:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M189PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M189Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE9:
	.size	_Z14Mapper189_InitP8CartInfo, .-_Z14Mapper189_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
