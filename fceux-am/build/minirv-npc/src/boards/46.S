#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"46.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s0,_ZL4reg0
	lbu	a5,0(s0)
	lla	s1,_ZL4reg1
	lbu	a1,0(s1)
	slli	a5,a5,1
	andi	a5,a5,30
	andi	a1,a1,1
	or	a1,a5,a1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	lbu	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a0,4
	srli	a5,a5,1
	andi	a0,a0,7
	andi	a5,a5,120
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M46Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M46Resetv, @function
_ZL8M46Resetv:
.LFB10:
	.cfi_startproc
	la a5, _ZL4reg1; sb zero, 0(a5);
	la a5, _ZL4reg0; sb zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL8M46Resetv, .-_ZL8M46Resetv
	.section	.text._ZL9M46Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M46Write1jh, @function
_ZL9M46Write1jh:
.LFB8:
	.cfi_startproc
	la a5, _ZL4reg1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9M46Write1jh, .-_ZL9M46Write1jh
	.section	.text._ZL9M46Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M46Write0jh, @function
_ZL9M46Write0jh:
.LFB7:
	.cfi_startproc
	la a5, _ZL4reg0; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M46Write0jh, .-_ZL9M46Write0jh
	.section	.text._ZL8M46Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M46Powerv, @function
_ZL8M46Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4reg1; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL4reg0; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_ZL9M46Write0jh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL9M46Write1jh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL8M46Powerv, .-_ZL8M46Powerv
	.section	.text._Z13Mapper46_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper46_InitP8CartInfo
	.hidden	_Z13Mapper46_InitP8CartInfo
	.type	_Z13Mapper46_InitP8CartInfo, @function
_Z13Mapper46_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M46Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M46Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13Mapper46_InitP8CartInfo, .-_Z13Mapper46_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG0"
	.align	2
.LC1:
	.string	"REG1"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4reg0
	.word	1
	.word	.LC0
	.word	_ZL4reg1
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4reg1,"aw",@nobits
	.type	_ZL4reg1, @object
	.size	_ZL4reg1, 1
_ZL4reg1:
	.zero	1
	.section	.sbss._ZL4reg0,"aw",@nobits
	.type	_ZL4reg0, @object
	.size	_ZL4reg0, 1
_ZL4reg0:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
