#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bandai.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10BandaiReadj,"ax",@progbits
	.align	2
	.type	_ZL10BandaiReadj, @function
_ZL10BandaiReadj:
.LFB11:
	.cfi_startproc
	la a0, X+24; lbu a0, 0(a0);
	la a5, _ZL10x24c0x_out; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a0,a0,-17
	or	a0,a0,a5
	andi	a0,a0,0xff
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL10BandaiReadj, .-_ZL10BandaiReadj
	.section	.text._ZL11BarcodeReadj,"ax",@progbits
	.align	2
	.type	_ZL11BarcodeReadj, @function
_ZL11BarcodeReadj:
.LFB22:
	.cfi_startproc
	la a0, _ZL10BarcodeOut; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE22:
	.size	_ZL11BarcodeReadj, .-_ZL11BarcodeReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s3,_ZL3reg
	la a4, _ZL5is153; lbu a4, 0(a4);
	lbu	a5,0(s3)
	bne	a4,zero,.L16
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,s3
	li	s0,0
	li	s2,8192
.L7:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L7
	lbu	a1,8(s3)
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
.L6:
	lbu	a5,9(s3)
	li	a4,2
	li	a0,2
	andi	a5,a5,3
	beq	a5,a4,.L15
	li	a4,3
	li	a0,3
	beq	a5,a4,.L15
	li	a4,1
	li	a0,1
	bne	a5,a4,.L15
	li	a0,0
.L15:
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L16:
	.cfi_restore_state
	slli	a5,a5,4
	li	a0,0
	andi	s0,a5,16
	call	_Z7setchr8j
	lbu	a1,8(s3)
	li	a0,32768
	andi	a1,a1,15
	or	a1,a1,s0
	call	_Z8setprg16jj
	ori	a1,s0,15
	li	a0,49152
	call	_Z8setprg16jj
	j	.L6
	.cfi_endproc
.LFE9:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB14:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE14:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL11BandaiPowerv,"ax",@progbits
	.align	2
	.type	_ZL11BandaiPowerv, @function
_ZL11BandaiPowerv:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL9x24c0x_oe; sb zero, 0(a5);
	la a5, _ZL10x24c0x_scl; sb zero, 0(a5);
	la a5, _ZL10x24c0x_sda; sb zero, 0(a5);
	la a5, _ZL15x24c0x_bitcount; sb zero, 0(a5);
	la a5, _ZL12x24c0x_latch; sb zero, 0(a5);
	la a5, _ZL11x24c0x_word; sb zero, 0(a5);
	la a5, _ZL11x24c0x_addr; sb zero, 0(a5);
	la a5, _ZL12x24c0x_state; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_ZL10BandaiReadj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL11BandaiWritejh
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE13:
	.size	_ZL11BandaiPowerv, .-_ZL11BandaiPowerv
	.section	.text._ZL9M157Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M157Powerv, @function
_ZL9M157Powerv:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,-1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL11BarcodeData; sb a5, 0(a4);
	li	s0,65536
	la a5, _ZL14BarcodeReadPos; sw zero, 0(a5);
	la a5, _ZL10BarcodeOut; sw zero, 0(a5);
	la a5, _ZL17BarcodeCycleCount; sw zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL11BandaiWritejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	lla	a2,_ZL11BarcodeReadj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
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
.LFE23:
	.size	_ZL9M157Powerv, .-_ZL9M157Powerv
	.section	.text._ZL11BandaiWritejh,"ax",@progbits
	.align	2
	.type	_ZL11BandaiWritejh, @function
