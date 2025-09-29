#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"coolboy.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL12COOLBOYResetv,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYResetv, @function
_ZL12COOLBOYResetv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z12MMC3RegResetv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
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
.LFE9:
	.size	_ZL12COOLBOYResetv, .-_ZL12COOLBOYResetv
	.section	.text._ZL12COOLBOYPowerv,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYPowerv, @function
_ZL12COOLBOYPowerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z12GenMMC3Powerv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	li	a1,24576
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,28672
	lla	a2,_ZL12COOLBOYWritejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL12COOLBOYPowerv, .-_ZL12COOLBOYPowerv
	.section	.text._ZL13MINDKIDSPowerv,"ax",@progbits
	.align	2
	.type	_ZL13MINDKIDSPowerv, @function
_ZL13MINDKIDSPowerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z12GenMMC3Powerv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	lla	a2,_ZL12COOLBOYWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE11:
	.size	_ZL13MINDKIDSPowerv, .-_ZL13MINDKIDSPowerv
	.section	.text._ZL9COOLBOYCWjh,"ax",@progbits
	.align	2
	.type	_ZL9COOLBOYCWjh, @function
_ZL9COOLBOYCWjh:
.LFB6:
	.cfi_startproc
	lla	a2,EXPREGS
	lbu	a4,3(a2)
	lbu	a5,0(a2)
	andi	t1,a4,16
	andi	a3,a5,-128
	xori	a3,a3,255
	andi	a4,a4,64
	beq	t1,zero,.L9
	beq	a4,zero,.L10
	la a4, MMC3_cmd; lbu a4, 0(a4);
	li	t1,4096
	slli	a4,a4,5
	and	a4,a4,t1
	li	t1,-4096
	addi	t1,t1,2047
	xor	a4,a4,a0
	and	a4,a4,t1
	li	t1,1024
	beq	a4,t1,.L22
.L10:
	lbu	a4,2(a2)
	slli	a5,a5,4
	not	a2,a3
	and	a5,a5,a2
	and	a1,a3,a1
	slli	a4,a4,3
	srli	a3,a0,10
	or	a1,a5,a1
	andi	a4,a4,120
	andi	a5,a3,7
	andi	a1,a1,128
	or	a4,a4,a5
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L9:
	bne	a4,zero,.L11
.L16:
	and	a4,a3,a1
.L12:
	slli	a5,a5,4
	not	a3,a3
	and	a5,a5,a3
	andi	a5,a5,128
	or	a1,a5,a4
	tail	_Z7setchr1jj
.L11:
	la a4, MMC3_cmd; lbu a4, 0(a4);
	li	a2,4096
	slli	a4,a4,5
	and	a4,a4,a2
	xor	a2,a4,a0
	addi	t1,a2,-2048
	beq	t1,zero,.L13
	li	t1,4096
	addi	t1,t1,-2048
	bgtu	a2,t1,.L14
	beq	a4,a0,.L15
	li	t1,1024
	li	a4,0
	beq	a2,t1,.L12
	j	.L16
.L22:
	andi	a1,a1,127
	j	.L10
.L13:
	la a4, DRegBuf+1; lbu a4, 0(a4);
	and	a4,a3,a4
	j	.L12
.L15:
	la a4, DRegBuf; lbu a4, 0(a4);
	and	a4,a3,a4
	j	.L12
.L14:
	li	t1,4096
	addi	t1,t1,-1024
	li	a4,0
	beq	a2,t1,.L12
	j	.L16
	.cfi_endproc
.LFE6:
	.size	_ZL9COOLBOYCWjh, .-_ZL9COOLBOYCWjh
	.section	.text._ZL9COOLBOYPWjh,"ax",@progbits
	.align	2
	.type	_ZL9COOLBOYPWjh, @function
