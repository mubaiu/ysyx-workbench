#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"82.cpp"
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 8, -8
	lla	s2,_ZL4ctrl
	lbu	s0,0(s2)
	lla	s1,_ZL4regs
	lbu	a1,0(s1)
	li	s3,4096
	slli	s0,s0,11
	and	s0,s0,s3
	mv	a0,s0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,1(s1)
	li	a0,4096
	addi	a0,a0,-2048
	or	a0,s0,a0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,2(s1)
	xor	a0,s0,s3
	call	_Z7setchr1jj
	lbu	a1,3(s1)
	li	a0,4096
	addi	a0,a0,1024
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lbu	a1,4(s1)
	li	a0,8192
	addi	a0,a0,-2048
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lbu	a1,5(s1)
	li	a0,8192
	addi	a0,a0,-1024
	xor	a0,s0,a0
	call	_Z7setchr1jj
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a1,6(s1)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,8(s1)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lbu	a0,0(s2)
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
	andi	a0,a0,1
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
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M82Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M82Writejh, @function
_ZL8M82Writejh:
.LFB7:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,-267
	bgtu	a0,a5,.L6
	andi	a0,a0,7
	lla	a5,_ZL4regs
	add	a5,a5,a0
	sb	a1,0(a5)
.L7:
	tail	_ZL4Syncv
.L6:
	li	a5,32768
	addi	a5,a5,-261
	beq	a0,a5,.L8
	bgtu	a0,a5,.L9
	li	a5,32768
	addi	a5,a5,-266
	beq	a0,a5,.L10
	li	a5,32768
	addi	a5,a5,-262
	bne	a0,a5,.L7
	srli	a1,a1,2
	la a5, _ZL4regs+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	andi	a1,a1,3
	la a5, _ZL4ctrl; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	li	a5,32768
	addi	a5,a5,-260
	bne	a0,a5,.L7
	srli	a1,a1,2
	la a5, _ZL4regs+8; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	srli	a1,a1,2
	la a5, _ZL4regs+7; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL8M82Writejh, .-_ZL8M82Writejh
	.section	.text._ZL8M82Closev,"ax",@progbits
	.align	2
	.type	_ZL8M82Closev, @function
_ZL8M82Closev:
.LFB9:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L19
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
.L19:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M82Closev, .-_ZL8M82Closev
	.section	.text._ZL8M82Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M82Powerv, @function
_ZL8M82Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	li	a0,32768
	lla	a2,_ZL8M82Writejh
	addi	a1,a1,-260
	addi	a0,a0,-272
	call	_Z15SetWriteHandleriiPFvjhE
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
.LFE8:
	.size	_ZL8M82Powerv, .-_ZL8M82Powerv
	.section	.rodata._Z13Mapper82_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper82_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper82_InitP8CartInfo
	.hidden	_Z13Mapper82_InitP8CartInfo
	.type	_Z13Mapper82_InitP8CartInfo, @function
_Z13Mapper82_InitP8CartInfo:
.LFB11:
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
	lla	a5,_ZL8M82Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M82Closev
	lla	s1,_ZL8WRAMSIZE
	sw	a5,8(a0)
	mv	s0,a0
	li	a5,8192
	li	a0,8192
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
	beq	a5,zero,.L25
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L25:
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
.LFE11:
	.size	_Z13Mapper82_InitP8CartInfo, .-_Z13Mapper82_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"CTRL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4regs
	.word	9
	.word	.LC1
	.word	_ZL4ctrl
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
	.section	.sbss._ZL4ctrl,"aw",@nobits
	.type	_ZL4ctrl, @object
	.size	_ZL4ctrl, 1
_ZL4ctrl:
	.zero	1
	.section	.bss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 9
_ZL4regs:
	.zero	9
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