_ZL11BandaiWritejh:
.LFB10:
	.cfi_startproc
	andi	a0,a0,15
	li	a5,9
	bleu	a0,a5,.L62
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	li	a5,12
	.cfi_offset 1, -4
	beq	a0,a5,.L24
	bgtu	a0,a5,.L25
	li	a5,10
	beq	a0,a5,.L63
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
.L22:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L25:
	.cfi_restore_state
	li	a5,13
	bne	a0,a5,.L22
	sw	s0,24(sp)
	lla	a3,_ZL10x24c0x_scl
	lbu	a4,0(a3)
	srli	a2,a1,7
	srli	a5,a1,6
	.cfi_offset 8, -8
	srli	s0,a1,5
	la a1, _ZL9x24c0x_oe; sb a2, 0(a1);
	andi	a5,a5,1
	andi	s0,s0,1
	bne	a4,zero,.L64
	beq	s0,zero,.L61
	lla	a1,_ZL12x24c0x_state
	lbu	a4,0(a1)
	li	a2,3
	beq	a4,a2,.L35
	bgtu	a4,a2,.L36
	li	a2,1
	beq	a4,a2,.L37
	li	a2,2
	bne	a4,a2,.L61
	lla	a4,_ZL15x24c0x_bitcount
	lbu	a2,0(a4)
	li	a0,8
	beq	a2,a0,.L65
	lla	a6,_ZL11x24c0x_word
	lbu	a0,0(a6)
	li	a7,16
	slli	a0,a0,1
	or	a0,a5,a0
	sb	a0,0(a6)
	beq	a2,a7,.L47
	addi	a2,a2,1
	andi	a2,a2,0xff
.L46:
	sb	a2,0(a4)
	lla	a4,_ZL10x24c0x_sda
