#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ac-08.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9AC08Powerv,"ax",@progbits
	.align	2
	.type	_ZL9AC08Powerv, @function
_ZL9AC08Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,24576
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	la a0, _ZL4mirr; lbu a0, 0(a0);
	call	_Z9setmirrori
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	addi	a1,a1,37
	mv	a0,a1
	lla	a2,_ZL8AC08Mirrjh
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9AC08Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL9AC08Powerv, .-_ZL9AC08Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
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
	.section	.text._ZL8AC08Mirrjh,"ax",@progbits
	.align	2
	.type	_ZL8AC08Mirrjh, @function
_ZL8AC08Mirrjh:
.LFB7:
	.cfi_startproc
	srli	a5,a1,3
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	xori	a5,a5,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a5,a5,1
	lla	s0,_ZL4mirr
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,24576
	sb	a5,0(s0)
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
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
	.size	_ZL8AC08Mirrjh, .-_ZL8AC08Mirrjh
	.section	.text._ZL9AC08Writejh,"ax",@progbits
	.align	2
	.type	_ZL9AC08Writejh, @function
_ZL9AC08Writejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	addi	a5,a5,1
	andi	a4,a1,15
	bne	a0,a5,.L10
	srli	a1,a1,1
	andi	a4,a1,15
.L10:
	mv	a1,a4
	li	a0,24576
	la a5, _ZL3reg; sb a4, 0(a5);
	call	_Z7setprg8jj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z9setprg32rijj
	li	a0,0
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL9AC08Writejh, .-_ZL9AC08Writejh
	.section	.text._Z9AC08_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9AC08_InitP8CartInfo
	.hidden	_Z9AC08_InitP8CartInfo
	.type	_Z9AC08_InitP8CartInfo, @function
_Z9AC08_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9AC08Powerv
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
	.size	_Z9AC08_InitP8CartInfo, .-_Z9AC08_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