_ZL9COOLBOYPWjh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	lla	a5,EXPREGS
	lbu	a2,1(a5)
	lbu	a3,0(a5)
	lbu	t0,3(a5)
	andi	a5,a2,64
	srli	s1,a3,2
	ori	a5,a5,63
	srli	t1,a2,2
	andi	s1,s1,16
	sw	a5,0(sp)
	andi	t1,t1,32
	or	t1,s1,t1
	lw	s1,0(sp)
	slli	a4,a2,2
	slli	t2,a3,2
	srli	s0,a2,1
	andi	a5,a4,128
	andi	t2,t2,192
	andi	s0,s0,8
	andi	a3,a3,7
	andi	a4,a4,48
	or	a4,t2,a4
	or	a5,s1,a5
	or	a3,s0,a3
	andi	t2,t0,64
	xor	a5,t1,a5
	or	a4,a3,a4
	beq	t2,zero,.L25
	li	a3,253
	bgtu	a1,a3,.L32
.L25:
	slli	a4,a4,4
	andi	t1,t0,16
	xor	a3,a1,a4
	beq	t1,zero,.L33
	andi	a2,a2,2
	andi	a5,a5,240
	srli	t1,a0,13
	andi	a1,t0,14
	bne	a2,zero,.L34
.L29:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	and	a5,a5,a3
	lw	s1,4(sp)
	.cfi_restore 9
	xor	a5,a5,a4
	andi	t1,t1,1
	or	a5,a5,t1
	or	a1,a5,a1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L34:
	.cfi_restore_state
	andi	t0,t0,12
	andi	a1,t1,2
	or	a1,t0,a1
	j	.L29
.L32:
	la a3, MMC3_cmd; lbu a3, 0(a3);
	andi	a3,a3,64
	bne	a3,zero,.L25
	li	a3,49152
	and	t1,a0,a3
	bne	t1,a3,.L25
	li	a1,0
	j	.L25
.L33:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	and	a1,a5,a3
	xor	a1,a1,a4
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE7:
	.size	_ZL9COOLBOYPWjh, .-_ZL9COOLBOYPWjh
	.section	.text._ZL12COOLBOYWritejh,"ax",@progbits
	.align	2
	.type	_ZL12COOLBOYWritejh, @function
_ZL12COOLBOYWritejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	la a5, A001B; lb a5, 0(a5);
	mv	s0,a0
	mv	s1,a1
	blt	a5,zero,.L39
.L36:
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	li	a3,128
	andi	a5,a5,144
	bne	a5,a3,.L40
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L40:
	.cfi_restore_state
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	andi	s0,s0,3
	add	a4,a4,s0
	sb	s1,0(a4)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lbu	a0,0(a5)
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L39:
	.cfi_restore_state
	call	_Z6CartBWjh
	j	.L36
	.cfi_endproc
.LFE8:
	.size	_ZL12COOLBOYWritejh, .-_ZL12COOLBOYWritejh
	.section	.rodata._Z12COOLBOY_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z12COOLBOY_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12COOLBOY_InitP8CartInfo
	.hidden	_Z12COOLBOY_InitP8CartInfo
	.type	_Z12COOLBOY_InitP8CartInfo, @function
_Z12COOLBOY_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	li	a1,4096
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,1
	li	a3,8
	li	a2,256
	addi	a1,a1,-2048
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9COOLBOYPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9COOLBOYCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL12COOLBOYPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12COOLBOYResetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z12COOLBOY_InitP8CartInfo, .-_Z12COOLBOY_InitP8CartInfo
	.section	.text._Z13MINDKIDS_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13MINDKIDS_InitP8CartInfo
	.hidden	_Z13MINDKIDS_InitP8CartInfo
	.type	_Z13MINDKIDS_InitP8CartInfo, @function
_Z13MINDKIDS_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	li	a1,4096
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,1
	li	a3,8
	li	a2,256
	addi	a1,a1,-2048
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9COOLBOYPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9COOLBOYCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL13MINDKIDSPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12COOLBOYResetv
	sw	a5,4(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z13MINDKIDS_InitP8CartInfo, .-_Z13MINDKIDS_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
