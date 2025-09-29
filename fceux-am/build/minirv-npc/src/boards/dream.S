#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"dream.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL10DREAMPowerv,"ax",@progbits
	.align	2
	.type	_ZL10DREAMPowerv, @function
_ZL10DREAMPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL6latche; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,8
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,20480
	addi	a1,a1,32
	lla	a2,_ZL10DREAMWritejh
	mv	a0,a1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL10DREAMPowerv, .-_ZL10DREAMPowerv
	.section	.text._ZL7Restorei,"ax",@progbits
	.align	2
	.type	_ZL7Restorei, @function
_ZL7Restorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a1, _ZL6latche; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,8
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE9:
	.size	_ZL7Restorei, .-_ZL7Restorei
	.section	.text._ZL10DREAMWritejh,"ax",@progbits
	.align	2
	.type	_ZL10DREAMWritejh, @function
_ZL10DREAMWritejh:
.LFB7:
	.cfi_startproc
	andi	a5,a1,7
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	mv	a1,a5
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a4, _ZL6latche; sb a5, 0(a4);
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,8
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE7:
	.size	_ZL10DREAMWritejh, .-_ZL10DREAMWritejh
	.section	.rodata._Z16DreamTech01_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.section	.text._Z16DreamTech01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z16DreamTech01_InitP8CartInfo
	.hidden	_Z16DreamTech01_InitP8CartInfo
	.type	_Z16DreamTech01_InitP8CartInfo, @function
_Z16DreamTech01_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL7Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10DREAMPowerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL6latche
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z16DreamTech01_InitP8CartInfo, .-_Z16DreamTech01_InitP8CartInfo
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
