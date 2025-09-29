#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"gs-2004.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL14BMCGS2004Resetv,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2004Resetv, @function
_ZL14BMCGS2004Resetv:
.LFB9:
	.cfi_startproc
	li	a5,-1
	la a4, _ZL3reg; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL14BMCGS2004Resetv, .-_ZL14BMCGS2004Resetv
	.section	.text._ZL14BMCGS2004Powerv,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2004Powerv, @function
_ZL14BMCGS2004Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,-1
	li	a2,0
	lla	s0,_ZL3reg
	li	a1,24576
	li	a0,1
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	li	s0,65536
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL14BMCGS2004Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL14BMCGS2004Powerv, .-_ZL14BMCGS2004Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,24576
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg8rijj
	li	a0,32768
	la a1, _ZL3reg; lbu a1, 0(a1);
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14BMCGS2004Writejh,"ax",@progbits
	.align	2
	.type	_ZL14BMCGS2004Writejh, @function
_ZL14BMCGS2004Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	a5,a1
	lla	s0,_ZL3reg
	li	a2,0
	li	a1,24576
	li	a0,1
	sb	a5,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z8setprg32jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL14BMCGS2004Writejh, .-_ZL14BMCGS2004Writejh
	.section	.text._Z14BMCGS2004_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCGS2004_InitP8CartInfo
	.hidden	_Z14BMCGS2004_InitP8CartInfo
	.type	_Z14BMCGS2004_InitP8CartInfo, @function
_Z14BMCGS2004_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL14BMCGS2004Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14BMCGS2004Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14BMCGS2004_InitP8CartInfo, .-_Z14BMCGS2004_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
