#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"15.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	lla	s0,_ZL7latched
	lbu	a0,0(s0)
	srli	a0,a0,6
	xori	a0,a0,1
	andi	a0,a0,1
	call	_Z9setmirrori
	lla	a3,_ZL7latchea
	lhu	a5,0(a3)
	li	a4,2
	andi	a2,a5,3
	beq	a2,a4,.L9
	andi	a5,a5,1
	li	s1,0
	bne	a5,zero,.L3
.L4:
	lbu	a1,0(s0)
	slli	a0,s1,13
	li	a5,32768
	slli	a1,a1,1
	andi	a1,a1,126
	add	a1,a1,s1
	add	a0,a0,a5
	call	_Z7setprg8jj
	addi	s1,s1,1
	li	a4,4
	bne	s1,a4,.L4
.L5:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L15:
	.cfi_restore_state
	ori	a5,a5,7
.L7:
	slli	a5,a5,1
	add	a1,a1,a5
	call	_Z7setprg8jj
	li	a5,3
	beq	s1,a5,.L5
	li	s1,3
	lla	a3,_ZL7latchea
.L3:
	lbu	a5,0(s0)
	slli	a0,s1,13
	li	a2,32768
	li	a4,1
	andi	a1,s1,1
	add	a0,a0,a2
	andi	a5,a5,63
	ble	s1,a4,.L6
	lhu	a2,0(a3)
	andi	a2,a2,2
	bne	a2,zero,.L7
	j	.L15
.L6:
	slli	a1,a5,1
	slli	a0,s1,13
	li	a5,32768
	add	a1,a1,s1
	add	a0,a0,a5
	call	_Z7setprg8jj
	addi	s1,s1,1
	lla	a3,_ZL7latchea
	j	.L3
.L9:
	li	s1,32768
.L2:
	lbu	a5,0(s0)
	mv	a0,s1
	slli	a1,a5,1
	andi	a1,a1,126
	srli	a5,a5,7
	add	a1,a1,a5
	call	_Z7setprg8jj
	li	a5,8192
	add	s1,s1,a5
	li	a5,65536
	bne	s1,a5,.L2
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB8:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M15Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M15Resetv, @function
_ZL8M15Resetv:
.LFB10:
	.cfi_startproc
	li	a5,-32768
	la a4, _ZL7latchea; sh a5, 0(a4);
	la a5, _ZL7latched; sb zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL8M15Resetv, .-_ZL8M15Resetv
	.section	.text._ZL8M15Closev,"ax",@progbits
	.align	2
	.type	_ZL8M15Closev, @function
_ZL8M15Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L24
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L24:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL8M15Closev, .-_ZL8M15Closev
	.section	.text._ZL8M15Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M15Powerv, @function
_ZL8M15Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,-32768
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	la a4, _ZL7latchea; sh a5, 0(a4);
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL7latched; sb zero, 0(a5);
	li	s0,32768
	call	_Z8setprg8rijj
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
	lla	a2,_ZL8M15Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL8M15Powerv, .-_ZL8M15Powerv
	.section	.text._ZL8M15Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M15Writejh, @function
_ZL8M15Writejh:
.LFB7:
	.cfi_startproc
	slli	a0,a0,16
	srli	a0,a0,16
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL7latchea; sh a0, 0(a5);
	la a5, _ZL7latched; sb a1, 0(a5);
	sw	ra,8(sp)
	.cfi_offset 1, -4
	andi	a0,a0,3
	li	a5,3
	la a1, CHRptr; lw a1, 0(a1);
	beq	a0,a5,.L33
	li	a3,1
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L33:
	.cfi_restore_state
	li	a3,0
	li	a2,8192
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL8M15Writejh, .-_ZL8M15Writejh
	.section	.rodata._Z13Mapper15_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper15_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper15_InitP8CartInfo
	.hidden	_Z13Mapper15_InitP8CartInfo
	.type	_Z13Mapper15_InitP8CartInfo, @function
_Z13Mapper15_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL8M15Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M15Resetv
	sw	a5,4(a0)
	lla	a5,_ZL8M15Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s1,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,_ZL4WRAM
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L36
	sw	a0,12(s0)
	sw	a1,28(s0)
.L36:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13Mapper15_InitP8CartInfo, .-_Z13Mapper15_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"AREG"
	.align	2
.LC2:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7latchea
	.word	2
	.word	.LC1
	.word	_ZL7latched
	.word	1
	.word	.LC2
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
	.section	.sbss._ZL7latched,"aw",@nobits
	.type	_ZL7latched, @object
	.size	_ZL7latched, 1
_ZL7latched:
	.zero	1
	.section	.sbss._ZL7latchea,"aw",@nobits
	.align	1
	.type	_ZL7latchea, @object
	.size	_ZL7latchea, 2
_ZL7latchea:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
