#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"le05.cpp"
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,57344
	li	a0,0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg2rijj
	li	a1,61440
	li	a2,0
	addi	a1,a1,-2048
	li	a0,0
	call	_Z8setprg2rijj
	li	a2,0
	li	a1,61440
	li	a0,0
	call	_Z8setprg2rijj
	li	a1,65536
	li	a2,0
	addi	a1,a1,-2048
	li	a0,0
	call	_Z8setprg2rijj
	li	a2,3
	li	a1,24576
	li	a0,1
	call	_Z8setprg8rijj
	li	a2,0
	li	a1,32768
	li	a0,1
	call	_Z8setprg8rijj
	li	a2,1
	li	a1,40960
	li	a0,1
	call	_Z8setprg8rijj
	li	a2,2
	li	a1,49152
	li	a0,1
	call	_Z8setprg8rijj
	la a0, _ZL3chr; lbu a0, 0(a0);
	andi	a0,a0,1
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL9LE05Powerv,"ax",@progbits
	.align	2
	.type	_ZL9LE05Powerv, @function
_ZL9LE05Powerv:
.LFB8:
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
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9LE05Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL9LE05Powerv, .-_ZL9LE05Powerv
	.section	.text._ZL9LE05Writejh,"ax",@progbits
	.align	2
	.type	_ZL9LE05Writejh, @function
_ZL9LE05Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL3chr; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9LE05Writejh, .-_ZL9LE05Writejh
	.section	.text._Z9LE05_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9LE05_InitP8CartInfo
	.hidden	_Z9LE05_InitP8CartInfo
	.type	_Z9LE05_InitP8CartInfo, @function
_Z9LE05_InitP8CartInfo:
.LFB9:
	.cfi_startproc
	lla	a5,_ZL9LE05Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE9:
	.size	_Z9LE05_InitP8CartInfo, .-_Z9LE05_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3chr
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.type	_ZL3chr, @object
	.size	_ZL3chr, 1
_ZL3chr:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
