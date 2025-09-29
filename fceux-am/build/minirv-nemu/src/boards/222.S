#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"222.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lla	s0,_ZL7prg_reg
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL7chr_reg
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	li	s2,8192
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
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
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
	.section	.text._ZL9M222Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M222Powerv, @function
_ZL9M222Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,-1
	li	a0,49152
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg16jj
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M222Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL9M222Powerv, .-_ZL9M222Powerv
	.section	.text._ZL9M222Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M222Writejh, @function
_ZL9M222Writejh:
.LFB8:
	.cfi_startproc
	li	a4,61440
	addi	a4,a4,3
	li	a5,49152
	and	a0,a0,a4
	addi	a5,a5,2
	beq	a0,a5,.L10
	bgtu	a0,a5,.L11
	li	a5,45056
	beq	a0,a5,.L12
	bgtu	a0,a5,.L13
	li	a5,36864
	beq	a0,a5,.L14
	li	a5,40960
	beq	a0,a5,.L15
	li	a5,32768
	bne	a0,a5,.L29
	la a5, _ZL7prg_reg; sb a1, 0(a5);
	j	.L29
.L11:
	li	a5,57344
	beq	a0,a5,.L20
	bleu	a0,a5,.L31
	li	a5,57344
	addi	a5,a5,2
	beq	a0,a5,.L24
	li	a4,61440
	bne	a0,a4,.L29
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4IRQa; sb a1, 0(a5);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, scanline; lw a4, 0(a4);
	li	a5,239
	ble	a4,a5,.L32
	addi	a1,a1,4
	andi	a1,a1,0xff
.L27:
	li	a0,1
	la a5, _ZL8IRQCount; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L31:
	li	a5,53248
	beq	a0,a5,.L22
	addi	a5,a5,2
	bne	a0,a5,.L29
	la a5, _ZL7chr_reg+5; sb a1, 0(a5);
.L29:
	tail	_ZL4Syncv
.L14:
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
	j	.L29
.L13:
	li	a5,45056
	addi	a5,a5,2
	beq	a0,a5,.L18
	li	a3,49152
	bne	a0,a3,.L29
	la a5, _ZL7chr_reg+2; sb a1, 0(a5);
	j	.L29
.L22:
	la a5, _ZL7chr_reg+4; sb a1, 0(a5);
	j	.L29
.L24:
	la a5, _ZL7chr_reg+7; sb a1, 0(a5);
	j	.L29
.L18:
	la a5, _ZL7chr_reg+1; sb a1, 0(a5);
	j	.L29
.L12:
	la a5, _ZL7chr_reg; sb a1, 0(a5);
	j	.L29
.L10:
	la a5, _ZL7chr_reg+3; sb a1, 0(a5);
	j	.L29
.L20:
	la a5, _ZL7chr_reg+6; sb a1, 0(a5);
	j	.L29
.L15:
	la a5, _ZL7prg_reg+1; sb a1, 0(a5);
	j	.L29
.L32:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	addi	a1,a1,-8
	andi	a1,a1,0xff
	j	.L27
	.cfi_endproc
.LFE8:
	.size	_ZL9M222Writejh, .-_ZL9M222Writejh
	.section	.text._ZL7M222IRQv,"ax",@progbits
	.align	2
	.type	_ZL7M222IRQv, @function
_ZL7M222IRQv:
.LFB6:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L33
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	li	a3,237
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bgtu	a5,a3,.L37
.L33:
	ret
.L37:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE6:
	.size	_ZL7M222IRQv, .-_ZL7M222IRQv
	.section	.text._Z14Mapper222_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper222_InitP8CartInfo
	.hidden	_Z14Mapper222_InitP8CartInfo
	.type	_Z14Mapper222_InitP8CartInfo, @function
_Z14Mapper222_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9M222Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7M222IRQv
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
	.size	_Z14Mapper222_InitP8CartInfo, .-_Z14Mapper222_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"IRQC"
	.align	2
.LC1:
	.string	"IRQA"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL8IRQCount
	.word	1
	.word	.LC0
	.word	_ZL4IRQa
	.word	1
	.word	.LC1
	.word	_ZL7prg_reg
	.word	2
	.word	.LC2
	.word	_ZL7chr_reg
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.align	2
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 8
_ZL7chr_reg:
	.zero	8
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.align	2
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 2
_ZL7prg_reg:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
