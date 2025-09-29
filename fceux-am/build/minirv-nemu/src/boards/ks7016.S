#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7016.cpp"
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
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a1,12
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,13
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,14
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,15
	call	_Z7setprg8jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7016Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7016Writejh, @function
_ZL14UNLKS7016Writejh:
.LFB7:
	.cfi_startproc
	li	a5,57344
	addi	a5,a5,-1725
	li	a4,57344
	and	a3,a0,a5
	addi	a4,a4,-1789
	andi	a2,a0,48
	beq	a3,a4,.L6
	bne	a3,a5,.L5
	li	a4,48
	li	a5,11
	beq	a2,a4,.L9
	srli	a0,a0,2
	andi	a5,a0,15
.L9:
	la a4, _ZL4preg; sb a5, 0(a4);
	tail	_ZL4Syncv
.L5:
	ret
.L6:
	li	a4,48
	li	a5,11
	bne	a2,a4,.L9
	srli	a0,a0,2
	andi	a0,a0,3
	ori	a5,a0,8
	la a4, _ZL4preg; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7016Writejh, .-_ZL14UNLKS7016Writejh
	.section	.text._ZL14UNLKS7016Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7016Powerv, @function
_ZL14UNLKS7016Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,8
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4preg; sb a5, 0(a4);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL14UNLKS7016Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLKS7016Powerv, .-_ZL14UNLKS7016Powerv
	.section	.text._Z14UNLKS7016_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7016_InitP8CartInfo
	.hidden	_Z14UNLKS7016_InitP8CartInfo
	.type	_Z14UNLKS7016_InitP8CartInfo, @function
_Z14UNLKS7016_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL14UNLKS7016Powerv
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
	.size	_Z14UNLKS7016_InitP8CartInfo, .-_Z14UNLKS7016_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
