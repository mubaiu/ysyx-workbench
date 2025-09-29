#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"t-262.cpp"
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
	li	a0,0
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL4base
	call	_Z7setchr8j
	lla	s1,_ZL4bank
	lbu	a5,0(s1)
	lbu	a1,0(s0)
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	la a4, _ZL4mode; lbu a4, 0(a4);
	lbu	a1,0(s0)
	li	a5,7
	beq	a4,zero,.L2
	lbu	a5,0(s1)
.L2:
	li	a0,49152
	or	a1,a1,a5
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14BMCT262Restorei,"ax",@progbits
	.align	2
	.type	_ZL14BMCT262Restorei, @function
_ZL14BMCT262Restorei:
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL14BMCT262Restorei, .-_ZL14BMCT262Restorei
	.section	.text._ZL12BMCT262Resetv,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Resetv, @function
_ZL12BMCT262Resetv:
.LFB9:
	.cfi_startproc
	la a5, _ZL4mode; sb zero, 0(a5);
	la a5, _ZL4base; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	la a5, _ZL4lock; sb zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12BMCT262Resetv, .-_ZL12BMCT262Resetv
	.section	.text._ZL12BMCT262Writejh,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Writejh, @function
_ZL12BMCT262Writejh:
.LFB7:
	.cfi_startproc
	lla	a3,_ZL4lock
	lbu	a5,0(a3)
	bne	a5,zero,.L11
	srli	a4,a0,2
	srli	a6,a0,3
	srli	a5,a0,1
	andi	a6,a6,32
	srli	a2,a0,13
	andi	a4,a4,24
	xori	a5,a5,1
	or	a4,a4,a6
	andi	a0,a0,-128
	andi	a5,a5,1
	andi	a2,a2,1
	la a6, _ZL4base; sb a4, 0(a6);
	sb	a2,0(a3)
	la a4, _ZL4mode; sb a0, 0(a4);
	la a4, _ZL4mirr; sb a5, 0(a4);
.L11:
	andi	a1,a1,7
	la a5, _ZL4bank; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL12BMCT262Writejh, .-_ZL12BMCT262Writejh
	.section	.text._ZL12BMCT262Powerv,"ax",@progbits
	.align	2
	.type	_ZL12BMCT262Powerv, @function
_ZL12BMCT262Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4mode; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL4base; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	la a5, _ZL4lock; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL12BMCT262Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL12BMCT262Powerv, .-_ZL12BMCT262Powerv
	.section	.text._Z12BMCT262_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMCT262_InitP8CartInfo
	.hidden	_Z12BMCT262_InitP8CartInfo
	.type	_Z12BMCT262_InitP8CartInfo, @function
_Z12BMCT262_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL12BMCT262Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12BMCT262Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14BMCT262Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z12BMCT262_InitP8CartInfo, .-_Z12BMCT262_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"BASE"
	.align	2
.LC2:
	.string	"LOCK"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"MODE"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4base
	.word	1
	.word	.LC1
	.word	_ZL4lock
	.word	1
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL4mode
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4mode,"aw",@nobits
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4lock,"aw",@nobits
	.type	_ZL4lock, @object
	.size	_ZL4lock, 1
_ZL4lock:
	.zero	1
	.section	.sbss._ZL4base,"aw",@nobits
	.type	_ZL4base, @object
	.size	_ZL4base, 1
_ZL4base:
	.zero	1
	.section	.sbss._ZL4bank,"aw",@nobits
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
