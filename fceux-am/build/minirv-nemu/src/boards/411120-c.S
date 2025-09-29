#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"411120-c.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL15BMC411120CResetv,"ax",@progbits
	.align	2
	.type	_ZL15BMC411120CResetv, @function
_ZL15BMC411120CResetv:
.LFB9:
	.cfi_startproc
	lla	a4,_ZL10reset_flag
	lbu	a5,0(a4)
	la a3, EXPREGS; sb zero, 0(a3);
	xori	a5,a5,4
	sb	a5,0(a4)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE9:
	.size	_ZL15BMC411120CResetv, .-_ZL15BMC411120CResetv
	.section	.text._ZL15BMC411120CPowerv,"ax",@progbits
	.align	2
	.type	_ZL15BMC411120CPowerv, @function
_ZL15BMC411120CPowerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL17BMC411120CLoWritejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL15BMC411120CPowerv, .-_ZL15BMC411120CPowerv
	.section	.text._ZL17BMC411120CLoWritejh,"ax",@progbits
	.align	2
	.type	_ZL17BMC411120CLoWritejh, @function
_ZL17BMC411120CLoWritejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	mv	a5,a0
	lbu	a0,0(s0)
	la a4, EXPREGS; sb a5, 0(a4);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE8:
	.size	_ZL17BMC411120CLoWritejh, .-_ZL17BMC411120CLoWritejh
	.section	.text._ZL12BMC411120CCWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC411120CCWjh, @function
_ZL12BMC411120CCWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,7
	andi	a5,a5,384
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE6:
	.size	_ZL12BMC411120CCWjh, .-_ZL12BMC411120CCWjh
	.section	.text._ZL12BMC411120CPWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC411120CPWjh, @function
_ZL12BMC411120CPWjh:
.LFB7:
	.cfi_startproc
	la a4, _ZL10reset_flag; lbu a4, 0(a4);
	la a5, EXPREGS; lbu a5, 0(a5);
	ori	a4,a4,8
	and	a4,a5,a4
	beq	a4,zero,.L9
	srli	a1,a5,4
	andi	a1,a1,3
	ori	a1,a1,12
	li	a0,32768
	tail	_Z8setprg32jj
.L9:
	slli	a5,a5,4
	andi	a5,a5,48
	andi	a1,a1,15
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE7:
	.size	_ZL12BMC411120CPWjh, .-_ZL12BMC411120CPWjh
	.section	.rodata._Z15BMC411120C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z15BMC411120C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC411120C_InitP8CartInfo
	.hidden	_Z15BMC411120C_InitP8CartInfo
	.type	_Z15BMC411120C_InitP8CartInfo, @function
_Z15BMC411120C_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL12BMC411120CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMC411120CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL15BMC411120CPowerv
	sw	a5,0(s0)
	lla	a5,_ZL15BMC411120CResetv
	sw	a5,4(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z15BMC411120C_InitP8CartInfo, .-_Z15BMC411120C_InitP8CartInfo
	.section	.sbss._ZL10reset_flag,"aw",@nobits
	.type	_ZL10reset_flag, @object
	.size	_ZL10reset_flag, 1
_ZL10reset_flag:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
