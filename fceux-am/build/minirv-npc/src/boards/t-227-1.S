#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"t-227-1.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL13BMCT2271Resetv,"ax",@progbits
	.align	2
	.type	_ZL13BMCT2271Resetv, @function
_ZL13BMCT2271Resetv:
.LFB10:
	.cfi_startproc
	lla	a4,_ZL10reset_flag
	lbu	a5,0(a4)
	la a3, EXPREGS; sb zero, 0(a3);
	addi	a5,a5,1
	andi	a5,a5,15
	sb	a5,0(a4)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE10:
	.size	_ZL13BMCT2271Resetv, .-_ZL13BMCT2271Resetv
	.section	.text._ZL13BMCT2271Powerv,"ax",@progbits
	.align	2
	.type	_ZL13BMCT2271Powerv, @function
_ZL13BMCT2271Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	li	a1,32768
	lla	a2,_ZL15BMCT2271LoWritejh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL14BMCT2271HiReadj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE11:
	.size	_ZL13BMCT2271Powerv, .-_ZL13BMCT2271Powerv
	.section	.text._ZL14BMCT2271HiReadj,"ax",@progbits
	.align	2
	.type	_ZL14BMCT2271HiReadj, @function
_ZL14BMCT2271HiReadj:
.LFB9:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L6
	li	a5,65536
	addi	a5,a5,-16
	and	a0,a0,a5
	la a5, _ZL10reset_flag; lbu a5, 0(a5);
	or	a0,a0,a5
.L6:
	tail	_Z6CartBRj
	.cfi_endproc
.LFE9:
	.size	_ZL14BMCT2271HiReadj, .-_ZL14BMCT2271HiReadj
	.section	.text._ZL15BMCT2271LoWritejh,"ax",@progbits
	.align	2
	.type	_ZL15BMCT2271LoWritejh, @function
_ZL15BMCT2271LoWritejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,EXPREGS
	lb	a4,0(a5)
	blt	a4,zero,.L11
	sb	a0,0(a5)
.L11:
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
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
	.size	_ZL15BMCT2271LoWritejh, .-_ZL15BMCT2271LoWritejh
	.section	.text._ZL10BMCT2271CWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCT2271CWjh, @function
_ZL10BMCT2271CWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,32
	slli	a5,a5,4
	beq	a4,zero,.L14
	andi	a5,a5,256
	or	a1,a5,a1
	ori	a1,a1,512
	tail	_Z7setchr1jj
.L14:
	andi	a1,a1,127
	andi	a5,a5,384
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE6:
	.size	_ZL10BMCT2271CWjh, .-_ZL10BMCT2271CWjh
	.section	.text._ZL10BMCT2271PWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCT2271PWjh, @function
_ZL10BMCT2271PWjh:
.LFB7:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a3,a5,32
	slli	a4,a5,1
	beq	a3,zero,.L17
	andi	a1,a1,31
	andi	a4,a4,32
	ori	a1,a1,64
	or	a1,a4,a1
	li	a3,2
	andi	a4,a5,3
	beq	a4,a3,.L19
.L26:
	andi	a5,a5,1
	bne	a5,zero,.L20
	tail	_Z7setprg8jj
.L20:
	li	a5,49152
	bltu	a0,a5,.L25
.L16:
	ret
.L17:
	andi	a4,a4,48
	andi	a1,a1,15
	or	a1,a4,a1
	li	a3,2
	andi	a4,a5,3
	bne	a4,a3,.L26
.L19:
	li	a4,49152
	bgeu	a0,a4,.L16
	srli	a5,a5,1
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	andi	a1,a1,253
	andi	a5,a5,2
	sw	s0,4(sp)
	.cfi_offset 8, -8
	or	s0,a5,a1
	srli	s0,s0,1
	mv	a1,s0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L25:
	srli	a1,a1,2
	li	a0,32768
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE7:
	.size	_ZL10BMCT2271PWjh, .-_ZL10BMCT2271PWjh
	.section	.rodata._Z13BMCT2271_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z13BMCT2271_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCT2271_InitP8CartInfo
	.hidden	_Z13BMCT2271_InitP8CartInfo
	.type	_Z13BMCT2271_InitP8CartInfo, @function
_Z13BMCT2271_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10BMCT2271PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL10BMCT2271CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL13BMCT2271Powerv
	sw	a5,0(s0)
	lla	a5,_ZL13BMCT2271Resetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13BMCT2271_InitP8CartInfo, .-_Z13BMCT2271_InitP8CartInfo
	.section	.sdata._ZL10reset_flag,"aw"
	.type	_ZL10reset_flag, @object
	.size	_ZL10reset_flag, 1
_ZL10reset_flag:
	.byte	7
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
