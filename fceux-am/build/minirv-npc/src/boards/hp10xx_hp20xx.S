#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hp10xx_hp20xx.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL11BMCHPxxReadj,"ax",@progbits
	.align	2
	.type	_ZL11BMCHPxxReadj, @function
_ZL11BMCHPxxReadj:
.LFB12:
	.cfi_startproc
	la a0, _ZL9dipswitch; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL11BMCHPxxReadj, .-_ZL11BMCHPxxReadj
	.section	.text._ZL12BMCHPxxResetv,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxResetv, @function
_ZL12BMCHPxxResetv:
.LFB13:
	.cfi_startproc
	lla	a3,_ZL9dipswitch
	lw	a5,0(a3)
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	addi	a5,a5,1
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a4,EXPREGS
	andi	a5,a5,15
	lla	s0,MMC3_cmd
	sw	a5,0(a3)
	sb	zero,3(a4)
	sb	zero,2(a4)
	sb	zero,1(a4)
	sb	zero,0(a4)
	la a2, _ZL4lock; sb zero, 0(a2);
	call	_Z12MMC3RegResetv
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
.LFE13:
	.size	_ZL12BMCHPxxResetv, .-_ZL12BMCHPxxResetv
	.section	.text._ZL12BMCHPxxPowerv,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxPowerv, @function
_ZL12BMCHPxxPowerv:
.LFB14:
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
	la a4, _ZL4lock; sb zero, 0(a4);
	la a4, _ZL9dipswitch; sw zero, 0(a4);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	li	a1,24576
	lla	a2,_ZL11BMCHPxxReadj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL12BMCHPxxWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL14BMCHPxxHiWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE14:
	.size	_ZL12BMCHPxxPowerv, .-_ZL12BMCHPxxPowerv
	.section	.text._ZL9BMCHPxxPWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxPWjh, @function
_ZL9BMCHPxxPWjh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	lbu	a4,1(s0)
	andi	a3,a5,4
	beq	a3,zero,.L8
	andi	a5,a5,15
	li	a3,4
	beq	a5,a3,.L13
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a1,a4,1
	andi	a1,a1,15
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L8:
	.cfi_restore_state
	andi	a5,a5,2
	bne	a5,zero,.L14
	andi	a4,a4,16
	li	a5,31
.L11:
	and	a1,a1,a5
	slli	a4,a4,1
	or	a1,a1,a4
	call	_Z7setprg8jj
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a2, A001B; lbu a2, 0(a2);
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg8rijj
.L14:
	.cfi_restore_state
	andi	a4,a4,24
	li	a5,15
	j	.L11
.L13:
	andi	a1,a4,31
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,49152
	andi	a1,a1,31
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE8:
	.size	_ZL9BMCHPxxPWjh, .-_ZL9BMCHPxxPWjh
	.section	.text._ZL9BMCHPxxCWjh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxCWjh, @function
_ZL9BMCHPxxCWjh:
.LFB7:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	lbu	a4,2(a4)
	andi	a3,a5,4
	beq	a3,zero,.L16
	andi	a5,a5,3
	li	a3,2
	beq	a5,a3,.L17
	li	a3,3
	beq	a5,a3,.L18
	andi	a0,a4,63
	tail	_Z7setchr8j
.L16:
	andi	a5,a5,1
	beq	a5,zero,.L19
	andi	a4,a4,48
	li	a5,127
	and	a1,a1,a5
	slli	a4,a4,3
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L19:
	andi	a4,a4,32
	li	a5,255
	and	a1,a1,a5
	slli	a4,a4,3
	or	a1,a1,a4
	tail	_Z7setchr1jj
.L18:
	la a5, _ZL8unromchr; lbu a5, 0(a5);
	andi	a5,a5,3
	andi	a4,a4,60
	or	a0,a5,a4
	tail	_Z7setchr8j
.L17:
	la a5, _ZL8unromchr; lbu a5, 0(a5);
	andi	a5,a5,1
	andi	a4,a4,62
	or	a0,a5,a4
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL9BMCHPxxCWjh, .-_ZL9BMCHPxxCWjh
	.section	.text._ZL12BMCHPxxWritejh,"ax",@progbits
	.align	2
	.type	_ZL12BMCHPxxWritejh, @function
_ZL12BMCHPxxWritejh:
.LFB11:
	.cfi_startproc
	lla	a4,_ZL4lock
	lbu	a3,0(a4)
	beq	a3,zero,.L26
	ret
.L26:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	mv	a5,a0
	lbu	a0,0(s0)
	lla	a3,EXPREGS
	andi	a5,a5,3
	add	a5,a3,a5
	andi	a3,a1,-128
	sb	a1,0(a5)
	sb	a3,0(a4)
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
.LFE11:
	.size	_ZL12BMCHPxxWritejh, .-_ZL12BMCHPxxWritejh
	.section	.text._ZL14BMCHPxxHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL14BMCHPxxHiWritejh, @function
_ZL14BMCHPxxHiWritejh:
.LFB10:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L33
	li	a5,49152
	bgeu	a0,a5,.L29
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z13MMC3_CMDWritejh
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
.L29:
	tail	_Z13MMC3_IRQWritejh
.L33:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, _ZL8unromchr; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE10:
	.size	_ZL14BMCHPxxHiWritejh, .-_ZL14BMCHPxxHiWritejh
	.section	.text._ZL9BMCHPxxMWh,"ax",@progbits
	.align	2
	.type	_ZL9BMCHPxxMWh, @function
_ZL9BMCHPxxMWh:
.LFB9:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,4
	mv	a5,a0
	beq	a4,zero,.L35
	la a0, _ZL8unromchr; lbu a0, 0(a0);
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	tail	_Z9setmirrori
.L35:
	not	a0,a0
	andi	a0,a0,1
	la a4, A000B; sb a5, 0(a4);
	tail	_Z9setmirrori
	.cfi_endproc
.LFE9:
	.size	_ZL9BMCHPxxMWh, .-_ZL9BMCHPxxMWh
	.section	.rodata._Z12BMCHPxx_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.align	2
.LC1:
	.string	"UCHR"
	.align	2
.LC2:
	.string	"DPSW"
	.align	2
.LC3:
	.string	"LOCK"
	.section	.text._Z12BMCHPxx_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12BMCHPxx_InitP8CartInfo
	.hidden	_Z12BMCHPxx_InitP8CartInfo
	.type	_Z12BMCHPxx_InitP8CartInfo, @function
_Z12BMCHPxx_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9BMCHPxxCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9BMCHPxxPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9BMCHPxxMWh
	la a4, mwrap; sw a5, 0(a4);
	lla	a5,_ZL12BMCHPxxPowerv
	sw	a5,0(s0)
	lla	a5,_ZL12BMCHPxxResetv
	sw	a5,4(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL8unromchr
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,_ZL9dipswitch
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,_ZL4lock
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE15:
	.size	_Z12BMCHPxx_InitP8CartInfo, .-_Z12BMCHPxx_InitP8CartInfo
	.section	.sbss._ZL9dipswitch,"aw",@nobits
	.align	2
	.type	_ZL9dipswitch, @object
	.size	_ZL9dipswitch, 4
_ZL9dipswitch:
	.zero	4
	.section	.sbss._ZL4lock,"aw",@nobits
	.type	_ZL4lock, @object
	.size	_ZL4lock, 1
_ZL4lock:
	.zero	1
	.section	.sbss._ZL8unromchr,"aw",@nobits
	.type	_ZL8unromchr, @object
	.size	_ZL8unromchr, 1
_ZL8unromchr:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
