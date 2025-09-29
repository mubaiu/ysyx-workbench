#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"et-100.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL15BMC1024CA1Closev,"ax",@progbits
	.align	2
	.type	_ZL15BMC1024CA1Closev, @function
_ZL15BMC1024CA1Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL15BMC1024CA1Closev, .-_ZL15BMC1024CA1Closev
	.section	.text._ZL15BMC1024CA1Resetv,"ax",@progbits
	.align	2
	.type	_ZL15BMC1024CA1Resetv, @function
_ZL15BMC1024CA1Resetv:
.LFB9:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE9:
	.size	_ZL15BMC1024CA1Resetv, .-_ZL15BMC1024CA1Resetv
	.section	.text._ZL15BMC1024CA1Powerv,"ax",@progbits
	.align	2
	.type	_ZL15BMC1024CA1Powerv, @function
_ZL15BMC1024CA1Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL15BMC1024CA1Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL15BMC1024CA1Powerv, .-_ZL15BMC1024CA1Powerv
	.section	.text._ZL12BMC1024CA1CWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC1024CA1CWjh, @function
_ZL12BMC1024CA1CWjh:
.LFB7:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a3,a5,16
	mv	a2,a1
	bne	a3,zero,.L17
	slli	a1,a5,7
	li	a3,40
	andi	a5,a5,40
	andi	a4,a1,896
	beq	a5,a3,.L18
	andi	a1,a2,127
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L17:
	mv	a1,a0
	li	a0,16
	tail	_Z8setchr1rijj
.L18:
	or	a1,a2,a4
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE7:
	.size	_ZL12BMC1024CA1CWjh, .-_ZL12BMC1024CA1CWjh
	.section	.text._ZL12BMC1024CA1PWjh,"ax",@progbits
	.align	2
	.type	_ZL12BMC1024CA1PWjh, @function
_ZL12BMC1024CA1PWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,4
	andi	a5,a5,8
	andi	a4,a4,112
	beq	a5,zero,.L20
	andi	a1,a1,31
	or	a1,a1,a4
	tail	_Z7setprg8jj
.L20:
	andi	a1,a1,15
	or	a1,a1,a4
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL12BMC1024CA1PWjh, .-_ZL12BMC1024CA1PWjh
	.section	.text._ZL15BMC1024CA1Writejh,"ax",@progbits
	.align	2
	.type	_ZL15BMC1024CA1Writejh, @function
_ZL15BMC1024CA1Writejh:
.LFB8:
	.cfi_startproc
	la a5, A001B; lbu a5, 0(a5);
	andi	a4,a5,192
	li	a3,128
	mv	a5,a0
	bne	a4,a3,.L22
	lla	a3,EXPREGS
	lbu	a4,0(a3)
	andi	a4,a4,7
	beq	a4,zero,.L26
.L22:
	mv	a0,a5
	tail	_Z6CartBWjh
.L26:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a5,a5,63
	sb	a5,0(a3)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE8:
	.size	_ZL15BMC1024CA1Writejh, .-_ZL15BMC1024CA1Writejh
	.section	.rodata._Z15BMC1024CA1_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z15BMC1024CA1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC1024CA1_InitP8CartInfo
	.hidden	_Z15BMC1024CA1_InitP8CartInfo
	.type	_Z15BMC1024CA1_InitP8CartInfo, @function
_Z15BMC1024CA1_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	s1,_ZL10CHRRAMSize
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(a5)
	call	_Z19SetupCartCHRMappingiPhji
	lla	a5,_ZL6CHRRAM
	lw	a1,0(s1)
	lw	a0,0(a5)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL12BMC1024CA1PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMC1024CA1CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL15BMC1024CA1Powerv
	sw	a5,0(s0)
	lla	a5,_ZL15BMC1024CA1Resetv
	sw	a5,4(s0)
	lla	a5,_ZL15BMC1024CA1Closev
	sw	a5,8(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z15BMC1024CA1_InitP8CartInfo, .-_Z15BMC1024CA1_InitP8CartInfo
	.section	.sbss._ZL10CHRRAMSize,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
