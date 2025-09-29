#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"187.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL8M187Readj,"ax",@progbits
	.align	2
	.type	_ZL8M187Readj, @function
_ZL8M187Readj:
.LFB11:
	.cfi_startproc
	la a4, EXPREGS+1; lbu a4, 0(a4);
	andi	a4,a4,3
	lla	a5,_ZL9prot_data
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL8M187Readj, .-_ZL8M187Readj
	.section	.text._ZL9M187Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M187Powerv, @function
_ZL9M187Powerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z12GenMMC3Powerv
	li	a1,24576
	lla	a2,_ZL8M187Readj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	lla	a2,_ZL11M187WriteLojh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL13M187Write8000jh
	li	a1,32768
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	addi	a1,a1,1
	lla	a2,_ZL13M187Write8001jh
	mv	a0,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE12:
	.size	_ZL9M187Powerv, .-_ZL9M187Powerv
	.section	.text._ZL13M187Write8001jh,"ax",@progbits
	.align	2
	.type	_ZL13M187Write8001jh, @function
_ZL13M187Write8001jh:
.LFB9:
	.cfi_startproc
	la a5, EXPREGS+1; lbu a5, 0(a5);
	bne	a5,zero,.L7
	ret
.L7:
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE9:
	.size	_ZL13M187Write8001jh, .-_ZL13M187Write8001jh
	.section	.text._ZL13M187Write8000jh,"ax",@progbits
	.align	2
	.type	_ZL13M187Write8000jh, @function
_ZL13M187Write8000jh:
.LFB8:
	.cfi_startproc
	li	a5,1
	la a4, EXPREGS+1; sb a5, 0(a4);
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE8:
	.size	_ZL13M187Write8000jh, .-_ZL13M187Write8000jh
	.section	.text._ZL6M187PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M187PWjh, @function
_ZL6M187PWjh:
.LFB7:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L10
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	andi	a4,a5,32
	andi	s0,a5,31
	beq	a4,zero,.L11
	andi	a5,a5,64
	srli	a1,s0,2
	bne	a5,zero,.L16
	srli	a1,s0,1
.L16:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L10:
	andi	a1,a1,63
	tail	_Z7setprg8jj
.L11:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
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
	.cfi_endproc
.LFE7:
	.size	_ZL6M187PWjh, .-_ZL6M187PWjh
	.section	.text._ZL11M187WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL11M187WriteLojh, @function
_ZL11M187WriteLojh:
.LFB10:
	.cfi_startproc
	li	a5,-4096
	li	a4,-20480
	add	a0,a0,a4
	addi	a5,a5,-1
	and	a0,a0,a5
	beq	a0,zero,.L19
	ret
.L19:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE10:
	.size	_ZL11M187WriteLojh, .-_ZL11M187WriteLojh
	.section	.text._ZL6M187CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M187CWjh, @function
_ZL6M187CWjh:
.LFB6:
	.cfi_startproc
	la a5, MMC3_cmd; lbu a5, 0(a5);
	slli	a5,a5,5
	xor	a5,a5,a0
	slli	a3,a5,19
	blt	a3,zero,.L21
	ori	a1,a1,256
	tail	_Z7setchr1jj
.L21:
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE6:
	.size	_ZL6M187CWjh, .-_ZL6M187CWjh
	.section	.rodata._Z14Mapper187_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z14Mapper187_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper187_InitP8CartInfo
	.hidden	_Z14Mapper187_InitP8CartInfo
	.type	_Z14Mapper187_InitP8CartInfo, @function
_Z14Mapper187_InitP8CartInfo:
.LFB13:
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
	lla	a5,_ZL6M187PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M187CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M187Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14Mapper187_InitP8CartInfo, .-_Z14Mapper187_InitP8CartInfo
	.section	.srodata._ZL9prot_data,"a"
	.align	2
	.type	_ZL9prot_data, @object
	.size	_ZL9prot_data, 4
_ZL9prot_data:
	.string	"\203\203B"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
