#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc6.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL6VRC6SWjh,"ax",@progbits
	.align	2
	.type	_ZL6VRC6SWjh, @function
_ZL6VRC6SWjh:
.LFB7:
	.cfi_startproc
	li	a5,61440
	addi	a5,a5,3
	and	a5,a0,a5
	li	a4,-36864
	add	a4,a5,a4
	li	a3,2
	bgtu	a4,a3,.L2
	andi	a0,a0,3
	lla	a5,_ZL5vpsg1
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, _ZL4sfun; lw a5, 0(a5);
	beq	a5,zero,.L1
.L13:
	jr	a5
.L2:
	li	a4,-40960
	add	a4,a5,a4
	bgtu	a4,a3,.L5
	andi	a0,a0,3
	ori	a0,a0,4
	lla	a5,_ZL5vpsg1
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, _ZL4sfun+4; lw a5, 0(a5);
	bne	a5,zero,.L13
.L1:
	ret
.L5:
	li	a4,-45056
	add	a5,a5,a4
	bgtu	a5,a3,.L1
	andi	a0,a0,3
	lla	a5,_ZL5vpsg2
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, _ZL4sfun+8; lw a5, 0(a5);
	bne	a5,zero,.L13
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL6VRC6SWjh, .-_ZL6VRC6SWjh
	.section	.text._ZL6DoSQV1v,"ax",@progbits
	.align	2
	.type	_ZL6DoSQV1v, @function
_ZL6DoSQV1v:
.LFB14:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE14:
	.size	_ZL6DoSQV1v, .-_ZL6DoSQV1v
	.section	.text._Z9VRC6Soundi,"ax",@progbits
	.align	2
	.globl	_Z9VRC6Soundi
	.hidden	_Z9VRC6Soundi
	.type	_Z9VRC6Soundi, @function
_Z9VRC6Soundi:
.LFB21:
	.cfi_startproc
	lla	a5,_ZL4cvbc
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.cfi_endproc
.LFE21:
	.size	_Z9VRC6Soundi, .-_Z9VRC6Soundi
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
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
	la a5, _ZL4is26; lbu a5, 0(a5);
	bne	a5,zero,.L29
.L18:
	lla	s0,_ZL3prg
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL3chr
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	li	a0,49152
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	s2,8192
.L19:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L19
	la a5, _ZL4mirr; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L28
	li	a4,3
	li	a0,3
	beq	a5,a4,.L28
	li	a4,1
	li	a0,1
	bne	a5,a4,.L28
	li	a0,0
.L28:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L29:
	.cfi_restore_state
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	j	.L18
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB12:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE12:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9VRC6Powerv,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Powerv, @function
_ZL9VRC6Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL9VRC6Writejh
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
.LFE9:
	.size	_ZL9VRC6Powerv, .-_ZL9VRC6Powerv
	.section	.text._ZL9VRC6Writejh,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Writejh, @function
_ZL9VRC6Writejh:
.LFB8:
	.cfi_startproc
	la a4, _ZL4is26; lbu a4, 0(a4);
	beq	a4,zero,.L34
	srli	a5,a0,1
	slli	a4,a0,1
	li	a3,65536
	addi	a3,a3,-4
	andi	a5,a5,1
	andi	a4,a4,2
	and	a0,a0,a3
	or	a5,a5,a4
	or	a0,a0,a5
.L34:
	li	a5,8192
	li	a4,-36864
	add	a4,a0,a4
	addi	a5,a5,2
	bleu	a4,a5,.L61
	li	a5,61440
	addi	a5,a5,3
	and	a0,a0,a5
	li	a5,57344
	li	a4,61440
	beq	a0,a5,.L36
	bgtu	a0,a5,.L37
	li	a5,53248
	beq	a0,a5,.L38
	bleu	a0,a5,.L62
	li	a5,53248
	addi	a5,a5,2
	beq	a0,a5,.L44
	li	a5,53248
	addi	a5,a5,3
	beq	a0,a5,.L45
	li	a5,53248
	addi	a5,a5,1
	bne	a0,a5,.L63
	la a5, _ZL3chr+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L37:
	beq	a0,a4,.L47
	bgtu	a0,a4,.L48
	li	a5,57344
	addi	a5,a5,2
	beq	a0,a5,.L49
	li	a5,57344
	addi	a5,a5,3
	beq	a0,a5,.L50
	li	a5,57344
	addi	a5,a5,1
	bne	a0,a5,.L64
	la a5, _ZL3chr+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L61:
	tail	_ZL6VRC6SWjh
