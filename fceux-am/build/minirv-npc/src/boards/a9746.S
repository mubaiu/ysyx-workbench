#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"a9746.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL13UNLA9746Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLA9746Powerv, @function
_ZL13UNLA9746Powerv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,49152
	lla	a2,_ZL13UNLA9746Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE7:
	.size	_ZL13UNLA9746Powerv, .-_ZL13UNLA9746Powerv
	.section	.text._ZL13UNLA9746Writejh,"ax",@progbits
	.align	2
	.type	_ZL13UNLA9746Writejh, @function
_ZL13UNLA9746Writejh:
.LFB6:
	.cfi_startproc
	li	a4,57344
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a4,a4,3
	li	a5,32768
	sw	s0,8(sp)
	sw	ra,12(sp)
	and	a0,a0,a4
	addi	a5,a5,1
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a1
	beq	a0,a5,.L5
	li	a5,32768
	addi	a5,a5,2
	beq	a0,a5,.L6
	li	a4,32768
	bne	a0,a4,.L4
	la a5, EXPREGS+1; sb a1, 0(a5);
	la a5, EXPREGS; sb zero, 0(a5);
.L4:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L6:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	la a5, EXPREGS; sb a1, 0(a5);
	la a5, EXPREGS+1; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_restore_state
	sw	s1,4(sp)
	.cfi_offset 9, -12
	srli	a1,a1,5
	srli	a4,s0,3
	lla	s1,EXPREGS
	andi	a4,a4,2
	srli	a5,s0,1
	andi	a1,a1,1
	lbu	a3,0(s1)
	or	a1,a1,a4
	andi	a2,a5,4
	slli	a4,s0,1
	or	a1,a1,a2
	andi	a4,a4,8
	li	a2,37
	or	a1,a1,a4
	beq	a3,a2,.L10
	bgtu	a3,a2,.L11
	li	a4,35
	beq	a3,a4,.L12
	li	a4,36
	bne	a3,a4,.L14
	li	a0,49152
	sw	a5,0(sp)
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L14
.L11:
	li	a4,38
	bne	a3,a4,.L14
	li	a0,32768
	sw	a5,0(sp)
	call	_Z7setprg8jj
	lw	a5,0(sp)
.L14:
	lbu	a4,1(s1)
	li	a3,21
	bgtu	a4,a3,.L15
	li	a3,7
	bleu	a4,a3,.L31
	addi	a4,a4,-8
	andi	a4,a4,0xff
	li	a3,13
	bgtu	a4,a3,.L31
	lla	a3,.L21
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata._ZL13UNLA9746Writejh,"a",@progbits
	.align	2
	.align	2
.L21:
	.word	.L17-.L21
	.word	.L26-.L21
	.word	.L17-.L21
	.word	.L25-.L21
	.word	.L17-.L21
	.word	.L24-.L21
	.word	.L17-.L21
	.word	.L23-.L21
	.word	.L17-.L21
	.word	.L22-.L21
	.word	.L17-.L21
	.word	.L31-.L21
	.word	.L17-.L21
	.word	.L20-.L21
	.section	.text._ZL13UNLA9746Writejh
.L15:
	addi	a4,a4,-22
	andi	a4,a4,0xff
	li	a3,8
	bgtu	a4,a3,.L31
	li	a3,1
	sll	a3,a3,a4
	andi	a3,a3,341
	beq	a3,zero,.L34
.L17:
	slli	s0,s0,4
	sb	s0,2(s1)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	li	a0,40960
	sw	a5,0(sp)
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L14
.L12:
	li	a0,57344
	sw	a5,0(sp)
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L14
.L34:
	li	a3,7
	beq	a4,a3,.L18
	li	a3,3
	bne	a4,a3,.L31
	lbu	a1,2(s1)
	li	a0,8192
	addi	a0,a0,-2048
.L32:
	or	a1,a5,a1
.L33:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
.L20:
	.cfi_restore_state
	li	a0,4096
	lbu	a1,2(s1)
	addi	a0,a0,1024
	j	.L32
.L22:
	lbu	a1,2(s1)
	li	a0,4096
	j	.L32
.L23:
	lbu	a1,2(s1)
	li	a0,4096
	addi	a0,a0,-1024
	or	a1,a5,a1
	ori	a1,a1,1
	j	.L33
.L24:
	li	a0,4096
	lbu	a1,2(s1)
	addi	a0,a0,-2048
	j	.L32
.L25:
	lbu	a1,2(s1)
	li	a0,1024
	or	a1,a5,a1
	ori	a1,a1,1
	j	.L33
.L26:
	lbu	a1,2(s1)
	li	a0,0
	j	.L32
.L31:
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L4
.L18:
	.cfi_restore_state
	li	a0,8192
	lbu	a1,2(s1)
	addi	a0,a0,-1024
	j	.L32
	.cfi_endproc
.LFE6:
	.size	_ZL13UNLA9746Writejh, .-_ZL13UNLA9746Writejh
	.section	.rodata._Z13UNLA9746_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z13UNLA9746_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLA9746_InitP8CartInfo
	.hidden	_Z13UNLA9746_InitP8CartInfo
	.type	_Z13UNLA9746_InitP8CartInfo, @function
_Z13UNLA9746_InitP8CartInfo:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a3,0
	li	a2,256
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL13UNLA9746Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,6
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE8:
	.size	_Z13UNLA9746_InitP8CartInfo, .-_Z13UNLA9746_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
