#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"kof97.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL13UNLKOF97Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLKOF97Powerv, @function
_ZL13UNLKOF97Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	lla	a2,_ZL16UNLKOF97CMDWritejh
	li	a1,40960
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL16UNLKOF97IRQWritejh
	li	a1,61440
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL13UNLKOF97Powerv, .-_ZL13UNLKOF97Powerv
	.section	.text._ZL16UNLKOF97IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLKOF97IRQWritejh, @function
_ZL16UNLKOF97IRQWritejh:
.LFB7:
	.cfi_startproc
	slli	a3,a1,24
	srai	a3,a3,24
	slli	a4,a3,3
	srli	a2,a1,1
	srli	a5,a1,4
	andi	a4,a4,32
	andi	a2,a2,1
	slli	a3,a3,2
	andi	a1,a1,-40
	andi	a3,a3,4
	andi	a5,a5,2
	or	a4,a4,a2
	or	a4,a4,a3
	or	a5,a5,a1
	li	a3,53248
	or	a1,a5,a4
	beq	a0,a3,.L6
	li	a5,61440
	beq	a0,a5,.L8
	tail	_Z13MMC3_IRQWritejh
.L8:
	li	a0,57344
	addi	a0,a0,1
	tail	_Z13MMC3_IRQWritejh
.L6:
	li	a0,49152
	addi	a0,a0,1
	tail	_Z13MMC3_IRQWritejh
	.cfi_endproc
.LFE7:
	.size	_ZL16UNLKOF97IRQWritejh, .-_ZL16UNLKOF97IRQWritejh
	.section	.text._ZL16UNLKOF97CMDWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLKOF97CMDWritejh, @function
_ZL16UNLKOF97CMDWritejh:
.LFB6:
	.cfi_startproc
	slli	a3,a1,24
	srai	a3,a3,24
	slli	a4,a3,3
	srli	a2,a1,1
	srli	a5,a1,4
	andi	a4,a4,32
	andi	a2,a2,1
	slli	a3,a3,2
	andi	a1,a1,-40
	andi	a3,a3,4
	andi	a5,a5,2
	or	a4,a4,a2
	or	a4,a4,a3
	or	a5,a5,a1
	li	a3,36864
	or	a1,a5,a4
	bne	a0,a3,.L10
	li	a0,32768
	addi	a0,a0,1
.L10:
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE6:
	.size	_ZL16UNLKOF97CMDWritejh, .-_ZL16UNLKOF97CMDWritejh
	.section	.text._Z13UNLKOF97_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLKOF97_InitP8CartInfo
	.hidden	_Z13UNLKOF97_InitP8CartInfo
	.type	_Z13UNLKOF97_InitP8CartInfo, @function
_Z13UNLKOF97_InitP8CartInfo:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL13UNLKOF97Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_Z13UNLKOF97_InitP8CartInfo, .-_Z13UNLKOF97_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