.L62:
	li	a5,45056
	addi	a5,a5,3
	beq	a0,a5,.L40
	li	a5,49152
	beq	a0,a5,.L41
	li	a5,32768
	bne	a0,a5,.L65
	la a5, _ZL3prg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L48:
	li	a5,61440
	addi	a5,a5,1
	beq	a0,a5,.L52
	li	a5,61440
	addi	a5,a5,2
	bne	a0,a5,.L66
	la a5, _ZL4IRQd; lbu a5, 0(a5);
	li	a0,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L36:
	la a5, _ZL3chr+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L52:
	andi	a4,a1,2
	andi	a5,a1,1
	la a3, _ZL4IRQa; sb a4, 0(a3);
	la a3, _ZL4IRQd; sb a5, 0(a3);
	beq	a4,zero,.L54
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a4, _ZL8IRQCount; sw a5, 0(a4);
.L54:
	li	a0,1
	la a5, _ZL10CycleCount; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L50:
	la a5, _ZL3chr+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L49:
	la a5, _ZL3chr+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L47:
	li	a0,1
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L38:
	la a5, _ZL3chr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L45:
	la a5, _ZL3chr+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L44:
	la a5, _ZL3chr+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L41:
	la a5, _ZL3prg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L40:
	srli	a1,a1,2
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L66:
	ret
.L65:
	ret
.L63:
	ret
.L64:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL9VRC6Writejh, .-_ZL9VRC6Writejh
	.section	.text._ZL8VRC6_ESIv,"ax",@progbits
	.align	2
	.type	_ZL8VRC6_ESIv, @function
_ZL8VRC6_ESIv:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a5,GameExpSound
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a4,_ZL8VRC6_ESIv
	sw	a4,16(a5)
	lla	a4,_Z9VRC6Soundi
	sw	a4,0(a5)
	lla	a4,_Z11VRC6SoundHQv
	sw	a4,8(a5)
	li	a2,12
	lla	a4,_Z10VRC6SyncHQi
	li	a1,0
	lla	a0,_ZL4cvbc
	sw	a4,12(a5)
	call	memset
	li	a2,12
	li	a1,0
	lla	a0,_ZL6vcount
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,_ZL6dcount
	call	memset
	lla	a5,FSettings
	lw	a4,60(a5)
	beq	a4,zero,.L68
	lw	a5,64(a5)
	ble	a5,zero,.L69
	lla	a5,_ZL4sfun
	lla	a4,_ZL8DoSQV1HQv
	sw	a4,0(a5)
	lla	a4,_ZL8DoSQV2HQv
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	a4,4(a5)
	lla	a4,_ZL8DoSawVHQv
	sw	a4,8(a5)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL10SStateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
.L69:
	.cfi_restore_state
	lla	a5,_ZL4sfun
	lla	a4,_ZL6DoSQV1v
	sw	a4,0(a5)
	lla	a4,_ZL6DoSQV2v
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	a4,4(a5)
	lla	a4,_ZL6DoSawVv
	sw	a4,8(a5)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL10SStateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
.L68:
	.cfi_restore_state
	li	a2,12
	li	a1,0
	lla	a0,_ZL4sfun
	call	memset
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL10SStateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE24:
	.size	_ZL8VRC6_ESIv, .-_ZL8VRC6_ESIv
	.section	.text._ZL9VRC6Closev,"ax",@progbits
	.align	2
	.type	_ZL9VRC6Closev, @function
_ZL9VRC6Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L78
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
.L78:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL9VRC6Closev, .-_ZL9VRC6Closev
	.section	.text._ZL11VRC6IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL11VRC6IRQHooki, @function
