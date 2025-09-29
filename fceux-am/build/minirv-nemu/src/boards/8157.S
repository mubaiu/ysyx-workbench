#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"8157.cpp"
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
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL6cmdreg
	lhu	a5,0(s1)
	sw	s0,8(sp)
	sw	s2,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	srli	s0,a5,1
	andi	a4,a5,96
	andi	s0,s0,128
	or	s0,s0,a4
	srli	a2,a5,2
	sw	ra,12(sp)
	.cfi_offset 1, -4
	andi	a4,a5,512
	srli	s0,s0,2
	andi	a2,a2,7
	li	s2,7
	bne	a4,zero,.L2
	slli	a5,a5,24
	srai	a5,a5,31
	and	s2,a2,a5
.L2:
	la a5, PRGptr+4; lw a5, 0(a5);
	beq	a5,zero,.L3
	srli	s0,s0,3
	li	a1,32768
	mv	a0,s0
	call	_Z9setprg16rijj
	mv	a2,s2
	li	a1,49152
	mv	a0,s0
	call	_Z9setprg16rijj
.L4:
	lhu	a0,0(s1)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	srli	a0,a0,1
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L3:
	.cfi_restore_state
	or	a1,s0,a2
	li	a0,32768
	call	_Z8setprg16jj
	or	a1,s2,s0
	li	a0,49152
	call	_Z8setprg16jj
	j	.L4
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNL8157Restorei,"ax",@progbits
	.align	2
	.type	_ZL14UNL8157Restorei, @function
_ZL14UNL8157Restorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL14UNL8157Restorei, .-_ZL14UNL8157Restorei
	.section	.text._ZL12UNL8157Resetv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Resetv, @function
_ZL12UNL8157Resetv:
.LFB10:
	.cfi_startproc
	la a5, _ZL6cmdreg; sh zero, 0(a5);
	li	a5,1
	la a4, _ZL5reset; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12UNL8157Resetv, .-_ZL12UNL8157Resetv
	.section	.text._ZL12UNL8157Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Writejh, @function
_ZL12UNL8157Writejh:
.LFB8:
	.cfi_startproc
	la a5, _ZL6cmdreg; sh a0, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL12UNL8157Writejh, .-_ZL12UNL8157Writejh
	.section	.text._ZL12UNL8157Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8157Powerv, @function
_ZL12UNL8157Powerv:
.LFB9:
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
	lla	a2,_ZL12UNL8157Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL11UNL8157Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL5reset; sb zero, 0(a5);
	la a5, _ZL6cmdreg; sh zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12UNL8157Powerv, .-_ZL12UNL8157Powerv
	.section	.text._ZL11UNL8157Readj,"ax",@progbits
	.align	2
	.type	_ZL11UNL8157Readj, @function
_ZL11UNL8157Readj:
.LFB7:
	.cfi_startproc
	la a5, _ZL6cmdreg; lhu a5, 0(a5);
	andi	a5,a5,256
	beq	a5,zero,.L16
	la a4, PRGsize; lw a4, 0(a4);
	li	a5,1048576
	bgeu	a4,a5,.L16
	li	a5,65536
	addi	a5,a5,-16
	and	a0,a0,a5
	la a5, _ZL5reset; lbu a5, 0(a5);
	add	a0,a5,a0
.L16:
	tail	_Z6CartBRj
	.cfi_endproc
.LFE7:
	.size	_ZL11UNL8157Readj, .-_ZL11UNL8157Readj
	.section	.text._Z12UNL8157_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL8157_InitP8CartInfo
	.hidden	_Z12UNL8157_InitP8CartInfo
	.type	_Z12UNL8157_InitP8CartInfo, @function
_Z12UNL8157_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL12UNL8157Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNL8157Resetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNL8157Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z12UNL8157_InitP8CartInfo, .-_Z12UNL8157_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REST"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6cmdreg
	.word	2
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5reset,"aw",@nobits
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6cmdreg,"aw",@nobits
	.align	1
	.type	_ZL6cmdreg, @object
	.size	_ZL6cmdreg, 2
_ZL6cmdreg:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
