#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bonza.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL13M216Write5000jh,"ax",@progbits
	.align	2
	.type	_ZL13M216Write5000jh, @function
_ZL13M216Write5000jh:
.LFB9:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL13M216Write5000jh, .-_ZL13M216Write5000jh
	.section	.text._ZL12M216Read5000j,"ax",@progbits
	.align	2
	.type	_ZL12M216Read5000j, @function
_ZL12M216Read5000j:
.LFB10:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL12M216Read5000j, .-_ZL12M216Read5000j
	.section	.text._ZL5Powerv,"ax",@progbits
	.align	2
	.type	_ZL5Powerv, @function
_ZL5Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL7chr_reg
	li	a0,32768
	sb	zero,0(s0)
	la a5, _ZL7prg_reg; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL11M216WriteHijh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL13M216Write5000jh
	li	a1,20480
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL12M216Read5000j
	li	a1,20480
	li	a0,20480
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE11:
	.size	_ZL5Powerv, .-_ZL5Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,32768
	la a1, _ZL7prg_reg; lbu a1, 0(a1);
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL7chr_reg; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL11M216WriteHijh,"ax",@progbits
	.align	2
	.type	_ZL11M216WriteHijh, @function
_ZL11M216WriteHijh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	andi	a4,a0,1
	srli	a0,a0,1
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL7chr_reg
	andi	a5,a0,7
	mv	a1,a4
	li	a0,32768
	sb	a5,0(s0)
	la a3, _ZL7prg_reg; sb a4, 0(a3);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE8:
	.size	_ZL11M216WriteHijh, .-_ZL11M216WriteHijh
	.section	.text._Z14Mapper216_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper216_InitP8CartInfo
	.hidden	_Z14Mapper216_InitP8CartInfo
	.type	_Z14Mapper216_InitP8CartInfo, @function
_Z14Mapper216_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL5Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper216_InitP8CartInfo, .-_Z14Mapper216_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7prg_reg
	.word	1
	.word	.LC0
	.word	_ZL7chr_reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 1
_ZL7chr_reg:
	.zero	1
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
