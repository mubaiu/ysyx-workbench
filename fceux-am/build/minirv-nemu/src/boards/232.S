#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"232.cpp"
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
	la a5, _ZL4bank; lbu a5, 0(a5);
	sw	s0,8(sp)
	.cfi_offset 8, -8
	srli	s0,a5,2
	la a1, _ZL4preg; lbu a1, 0(a1);
	andi	a5,a5,8
	andi	s0,s0,4
	or	s0,s0,a5
	andi	a1,a1,3
	or	a1,s0,a1
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	ori	a1,s0,3
	li	a0,49152
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
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13M232WritePregjh,"ax",@progbits
	.align	2
	.type	_ZL13M232WritePregjh, @function
_ZL13M232WritePregjh:
.LFB8:
	.cfi_startproc
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL13M232WritePregjh, .-_ZL13M232WritePregjh
	.section	.text._ZL13M232WriteBankjh,"ax",@progbits
	.align	2
	.type	_ZL13M232WriteBankjh, @function
_ZL13M232WriteBankjh:
.LFB7:
	.cfi_startproc
	la a5, _ZL4bank; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL13M232WriteBankjh, .-_ZL13M232WriteBankjh
	.section	.text._ZL9M232Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M232Powerv, @function
_ZL9M232Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4preg; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,49152
	lla	a2,_ZL13M232WriteBankjh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL13M232WritePregjh
	li	a0,49152
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
.LFE9:
	.size	_ZL9M232Powerv, .-_ZL9M232Powerv
	.section	.text._Z14Mapper232_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper232_InitP8CartInfo
	.hidden	_Z14Mapper232_InitP8CartInfo
	.type	_Z14Mapper232_InitP8CartInfo, @function
_Z14Mapper232_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M232Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper232_InitP8CartInfo, .-_Z14Mapper232_InitP8CartInfo
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
