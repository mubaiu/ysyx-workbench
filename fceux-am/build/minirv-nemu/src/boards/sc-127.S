#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sc-127.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL16UNLSC127ProtReadj,"ax",@progbits
	.align	2
	.type	_ZL16UNLSC127ProtReadj, @function
_ZL16UNLSC127ProtReadj:
.LFB8:
	.cfi_startproc
	li	a0,32
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL16UNLSC127ProtReadj, .-_ZL16UNLSC127ProtReadj
	.section	.text._ZL13UNLSC127Resetv,"ax",@progbits
	.align	2
	.type	_ZL13UNLSC127Resetv, @function
_ZL13UNLSC127Resetv:
.LFB11:
	.cfi_startproc
	la a5, _ZL4IRQa; sh zero, 0(a5);
	la a5, _ZL8IRQCount; sh zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL13UNLSC127Resetv, .-_ZL13UNLSC127Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	call	_Z8setprg8rijj
	lla	s3,_ZL3reg
	lbu	a1,0(s3)
	li	a0,32768
	lla	s1,_ZL3chr
	call	_Z7setprg8jj
	lbu	a1,1(s3)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	lbu	a1,2(s3)
	li	a0,49152
	li	s2,8192
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L5:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L5
	lbu	a0,3(s3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	xori	a0,a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB13:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE13:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13UNLSC127Closev,"ax",@progbits
	.align	2
	.type	_ZL13UNLSC127Closev, @function
_ZL13UNLSC127Closev:
.LFB12:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L15
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
.L15:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL13UNLSC127Closev, .-_ZL13UNLSC127Closev
	.section	.text._ZL13UNLSC127Powerv,"ax",@progbits
	.align	2
	.type	_ZL13UNLSC127Powerv, @function
_ZL13UNLSC127Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4IRQa; sh zero, 0(a5);
	la a5, _ZL8IRQCount; sh zero, 0(a5);
	call	_ZL4Syncv
	li	a1,24576
	addi	a1,a1,-2048
	mv	a0,a1
	lla	a2,_ZL16UNLSC127ProtReadj
	call	_Z14SetReadHandleriiPFhjE
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
	lla	a2,_ZL13UNLSC127Writejh
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
	.size	_ZL13UNLSC127Powerv, .-_ZL13UNLSC127Powerv
	.section	.text._ZL13UNLSC127Writejh,"ax",@progbits
	.align	2
	.type	_ZL13UNLSC127Writejh, @function
_ZL13UNLSC127Writejh:
.LFB7:
	.cfi_startproc
	li	a5,36864
	addi	a5,a5,7
	bgtu	a0,a5,.L21
	li	a4,36864
	bltu	a0,a4,.L44
	li	a5,-36864
	addi	a5,a5,-1
	add	a0,a0,a5
	li	a5,6
	bgtu	a0,a5,.L27
	lla	a4,.L29
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL13UNLSC127Writejh,"a",@progbits
	.align	2
	.align	2
.L29:
	.word	.L35-.L29
	.word	.L34-.L29
	.word	.L33-.L29
	.word	.L32-.L29
	.word	.L31-.L29
	.word	.L30-.L29
	.word	.L28-.L29
	.section	.text._ZL13UNLSC127Writejh
.L44:
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	beq	a0,a5,.L23
	li	a5,32768
	addi	a5,a5,2
	beq	a0,a5,.L24
	bne	a0,a4,.L42
	la a5, _ZL3reg; sb a1, 0(a5);
.L42:
	tail	_ZL4Syncv
.L21:
	li	a5,49152
	addi	a5,a5,5
	beq	a0,a5,.L36
	bgtu	a0,a5,.L37
	li	a5,49152
	addi	a5,a5,2
	beq	a0,a5,.L38
	li	a5,49152
	addi	a5,a5,3
	bne	a0,a5,.L42
	li	a5,1
	la a4, _ZL4IRQa; sh a5, 0(a4);
	j	.L42
.L37:
	li	a5,53248
	addi	a5,a5,1
	bne	a0,a5,.L42
	la a5, _ZL3reg+3; sb a1, 0(a5);
	j	.L42
.L31:
	la a5, _ZL3chr+5; sb a1, 0(a5);
	j	.L42
.L32:
	la a5, _ZL3chr+4; sb a1, 0(a5);
	j	.L42
.L33:
	la a5, _ZL3chr+3; sb a1, 0(a5);
	j	.L42
.L34:
	la a5, _ZL3chr+2; sb a1, 0(a5);
	j	.L42
.L35:
	la a5, _ZL3chr+1; sb a1, 0(a5);
	j	.L42
.L30:
	la a5, _ZL3chr+6; sb a1, 0(a5);
	j	.L42
.L28:
	la a5, _ZL3chr+7; sb a1, 0(a5);
	j	.L42
.L23:
	la a5, _ZL3reg+1; sb a1, 0(a5);
	j	.L42
.L27:
	la a5, _ZL3chr; sb a1, 0(a5);
	j	.L42
.L36:
	la a5, _ZL8IRQCount; sh a1, 0(a5);
	j	.L42
.L24:
	la a5, _ZL3reg+2; sb a1, 0(a5);
	j	.L42
.L38:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL4IRQa; sh zero, 0(a5);
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL13UNLSC127Writejh, .-_ZL13UNLSC127Writejh
	.section	.text._ZL11UNLSC127IRQv,"ax",@progbits
	.align	2
	.type	_ZL11UNLSC127IRQv, @function
_ZL11UNLSC127IRQv:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lhu a5, 0(a5);
	beq	a5,zero,.L55
	lla	a4,_ZL8IRQCount
	lhu	a5,0(a4)
	beq	a5,zero,.L49
	addi	a5,a5,-1
	slli	a5,a5,16
	srli	a5,a5,16
	sh	a5,0(a4)
	beq	a5,zero,.L49
	ret
.L55:
	ret
.L49:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z14X6502_IRQBegini
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4IRQa; sh zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL11UNLSC127IRQv, .-_ZL11UNLSC127IRQv
	.section	.rodata._Z13UNLSC127_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13UNLSC127_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLSC127_InitP8CartInfo
	.hidden	_Z13UNLSC127_InitP8CartInfo
	.type	_Z13UNLSC127_InitP8CartInfo, @function
_Z13UNLSC127_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL13UNLSC127Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13UNLSC127Resetv
	sw	a5,4(a0)
	lla	a5,_ZL13UNLSC127Closev
	sw	a5,8(a0)
	lla	a5,_ZL11UNLSC127IRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z13UNLSC127_InitP8CartInfo, .-_Z13UNLSC127_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"CHRS"
	.align	2
.LC3:
	.string	"IRQc"
	.align	2
.LC4:
	.string	"IRQa"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3reg
	.word	8
	.word	.LC1
	.word	_ZL3chr
	.word	8
	.word	.LC2
	.word	_ZL8IRQCount
	.word	2
	.word	.LC3
	.word	_ZL4IRQa
	.word	2
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	1
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 2
_ZL4IRQa:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
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
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
