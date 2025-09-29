#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"79.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL8M79Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M79Powerv, @function
_ZL8M79Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1
	li	a1,255
	li	a0,32768
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4preg; sb a5, 0(a4);
	call	_Z8setprg32jj
	la a0, _ZL4creg; lbu a0, 0(a0);
	call	_Z7setchr8j
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL8M79Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL8M79Writejh
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
	.size	_ZL8M79Powerv, .-_ZL8M79Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,32768
	la a1, _ZL4preg; lbu a1, 0(a1);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4creg; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M79Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M79Writejh, @function
_ZL8M79Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,16384
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	a4,a4,256
	mv	a5,a1
	beq	a0,a4,.L7
	la a1, _ZL4preg; lbu a1, 0(a1);
.L8:
	lla	s0,_ZL4creg
	andi	a5,a5,7
	li	a0,32768
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L7:
	.cfi_restore_state
	srli	a1,a1,3
	andi	a1,a1,1
	la a4, _ZL4preg; sb a1, 0(a4);
	j	.L8
	.cfi_endproc
.LFE7:
	.size	_ZL8M79Writejh, .-_ZL8M79Writejh
	.section	.text._Z13Mapper79_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper79_InitP8CartInfo
	.hidden	_Z13Mapper79_InitP8CartInfo
	.type	_Z13Mapper79_InitP8CartInfo, @function
_Z13Mapper79_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL8M79Powerv
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
.LFE10:
	.size	_Z13Mapper79_InitP8CartInfo, .-_Z13Mapper79_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CREG"
	.align	2
.LC1:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4creg
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
	.section	.sbss._ZL4creg,"aw",@nobits
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
