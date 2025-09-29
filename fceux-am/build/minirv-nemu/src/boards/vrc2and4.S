#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc2and4.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._ZL10VRC24_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._ZL10VRC24_InitP8CartInfo,"ax",@progbits
	.align	2
	.type	_ZL10VRC24_InitP8CartInfo, @function
_ZL10VRC24_InitP8CartInfo:
.LFB12:
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
	lla	a5,_ZL10VRC24Powerv
	sw	a5,0(a0)
	lla	a5,_ZL10VRC24Closev
	sw	a5,8(a0)
	lla	a5,_Z12VRC24IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s1,_ZL8WRAMSIZE
	mv	s0,a0
	la a4, GameStateRestore; sw a5, 0(a4);
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L2
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L2:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_ZL10VRC24_InitP8CartInfo, .-_ZL10VRC24_InitP8CartInfo
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL6prgreg
	lla	s0,_ZL8big_bank
	lbu	a1,0(s1)
	lbu	a4,0(s0)
	la a5, _ZL6regcmd; lbu a5, 0(a5);
	andi	a5,a5,2
	or	a1,a1,a4
	beq	a5,zero,.L9
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,32768
	ori	a1,a1,30
	call	_Z7setprg8jj
.L10:
	lbu	a5,0(s0)
	lbu	a1,1(s1)
	li	a0,40960
	or	a1,a1,a5
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,57344
	ori	a1,a1,31
	call	_Z7setprg8jj
	la a5, UNIFchrrama; lw a5, 0(a5);
	beq	a5,zero,.L11
	li	a0,0
	call	_Z7setchr8j
.L12:
	la a5, _ZL4mirr; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L19
	li	a4,3
	li	a0,3
	beq	a5,a4,.L19
	li	a4,1
	li	a0,1
	bne	a5,a4,.L19
	li	a0,0
.L19:
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L9:
	.cfi_restore_state
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,49152
	ori	a1,a1,30
	call	_Z7setprg8jj
	j	.L10
.L11:
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lla	s2,_ZL5chrhi
	lla	s1,_ZL6chrreg
	li	s0,0
	lla	s4,_ZL4is22
	li	s3,8192
.L13:
	lhu	a5,0(s2)
	lbu	a4,0(s1)
	lbu	a1,0(s4)
	mv	a0,s0
	or	a5,a5,a4
	sra	a1,a5,a1
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s2,s2,2
	addi	s1,s1,1
	bne	s0,s3,.L13
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	j	.L12
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10VRC24Closev,"ax",@progbits
	.align	2
	.type	_ZL10VRC24Closev, @function
_ZL10VRC24Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L27
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
.L27:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL10VRC24Closev, .-_ZL10VRC24Closev
	.section	.text._ZL10VRC24Powerv,"ax",@progbits
	.align	2
	.type	_ZL10VRC24Powerv, @function
_ZL10VRC24Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,32
	sw	s0,8(sp)
	la a4, _ZL8big_bank; sb a5, 0(a4);
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL4WRAM
	call	_ZL4Syncv
	lw	a5,0(s0)
	beq	a5,zero,.L31
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	call	_Z8setprg8rijj
	li	s1,32768
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	a2,0(s0)
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s1,4(sp)
	.cfi_restore 9
.L31:
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
	lla	a2,_ZL10VRC24Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL10VRC24Powerv, .-_ZL10VRC24Powerv
	.section	.text._ZL10VRC24Writejh,"ax",@progbits
	.align	2
	.type	_ZL10VRC24Writejh, @function
_ZL10VRC24Writejh:
.LFB7:
	.cfi_startproc
	la a4, _ZL8reg2mask; lbu a4, 0(a4);
	la a5, _ZL8reg1mask; lbu a5, 0(a5);
	and	a4,a4,a0
	and	a5,a5,a0
	li	a2,61440
	snez	a4,a4
	snez	a5,a5
	and	a0,a0,a2
	slli	a4,a4,1
	or	a5,a5,a0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	or	a5,a5,a4
	li	a3,12288
	li	a4,-45056
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	add	a4,a5,a4
	addi	a3,a3,3
	mv	s0,a1
	bgtu	a4,a3,.L37
	la a3, UNIFchrrama; lw a3, 0(a3);
	beq	a3,zero,.L38
	slli	s0,a1,2
	andi	s0,s0,32
	la a5, _ZL8big_bank; sb s0, 0(a5);
