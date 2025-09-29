#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"170.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9M170ProtWjh,"ax",@progbits
	.align	2
	.type	_ZL9M170ProtWjh, @function
_ZL9M170ProtWjh:
.LFB7:
	.cfi_startproc
	slli	a1,a1,1
	andi	a1,a1,-128
	la a5, _ZL3reg; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL9M170ProtWjh, .-_ZL9M170ProtWjh
	.section	.text._ZL9M170ProtRj,"ax",@progbits
	.align	2
	.type	_ZL9M170ProtRj, @function
_ZL9M170ProtRj:
.LFB8:
	.cfi_startproc
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,127
	la a0, _ZL3reg; lbu a0, 0(a0);
	or	a0,a5,a0
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL9M170ProtRj, .-_ZL9M170ProtRj
	.section	.text._ZL9M170Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M170Powerv, @function
_ZL9M170Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,24576
	addi	a1,a1,1282
	mv	a0,a1
	lla	a2,_ZL9M170ProtWjh
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9M170ProtWjh
	li	a1,28672
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,28672
	addi	a1,a1,1
	mv	a0,a1
	lla	a2,_ZL9M170ProtRj
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	addi	a1,a1,1911
	mv	a0,a1
	lla	a2,_ZL9M170ProtRj
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL9M170Powerv, .-_ZL9M170Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._Z14Mapper170_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper170_InitP8CartInfo
	.hidden	_Z14Mapper170_InitP8CartInfo
	.type	_Z14Mapper170_InitP8CartInfo, @function
_Z14Mapper170_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9M170Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper170_InitP8CartInfo, .-_Z14Mapper170_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
