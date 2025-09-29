#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"603-5052.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL19UNL6035052ProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNL6035052ProtWritejh, @function
_ZL19UNL6035052ProtWritejh:
.LFB6:
	.cfi_startproc
	andi	a1,a1,3
	lla	a5,_ZL3lut
	add	a5,a5,a1
	lbu	a5,0(a5)
	la a4, EXPREGS; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL19UNL6035052ProtWritejh, .-_ZL19UNL6035052ProtWritejh
	.section	.text._ZL18UNL6035052ProtReadj,"ax",@progbits
	.align	2
	.type	_ZL18UNL6035052ProtReadj, @function
_ZL18UNL6035052ProtReadj:
.LFB7:
	.cfi_startproc
	la a0, EXPREGS; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL18UNL6035052ProtReadj, .-_ZL18UNL6035052ProtReadj
	.section	.text._ZL15UNL6035052Powerv,"ax",@progbits
	.align	2
	.type	_ZL15UNL6035052Powerv, @function
_ZL15UNL6035052Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z12GenMMC3Powerv
	li	s0,32768
	li	a0,16384
	addi	a1,s0,-1
	lla	a2,_ZL19UNL6035052ProtWritejh
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,16384
	lla	a2,_ZL18UNL6035052ProtReadj
	addi	a0,a0,32
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL15UNL6035052Powerv, .-_ZL15UNL6035052Powerv
	.section	.rodata._Z15UNL6035052_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.section	.text._Z15UNL6035052_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNL6035052_InitP8CartInfo
	.hidden	_Z15UNL6035052_InitP8CartInfo
	.type	_Z15UNL6035052_InitP8CartInfo, @function
_Z15UNL6035052_InitP8CartInfo:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a3,0
	li	a2,256
	li	a1,128
	li	a4,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL15UNL6035052Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC0
	li	a2,0
	li	a1,6
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE9:
	.size	_Z15UNL6035052_InitP8CartInfo, .-_Z15UNL6035052_InitP8CartInfo
	.section	.srodata._ZL3lut,"a"
	.align	2
	.type	_ZL3lut, @object
	.size	_ZL3lut, 4
_ZL3lut:
	.string	""
	.ascii	"\002\002\003"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
