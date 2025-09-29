#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"09-034a.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12UNLSMB2JReadj,"ax",@progbits
	.align	2
	.type	_ZL12UNLSMB2JReadj, @function
_ZL12UNLSMB2JReadj:
.LFB9:
	.cfi_startproc
	li	a0,255
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL12UNLSMB2JReadj, .-_ZL12UNLSMB2JReadj
	.section	.text._ZL13UNLSMB2JPowerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLSMB2JPowerv, @function
_ZL13UNLSMB2JPowerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,24576
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL3prg; sb zero, 0(a5);
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL12UNLSMB2JReadj
	addi	a1,a1,85
	addi	a0,a0,66
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	addi	a1,a1,104
	mv	a0,a1
	lla	a2,_ZL14UNLSMB2JWrite2jh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,16384
	addi	a1,a1,39
	lla	a2,_ZL14UNLSMB2JWrite1jh
	mv	a0,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL13UNLSMB2JPowerv, .-_ZL13UNLSMB2JPowerv
	.section	.text._ZL14UNLSMB2JWrite2jh,"ax",@progbits
	.align	2
	.type	_ZL14UNLSMB2JWrite2jh, @function
_ZL14UNLSMB2JWrite2jh:
.LFB8:
	.cfi_startproc
	andi	a1,a1,1
	li	a0,1
	la a5, _ZL4IRQa; sw a1, 0(a5);
	la a5, _ZL8IRQCount; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLSMB2JWrite2jh, .-_ZL14UNLSMB2JWrite2jh
	.section	.text._ZL15UNLSMB2JIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL15UNLSMB2JIRQHooki, @function
_ZL15UNLSMB2JIRQHooki:
.LFB11:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L6
	lla	a4,_ZL8IRQCount
	lw	a3,0(a4)
	li	a5,4096
	addi	a5,a5,1653
	bgtu	a3,a5,.L8
	add	a0,a0,a3
	sw	a0,0(a4)
	ret
.L6:
	ret
.L8:
	li	a0,1
	la a5, _ZL4IRQa; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE11:
	.size	_ZL15UNLSMB2JIRQHooki, .-_ZL15UNLSMB2JIRQHooki
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a2, _ZL3prg; lbu a2, 0(a2);
	li	a1,24576
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg8rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE12:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLSMB2JWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL14UNLSMB2JWrite1jh, @function
_ZL14UNLSMB2JWrite1jh:
.LFB7:
	.cfi_startproc
	andi	a5,a1,1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	mv	a2,a5
	li	a1,24576
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, _ZL3prg; sb a5, 0(a4);
	call	_Z8setprg8rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLSMB2JWrite1jh, .-_ZL14UNLSMB2JWrite1jh
	.section	.text._Z13UNLSMB2J_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLSMB2J_InitP8CartInfo
	.hidden	_Z13UNLSMB2J_InitP8CartInfo
	.type	_Z13UNLSMB2J_InitP8CartInfo, @function
_Z13UNLSMB2J_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	lla	a5,_ZL13UNLSMB2JPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLSMB2JIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z13UNLSMB2J_InitP8CartInfo, .-_Z13UNLSMB2J_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"PRG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	4
	.word	.LC0
	.word	_ZL4IRQa
	.word	4
	.word	.LC1
	.word	_ZL3prg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL3prg,"aw",@nobits
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
