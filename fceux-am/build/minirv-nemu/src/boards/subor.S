#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"subor.cpp"
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
	lla	a3,_ZL4regs
	sw	ra,12(sp)
	sw	s0,8(sp)
	lbu	a2,1(a3)
	lbu	a4,0(a3)
	lbu	a5,2(a3)
	lbu	a1,3(a3)
	xor	a4,a2,a4
	slli	a4,a4,1
	andi	a3,a2,8
	andi	a4,a4,32
	xor	a5,a5,a1
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	beq	a3,zero,.L2
	andi	a5,a5,30
	add	s0,a5,a4
	sw	s1,4(sp)
	.cfi_offset 9, -12
	la a5, _ZL5is167; lbu a5, 0(a5);
	addi	s1,s0,1
	beq	a5,zero,.L3
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L2:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a5,a5,31
	andi	a2,a2,4
	add	s0,a5,a4
	beq	a2,zero,.L5
	li	a1,31
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L5:
	.cfi_restore_state
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	la a5, _ZL5is167; lbu a5, 0(a5);
	beq	a5,zero,.L6
	li	a0,49152
	li	a1,32
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L3:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L6:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a0,49152
	li	a1,7
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
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
	.section	.text._ZL9M166Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M166Writejh, @function
_ZL9M166Writejh:
.LFB7:
	.cfi_startproc
	srli	a0,a0,13
	andi	a0,a0,3
	lla	a5,_ZL4regs
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M166Writejh, .-_ZL9M166Writejh
	.section	.text._ZL9M166Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M166Powerv, @function
_ZL9M166Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4regs; sw zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M166Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL9M166Powerv, .-_ZL9M166Powerv
	.section	.text._Z14Mapper166_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper166_InitP8CartInfo
	.hidden	_Z14Mapper166_InitP8CartInfo
	.type	_Z14Mapper166_InitP8CartInfo, @function
_Z14Mapper166_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL9M166Powerv
	sw	a5,0(a0)
	la a5, _ZL5is167; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z14Mapper166_InitP8CartInfo, .-_Z14Mapper166_InitP8CartInfo
	.section	.text._Z14Mapper167_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper167_InitP8CartInfo
	.hidden	_Z14Mapper167_InitP8CartInfo
	.type	_Z14Mapper167_InitP8CartInfo, @function
_Z14Mapper167_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9M166Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, _ZL5is167; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper167_InitP8CartInfo, .-_Z14Mapper167_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.section	.sbss._ZL5is167,"aw",@nobits
	.type	_ZL5is167, @object
	.size	_ZL5is167, 1
_ZL5is167:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
