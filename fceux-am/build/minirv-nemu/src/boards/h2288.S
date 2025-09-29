#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"h2288.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10H2288Powerv,"ax",@progbits
	.align	2
	.type	_ZL10H2288Powerv, @function
_ZL10H2288Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL12H2288WriteLojh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,40960
	lla	a2,_ZL12H2288WriteHijh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL10H2288Powerv, .-_ZL10H2288Powerv
	.section	.text._ZL7H2288PWjh,"ax",@progbits
	.align	2
	.type	_ZL7H2288PWjh, @function
_ZL7H2288PWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,64
	beq	a4,zero,.L5
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	srli	s0,a5,2
	andi	a4,a5,5
	andi	s0,s0,10
	sw	ra,12(sp)
	.cfi_offset 1, -4
	andi	a5,a5,2
	or	s0,s0,a4
	beq	a5,zero,.L6
	srli	a1,s0,1
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L6:
	.cfi_restore_state
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L5:
	andi	a1,a1,63
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL7H2288PWjh, .-_ZL7H2288PWjh
	.section	.text._ZL12H2288WriteHijh,"ax",@progbits
	.align	2
	.type	_ZL12H2288WriteHijh, @function
_ZL12H2288WriteHijh:
.LFB7:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,1
	li	a3,32768
	and	a0,a0,a5
	beq	a0,a3,.L11
	beq	a0,a5,.L12
	ret
.L12:
	tail	_Z13MMC3_CMDWritejh
.L11:
	andi	a3,a1,7
	lla	a5,m114_perm
	add	a5,a5,a3
	lbu	a5,0(a5)
	andi	a1,a1,-64
	li	a0,32768
	or	a1,a5,a1
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE7:
	.size	_ZL12H2288WriteHijh, .-_ZL12H2288WriteHijh
	.section	.text._ZL12H2288WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL12H2288WriteLojh, @function
_ZL12H2288WriteLojh:
.LFB8:
	.cfi_startproc
	slli	a5,a0,20
	bge	a5,zero,.L15
	andi	a0,a0,1
	bne	a0,zero,.L19
	la a5, EXPREGS; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L19:
	la a5, EXPREGS+1; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L15:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL12H2288WriteLojh, .-_ZL12H2288WriteLojh
	.section	.rodata._Z13UNLH2288_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z13UNLH2288_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLH2288_InitP8CartInfo
	.hidden	_Z13UNLH2288_InitP8CartInfo
	.type	_Z13UNLH2288_InitP8CartInfo, @function
_Z13UNLH2288_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7H2288PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL10H2288Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z13UNLH2288_InitP8CartInfo, .-_Z13UNLH2288_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
