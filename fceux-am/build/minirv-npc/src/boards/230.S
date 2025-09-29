#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"230.cpp"
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
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL6latche
	la a5, _ZL5reset; lbu a5, 0(a5);
	lbu	a1,0(s1)
	bne	a5,zero,.L8
	sw	s0,4(sp)
	.cfi_offset 8, -8
	andi	a5,a1,32
	andi	s0,a1,31
	addi	s0,s0,8
	bne	a5,zero,.L9
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
.L5:
	lbu	a0,0(s1)
	srli	a0,a0,6
	andi	a0,a0,1
	call	_Z9setmirrori
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
.L9:
	.cfi_restore_state
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	j	.L5
.L8:
	.cfi_restore 8
	andi	a1,a1,7
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,1
	call	_Z9setmirrori
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
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M230Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M230Resetv, @function
_ZL9M230Resetv:
.LFB8:
	.cfi_startproc
	lla	a4,_ZL5reset
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9M230Resetv, .-_ZL9M230Resetv
	.section	.text._ZL9M230Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M230Writejh, @function
_ZL9M230Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL6latche; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M230Writejh, .-_ZL9M230Writejh
	.section	.text._ZL9M230Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M230Powerv, @function
_ZL9M230Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL5reset; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL6latche; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL9M230Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL9M230Powerv, .-_ZL9M230Powerv
	.section	.text._Z14Mapper230_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper230_InitP8CartInfo
	.hidden	_Z14Mapper230_InitP8CartInfo
	.type	_Z14Mapper230_InitP8CartInfo, @function
_Z14Mapper230_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M230Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M230Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper230_InitP8CartInfo, .-_Z14Mapper230_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"RST"
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6latche
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5reset,"aw",@nobits
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