.L59:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L37:
	.cfi_restore_state
	beq	a5,a2,.L41
	bgtu	a5,a2,.L42
	li	a4,36864
	addi	a4,a4,3
	bgtu	a5,a4,.L43
	li	a4,36864
	addi	a4,a4,1
	bgtu	a5,a4,.L44
	li	a4,32768
	addi	a4,a4,3
	li	a3,32768
	bgtu	a5,a4,.L45
	bltu	a5,a3,.L36
	la a5, _ZL8isPirate; lbu a5, 0(a5);
	beq	a5,zero,.L60
.L36:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L38:
	.cfi_restore_state
	srli	a3,a5,1
	andi	a3,a3,1
	srli	a4,a4,11
	or	a4,a3,a4
	slli	a4,a4,16
	srli	a4,a4,16
	lla	a1,_ZL6chrreg
	add	a1,a1,a4
	lbu	a3,0(a1)
	slli	a5,a5,2
	andi	a5,a5,4
	li	a0,240
	sra	a0,a0,a5
	andi	a2,s0,15
	and	a3,a3,a0
	sll	a2,a2,a5
	or	a3,a3,a2
	sb	a3,0(a1)
	beq	a5,zero,.L59
	slli	a4,a4,1
	slli	s0,s0,4
	lla	a5,_ZL5chrhi
	add	a5,a5,a4
	andi	s0,s0,256
	sh	s0,0(a5)
	j	.L59
.L43:
	li	a4,-40960
	add	a5,a5,a4
	li	a4,3
	bgtu	a5,a4,.L36
	la a5, _ZL8isPirate; lbu a5, 0(a5);
	bne	a5,zero,.L53
	andi	s0,a1,31
	lla	a5,_ZL6prgreg
	sb	s0,1(a5)
	j	.L59
.L42:
	li	a4,61440
	addi	a4,a4,2
	beq	a5,a4,.L50
	li	a4,61440
	addi	a4,a4,3
	beq	a5,a4,.L51
	li	a4,61440
	addi	a4,a4,1
	bne	a5,a4,.L36
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lbu	a5,0(a4)
	slli	s0,s0,4
	andi	a5,a5,15
	or	a5,a5,s0
	sb	a5,0(a4)
	j	.L36
.L45:
	li	a4,36864
	sub	a5,a5,a4
	li	a4,1
	bgtu	a5,a4,.L36
	li	a5,255
	beq	a1,a5,.L59
	la a5, _ZL4mirr; sb a1, 0(a5);
	j	.L59
.L41:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lbu	a5,0(a4)
	andi	s0,s0,15
	andi	a5,a5,-16
	or	a5,a5,s0
	sb	a5,0(a4)
	j	.L36
.L44:
	la a5, _ZL6regcmd; sb a1, 0(a5);
	j	.L59
.L51:
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, _ZL6irqcmd; lbu a5, 0(a5);
	la a4, _ZL4IRQa; sb a5, 0(a4);
	j	.L36
.L50:
	li	a0,1
	call	_Z12X6502_IRQEndi
	andi	a5,s0,2
	la a4, _ZL8IRQLatch; lbu a4, 0(a4);
	andi	s0,s0,1
	la a3, _ZL8IRQCount; sh a4, 0(a3);
	la a3, _ZL6acount; sh zero, 0(a3);
	la a4, _ZL4IRQa; sb a5, 0(a4);
	la a5, _ZL6irqcmd; sb s0, 0(a5);
	j	.L36
.L53:
	slli	s0,a1,1
	andi	s0,s0,62
	lla	a5,_ZL6prgreg
	sb	s0,0(a5)
	ori	s0,s0,1
	sb	s0,1(a5)
	j	.L59
.L60:
	andi	s0,a1,31
	la a5, _ZL6prgreg; sb s0, 0(a5);
	j	.L59
	.cfi_endproc
.LFE7:
	.size	_ZL10VRC24Writejh, .-_ZL10VRC24Writejh
	.section	.text._Z12VRC24IRQHooki,"ax",@progbits
	.align	2
	.globl	_Z12VRC24IRQHooki
	.hidden	_Z12VRC24IRQHooki
	.type	_Z12VRC24IRQHooki, @function
