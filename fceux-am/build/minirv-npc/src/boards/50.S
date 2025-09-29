#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"50.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL8M50Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M50Resetv, @function
_ZL8M50Resetv:
.LFB9:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M50Resetv, .-_ZL8M50Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,15
	li	a0,24576
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a1,8
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,9
	li	a0,40960
	call	_Z7setprg8jj
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,11
	call	_Z7setprg8jj
	lw	ra,8(sp)
	.cfi_restore 1
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
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M50Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M50Powerv, @function
_ZL8M50Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL8M50Writejh
	addi	a1,a1,-1
	addi	a0,a0,32
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M50Powerv, .-_ZL8M50Powerv
	.section	.text._ZL10M50IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M50IRQHooki, @function
_ZL10M50IRQHooki:
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
	.size	_ZL10M50IRQHooki, .-_ZL10M50IRQHooki
	.section	.text._ZL8M50Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M50Writejh, @function
_ZL8M50Writejh:
.LFB7:
	.cfi_startproc
	li	a4,53248
	addi	a4,a4,352
	li	a5,16384
	and	a0,a0,a4
	addi	a5,a5,32
	beq	a0,a5,.L15
	li	a5,16384
	addi	a5,a5,288
	beq	a0,a5,.L18
	ret
.L18:
	andi	a1,a1,1
	la a5, _ZL4IRQa; sw a1, 0(a5);
	bne	a1,zero,.L17
	la a5, _ZL8IRQCount; sw zero, 0(a5);
.L17:
	li	a0,1
	tail	_Z12X6502_IRQEndi
.L15:
	srli	a5,a1,1
	andi	a4,a1,8
	andi	a5,a5,3
	slli	a1,a1,2
	or	a5,a5,a4
	andi	a1,a1,4
	or	a5,a5,a1
	la a4, _ZL3reg; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL8M50Writejh, .-_ZL8M50Writejh
	.section	.text._Z13Mapper50_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper50_InitP8CartInfo
	.hidden	_Z13Mapper50_InitP8CartInfo
	.type	_Z13Mapper50_InitP8CartInfo, @function
_Z13Mapper50_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M50Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M50Resetv
	sw	a5,4(a0)
	lla	a5,_ZL10M50IRQHooki
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
	.size	_Z13Mapper50_InitP8CartInfo, .-_Z13Mapper50_InitP8CartInfo
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