_ZL11VRC6IRQHooki:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L93
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s2,16(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL10CycleCount
	lw	a4,0(s2)
	slli	a5,a0,1
	add	a5,a5,a0
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	add	a5,a5,a4
	sw	a5,0(s2)
	lla	s3,_ZL8IRQCount
	li	s0,340
	li	s1,256
.L84:
	lw	a4,0(s3)
	li	a3,0
.L85:
	ble	a5,s0,.L96
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,s1,.L85
	la a4, _ZL8IRQLatch; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s2)
	sw	a4,0(s3)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s2)
	j	.L84
.L93:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	ret
.L96:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	beq	a3,zero,.L81
	sw	a4,0(s3)
	sw	a5,0(s2)
.L81:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL11VRC6IRQHooki, .-_ZL11VRC6IRQHooki
	.section	.text._Z11VRC6SoundHQv,"ax",@progbits
	.align	2
	.globl	_Z11VRC6SoundHQv
	.hidden	_Z11VRC6SoundHQv
	.type	_Z11VRC6SoundHQv, @function
_Z11VRC6SoundHQv:
.LFB40:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE40:
	.size	_Z11VRC6SoundHQv, .-_Z11VRC6SoundHQv
	.section	.text._ZL6DoSQV2v,"ax",@progbits
	.align	2
	.type	_ZL6DoSQV2v, @function
_ZL6DoSQV2v:
.LFB30:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE30:
	.size	_ZL6DoSQV2v, .-_ZL6DoSQV2v
	.section	.text._ZL6DoSawVv,"ax",@progbits
	.align	2
	.type	_ZL6DoSawVv, @function
_ZL6DoSawVv:
.LFB32:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE32:
	.size	_ZL6DoSawVv, .-_ZL6DoSawVv
	.section	.text._ZL8DoSQV1HQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSQV1HQv, @function
_ZL8DoSQV1HQv:
.LFB34:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE34:
	.size	_ZL8DoSQV1HQv, .-_ZL8DoSQV1HQv
	.section	.text._ZL8DoSQV2HQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSQV2HQv, @function
_ZL8DoSQV2HQv:
.LFB36:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE36:
	.size	_ZL8DoSQV2HQv, .-_ZL8DoSQV2HQv
	.section	.text._ZL8DoSawVHQv,"ax",@progbits
	.align	2
	.type	_ZL8DoSawVHQv, @function
_ZL8DoSawVHQv:
.LFB38:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE38:
	.size	_ZL8DoSawVHQv, .-_ZL8DoSawVHQv
	.section	.text._Z10VRC6SyncHQi,"ax",@progbits
	.align	2
	.globl	_Z10VRC6SyncHQi
	.hidden	_Z10VRC6SyncHQi
	.type	_Z10VRC6SyncHQi, @function
_Z10VRC6SyncHQi:
.LFB42:
	.cfi_startproc
	lla	a5,_ZL4cvbc
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.cfi_endproc
.LFE42:
	.size	_Z10VRC6SyncHQi, .-_Z10VRC6SyncHQi
	.section	.text._Z13Mapper24_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper24_InitP8CartInfo
	.hidden	_Z13Mapper24_InitP8CartInfo
	.type	_Z13Mapper24_InitP8CartInfo, @function
_Z13Mapper24_InitP8CartInfo:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9VRC6Powerv
	sw	a5,0(a0)
	la a5, _ZL4is26; sb zero, 0(a5);
	lla	a5,_ZL11VRC6IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_ZL8VRC6_ESIv
	lw	ra,12(sp)
	.cfi_restore 1
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
.LFE25:
	.size	_Z13Mapper24_InitP8CartInfo, .-_Z13Mapper24_InitP8CartInfo
	.section	.rodata._Z13Mapper26_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper26_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper26_InitP8CartInfo
	.hidden	_Z13Mapper26_InitP8CartInfo
	.type	_Z13Mapper26_InitP8CartInfo, @function
