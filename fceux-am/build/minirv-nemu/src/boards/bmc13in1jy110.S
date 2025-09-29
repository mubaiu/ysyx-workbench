#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc13in1jy110.cpp"
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
	la a5, _ZL9bank_mode; lbu a5, 0(a5);
	andi	a5,a5,7
	li	a4,5
	bgtu	a5,a4,.L1
	lla	a4,.L4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	add	a5,a5,a4
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	jr	a5
	.section	.rodata._ZL4Syncv,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L10-.L4
	.word	.L6-.L4
	.word	.L11-.L4
	.word	.L3-.L4
	.section	.text._ZL4Syncv
.L11:
	lla	s0,_ZL10bank_value
.L5:
	lbu	a1,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a1,a1,7
	li	a0,32768
	addi	a1,a1,8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L10:
	.cfi_restore_state
	lla	s0,_ZL4prgb
.L7:
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,-1
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L6:
	.cfi_restore_state
	lla	s0,_ZL4prgb
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L3:
	.cfi_restore_state
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL10bank_value
	lbu	a5,0(s1)
	lla	s0,_ZL4prgb
	lbu	a1,1(s0)
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a5,0(s1)
	lbu	a1,3(s0)
	li	a0,49152
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	call	_Z8setprg16jj
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L7
.L9:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a1, _ZL10bank_value; lbu a1, 0(a1);
	andi	a1,a1,7
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L8:
	.cfi_restore_state
	lla	s0,_ZL10bank_value
	lbu	a5,0(s0)
	la a1, _ZL4prgb+1; lbu a1, 0(a1);
	li	a0,32768
	andi	a5,a5,7
	addi	a5,a5,8
	srai	a5,a5,1
	add	a1,a5,a1
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,1
	andi	a1,a1,3
	call	_Z8setprg16jj
	j	.L5
.L1:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL18BMC13in1JY110Powerv,"ax",@progbits
	.align	2
	.type	_ZL18BMC13in1JY110Powerv, @function
_ZL18BMC13in1JY110Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,32768
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4prgb; sw zero, 0(a5);
	la a5, _ZL9bank_mode; sb zero, 0(a5);
	la a5, _ZL10bank_value; sb zero, 0(a5);
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL18BMC13in1JY110Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL18BMC13in1JY110Powerv, .-_ZL18BMC13in1JY110Powerv
	.section	.text._ZL18BMC13in1JY110Writejh,"ax",@progbits
	.align	2
	.type	_ZL18BMC13in1JY110Writejh, @function
_ZL18BMC13in1JY110Writejh:
.LFB7:
	.cfi_startproc
	li	a5,53248
	addi	a5,a5,1
	beq	a0,a5,.L22
	bgtu	a0,a5,.L23
	li	a5,32768
	addi	a5,a5,3
	li	a3,32768
	bgtu	a0,a5,.L24
	bltu	a0,a3,.L30
	andi	a5,a0,3
	lla	a4,_ZL4prgb
	add	a5,a4,a5
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L23:
	li	a5,53248
	addi	a5,a5,3
	bne	a0,a5,.L30
	la a5, _ZL10bank_value; sb a1, 0(a5);
.L30:
	tail	_ZL4Syncv
.L24:
	li	a4,53248
	bne	a0,a4,.L30
	la a5, _ZL9bank_mode; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	andi	a0,a1,3
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z9setmirrori
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL18BMC13in1JY110Writejh, .-_ZL18BMC13in1JY110Writejh
	.section	.text._Z18BMC13in1JY110_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z18BMC13in1JY110_InitP8CartInfo
	.hidden	_Z18BMC13in1JY110_InitP8CartInfo
	.type	_Z18BMC13in1JY110_InitP8CartInfo, @function
_Z18BMC13in1JY110_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL18BMC13in1JY110Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_Z18BMC13in1JY110_InitP8CartInfo, .-_Z18BMC13in1JY110_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BNM"
	.align	2
.LC1:
	.string	"BMV"
	.align	2
.LC2:
	.string	"PRGB"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL9bank_mode
	.word	1
	.word	.LC0
	.word	_ZL10bank_value
	.word	1
	.word	.LC1
	.word	_ZL4prgb
	.word	4
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4prgb,"aw",@nobits
	.align	2
	.type	_ZL4prgb, @object
	.size	_ZL4prgb, 4
_ZL4prgb:
	.zero	4
	.section	.sbss._ZL10bank_value,"aw",@nobits
	.type	_ZL10bank_value, @object
	.size	_ZL10bank_value, 1
_ZL10bank_value:
	.zero	1
	.section	.sbss._ZL9bank_mode,"aw",@nobits
	.type	_ZL9bank_mode, @object
	.size	_ZL9bank_mode, 1
_ZL9bank_mode:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
