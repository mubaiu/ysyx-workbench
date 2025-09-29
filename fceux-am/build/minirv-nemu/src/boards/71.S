#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"71.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL8M71Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M71Powerv, @function
_ZL8M71Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4mirr; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	la a0, _ZL4mirr; lbu a0, 0(a0);
	bne	a0,zero,.L8
.L2:
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL8M71Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
.L8:
	.cfi_restore_state
	call	_Z9setmirrori
	j	.L2
	.cfi_endproc
.LFE8:
	.size	_ZL8M71Powerv, .-_ZL8M71Powerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	la a0, _ZL4mirr; lbu a0, 0(a0);
	bne	a0,zero,.L12
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L12:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M71Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M71Writejh, @function
_ZL8M71Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,61440
	and	a0,a0,a5
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,36864
	beq	a0,a5,.L18
	la a5, _ZL4preg; sb a1, 0(a5);
	lla	s0,_ZL4mirr
.L15:
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	bne	a0,zero,.L19
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	.cfi_restore_state
	srli	a1,a1,4
	andi	a1,a1,1
	addi	a1,a1,2
	lla	s0,_ZL4mirr
	sb	a1,0(s0)
	la a1, _ZL4preg; lbu a1, 0(a1);
	j	.L15
.L19:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
	.size	_ZL8M71Writejh, .-_ZL8M71Writejh
	.section	.text._Z13Mapper71_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper71_InitP8CartInfo
	.hidden	_Z13Mapper71_InitP8CartInfo
	.type	_Z13Mapper71_InitP8CartInfo, @function
_Z13Mapper71_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL8M71Powerv
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
	.size	_Z13Mapper71_InitP8CartInfo, .-_Z13Mapper71_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4preg
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
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