.L32:
	sb	a5,0(a4)
	sb	s0,0(a3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L62:
	lla	a5,_ZL3reg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L63:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	li	a0,1
	sw	s0,24(sp)
	sw	a1,12(sp)
	.cfi_offset 8, -8
	call	_Z12X6502_IRQEndi
	lw	a1,12(sp)
	lw	ra,28(sp)
	.cfi_restore 1
	la a5, _ZL8IRQLatch; lhu a5, 0(a5);
	andi	s0,a1,1
	la a4, _ZL4IRQa; sb s0, 0(a4);
	lw	s0,24(sp)
	.cfi_restore 8
	la a4, _ZL8IRQCount; sh a5, 0(a4);
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L24:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	lla	a4,_ZL8IRQLatch
	lbu	a5,0(a4)
	sw	s0,24(sp)
	.cfi_offset 8, -8
	slli	s0,a1,8
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	or	a5,a5,s0
	lw	s0,24(sp)
	.cfi_restore 8
	sh	a5,0(a4)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L64:
	.cfi_restore_state
	lla	a4,_ZL10x24c0x_sda
	beq	s0,zero,.L32
	lbu	a2,0(a4)
	bne	a2,zero,.L66
	beq	a5,zero,.L32
	la a2, _ZL12x24c0x_state; sb zero, 0(a2);
	j	.L32
.L68:
	la a2, _ZL11x24c0x_word; lbu a2, 0(a2);
	lla	a4,_ZL11x24c0x_data
	add	a4,a4,a2
	lbu	a4,0(a4)
	la a2, _ZL10x24c0x_out; sb zero, 0(a2);
	la a2, _ZL15x24c0x_bitcount; sb zero, 0(a2);
	la a2, _ZL12x24c0x_latch; sb a4, 0(a2);
.L61:
	lla	a4,_ZL10x24c0x_sda
	j	.L32
.L66:
	bne	a5,zero,.L32
	li	a2,1
	la a1, _ZL12x24c0x_state; sb a2, 0(a1);
	la a2, _ZL15x24c0x_bitcount; sb zero, 0(a2);
	la a2, _ZL11x24c0x_addr; sb zero, 0(a2);
	j	.L32
.L36:
	li	a2,4
	bne	a4,a2,.L61
	lla	a4,_ZL15x24c0x_bitcount
	lbu	a2,0(a4)
	li	a1,8
	beq	a2,a1,.L67
	lla	a0,_ZL12x24c0x_latch
	lbu	a1,0(a0)
	addi	a2,a2,1
	andi	a2,a2,0xff
	slli	a1,a1,1
	or	a1,a5,a1
	andi	a1,a1,0xff
	sb	a1,0(a0)
	sb	a2,0(a4)
	li	a0,8
	lla	a4,_ZL10x24c0x_sda
	bne	a2,a0,.L32
	lla	a6,_ZL11x24c0x_word
	lbu	a2,0(a6)
	lla	a0,_ZL11x24c0x_data
	add	a0,a0,a2
	addi	a2,a2,1
	sb	a1,0(a0)
	sb	a2,0(a6)
	j	.L32
.L35:
	lla	a6,_ZL15x24c0x_bitcount
	lbu	a4,0(a6)
	li	a0,8
	beq	a4,a0,.L68
	lla	a7,_ZL12x24c0x_latch
	lbu	a1,0(a7)
	addi	a4,a4,1
	andi	a2,a4,0xff
	srli	a4,a1,7
	slli	a1,a1,1
	la t1, _ZL10x24c0x_out; sb a4, 0(t1);
	sb	a1,0(a7)
	sb	a2,0(a6)
	lla	a4,_ZL10x24c0x_sda
	bne	a2,a0,.L32
	lla	a1,_ZL11x24c0x_word
	lbu	a2,0(a1)
	addi	a2,a2,1
	sb	a2,0(a1)
	j	.L32
.L37:
	lla	a4,_ZL15x24c0x_bitcount
	lbu	a2,0(a4)
	li	a0,6
	bgtu	a2,a0,.L40
	lla	a0,_ZL11x24c0x_addr
	lbu	a1,0(a0)
	slli	a1,a1,1
	or	a1,a5,a1
	sb	a1,0(a0)
.L41:
	addi	a2,a2,1
	sb	a2,0(a4)
	lla	a4,_ZL10x24c0x_sda
	j	.L32
.L40:
	la a0, _ZL6x24c02; lbu a0, 0(a0);
	bne	a0,zero,.L42
	la a0, _ZL11x24c0x_addr; lbu a0, 0(a0);
	la a6, _ZL11x24c0x_word; sb a0, 0(a6);
	bne	a5,zero,.L44
	li	a0,4
	sb	a0,0(a1)
	j	.L41
.L67:
	la a4, _ZL10x24c0x_out; sb zero, 0(a4);
	la a4, _ZL12x24c0x_latch; sb zero, 0(a4);
	la a4, _ZL15x24c0x_bitcount; sb zero, 0(a4);
	lla	a4,_ZL10x24c0x_sda
	j	.L32
.L65:
	la a2, _ZL11x24c0x_word; sb zero, 0(a2);
	la a2, _ZL10x24c0x_out; sb zero, 0(a2);
	li	a2,9
	j	.L46
.L44:
	li	a0,3
	sb	a0,0(a1)
	j	.L41
.L42:
	bne	a5,zero,.L44
	li	a0,2
	sb	a0,0(a1)
	j	.L41
.L47:
	li	a2,4
	sb	a2,0(a1)
	li	a2,8
	j	.L46
	.cfi_endproc
.LFE10:
	.size	_ZL11BandaiWritejh, .-_ZL11BandaiWritejh
	.section	.text._ZL9M153Closev,"ax",@progbits
	.align	2
	.type	_ZL9M153Closev, @function
_ZL9M153Closev:
.LFB18:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L75
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L75:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE18:
	.size	_ZL9M153Closev, .-_ZL9M153Closev
	.section	.text._ZL9M153Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M153Powerv, @function
_ZL9M153Powerv:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11BandaiWritejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE17:
	.size	_ZL9M153Powerv, .-_ZL9M153Powerv
	.section	.text._ZL13BandaiIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL13BandaiIRQHooki, @function
_ZL13BandaiIRQHooki:
.LFB12:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L85
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQCount
	lhu	a5,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	sub	a0,a5,a0
	slli	a0,a0,16
	srai	a0,a0,16
	sh	a0,0(s0)
	blt	a0,zero,.L88
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L85:
	ret
.L88:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,-1
	lw	ra,12(sp)
	.cfi_restore 1
	sh	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_ZL13BandaiIRQHooki, .-_ZL13BandaiIRQHooki
	.section	.text._ZL14BarcodeIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14BarcodeIRQHooki, @function
_ZL14BarcodeIRQHooki:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	beq	a5,zero,.L91
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL8IRQCount
	lhu	a5,0(s1)
	sub	a5,a5,a0
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a5,0(s1)
	blt	a5,zero,.L98
	lw	s1,4(sp)
	.cfi_restore 9
.L91:
	lla	a5,_ZL17BarcodeCycleCount
	lw	a3,0(a5)
	li	a4,999
	add	a0,s0,a3
	bgt	a0,a4,.L93
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	a0,0(a5)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L93:
	.cfi_restore_state
	lla	a2,_ZL14BarcodeReadPos
	lw	a3,0(a2)
	lla	a4,_ZL11BarcodeData
	addi	a0,a0,-1000
	add	a4,a4,a3
	lbu	a4,0(a4)
	sw	a0,0(a5)
	li	a5,255
	beq	a4,a5,.L99
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	xori	a4,a4,1
	slli	a4,a4,3
	addi	a3,a3,1
	la a5, _ZL10BarcodeOut; sw a4, 0(a5);
	sw	a3,0(a2)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L99:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	la a5, _ZL10BarcodeOut; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L98:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,-1
	sh	a5,0(s1)
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L91
	.cfi_endproc
.LFE21:
	.size	_ZL14BarcodeIRQHooki, .-_ZL14BarcodeIRQHooki
	.section	.rodata._Z13Mapper16_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"DATA"
	.section	.text._Z13Mapper16_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper16_InitP8CartInfo
	.hidden	_Z13Mapper16_InitP8CartInfo
	.type	_Z13Mapper16_InitP8CartInfo, @function
_Z13Mapper16_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	mv	a5,a0
	lla	a3,_ZL11BandaiPowerv
	li	a4,1
	sw	a3,0(a5)
	lla	a0,_ZL11x24c0x_data
	li	a3,256
	sw	a4,48(a5)
	sw	a0,12(a5)
	sw	a3,28(a5)
	la a5, _ZL6x24c02; sb a4, 0(a5);
	la a5, _ZL5is153; sb zero, 0(a5);
	lla	a5,_ZL13BandaiIRQHooki
	lla	a3,.LC4
	li	a2,0
	li	a1,256
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL15x24c0xStateRegs
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE15:
	.size	_Z13Mapper16_InitP8CartInfo, .-_Z13Mapper16_InitP8CartInfo
	.section	.text._Z14Mapper159_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper159_InitP8CartInfo
	.hidden	_Z14Mapper159_InitP8CartInfo
	.type	_Z14Mapper159_InitP8CartInfo, @function
_Z14Mapper159_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	mv	a5,a0
	lla	a4,_ZL11BandaiPowerv
	sw	a4,0(a5)
	li	a4,1
	sw	a4,48(a5)
	lla	a0,_ZL11x24c0x_data
	li	a4,128
	sw	a4,28(a5)
	sw	a0,12(a5)
	la a5, _ZL6x24c02; sb zero, 0(a5);
	la a5, _ZL5is153; sb zero, 0(a5);
	lla	a5,_ZL13BandaiIRQHooki
	lla	a3,.LC4
	li	a2,0
	li	a1,128
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL15x24c0xStateRegs
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE16:
	.size	_Z14Mapper159_InitP8CartInfo, .-_Z14Mapper159_InitP8CartInfo
	.section	.rodata._Z14Mapper153_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"WRAM"
	.section	.text._Z14Mapper153_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper153_InitP8CartInfo
	.hidden	_Z14Mapper153_InitP8CartInfo
	.type	_Z14Mapper153_InitP8CartInfo, @function
_Z14Mapper153_InitP8CartInfo:
.LFB19:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lla	a5,_ZL9M153Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M153Closev
	sw	a5,8(a0)
	li	a5,1
	la a4, _ZL5is153; sb a5, 0(a4);
	lla	a5,_ZL13BandaiIRQHooki
	lla	s1,_ZL8WRAMSIZE
	mv	s0,a0
	la a4, MapIRQHook; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s2,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s2)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC5
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L105
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L105:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE19:
	.size	_Z14Mapper153_InitP8CartInfo, .-_Z14Mapper153_InitP8CartInfo
	.globl	__umodsi3
	.globl	__modsi3
	.section	.text._Z15FCEUI_DatachSetPKh,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_DatachSetPKh
	.hidden	_Z15FCEUI_DatachSetPKh
	.type	_Z15FCEUI_DatachSetPKh, @function
