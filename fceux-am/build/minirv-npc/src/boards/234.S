#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"234.cpp"
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
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL4bank
	lbu	a1,0(s0)
	andi	a5,a1,64
	beq	a5,zero,.L2
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL4preg
	lbu	a5,0(s1)
	andi	a1,a1,14
	li	a0,32768
	andi	a5,a5,1
	or	a1,a5,a1
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lbu	a5,0(s1)
	slli	a0,a0,2
	srli	a5,a5,4
	andi	a5,a5,7
	andi	a0,a0,56
	or	a0,a0,a5
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,7
	xori	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L2:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	la a5, _ZL4preg; lbu a5, 0(a5);
	srli	a5,a5,4
	slli	a0,a0,2
	andi	a5,a5,3
	andi	a0,a0,60
	or	a0,a0,a5
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,7
	xori	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._Z12M234ReadBankj,"ax",@progbits
	.align	2
	.globl	_Z12M234ReadBankj
	.hidden	_Z12M234ReadBankj
	.type	_Z12M234ReadBankj, @function
_Z12M234ReadBankj:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z6CartBRj
	lla	a5,_ZL4bank
	lbu	a4,0(a5)
	beq	a4,zero,.L9
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L9:
	.cfi_restore_state
	sw	a0,0(sp)
	sb	a0,0(a5)
	call	_ZL4Syncv
	lw	ra,12(sp)
	.cfi_restore 1
	lw	a0,0(sp)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_Z12M234ReadBankj, .-_Z12M234ReadBankj
	.section	.text._Z12M234ReadPregj,"ax",@progbits
	.align	2
	.globl	_Z12M234ReadPregj
	.hidden	_Z12M234ReadPregj
	.type	_Z12M234ReadPregj, @function
_Z12M234ReadPregj:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z6CartBRj
	mv	s0,a0
	la a5, _ZL4preg; sb a0, 0(a5);
	call	_ZL4Syncv
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	_Z12M234ReadPregj, .-_Z12M234ReadPregj
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
	.section	.text._ZL9M234Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M234Resetv, @function
_ZL9M234Resetv:
.LFB9:
	.cfi_startproc
	la a5, _ZL4preg; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL9M234Resetv, .-_ZL9M234Resetv
	.section	.text._ZL9M234Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M234Powerv, @function
_ZL9M234Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL4preg; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,65536
	li	a0,65536
	lla	a2,_Z12M234ReadBankj
	addi	a1,a1,-97
	addi	a0,a0,-128
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	li	a0,65536
	lla	a2,_Z12M234ReadPregj
	addi	a1,a1,-9
	addi	a0,a0,-24
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE10:
	.size	_ZL9M234Powerv, .-_ZL9M234Powerv
	.section	.text._Z14Mapper234_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper234_InitP8CartInfo
	.hidden	_Z14Mapper234_InitP8CartInfo
	.type	_Z14Mapper234_InitP8CartInfo, @function
_Z14Mapper234_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M234Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M234Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper234_InitP8CartInfo, .-_Z14Mapper234_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BANK"
	.align	2
.LC1:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4bank
	.word	1
	.word	.LC0
	.word	_ZL4preg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.section	.sbss._ZL4bank,"aw",@nobits
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
