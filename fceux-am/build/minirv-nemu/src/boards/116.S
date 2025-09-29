#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"116.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL7SyncPRGv,"ax",@progbits
	.align	2
	.type	_ZL7SyncPRGv, @function
_ZL7SyncPRGv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4mode; lbu a5, 0(a5);
	sw	ra,12(sp)
	sw	s0,8(sp)
	andi	a5,a5,3
	li	a4,1
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	beq	a5,a4,.L2
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L3
	lla	a4,_ZL9mmc1_regs
	lbu	a5,0(a4)
	lbu	a1,3(a4)
	andi	a4,a5,8
	andi	s0,a1,15
	beq	a4,zero,.L12
	andi	a5,a5,4
	bne	a5,zero,.L13
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L3:
	.cfi_restore_state
	lla	s0,_ZL8vrc2_prg
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
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
.L2:
	.cfi_restore_state
	la s0, _ZL9mmc3_ctrl; lbu s0, 0(s0);
	srli	s0,s0,5
	sw	s1,4(sp)
	.cfi_offset 9, -12
	andi	a5,s0,2
	lla	s1,_ZL9mmc3_regs
	add	a5,s1,a5
	lbu	a1,6(a5)
	li	a0,32768
	not	s0,s0
	call	_Z7setprg8jj
	lbu	a1,7(s1)
	li	a0,40960
	andi	s0,s0,2
	call	_Z7setprg8jj
	add	s0,s1,s0
	lbu	a1,6(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_restore 8
	lbu	a1,9(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L13:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,15
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L12:
	.cfi_restore_state
	srli	a1,s0,1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE6:
	.size	_ZL7SyncPRGv, .-_ZL7SyncPRGv
	.section	.text._ZL7SyncCHRv,"ax",@progbits
	.align	2
	.type	_ZL7SyncCHRv, @function
_ZL7SyncCHRv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	la a5, _ZL4mode; lbu a5, 0(a5);
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	slli	s0,a5,6
	li	a4,1
	andi	a5,a5,3
	andi	s0,s0,256
	beq	a5,a4,.L15
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L16
	lla	s0,_ZL9mmc1_regs
	lbu	a5,0(s0)
	lbu	a1,1(s0)
	andi	a5,a5,16
	beq	a5,zero,.L22
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	li	a0,4096
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
.L16:
	.cfi_restore_state
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL8vrc2_chr
	lbu	a1,0(s1)
	li	a0,0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,1(s1)
	li	a0,1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,2(s1)
	li	a0,4096
	addi	a0,a0,-2048
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,3(s1)
	li	a0,4096
	addi	a0,a0,-1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,4(s1)
	li	a0,4096
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,5(s1)
	li	a0,4096
	addi	a0,a0,1024
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,6(s1)
	li	a0,8192
	addi	a0,a0,-2048
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,7(s1)
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	or	a1,a1,s0
	lw	s0,24(sp)
	.cfi_restore 8
	li	a0,8192
	addi	a0,a0,-1024
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
.L15:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	lla	s2,_ZL9mmc3_regs
	lbu	a1,0(s2)
	la s1, _ZL9mmc3_ctrl; lbu s1, 0(s1);
	li	s3,4096
	slli	s1,s1,5
	and	s1,s1,s3
	andi	a1,a1,254
	or	a1,a1,s0
	mv	a0,s1
	call	_Z7setchr1jj
	lbu	a1,0(s2)
	ori	a0,s1,1024
	ori	a1,a1,1
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,1(s2)
	li	a0,4096
	addi	a0,a0,-2048
	andi	a1,a1,254
	or	a1,a1,s0
	or	a0,s1,a0
	call	_Z7setchr1jj
	lbu	a1,1(s2)
	li	a0,4096
	addi	a0,a0,-1024
	ori	a1,a1,1
	or	a1,a1,s0
	or	a0,s1,a0
	call	_Z7setchr1jj
	lbu	a1,2(s2)
	xor	a0,s1,s3
	or	a1,a1,s0
	call	_Z7setchr1jj
	lbu	a1,3(s2)
	li	a0,4096
	addi	a0,a0,1024
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lbu	a1,4(s2)
	li	a0,8192
	addi	a0,a0,-2048
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lbu	a1,5(s2)
	li	a0,8192
	addi	a0,a0,-1024
	or	a1,a1,s0
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	ra,28(sp)
	.cfi_restore 1
	xor	a0,s1,a0
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
.L22:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	srli	a0,a1,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL7SyncCHRv, .-_ZL7SyncCHRv
	.section	.text._ZL7SyncMIRv,"ax",@progbits
	.align	2
	.type	_ZL7SyncMIRv, @function
_ZL7SyncMIRv:
.LFB8:
	.cfi_startproc
	la a5, _ZL4mode; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L24
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L25
	la a5, _ZL9mmc1_regs; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a3,2
	beq	a5,a3,.L31
	li	a3,3
	beq	a5,a3,.L28
	beq	a5,a4,.L29
	li	a0,2
	tail	_Z9setmirrori
.L25:
	la a0, _ZL9vrc2_mirr; lbu a0, 0(a0);
	not	a0,a0
	andi	a0,a0,1
	tail	_Z9setmirrori
.L24:
	la a0, _ZL9mmc3_mirr; lbu a0, 0(a0);
	not	a0,a0
	andi	a0,a0,1
	tail	_Z9setmirrori
.L28:
	li	a0,0
	tail	_Z9setmirrori
.L31:
	li	a0,1
	tail	_Z9setmirrori
.L29:
	li	a0,3
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL7SyncMIRv, .-_ZL7SyncMIRv
	.section	.text._ZL12UNLSL12Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12Powerv, @function
_ZL12UNLSL12Powerv:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,-33816576
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL9mmc3_regs
	addi	a4,a4,1798
	li	a3,84148224
	sw	a4,4(a5)
	addi	a3,a3,512
	li	a4,-2
	li	a2,117833728
	sh	a4,8(a5)
	sw	a3,0(a5)
	lla	a1,_ZL8vrc2_chr
	addi	a2,a2,1284
	la a0, _ZL4mode; sb zero, 0(a0);
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQLatch; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sb zero, 0(a5);
	la a5, _ZL9mmc3_mirr; sb zero, 0(a5);
	la a5, _ZL9mmc3_ctrl; sb zero, 0(a5);
	li	a5,12
	sw	a2,4(a1)
	li	a0,-1
	li	a2,256
	la a4, _ZL9mmc1_regs; sw a5, 0(a4);
	sw	a0,0(a1)
	li	s0,65536
	la a1, _ZL8vrc2_prg; sh a2, 0(a1);
	la a5, _ZL11mmc1_buffer; sb zero, 0(a5);
	la a2, _ZL9vrc2_mirr; sb zero, 0(a2);
	la a5, _ZL10mmc1_shift; sb zero, 0(a5);
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	call	_ZL7SyncMIRv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL16UNLSL12ModeWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL12UNLSL12Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE14:
	.size	_ZL12UNLSL12Powerv, .-_ZL12UNLSL12Powerv
	.section	.text._ZL12UNLSL12Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12Writejh, @function
_ZL12UNLSL12Writejh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4mode; lbu a5, 0(a5);
	sw	ra,12(sp)
	andi	a5,a5,3
	li	a4,1
	.cfi_offset 1, -4
	beq	a5,a4,.L35
	addi	a5,a5,-2
	andi	a5,a5,0xff
	bgtu	a5,a4,.L36
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L66
	lla	a2,_ZL10mmc1_shift
	lbu	a4,0(a2)
	lla	a3,_ZL11mmc1_buffer
	lbu	a6,0(a3)
	andi	a5,a1,1
	sll	a5,a5,a4
	or	a5,a5,a6
	addi	a4,a4,1
	andi	a4,a4,0xff
	andi	a5,a5,0xff
	sb	a5,0(a3)
	sb	a4,0(a2)
	li	a3,5
	beq	a4,a3,.L67
.L34:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L36:
	.cfi_restore_state
	li	a5,12288
	li	a4,-45056
	add	a4,a0,a4
	addi	a5,a5,3
	bleu	a4,a5,.L68
	li	a5,61440
	and	a5,a0,a5
	li	a4,36864
	beq	a5,a4,.L40
	li	a4,40960
	beq	a5,a4,.L41
	li	a4,32768
	bne	a5,a4,.L34
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL8vrc2_prg; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPRGv
.L35:
	.cfi_restore_state
	li	a4,57344
	addi	a4,a4,1
	and	a0,a0,a4
	li	a3,49152
	li	a2,57344
	beq	a0,a3,.L44
	bgtu	a0,a3,.L45
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	beq	a0,a5,.L46
	li	a5,40960
	beq	a0,a5,.L47
	bne	a0,a4,.L34
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL9mmc3_ctrl
	lbu	s1,0(s0)
	sb	a1,0(s0)
	xor	a1,a1,s1
	andi	a5,a1,64
	bne	a5,zero,.L69
.L53:
	slli	a1,a1,24
	srai	a1,a1,24
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	bge	a1,zero,.L34
.L54:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncCHRv
.L45:
	.cfi_restore_state
	beq	a0,a2,.L50
	beq	a0,a4,.L51
	li	a4,49152
	addi	a4,a4,1
	bne	a0,a4,.L34
	la a4, _ZL9IRQReload; sb a5, 0(a4);
	j	.L34
.L67:
	srli	a0,a0,13
	addi	a0,a0,-4
	andi	a0,a0,0xff
	lla	a4,_ZL9mmc1_regs
	add	a4,a4,a0
	sb	a5,0(a4)
	la a5, _ZL10mmc1_shift; sb zero, 0(a5);
	la a5, _ZL11mmc1_buffer; sb zero, 0(a5);
	li	a5,2
	beq	a0,a5,.L56
	bgtu	a0,a5,.L57
	bne	a0,zero,.L59
	call	_ZL7SyncMIRv
.L56:
	call	_ZL7SyncCHRv
.L59:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPRGv
.L40:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL9vrc2_mirr; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncMIRv
.L68:
	.cfi_restore_state
	srli	a4,a0,10
	andi	a5,a0,2
	or	a5,a5,a4
	srli	a5,a5,1
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,_ZL8vrc2_chr
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	a0,a0,2
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a5,a5,a3
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a4)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncCHRv
.L66:
	.cfi_restore_state
	lla	a4,_ZL9mmc1_regs
	lbu	a5,0(a4)
	la a3, _ZL10mmc1_shift; sb zero, 0(a3);
	la a3, _ZL11mmc1_buffer; sb zero, 0(a3);
	ori	a5,a5,12
	sb	a5,0(a4)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPRGv
.L41:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL8vrc2_prg+1; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPRGv
.L57:
	.cfi_restore_state
	li	a5,3
	beq	a0,a5,.L59
	j	.L34
.L46:
	la a5, _ZL9mmc3_ctrl; lbu a5, 0(a5);
	andi	a5,a5,7
	lla	a4,_ZL9mmc3_regs
	add	a4,a4,a5
	sb	a1,0(a4)
	li	a4,5
	bleu	a5,a4,.L54
	j	.L59
.L47:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL9mmc3_mirr; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncMIRv
.L44:
	.cfi_restore_state
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	j	.L34
.L51:
	la a4, _ZL4IRQa; sb a5, 0(a4);
	j	.L34
.L50:
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, _ZL4IRQa; sb zero, 0(a5);
	j	.L34
.L69:
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_ZL7SyncPRGv
	lbu	a1,0(s0)
	xor	a1,s1,a1
	j	.L53
	.cfi_endproc
.LFE11:
	.size	_ZL12UNLSL12Writejh, .-_ZL12UNLSL12Writejh
	.section	.text._ZL12UNLSL12HBIRQv,"ax",@progbits
	.align	2
	.type	_ZL12UNLSL12HBIRQv, @function
_ZL12UNLSL12HBIRQv:
.LFB12:
	.cfi_startproc
	la a5, _ZL4mode; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,1
	beq	a5,a4,.L83
.L70:
	ret
.L83:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L84
.L73:
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a3, _ZL9IRQReload; sb zero, 0(a3);
.L75:
	sb	a5,0(a4)
	bne	a5,zero,.L70
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L70
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L84:
	la a3, _ZL9IRQReload; lbu a3, 0(a3);
	bne	a3,zero,.L73
	addi	a5,a5,-1
	andi	a5,a5,0xff
	j	.L75
	.cfi_endproc
.LFE12:
	.size	_ZL12UNLSL12HBIRQv, .-_ZL12UNLSL12HBIRQv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncMIRv
	.cfi_endproc
.LFE13:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL16UNLSL12ModeWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNLSL12ModeWritejh, @function
_ZL16UNLSL12ModeWritejh:
.LFB10:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,256
	and	a4,a0,a5
	beq	a4,a5,.L96
	ret
.L96:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL4mode; sb a1, 0(a5);
	andi	a0,a0,1
	beq	a0,zero,.L89
	li	a5,12
	la a4, _ZL9mmc1_regs; sb a5, 0(a4);
	la a5, _ZL9mmc1_regs+3; sb zero, 0(a5);
	la a5, _ZL11mmc1_buffer; sb zero, 0(a5);
	la a5, _ZL10mmc1_shift; sb zero, 0(a5);
.L89:
	call	_ZL7SyncPRGv
	call	_ZL7SyncCHRv
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncMIRv
	.cfi_endproc
.LFE10:
	.size	_ZL16UNLSL12ModeWritejh, .-_ZL16UNLSL12ModeWritejh
	.section	.text._Z12UNLSL12_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLSL12_InitP8CartInfo
	.hidden	_Z12UNLSL12_InitP8CartInfo
	.type	_Z12UNLSL12_InitP8CartInfo, @function
_Z12UNLSL12_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	lla	a5,_ZL12UNLSL12Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNLSL12HBIRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE15:
	.size	_Z12UNLSL12_InitP8CartInfo, .-_Z12UNLSL12_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MODE"
	.align	2
.LC1:
	.string	"VRCC"
	.align	2
.LC2:
	.string	"VRCP"
	.align	2
.LC3:
	.string	"VRCM"
	.align	2
.LC4:
	.string	"M3RG"
	.align	2
.LC5:
	.string	"M3CT"
	.align	2
.LC6:
	.string	"M3MR"
	.align	2
.LC7:
	.string	"IRQR"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"IRQL"
	.align	2
.LC10:
	.string	"IRQA"
	.align	2
.LC11:
	.string	"M1RG"
	.align	2
.LC12:
	.string	"M1BF"
	.align	2
.LC13:
	.string	"M1MR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 180
_ZL9StateRegs:
	.word	_ZL4mode
	.word	1
	.word	.LC0
	.word	_ZL8vrc2_chr
	.word	8
	.word	.LC1
	.word	_ZL8vrc2_prg
	.word	2
	.word	.LC2
	.word	_ZL9vrc2_mirr
	.word	1
	.word	.LC3
	.word	_ZL9mmc3_regs
	.word	10
	.word	.LC4
	.word	_ZL9mmc3_ctrl
	.word	1
	.word	.LC5
	.word	_ZL9mmc3_mirr
	.word	1
	.word	.LC6
	.word	_ZL9IRQReload
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	1
	.word	.LC8
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC9
	.word	_ZL4IRQa
	.word	1
	.word	.LC10
	.word	_ZL9mmc1_regs
	.word	4
	.word	.LC11
	.word	_ZL11mmc1_buffer
	.word	1
	.word	.LC12
	.word	_ZL10mmc1_shift
	.word	1
	.word	.LC13
	.word	0
	.zero	8
	.section	.sbss._ZL10mmc1_shift,"aw",@nobits
	.type	_ZL10mmc1_shift, @object
	.size	_ZL10mmc1_shift, 1
_ZL10mmc1_shift:
	.zero	1
	.section	.sbss._ZL11mmc1_buffer,"aw",@nobits
	.type	_ZL11mmc1_buffer, @object
	.size	_ZL11mmc1_buffer, 1
_ZL11mmc1_buffer:
	.zero	1
	.section	.sbss._ZL9mmc1_regs,"aw",@nobits
	.align	2
	.type	_ZL9mmc1_regs, @object
	.size	_ZL9mmc1_regs, 4
_ZL9mmc1_regs:
	.zero	4
	.section	.sbss._ZL9IRQReload,"aw",@nobits
	.type	_ZL9IRQReload, @object
	.size	_ZL9IRQReload, 1
_ZL9IRQReload:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL9mmc3_mirr,"aw",@nobits
	.type	_ZL9mmc3_mirr, @object
	.size	_ZL9mmc3_mirr, 1
_ZL9mmc3_mirr:
	.zero	1
	.section	.sbss._ZL9mmc3_ctrl,"aw",@nobits
	.type	_ZL9mmc3_ctrl, @object
	.size	_ZL9mmc3_ctrl, 1
_ZL9mmc3_ctrl:
	.zero	1
	.section	.bss._ZL9mmc3_regs,"aw",@nobits
	.align	2
	.type	_ZL9mmc3_regs, @object
	.size	_ZL9mmc3_regs, 10
_ZL9mmc3_regs:
	.zero	10
	.section	.sbss._ZL9vrc2_mirr,"aw",@nobits
	.type	_ZL9vrc2_mirr, @object
	.size	_ZL9vrc2_mirr, 1
_ZL9vrc2_mirr:
	.zero	1
	.section	.sbss._ZL8vrc2_prg,"aw",@nobits
	.align	2
	.type	_ZL8vrc2_prg, @object
	.size	_ZL8vrc2_prg, 2
_ZL8vrc2_prg:
	.zero	2
	.section	.sbss._ZL8vrc2_chr,"aw",@nobits
	.align	2
	.type	_ZL8vrc2_chr, @object
	.size	_ZL8vrc2_chr, 8
_ZL8vrc2_chr:
	.zero	8
	.section	.sbss._ZL4mode,"aw",@nobits
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
