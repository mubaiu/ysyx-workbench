#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc1.cpp"
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
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL4preg
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL4creg
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	lla	s0,_ZL4mode
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a5,0(s0)
	lbu	a1,0(s1)
	li	a0,0
	slli	a5,a5,3
	andi	a5,a5,16
	or	a1,a5,a1
	call	_Z7setchr4jj
	lbu	a5,0(s0)
	lbu	a1,1(s1)
	li	a0,4096
	slli	a5,a5,2
	andi	a5,a5,16
	or	a1,a5,a1
	call	_Z7setchr4jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
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
	.section	.text._ZL8M75Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M75Writejh, @function
_ZL8M75Writejh:
.LFB7:
	.cfi_startproc
	li	a4,61440
	and	a0,a0,a4
	li	a5,49152
	beq	a0,a5,.L6
	bgtu	a0,a5,.L7
	li	a5,36864
	beq	a0,a5,.L8
	li	a5,40960
	beq	a0,a5,.L9
	li	a5,32768
	bne	a0,a5,.L14
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L7:
	li	a5,57344
	beq	a0,a5,.L12
	bne	a0,a4,.L15
	andi	a1,a1,15
	la a5, _ZL4creg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L15:
	ret
.L14:
	ret
.L12:
	andi	a1,a1,15
	la a5, _ZL4creg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	la a5, _ZL4preg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	la a5, _ZL4mode; sb a1, 0(a5);
	tail	_ZL4Syncv
.L6:
	la a5, _ZL4preg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL8M75Writejh, .-_ZL8M75Writejh
	.section	.text._ZL8M75Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M75Powerv, @function
_ZL8M75Powerv:
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
	lla	a2,_ZL8M75Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL8M75Powerv, .-_ZL8M75Powerv
	.section	.text._Z13Mapper75_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper75_InitP8CartInfo
	.hidden	_Z13Mapper75_InitP8CartInfo
	.type	_Z13Mapper75_InitP8CartInfo, @function
_Z13Mapper75_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL8M75Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_Z13Mapper75_InitP8CartInfo, .-_Z13Mapper75_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MODE"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"PREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4mode
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	2
	.word	.LC1
	.word	_ZL4preg
	.word	3
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4mode,"aw",@nobits
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 2
_ZL4creg:
	.zero	2
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