_Z15FCEUI_DatachSetPKh:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-1120
	.cfi_def_cfa_offset 1120
	sw	ra,1116(sp)
	sw	s0,1112(sp)
	lla	a5,.LANCHOR0
	addi	a4,sp,24
	lla	a7,.LANCHOR0+240
	.cfi_offset 1, -4
	.cfi_offset 8, -8
.L111:
	lw	a6,0(a5)
	lw	a1,4(a5)
	lw	a2,8(a5)
	lw	a3,12(a5)
	sw	a6,0(a4)
	sw	a1,4(a4)
	sw	a2,8(a4)
	sw	a3,12(a4)
	addi	a5,a5,16
	addi	a4,a4,16
	bne	a5,a7,.L111
	lla	a5,.LANCHOR0+240
	addi	a4,sp,264
	lla	t1,.LANCHOR0+520
.L112:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t1,.L112
	lla	a5,.LANCHOR0+520
	addi	a4,sp,544
	lla	t1,.LANCHOR0+800
.L113:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t1,.L113
	lla	a5,.LANCHOR0+800
	addi	a4,sp,824
	lla	t1,.LANCHOR0+1080
.L114:
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a1,8(a5)
	lw	a2,12(a5)
	lw	a3,16(a5)
	sw	a7,0(a4)
	sw	a6,4(a4)
	sw	a1,8(a4)
	sw	a2,12(a4)
	sw	a3,16(a4)
	addi	a5,a5,20
	addi	a4,a4,20
	bne	a5,t1,.L114
	addi	s0,sp,8
	mv	a2,s0
	li	a4,0
	li	a1,9
	li	a6,13
