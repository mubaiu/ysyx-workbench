#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"karaoke.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL6ExtDevj,"ax",@progbits
	.align	2
	.type	_ZL6ExtDevj, @function
_ZL6ExtDevj:
.LFB8:
	.cfi_startproc
	li	a0,3
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL6ExtDevj, .-_ZL6ExtDevj
	.section	.text._ZL5Powerv,"ax",@progbits
	.align	2
	.type	_ZL5Powerv, @function
_ZL5Powerv:
.LFB9:
	.cfi_startproc
	la a1, ROM_size; lw a1, 0(a1);
	srli	a1,a1,4
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a1,a1,7
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL6latche; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	li	a1,32768
	lla	a2,_ZL6ExtDevj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL9M188Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL5Powerv, .-_ZL5Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	la a1, _ZL6latche; lbu a1, 0(a1);
	beq	a1,zero,.L6
	andi	a5,a1,16
	andi	a1,a1,7
	beq	a5,zero,.L7
	li	a0,32768
	tail	_Z8setprg16jj
.L7:
	ori	a1,a1,8
	li	a0,32768
	tail	_Z8setprg16jj
.L6:
	la a1, ROM_size; lw a1, 0(a1);
	srli	a1,a1,4
	addi	a1,a1,7
	li	a0,32768
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M188Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M188Writejh, @function
_ZL9M188Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL6latche; sb a1, 0(a5);
	beq	a1,zero,.L10
	andi	a5,a1,16
	andi	a1,a1,7
	beq	a5,zero,.L11
	li	a0,32768
	tail	_Z8setprg16jj
.L11:
	ori	a1,a1,8
	li	a0,32768
	tail	_Z8setprg16jj
.L10:
	la a1, ROM_size; lw a1, 0(a1);
	srli	a1,a1,4
	addi	a1,a1,7
	li	a0,32768
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE7:
	.size	_ZL9M188Writejh, .-_ZL9M188Writejh
	.section	.rodata._Z14Mapper188_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.section	.text._Z14Mapper188_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper188_InitP8CartInfo
	.hidden	_Z14Mapper188_InitP8CartInfo
	.type	_Z14Mapper188_InitP8CartInfo, @function
_Z14Mapper188_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL5Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL6latche
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper188_InitP8CartInfo, .-_Z14Mapper188_InitP8CartInfo
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
