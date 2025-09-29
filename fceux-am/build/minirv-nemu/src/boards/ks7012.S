#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7012.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL14UNLKS7012Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Closev, @function
_ZL14UNLKS7012Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
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
.L7:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL14UNLKS7012Closev, .-_ZL14UNLKS7012Closev
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg8rijj
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7012Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Resetv, @function
_ZL14UNLKS7012Resetv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,-1
	lla	s0,_ZL3reg
	li	a2,0
	li	a1,24576
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLKS7012Resetv, .-_ZL14UNLKS7012Resetv
	.section	.text._ZL14UNLKS7012Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Powerv, @function
_ZL14UNLKS7012Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	li	a5,-1
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a2,0
	lla	s0,_ZL3reg
	li	a1,24576
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	li	s0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
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
	lla	a2,_ZL14UNLKS7012Writejh
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
.LFE8:
	.size	_ZL14UNLKS7012Powerv, .-_ZL14UNLKS7012Powerv
	.section	.text._ZL14UNLKS7012Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7012Writejh, @function
_ZL14UNLKS7012Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,57344
	sw	ra,12(sp)
	addi	a5,a5,160
	.cfi_offset 1, -4
	beq	a0,a5,.L18
	li	a5,61440
	addi	a5,a5,-458
	beq	a0,a5,.L19
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L19:
	.cfi_restore_state
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	a5,1
	lla	s0,_ZL3reg
	li	a2,0
	li	a1,24576
	li	a0,16
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L18:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	li	a2,0
	li	a1,24576
	li	a0,16
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z8setprg8rijj
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	andi	a1,a1,1
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7012Writejh, .-_ZL14UNLKS7012Writejh
	.section	.rodata._Z14UNLKS7012_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7012_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7012_InitP8CartInfo
	.hidden	_Z14UNLKS7012_InitP8CartInfo
	.type	_Z14UNLKS7012_InitP8CartInfo, @function
_Z14UNLKS7012_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL14UNLKS7012Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7012Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNLKS7012Closev
	lla	s0,_ZL8WRAMSIZE
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
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
.LFE12:
	.size	_Z14UNLKS7012_InitP8CartInfo, .-_Z14UNLKS7012_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
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
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