.L117:
	add	a5,a0,a4
	lbu	a3,0(a5)
	addi	a5,a3,-48
	andi	a5,a5,0xff
	beq	a3,zero,.L115
	sb	a5,0(a2)
	addi	a4,a4,1
	bgtu	a5,a1,.L116
	addi	a2,a2,1
	bne	a4,a6,.L117
	sw	s1,1108(sp)
	li	a3,1
	.cfi_offset 9, -12
.L118:
	lla	s1,_ZL11BarcodeData
	lla	a4,_ZL11BarcodeData+32
	mv	a5,s1
.L121:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a5,a4,.L121
	li	a5,1
	sh	a5,32(s1)
	sb	a5,34(s1)
	lbu	a4,8(sp)
	bleu	a3,a5,.L169
	mv	a2,s0
	li	a0,0
	li	a4,0
	li	a1,7
.L122:
	andi	a3,a4,1
	lbu	a5,0(a2)
	bne	a3,zero,.L135
	slli	a3,a5,1
	add	a5,a3,a5
.L135:
	addi	a4,a4,1
	add	a0,a0,a5
	addi	a2,a2,1
	bne	a4,a1,.L122
	li	a1,10
	call	__umodsi3
	li	a5,10
	li	a1,10
	sub	a0,a5,a0
	call	__umodsi3
	lla	a2,_ZL11BarcodeData+42
	mv	a6,s0
	li	a1,35
	li	a7,63
.L136:
	lbu	a3,0(a6)
	addi	a5,a2,-7
	slli	a4,a3,3
	sub	a4,a4,a3
	slli	a4,a4,2
	addi	a3,sp,264
	add	a4,a3,a4
.L137:
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a3,-1(a5)
	bne	a5,a2,.L137
	addi	a1,a1,7
	addi	a6,a6,1
	addi	a2,a5,7
	bne	a1,a7,.L136
	li	a5,65536
	addi	a5,a5,1
	la a4, _ZL11BarcodeData+63; sb zero, 0(a4);
	sw	a5,64(s1)
	lla	a2,_ZL11BarcodeData+75
	li	a1,68
	li	a6,89
