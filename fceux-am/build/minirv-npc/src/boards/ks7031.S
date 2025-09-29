#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7031.cpp"
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
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL3reg
	lbu	a1,0(s0)
	li	a0,24576
	call	_Z7setprg2jj
	lbu	a1,1(s0)
	li	a0,28672
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	lbu	a1,2(s0)
	li	a0,28672
	call	_Z7setprg2jj
	lbu	a1,3(s0)
	li	a0,32768
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,15
	li	a0,32768
	call	_Z7setprg2jj
	li	a0,36864
	li	a1,14
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,13
	li	a0,36864
	call	_Z7setprg2jj
	li	a0,40960
	li	a1,12
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,11
	li	a0,40960
	call	_Z7setprg2jj
	li	a0,45056
	li	a1,10
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,9
	li	a0,45056
	call	_Z7setprg2jj
	li	a0,49152
	li	a1,8
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,7
	li	a0,49152
	call	_Z7setprg2jj
	li	a0,53248
	li	a1,6
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,5
	li	a0,53248
	call	_Z7setprg2jj
	li	a0,57344
	li	a1,4
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,3
	li	a0,57344
	call	_Z7setprg2jj
	li	a0,61440
	li	a1,2
	addi	a0,a0,-2048
	call	_Z7setprg2jj
	li	a1,1
	li	a0,61440
	call	_Z7setprg2jj
	li	a0,65536
	addi	a0,a0,-2048
	li	a1,0
	call	_Z7setprg2jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
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
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7031Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7031Writejh, @function
_ZL14UNLKS7031Writejh:
.LFB7:
	.cfi_startproc
	srli	a0,a0,11
	andi	a0,a0,3
	lla	a5,_ZL3reg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7031Writejh, .-_ZL14UNLKS7031Writejh
	.section	.text._ZL14UNLKS7031Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7031Powerv, @function
_ZL14UNLKS7031Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL14UNLKS7031Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLKS7031Powerv, .-_ZL14UNLKS7031Powerv
	.section	.text._Z14UNLKS7031_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7031_InitP8CartInfo
	.hidden	_Z14UNLKS7031_InitP8CartInfo
	.type	_Z14UNLKS7031_InitP8CartInfo, @function
_Z14UNLKS7031_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL14UNLKS7031Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z14UNLKS7031_InitP8CartInfo, .-_Z14UNLKS7031_InitP8CartInfo
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
	.word	4
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 4
_ZL3reg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