_Z13Mapper26_InitP8CartInfo:
.LFB26:
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
	lla	a5,_ZL9VRC6Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9VRC6Closev
	sw	a5,8(a0)
	li	a5,1
	la a4, _ZL4is26; sb a5, 0(a4);
	lla	a5,_ZL11VRC6IRQHooki
	mv	s0,a0
	la a4, MapIRQHook; sw a5, 0(a4);
	call	_ZL8VRC6_ESIv
	lla	a5,_ZL12StateRestorei
	lla	s1,_ZL8WRAMSIZE
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
	beq	a5,zero,.L107
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L107:
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
.LFE26:
	.size	_Z13Mapper26_InitP8CartInfo, .-_Z13Mapper26_InitP8CartInfo
	.section	.text._Z12NSFVRC6_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFVRC6_Initv
	.hidden	_Z12NSFVRC6_Initv
	.type	_Z12NSFVRC6_Initv, @function
_Z12NSFVRC6_Initv:
.LFB27:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL8VRC6_ESIv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,49152
	lla	a2,_ZL6VRC6SWjh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE27:
	.size	_Z12NSFVRC6_Initv, .-_Z12NSFVRC6_Initv
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PSG1"
	.align	2
.LC2:
	.string	"PSG2"
	.section	.data._ZL10SStateRegs,"aw"
	.align	2
	.type	_ZL10SStateRegs, @object
	.size	_ZL10SStateRegs, 36
_ZL10SStateRegs:
	.word	_ZL5vpsg1
	.word	8
	.word	.LC1
	.word	_ZL5vpsg2
	.word	4
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL6dcount,"aw",@nobits
	.align	2
	.type	_ZL6dcount, @object
	.size	_ZL6dcount, 8
_ZL6dcount:
	.zero	8
	.section	.bss._ZL6vcount,"aw",@nobits
	.align	2
	.type	_ZL6vcount, @object
	.size	_ZL6vcount, 12
_ZL6vcount:
	.zero	12
	.section	.bss._ZL4cvbc,"aw",@nobits
	.align	2
	.type	_ZL4cvbc, @object
	.size	_ZL4cvbc, 12
_ZL4cvbc:
	.zero	12
	.section	.sbss._ZL5vpsg2,"aw",@nobits
	.align	2
	.type	_ZL5vpsg2, @object
	.size	_ZL5vpsg2, 4
_ZL5vpsg2:
	.zero	4
	.section	.sbss._ZL5vpsg1,"aw",@nobits
	.align	2
	.type	_ZL5vpsg1, @object
	.size	_ZL5vpsg1, 8
_ZL5vpsg1:
	.zero	8
	.section	.bss._ZL4sfun,"aw",@nobits
	.align	2
	.type	_ZL4sfun, @object
	.size	_ZL4sfun, 12
_ZL4sfun:
	.zero	12
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	"PRG"
	.align	2
.LC4:
	.string	"CHR"
	.align	2
.LC5:
	.string	"MIRR"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"IRQD"
	.align	2
.LC8:
	.string	"IRQL"
	.align	2
.LC9:
	.string	"IRQC"
	.align	2
.LC10:
	.string	"CYCC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL3prg
	.word	2
	.word	.LC3
	.word	_ZL3chr
	.word	8
	.word	.LC4
	.word	_ZL4mirr
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL4IRQd
	.word	1
	.word	.LC7
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC8
	.word	_ZL8IRQCount
	.word	4
	.word	.LC9
	.word	_ZL10CycleCount
	.word	4
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
	.section	.sbss._ZL10CycleCount,"aw",@nobits
	.align	2
	.type	_ZL10CycleCount, @object
	.size	_ZL10CycleCount, 4
_ZL10CycleCount:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4IRQd,"aw",@nobits
	.type	_ZL4IRQd, @object
	.size	_ZL4IRQd, 1
_ZL4IRQd:
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
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.type	_ZL3prg, @object
	.size	_ZL3prg, 2
_ZL3prg:
	.zero	2
	.section	.sbss._ZL4is26,"aw",@nobits
	.type	_ZL4is26, @object
	.size	_ZL4is26, 1
_ZL4is26:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
