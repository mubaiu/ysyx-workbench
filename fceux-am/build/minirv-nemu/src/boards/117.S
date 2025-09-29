#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"117.cpp"
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
	lla	s0,_ZL6prgreg
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL6chrreg
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s2,8192
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,57344
	li	s0,0
	call	_Z7setprg8jj
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L2
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	la a0, _ZL6mirror; lbu a0, 0(a0);
	xori	a0,a0,1
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
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M117Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M117Powerv, @function
_ZL9M117Powerv:
.LFB8:
	.cfi_startproc
	li	a5,-65536
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a5,a5,-516
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL6prgreg; sw a5, 0(a4);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M117Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL9M117Powerv, .-_ZL9M117Powerv
	.section	.text._ZL11M117IRQHookv,"ax",@progbits
	.align	2
	.type	_ZL11M117IRQHookv, @function
_ZL11M117IRQHookv:
.LFB9:
	.cfi_startproc
	lla	a5,_ZL4IRQa
	lbu	a3,0(a5)
	li	a4,3
	beq	a3,a4,.L16
.L9:
	ret
.L16:
	lla	a3,_ZL8IRQCount
	lbu	a4,0(a3)
	beq	a4,zero,.L9
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	bne	a4,zero,.L9
	li	a4,1
	li	a0,1
	sb	a4,0(a5)
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE9:
	.size	_ZL11M117IRQHookv, .-_ZL11M117IRQHookv
	.section	.text._ZL9M117Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M117Writejh, @function
_ZL9M117Writejh:
.LFB7:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,3
	bleu	a0,a5,.L27
	li	a5,-40960
	add	a5,a0,a5
	li	a4,7
	bleu	a5,a4,.L28
	li	a5,49152
	addi	a5,a5,3
	beq	a0,a5,.L20
	bleu	a0,a5,.L29
	li	a5,53248
	beq	a0,a5,.L25
	li	a5,57344
	bne	a0,a5,.L30
	lla	a4,_ZL4IRQa
	lbu	a5,0(a4)
	andi	a1,a1,1
	li	a0,1
	andi	a5,a5,-2
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_Z12X6502_IRQEndi
.L28:
	andi	a0,a0,7
	lla	a5,_ZL6chrreg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L27:
	andi	a0,a0,3
	lla	a5,_ZL6prgreg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L29:
	li	a5,49152
	addi	a5,a5,1
	beq	a0,a5,.L22
	li	a5,49152
	addi	a5,a5,2
	bne	a0,a5,.L31
	li	a0,1
	tail	_Z12X6502_IRQEndi
.L20:
	lla	a4,_ZL4IRQa
	lbu	a5,0(a4)
	la a3, _ZL8IRQLatch; lbu a3, 0(a3);
	la a2, _ZL8IRQCount; sb a3, 0(a2);
	ori	a5,a5,2
	sb	a5,0(a4)
	ret
.L25:
	andi	a1,a1,1
	la a5, _ZL6mirror; sb a1, 0(a5);
	ret
.L22:
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	ret
.L30:
	ret
.L31:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL9M117Writejh, .-_ZL9M117Writejh
	.section	.text._Z14Mapper117_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper117_InitP8CartInfo
	.hidden	_Z14Mapper117_InitP8CartInfo
	.type	_Z14Mapper117_InitP8CartInfo, @function
_Z14Mapper117_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9M117Powerv
	sw	a5,0(a0)
	lla	a5,_ZL11M117IRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper117_InitP8CartInfo, .-_Z14Mapper117_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQA"
	.align	2
.LC1:
	.string	"IRQC"
	.align	2
.LC2:
	.string	"IRQL"
	.align	2
.LC3:
	.string	"PREG"
	.align	2
.LC4:
	.string	"CREG"
	.align	2
.LC5:
	.string	"MREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4IRQa
	.word	1
	.word	.LC0
	.word	_ZL8IRQCount
	.word	1
	.word	.LC1
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC2
	.word	_ZL6prgreg
	.word	4
	.word	.LC3
	.word	_ZL6chrreg
	.word	8
	.word	.LC4
	.word	_ZL6mirror
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL6mirror,"aw",@nobits
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.section	.sbss._ZL6chrreg,"aw",@nobits
	.align	2
	.type	_ZL6chrreg, @object
	.size	_ZL6chrreg, 8
_ZL6chrreg:
	.zero	8
	.section	.sbss._ZL6prgreg,"aw",@nobits
	.align	2
	.type	_ZL6prgreg, @object
	.size	_ZL6prgreg, 4
_ZL6prgreg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
