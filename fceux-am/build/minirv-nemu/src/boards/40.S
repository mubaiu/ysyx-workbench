#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"40.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL8M40Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M40Resetv, @function
_ZL8M40Resetv:
.LFB9:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M40Resetv, .-_ZL8M40Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,-2
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a1,-4
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-3
	li	a0,40960
	call	_Z7setprg8jj
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M40Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M40Powerv, @function
_ZL8M40Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL3reg; sb zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL8M40Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M40Powerv, .-_ZL8M40Powerv
	.section	.text._ZL10M40IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M40IRQHooki, @function
_ZL10M40IRQHooki:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L8
	lla	a5,_ZL8IRQCount
	lw	a4,0(a5)
	li	a3,4096
	bgeu	a4,a3,.L10
	add	a0,a0,a4
	sw	a0,0(a5)
	ret
.L8:
	ret
.L10:
	li	a0,1
	la a5, _ZL4IRQa; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE10:
	.size	_ZL10M40IRQHooki, .-_ZL10M40IRQHooki
	.section	.text._ZL8M40Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M40Writejh, @function
_ZL8M40Writejh:
.LFB7:
	.cfi_startproc
	li	a5,57344
	and	a0,a0,a5
	li	a4,40960
	beq	a0,a4,.L15
	beq	a0,a5,.L16
	li	a5,32768
	bne	a0,a5,.L14
	li	a0,1
	la a5, _ZL4IRQa; sw zero, 0(a5);
	la a5, _ZL8IRQCount; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L16:
	andi	a1,a1,7
	la a5, _ZL3reg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	ret
.L15:
	li	a5,1
	la a4, _ZL4IRQa; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL8M40Writejh, .-_ZL8M40Writejh
	.section	.text._Z13Mapper40_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper40_InitP8CartInfo
	.hidden	_Z13Mapper40_InitP8CartInfo
	.type	_Z13Mapper40_InitP8CartInfo, @function
_Z13Mapper40_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M40Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M40Resetv
	sw	a5,4(a0)
	lla	a5,_ZL10M40IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13Mapper40_InitP8CartInfo, .-_Z13Mapper40_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"REG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	4
	.word	.LC0
	.word	_ZL4IRQa
	.word	4
	.word	.LC1
	.word	_ZL3reg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