_Z12VRC24IRQHooki:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L74
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL6acount
	lhu	a4,0(s1)
	slli	a5,a0,1
	add	a5,a0,a5
	add	a5,a5,a4
	slli	a5,a5,16
	sw	ra,12(sp)
	srli	a5,a5,16
	sh	a5,0(s1)
	li	a4,340
	.cfi_offset 1, -4
	bleu	a5,a4,.L61
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL8IRQCount
	lhu	a3,0(s2)
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,340
.L65:
	li	a0,0
	j	.L66
.L67:
	slli	a5,a1,16
	slli	a3,a4,16
	srli	a5,a5,16
	srli	a3,a3,16
	li	a0,1
	bne	a2,zero,.L78
.L66:
	addi	a4,a3,1
	addi	a1,a5,-341
	andi	a2,a4,256
	bgtu	a5,s0,.L67
	beq	a0,zero,.L77
	sh	a3,0(s2)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s2,0(sp)
	.cfi_restore 18
	sh	a5,0(s1)
.L61:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L74:
	ret
.L78:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	sh	a3,0(s2)
	sh	a5,0(s1)
	call	_Z14X6502_IRQBegini
	la a4, _ZL8IRQLatch; lbu a4, 0(a4);
	slli	a3,a4,16
	lhu	a5,0(s1)
	srli	a3,a3,16
	sh	a4,0(s2)
	j	.L65
.L77:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L61
	.cfi_endproc
.LFE9:
	.size	_Z12VRC24IRQHooki, .-_Z12VRC24IRQHooki
	.section	.text._Z13Mapper21_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper21_InitP8CartInfo
	.hidden	_Z13Mapper21_InitP8CartInfo
	.type	_Z13Mapper21_InitP8CartInfo, @function
_Z13Mapper21_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	la a5, _ZL8isPirate; sb zero, 0(a5);
	la a5, _ZL4is22; sb zero, 0(a5);
	li	a5,66
	la a4, _ZL8reg1mask; sb a5, 0(a4);
	li	a5,-124
	la a4, _ZL8reg2mask; sb a5, 0(a4);
	tail	_ZL10VRC24_InitP8CartInfo
	.cfi_endproc
.LFE13:
	.size	_Z13Mapper21_InitP8CartInfo, .-_Z13Mapper21_InitP8CartInfo
	.section	.text._Z13Mapper22_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper22_InitP8CartInfo
	.hidden	_Z13Mapper22_InitP8CartInfo
	.type	_Z13Mapper22_InitP8CartInfo, @function
_Z13Mapper22_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	lla	a4,_ZL10VRC24Powerv
	li	a5,1
	sw	a4,0(a0)
	la a4, _ZL4is22; sb a5, 0(a4);
	la a4, _ZL8isPirate; sb zero, 0(a4);
	li	a4,2
	la a6, _ZL8reg1mask; sb a4, 0(a6);
	la a4, _ZL8reg2mask; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z13Mapper22_InitP8CartInfo, .-_Z13Mapper22_InitP8CartInfo
	.section	.text._Z13Mapper23_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper23_InitP8CartInfo
	.hidden	_Z13Mapper23_InitP8CartInfo
	.type	_Z13Mapper23_InitP8CartInfo, @function
_Z13Mapper23_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	la a5, _ZL8isPirate; sb zero, 0(a5);
	la a5, _ZL4is22; sb zero, 0(a5);
	li	a5,21
	la a4, _ZL8reg1mask; sb a5, 0(a4);
	li	a5,42
	la a4, _ZL8reg2mask; sb a5, 0(a4);
	tail	_ZL10VRC24_InitP8CartInfo
	.cfi_endproc
.LFE15:
	.size	_Z13Mapper23_InitP8CartInfo, .-_Z13Mapper23_InitP8CartInfo
	.section	.text._Z13Mapper25_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper25_InitP8CartInfo
	.hidden	_Z13Mapper25_InitP8CartInfo
	.type	_Z13Mapper25_InitP8CartInfo, @function
