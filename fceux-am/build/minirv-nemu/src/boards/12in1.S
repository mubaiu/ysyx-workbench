#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"12in1.cpp"
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 8, -8
	lla	s2,_ZL4ctrl
	lbu	s0,0(s2)
	lla	s1,_ZL6prgchr
	lbu	a1,0(s1)
	slli	s0,s0,3
	andi	s0,s0,24
	slli	s3,s0,2
	srli	a1,a1,3
	or	a1,a1,s3
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,1(s1)
	li	a0,4096
	srli	a1,a1,3
	or	a1,a1,s3
	call	_Z7setchr4jj
	lbu	a5,0(s2)
	lbu	a1,0(s1)
	li	a0,32768
	andi	a5,a5,8
	beq	a5,zero,.L2
	andi	a1,a1,6
	or	a1,s0,a1
	call	_Z8setprg16jj
	lbu	a5,0(s1)
	li	a0,49152
	andi	a5,a5,6
	or	a1,s0,a5
	ori	a1,a1,1
	call	_Z8setprg16jj
.L3:
	lbu	a0,0(s2)
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L2:
	.cfi_restore_state
	andi	a1,a1,7
	or	a1,s0,a1
	call	_Z8setprg16jj
	ori	a1,s0,7
	li	a0,49152
	call	_Z8setprg16jj
	j	.L3
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
	.section	.text._ZL13BMC12IN1Powerv,"ax",@progbits
	.align	2
	.type	_ZL13BMC12IN1Powerv, @function
_ZL13BMC12IN1Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4ctrl; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL6prgchr; sh zero, 0(a5);
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
	lla	a2,_ZL13BMC12IN1Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL13BMC12IN1Powerv, .-_ZL13BMC12IN1Powerv
	.section	.text._ZL13BMC12IN1Writejh,"ax",@progbits
	.align	2
	.type	_ZL13BMC12IN1Writejh, @function
_ZL13BMC12IN1Writejh:
.LFB7:
	.cfi_startproc
	li	a5,57344
	and	a0,a0,a5
	li	a4,49152
	beq	a0,a4,.L10
	beq	a0,a5,.L11
	li	a5,40960
	bne	a0,a5,.L9
	la a5, _ZL6prgchr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L11:
	andi	a1,a1,15
	la a5, _ZL4ctrl; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	la a5, _ZL6prgchr+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL13BMC12IN1Writejh, .-_ZL13BMC12IN1Writejh
	.section	.text._Z13BMC12IN1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC12IN1_InitP8CartInfo
	.hidden	_Z13BMC12IN1_InitP8CartInfo
	.type	_Z13BMC12IN1_InitP8CartInfo, @function
_Z13BMC12IN1_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL13BMC12IN1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z13BMC12IN1_InitP8CartInfo, .-_Z13BMC12IN1_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"CTRL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL6prgchr
	.word	2
	.word	.LC0
	.word	_ZL4ctrl
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4ctrl,"aw",@nobits
	.type	_ZL4ctrl, @object
	.size	_ZL4ctrl, 1
_ZL4ctrl:
	.zero	1
	.section	.sbss._ZL6prgchr,"aw",@nobits
	.align	2
	.type	_ZL6prgchr, @object
	.size	_ZL6prgchr, 2
_ZL6prgchr:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
