#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7057.cpp"
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
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL3reg
	lbu	a1,4(s0)
	li	a0,24576
	call	_Z7setprg2jj
	lbu	a1,5(s0)
	li	a0,28672
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,6(s0)
	li	a0,28672
	call	_Z7setprg2jj
	lbu	a1,7(s0)
	li	a0,32768
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg2jj
	lbu	a1,1(s0)
	li	a0,36864
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,2(s0)
	li	a0,36864
	call	_Z7setprg2jj
	lbu	a1,3(s0)
	li	a0,40960
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,13
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
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
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNLKS7057Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Resetv, @function
_ZL14UNLKS7057Resetv:
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLKS7057Resetv, .-_ZL14UNLKS7057Resetv
	.section	.text._ZL14UNLKS7057Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Writejh, @function
_ZL14UNLKS7057Writejh:
.LFB7:
	.cfi_startproc
	li	a4,61440
	addi	a4,a4,3
	li	a5,49152
	and	a0,a0,a4
	addi	a5,a5,3
	li	a4,49152
	beq	a0,a5,.L6
	bgtu	a0,a5,.L7
	li	a5,45056
	addi	a5,a5,3
	li	a3,45056
	beq	a0,a5,.L8
	bgtu	a0,a5,.L9
	li	a5,45056
	addi	a5,a5,1
	beq	a0,a5,.L10
	li	a5,45056
	addi	a5,a5,2
	beq	a0,a5,.L11
	beq	a0,a3,.L12
	li	a5,32768
	addi	a5,a5,3
	li	a4,32768
	bgtu	a0,a5,.L13
	bgeu	a0,a4,.L14
	ret
.L7:
	li	a5,57344
	beq	a0,a5,.L19
	bgtu	a0,a5,.L20
	li	a5,53248
	addi	a5,a5,2
	li	a4,53248
	beq	a0,a5,.L21
	bgtu	a0,a5,.L22
	beq	a0,a4,.L23
	li	a5,53248
	addi	a5,a5,1
	bne	a0,a5,.L29
	lla	a4,_ZL3reg
	lbu	a5,4(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,4(a4)
	tail	_ZL4Syncv
.L21:
	lla	a4,_ZL3reg
	lbu	a5,5(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,5(a4)
	tail	_ZL4Syncv
.L10:
	lla	a4,_ZL3reg
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
.L20:
	li	a5,57344
	addi	a5,a5,2
	beq	a0,a5,.L26
	li	a5,57344
	addi	a5,a5,3
	beq	a0,a5,.L27
	li	a5,57344
	addi	a5,a5,1
	bne	a0,a5,.L30
	lla	a4,_ZL3reg
	lbu	a5,6(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,6(a4)
	tail	_ZL4Syncv
.L9:
	li	a5,49152
	addi	a5,a5,1
	beq	a0,a5,.L16
	li	a5,49152
	addi	a5,a5,2
	beq	a0,a5,.L17
	bne	a0,a4,.L31
	lla	a4,_ZL3reg
	lbu	a5,2(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,2(a4)
	tail	_ZL4Syncv
.L22:
	li	a5,53248
	addi	a5,a5,3
	bne	a0,a5,.L32
	lla	a4,_ZL3reg
	lbu	a5,5(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,5(a4)
	tail	_ZL4Syncv
.L8:
	lla	a4,_ZL3reg
	lbu	a5,1(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,1(a4)
	tail	_ZL4Syncv
.L23:
	lla	a4,_ZL3reg
	lbu	a5,4(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,4(a4)
	tail	_ZL4Syncv
.L12:
	lla	a4,_ZL3reg
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
.L11:
	lla	a4,_ZL3reg
	lbu	a5,1(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,1(a4)
	tail	_ZL4Syncv
.L27:
	lla	a4,_ZL3reg
	lbu	a5,7(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,7(a4)
	tail	_ZL4Syncv
.L26:
	lla	a4,_ZL3reg
	lbu	a5,7(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,7(a4)
	tail	_ZL4Syncv
.L6:
	lla	a4,_ZL3reg
	lbu	a5,3(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,3(a4)
	tail	_ZL4Syncv
.L19:
	lla	a4,_ZL3reg
	lbu	a5,6(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,6(a4)
	tail	_ZL4Syncv
.L17:
	lla	a4,_ZL3reg
	lbu	a5,3(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,3(a4)
	tail	_ZL4Syncv
.L16:
	lla	a4,_ZL3reg
	lbu	a5,2(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,2(a4)
	tail	_ZL4Syncv
.L13:
	li	a5,-36864
	add	a0,a0,a5
	li	a5,3
	bgtu	a0,a5,.L33
.L14:
	andi	a1,a1,1
	la a5, _ZL6mirror; sb a1, 0(a5);
	tail	_ZL4Syncv
.L31:
	ret
.L30:
	ret
.L29:
	ret
.L32:
	ret
.L33:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7057Writejh, .-_ZL14UNLKS7057Writejh
	.section	.text._ZL14UNLKS7057Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7057Powerv, @function
_ZL14UNLKS7057Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL14UNLKS7057Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLKS7057Powerv, .-_ZL14UNLKS7057Powerv
	.section	.text._Z14UNLKS7057_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7057_InitP8CartInfo
	.hidden	_Z14UNLKS7057_InitP8CartInfo
	.type	_Z14UNLKS7057_InitP8CartInfo, @function
_Z14UNLKS7057_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL14UNLKS7057Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7057Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z14UNLKS7057_InitP8CartInfo, .-_Z14UNLKS7057_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	8
	.word	.LC0
	.word	_ZL6mirror
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL6mirror,"aw",@nobits
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