_Z13Mapper25_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	la a5, _ZL8isPirate; sb zero, 0(a5);
	la a5, _ZL4is22; sb zero, 0(a5);
	li	a5,10
	la a4, _ZL8reg1mask; sb a5, 0(a4);
	li	a5,5
	la a4, _ZL8reg2mask; sb a5, 0(a4);
	tail	_ZL10VRC24_InitP8CartInfo
	.cfi_endproc
.LFE16:
	.size	_Z13Mapper25_InitP8CartInfo, .-_Z13Mapper25_InitP8CartInfo
	.section	.text._Z12UNLT230_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLT230_InitP8CartInfo
	.hidden	_Z12UNLT230_InitP8CartInfo
	.type	_Z12UNLT230_InitP8CartInfo, @function
_Z12UNLT230_InitP8CartInfo:
.LFB17:
	.cfi_startproc
	li	a5,1
	la a4, _ZL8isPirate; sb a5, 0(a4);
	la a5, _ZL4is22; sb zero, 0(a5);
	li	a5,21
	la a4, _ZL8reg1mask; sb a5, 0(a4);
	li	a5,42
	la a4, _ZL8reg2mask; sb a5, 0(a4);
	tail	_ZL10VRC24_InitP8CartInfo
	.cfi_endproc
.LFE17:
	.size	_Z12UNLT230_InitP8CartInfo, .-_Z12UNLT230_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"CRGH"
	.align	2
.LC4:
	.string	"CMDR"
	.align	2
.LC5:
	.string	"CMDI"
	.align	2
.LC6:
	.string	"MIRR"
	.align	2
.LC7:
	.string	"BIGB"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"IRQL"
	.align	2
.LC10:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 132
_ZL9StateRegs:
	.word	_ZL6prgreg
	.word	2
	.word	.LC1
	.word	_ZL6chrreg
	.word	8
	.word	.LC2
	.word	_ZL5chrhi
	.word	16
	.word	.LC3
	.word	_ZL6regcmd
	.word	1
	.word	.LC4
	.word	_ZL6irqcmd
	.word	1
	.word	.LC5
	.word	_ZL4mirr
	.word	1
	.word	.LC6
	.word	_ZL8big_bank
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	2
	.word	.LC8
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC9
	.word	_ZL4IRQa
	.word	1
	.word	.LC10
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
	.section	.sbss._ZL6acount,"aw",@nobits
	.align	1
	.type	_ZL6acount, @object
	.size	_ZL6acount, 2
_ZL6acount:
	.zero	2
	.section	.sbss._ZL8big_bank,"aw",@nobits
	.type	_ZL8big_bank, @object
	.size	_ZL8big_bank, 1
_ZL8big_bank:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL6irqcmd,"aw",@nobits
	.type	_ZL6irqcmd, @object
	.size	_ZL6irqcmd, 1
_ZL6irqcmd:
	.zero	1
	.section	.sbss._ZL6regcmd,"aw",@nobits
	.type	_ZL6regcmd, @object
	.size	_ZL6regcmd, 1
_ZL6regcmd:
	.zero	1
	.section	.bss._ZL5chrhi,"aw",@nobits
	.align	2
	.type	_ZL5chrhi, @object
	.size	_ZL5chrhi, 16
_ZL5chrhi:
	.zero	16
	.section	.sbss._ZL6chrreg,"aw",@nobits
	.align	2
	.type	_ZL6chrreg, @object
	.size	_ZL6chrreg, 8
_ZL6chrreg:
	.zero	8
	.section	.sbss._ZL6prgreg,"aw",@nobits
	.align	2
	.type	_ZL6prgreg, @object
	.size	_ZL6prgreg, 2
_ZL6prgreg:
	.zero	2
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
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL8reg2mask,"aw",@nobits
	.type	_ZL8reg2mask, @object
	.size	_ZL8reg2mask, 1
_ZL8reg2mask:
	.zero	1
	.section	.sbss._ZL8reg1mask,"aw",@nobits
	.type	_ZL8reg1mask, @object
	.size	_ZL8reg1mask, 1
_ZL8reg1mask:
	.zero	1
	.section	.sbss._ZL4is22,"aw",@nobits
	.type	_ZL4is22, @object
	.size	_ZL4is22, 1
_ZL4is22:
	.zero	1
	.section	.sbss._ZL8isPirate,"aw",@nobits
	.type	_ZL8isPirate, @object
	.size	_ZL8isPirate, 1
_ZL8isPirate:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