.L139:
	lbu	a3,4(s0)
	addi	a5,a2,-7
	slli	a4,a3,3
	sub	a4,a4,a3
	slli	a4,a4,2
	addi	a3,sp,824
	add	a4,a3,a4
.L140:
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a3,-1(a5)
	bne	a5,a2,.L140
	addi	a1,a1,7
	addi	s0,s0,1
	addi	a2,a5,7
	bne	a1,a6,.L139
	slli	a5,a0,3
	sub	a5,a5,a0
	addi	a4,sp,824
	slli	a5,a5,2
	add	a5,a4,a5
	lla	a2,_ZL11BarcodeData+7
	lla	a4,_ZL11BarcodeData
.L142:
	lw	a3,0(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	sb	a3,88(a4)
	bne	a4,a2,.L142
	li	a3,96
.L133:
	add	a4,s1,a3
	li	a2,1
	addi	a5,a3,3
	sb	a2,0(a4)
	sb	zero,1(a4)
	sb	a2,2(a4)
	lla	a4,_ZL11BarcodeData+35
	add	a5,s1,a5
	add	a4,a4,a3
.L143:
	sb	zero,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L143
	li	a5,-1
	add	s1,s1,a3
	sb	a5,35(s1)
	lw	ra,1116(sp)
	.cfi_restore 1
	lw	s0,1112(sp)
	.cfi_restore 8
	la a5, _ZL14BarcodeReadPos; sw zero, 0(a5);
	li	a5,8
	la a4, _ZL10BarcodeOut; sw a5, 0(a4);
	la a5, _ZL17BarcodeCycleCount; sw zero, 0(a5);
	lw	s1,1108(sp)
	.cfi_restore 9
	li	a0,1
	addi	sp,sp,1120
	.cfi_def_cfa_offset 0
	jr	ra
.L115:
	.cfi_def_cfa_offset 1120
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,8
	addi	a3,a4,-12
	bgt	a4,a5,.L119
	li	a5,6
	ble	a4,a5,.L116
.L168:
	sw	s1,1108(sp)
	.cfi_offset 9, -12
	j	.L118
.L119:
	.cfi_restore 9
	li	a5,1
	bleu	a3,a5,.L168
.L116:
	lw	ra,1116(sp)
	.cfi_restore 1
	lw	s0,1112(sp)
	.cfi_restore 8
	li	a0,0
	addi	sp,sp,1120
	.cfi_def_cfa_offset 0
	jr	ra
.L169:
	.cfi_def_cfa_offset 1120
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,3
	addi	a4,sp,24
	add	a1,a4,a5
	lla	a3,_ZL11BarcodeData+42
	mv	a6,s0
	li	a0,42
	li	a7,84
.L127:
	lw	a4,0(a1)
	lbu	a5,1(a6)
	beq	a4,zero,.L123
	slli	a4,a5,3
	sub	a4,a4,a5
	slli	a4,a4,2
	addi	a5,sp,544
	add	a4,a5,a4
	addi	a5,a3,-7
.L124:
	lw	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a2,-1(a5)
	bne	a3,a5,.L124
	addi	a0,a0,7
	addi	a1,a1,4
	addi	a6,a6,1
	addi	a3,a3,7
	bne	a0,a7,.L127
.L170:
	li	a5,1
	la a4, _ZL11BarcodeData+77; sb zero, 0(a4);
	sh	a5,78(s1)
	sh	a5,80(s1)
	addi	a0,sp,15
	lla	a2,_ZL11BarcodeData+89
	li	a1,82
	li	a6,117
.L128:
	lbu	a3,0(a0)
	addi	a5,a2,-7
	slli	a4,a3,3
	sub	a4,a4,a3
	slli	a4,a4,2
	addi	a3,sp,824
	add	a4,a3,a4
.L129:
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a3,-1(a5)
	bne	a2,a5,.L129
	addi	a1,a1,7
	addi	a0,a0,1
	addi	a2,a2,7
	bne	a1,a6,.L128
	li	a0,0
	li	a5,0
	li	a2,12
.L130:
	andi	a3,a5,1
	lbu	a4,0(s0)
	addi	a5,a5,1
	beq	a3,zero,.L131
	slli	a3,a4,1
	add	a4,a3,a4
.L131:
	addi	s0,s0,1
	add	a0,a0,a4
	bne	a5,a2,.L130
	li	a1,10
	call	__umodsi3
	li	a5,10
	sub	a0,a5,a0
	li	a1,10
	call	__umodsi3
	slli	a5,a0,3
	sub	a4,a5,a0
	slli	a4,a4,2
	addi	a5,sp,824
	add	a4,a5,a4
	lla	s0,_ZL11BarcodeData+7
	lla	a5,_ZL11BarcodeData
.L132:
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a3,116(a5)
	bne	s0,a5,.L132
	li	a3,124
	j	.L133
.L123:
	slli	a4,a5,3
	sub	a4,a4,a5
	slli	a4,a4,2
	addi	a5,sp,264
	add	a4,a5,a4
	addi	a5,a3,-7
.L126:
	lw	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,4
	sb	a2,-1(a5)
	bne	a3,a5,.L126
	addi	a0,a0,7
	addi	a1,a1,4
	addi	a6,a6,1
	addi	a3,a3,7
	bne	a0,a7,.L127
	j	.L170
	.cfi_endproc
.LFE20:
	.size	_Z15FCEUI_DatachSetPKh, .-_Z15FCEUI_DatachSetPKh
	.section	.text._Z14Mapper157_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper157_InitP8CartInfo
	.hidden	_Z14Mapper157_InitP8CartInfo
	.type	_Z14Mapper157_InitP8CartInfo, @function
_Z14Mapper157_InitP8CartInfo:
.LFB24:
	.cfi_startproc
	lla	a5,_ZL9M157Powerv
	sw	a5,0(a0)
	la a4, GameInfo; lw a4, 0(a4);
	li	a5,1
	sw	a5,28(a4)
	la a4, _ZL5is153; sb a5, 0(a4);
	lla	a5,_ZL14BarcodeIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE24:
	.size	_Z14Mapper157_InitP8CartInfo, .-_Z14Mapper157_InitP8CartInfo
	.section	.sbss._ZL10BarcodeOut,"aw",@nobits
	.align	2
	.type	_ZL10BarcodeOut, @object
	.size	_ZL10BarcodeOut, 4
_ZL10BarcodeOut:
	.zero	4
	.section	.sbss._ZL17BarcodeCycleCount,"aw",@nobits
	.align	2
	.type	_ZL17BarcodeCycleCount, @object
	.size	_ZL17BarcodeCycleCount, 4
_ZL17BarcodeCycleCount:
	.zero	4
	.section	.sbss._ZL14BarcodeReadPos,"aw",@nobits
	.align	2
	.type	_ZL14BarcodeReadPos, @object
	.size	_ZL14BarcodeReadPos, 4
_ZL14BarcodeReadPos:
	.zero	4
	.section	.bss._ZL11BarcodeData,"aw",@nobits
	.align	2
	.type	_ZL11BarcodeData, @object
	.size	_ZL11BarcodeData, 256
_ZL11BarcodeData:
	.zero	256
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"ADDR"
	.align	2
.LC7:
	.string	"WORD"
	.align	2
.LC8:
	.string	"LATC"
	.align	2
.LC9:
	.string	"BITC"
	.align	2
.LC10:
	.string	"SDA"
	.align	2
.LC11:
	.string	"SCL"
	.align	2
.LC12:
	.string	"OUT"
	.align	2
.LC13:
	.string	"OE"
	.align	2
.LC14:
	.string	"STAT"
	.section	.data._ZL15x24c0xStateRegs,"aw"
	.align	2
	.type	_ZL15x24c0xStateRegs, @object
	.size	_ZL15x24c0xStateRegs, 120
_ZL15x24c0xStateRegs:
	.word	_ZL11x24c0x_addr
	.word	1
	.word	.LC6
	.word	_ZL11x24c0x_word
	.word	1
	.word	.LC7
	.word	_ZL12x24c0x_latch
	.word	1
	.word	.LC8
	.word	_ZL15x24c0x_bitcount
	.word	1
	.word	.LC9
	.word	_ZL10x24c0x_sda
	.word	1
	.word	.LC10
	.word	_ZL10x24c0x_scl
	.word	1
	.word	.LC11
	.word	_ZL10x24c0x_out
	.word	1
	.word	.LC12
	.word	_ZL9x24c0x_oe
	.word	1
	.word	.LC13
	.word	_ZL12x24c0x_state
	.word	1
	.word	.LC14
	.word	0
	.zero	8
	.section	.sbss._ZL9x24c0x_oe,"aw",@nobits
	.type	_ZL9x24c0x_oe, @object
	.size	_ZL9x24c0x_oe, 1
_ZL9x24c0x_oe:
	.zero	1
	.section	.sbss._ZL10x24c0x_out,"aw",@nobits
	.type	_ZL10x24c0x_out, @object
	.size	_ZL10x24c0x_out, 1
_ZL10x24c0x_out:
	.zero	1
	.section	.sbss._ZL10x24c0x_scl,"aw",@nobits
	.type	_ZL10x24c0x_scl, @object
	.size	_ZL10x24c0x_scl, 1
_ZL10x24c0x_scl:
	.zero	1
	.section	.sbss._ZL10x24c0x_sda,"aw",@nobits
	.type	_ZL10x24c0x_sda, @object
	.size	_ZL10x24c0x_sda, 1
_ZL10x24c0x_sda:
	.zero	1
	.section	.sbss._ZL15x24c0x_bitcount,"aw",@nobits
	.type	_ZL15x24c0x_bitcount, @object
	.size	_ZL15x24c0x_bitcount, 1
_ZL15x24c0x_bitcount:
	.zero	1
	.section	.sbss._ZL12x24c0x_latch,"aw",@nobits
	.type	_ZL12x24c0x_latch, @object
	.size	_ZL12x24c0x_latch, 1
_ZL12x24c0x_latch:
	.zero	1
	.section	.sbss._ZL11x24c0x_word,"aw",@nobits
	.type	_ZL11x24c0x_word, @object
	.size	_ZL11x24c0x_word, 1
_ZL11x24c0x_word:
	.zero	1
	.section	.sbss._ZL11x24c0x_addr,"aw",@nobits
	.type	_ZL11x24c0x_addr, @object
	.size	_ZL11x24c0x_addr, 1
_ZL11x24c0x_addr:
	.zero	1
	.section	.sbss._ZL12x24c0x_state,"aw",@nobits
	.type	_ZL12x24c0x_state, @object
	.size	_ZL12x24c0x_state, 1
_ZL12x24c0x_state:
	.zero	1
	.section	.bss._ZL11x24c0x_data,"aw",@nobits
	.align	2
	.type	_ZL11x24c0x_data, @object
	.size	_ZL11x24c0x_data, 256
_ZL11x24c0x_data:
	.zero	256
	.section	.rodata.str1.4
	.align	2
.LC15:
	.string	"REGS"
	.align	2
.LC16:
	.string	"IRQA"
	.align	2
.LC17:
	.string	"IRQC"
	.align	2
.LC18:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3reg
	.word	16
	.word	.LC15
	.word	_ZL4IRQa
	.word	1
	.word	.LC16
	.word	_ZL8IRQCount
	.word	2
	.word	.LC17
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC18
	.word	0
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL6x24c02,"aw",@nobits
	.type	_ZL6x24c02, @object
	.size	_ZL6x24c02, 1
_ZL6x24c02:
	.zero	1
	.section	.sbss._ZL5is153,"aw",@nobits
	.type	_ZL5is153, @object
	.size	_ZL5is153, 1
_ZL5is153:
	.zero	1
	.section	.bss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 16
_ZL3reg:
	.zero	16
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
.LC1:
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
.LC2:
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
.LC3:
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
