#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"235.cpp"
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
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL6cmdreg
	lhu	a0,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	andi	a5,a0,1024
	beq	a5,zero,.L2
	li	a0,2
	call	_Z9setmirrori
	lhu	a5,0(s0)
	slli	a4,a5,20
	bge	a4,zero,.L4
.L7:
	srli	a1,a5,3
	slli	a4,a5,1
	andi	a4,a4,62
	andi	a1,a1,96
	srli	a5,a5,12
	or	a1,a1,a4
	andi	a5,a5,1
	or	a1,a1,a5
	li	a0,32768
	call	_Z8setprg16jj
	lhu	a5,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	srli	a1,a5,3
	slli	a4,a5,1
	andi	a1,a1,96
	andi	a4,a4,62
	srli	a5,a5,12
	or	a1,a1,a4
	andi	a5,a5,1
	li	a0,49152
	or	a1,a1,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L2:
	.cfi_restore_state
	srli	a0,a0,13
	xori	a0,a0,1
	andi	a0,a0,1
	call	_Z9setmirrori
	lhu	a5,0(s0)
	slli	a4,a5,20
	blt	a4,zero,.L7
.L4:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	srli	a1,a5,4
	andi	a1,a1,48
	andi	a5,a5,31
	or	a1,a1,a5
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL11M235Restorei,"ax",@progbits
	.align	2
	.type	_ZL11M235Restorei, @function
_ZL11M235Restorei:
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL11M235Restorei, .-_ZL11M235Restorei
	.section	.text._ZL9M235Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M235Writejh, @function
_ZL9M235Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL6cmdreg; sh a0, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M235Writejh, .-_ZL9M235Writejh
	.section	.text._ZL9M235Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M235Powerv, @function
_ZL9M235Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,0
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL9M235Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6cmdreg; sh zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9M235Powerv, .-_ZL9M235Powerv
	.section	.text._Z14Mapper235_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper235_InitP8CartInfo
	.hidden	_Z14Mapper235_InitP8CartInfo
	.type	_Z14Mapper235_InitP8CartInfo, @function
_Z14Mapper235_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL9M235Powerv
	sw	a5,0(a0)
	lla	a5,_ZL11M235Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z14Mapper235_InitP8CartInfo, .-_Z14Mapper235_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL6cmdreg
	.word	2
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL6cmdreg,"aw",@nobits
	.align	1
	.type	_ZL6cmdreg, @object
	.size	_ZL6cmdreg, 2
_ZL6cmdreg:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
