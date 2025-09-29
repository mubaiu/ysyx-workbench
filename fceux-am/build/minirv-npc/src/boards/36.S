#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"36.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL7M36Readj,"ax",@progbits
	.align	2
	.type	_ZL7M36Readj, @function
_ZL7M36Readj:
.LFB8:
	.cfi_startproc
	la a0, _ZL6latche; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL7M36Readj, .-_ZL7M36Readj
	.section	.text._ZL8M36Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M36Writejh, @function
_ZL8M36Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	srli	a0,a0,12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	andi	a0,a0,7
	mv	s0,a1
	beq	a0,zero,.L4
	li	a5,4
	beq	a0,a5,.L5
.L6:
	lla	s1,_ZL6latche
	srli	a1,s0,4
	li	a0,32768
	sb	s0,0(s1)
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L5:
	.cfi_restore_state
	li	a0,0
	la a5, _ZL4mirr; sb zero, 0(a5);
	call	_Z9setmirrori
	j	.L6
.L4:
	li	a5,1
	li	a0,1
	la a4, _ZL4mirr; sb a5, 0(a4);
	call	_Z9setmirrori
	j	.L6
	.cfi_endproc
.LFE7:
	.size	_ZL8M36Writejh, .-_ZL8M36Writejh
	.section	.text._ZL10M36Restorei,"ax",@progbits
	.align	2
	.type	_ZL10M36Restorei, @function
_ZL10M36Restorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE10:
	.size	_ZL10M36Restorei, .-_ZL10M36Restorei
	.section	.text._ZL8M36Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M36Powerv, @function
_ZL8M36Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL6latche
	li	a0,32768
	sb	zero,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	andi	a0,a0,15
	call	_Z7setchr8j
	li	a1,16384
	addi	a1,a1,256
	mv	a0,a1
	lla	a2,_ZL7M36Readj
	call	_Z14SetReadHandleriiPFhjE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL8M36Writejh
	addi	a1,a1,-2
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL8M36Powerv, .-_ZL8M36Powerv
	.section	.text._Z13Mapper36_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper36_InitP8CartInfo
	.hidden	_Z13Mapper36_InitP8CartInfo
	.type	_Z13Mapper36_InitP8CartInfo, @function
_Z13Mapper36_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL8M36Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10M36Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z13Mapper36_InitP8CartInfo, .-_Z13Mapper36_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL6latche
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
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
