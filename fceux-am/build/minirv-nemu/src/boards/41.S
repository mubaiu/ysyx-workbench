#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"41.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9M41Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M41Write1jh, @function
_ZL9M41Write1jh:
.LFB8:
	.cfi_startproc
	la a1, _ZL7mainreg; lbu a1, 0(a1);
	andi	a5,a1,4
	bne	a5,zero,.L7
	ret
.L7:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6chrreg
	lbu	a5,0(s0)
	andi	a0,a0,3
	andi	a1,a1,7
	andi	a5,a5,12
	or	a5,a5,a0
	li	a0,32768
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	call	_Z7setchr8j
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL6mirror; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL9M41Write1jh, .-_ZL9M41Write1jh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	la a1, _ZL7mainreg; lbu a1, 0(a1);
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	andi	a1,a1,7
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	la a0, _ZL6chrreg; lbu a0, 0(a0);
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL6mirror; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M41Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M41Write0jh, @function
_ZL9M41Write0jh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL6chrreg
	lbu	a4,0(s0)
	srli	a3,a0,5
	srli	a2,a0,1
	andi	a5,a0,0xff
	andi	a2,a2,12
	xori	a3,a3,1
	andi	a4,a4,3
	or	a4,a4,a2
	lla	s1,_ZL6mirror
	andi	a3,a3,1
	andi	a1,a5,7
	li	a0,32768
	sb	a3,0(s1)
	sb	a4,0(s0)
	la a2, _ZL7mainreg; sb a5, 0(a2);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	call	_Z7setchr8j
	lw	s0,8(sp)
	.cfi_restore 8
	lbu	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
	.size	_ZL9M41Write0jh, .-_ZL9M41Write0jh
	.section	.text._ZL8M41Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M41Powerv, @function
_ZL8M41Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL6chrreg
	li	a0,32768
	sb	zero,0(s0)
	la a5, _ZL7mainreg; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	la a0, _ZL6mirror; lbu a0, 0(a0);
	call	_Z9setmirrori
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL9M41Write0jh
	addi	a1,a1,2047
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M41Write1jh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL8M41Powerv, .-_ZL8M41Powerv
	.section	.text._Z13Mapper41_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper41_InitP8CartInfo
	.hidden	_Z13Mapper41_InitP8CartInfo
	.type	_Z13Mapper41_InitP8CartInfo, @function
_Z13Mapper41_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL8M41Powerv
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
	.size	_Z13Mapper41_InitP8CartInfo, .-_Z13Mapper41_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL7mainreg
	.word	1
	.word	.LC0
	.word	_ZL6chrreg
	.word	1
	.word	.LC1
	.word	_ZL6mirror
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL6mirror,"aw",@nobits
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.section	.sbss._ZL6chrreg,"aw",@nobits
	.type	_ZL6chrreg, @object
	.size	_ZL6chrreg, 1
_ZL6chrreg:
	.zero	1
	.section	.sbss._ZL7mainreg,"aw",@nobits
	.type	_ZL7mainreg, @object
	.size	_ZL7mainreg, 1
_ZL7mainreg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
