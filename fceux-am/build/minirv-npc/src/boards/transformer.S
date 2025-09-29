#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"transformer.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL16TransformerClosev,"ax",@progbits
	.align	2
	.type	_ZL16TransformerClosev, @function
_ZL16TransformerClosev:
.LFB9:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL16TransformerClosev, .-_ZL16TransformerClosev
	.section	.text._ZL16TransformerPowerv,"ax",@progbits
	.align	2
	.type	_ZL16TransformerPowerv, @function
_ZL16TransformerPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,20480
	lla	a2,_ZL15TransformerReadj
	addi	a1,a1,4
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lla	a5,_ZL18TransformerIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	_ZL16TransformerPowerv, .-_ZL16TransformerPowerv
	.section	.text._ZL18TransformerIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL18TransformerIRQHooki, @function
_ZL18TransformerIRQHooki:
.LFB6:
	.cfi_startproc
	lla	a5,_ZL21TransformerCycleCount
	lw	a3,0(a5)
	li	a4,999
	add	a0,a0,a3
	bgt	a0,a4,.L25
	sw	a0,0(a5)
	ret
.L25:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	addi	a0,a0,-1000
	sw	a0,0(a5)
	lla	s0,_ZL15TransformerKeys
	call	_Z11GetKeyboardv
	sw	a0,0(s0)
	lla	a5,_ZL7oldkeys
	li	a4,0
	li	a1,256
	j	.L18
.L15:
	addi	a4,a4,1
	beq	a4,a1,.L26
.L18:
	lw	a3,0(a5)
	lw	a2,0(a0)
	addi	a5,a5,4
	addi	a0,a0,4
	beq	a3,a2,.L15
	ori	a5,a4,128
	bne	a3,zero,.L17
	mv	a5,a4
.L17:
	li	a0,1
	la a4, _ZL15TransformerChar; sw a5, 0(a4);
	call	_Z14X6502_IRQBegini
	lw	a1,0(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a2,1024
	lla	a0,_ZL7oldkeys
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	memcpy
.L26:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	_ZL18TransformerIRQHooki, .-_ZL18TransformerIRQHooki
	.section	.text._ZL15TransformerReadj,"ax",@progbits
	.align	2
	.type	_ZL15TransformerReadj, @function
_ZL15TransformerReadj:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a0,a0,3
	beq	a0,zero,.L28
	li	a5,1
	li	s0,0
	bne	a0,a5,.L30
	la s0, _ZL15TransformerChar; lw s0, 0(s0);
	srai	s0,s0,4
	andi	s0,s0,0xff
.L30:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L28:
	.cfi_restore_state
	la s0, _ZL15TransformerChar; lw s0, 0(s0);
	li	a0,1
	call	_Z12X6502_IRQEndi
	andi	s0,s0,15
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_ZL15TransformerReadj, .-_ZL15TransformerReadj
	.section	.rodata._Z16Transformer_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z16Transformer_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z16Transformer_InitP8CartInfo
	.hidden	_Z16Transformer_InitP8CartInfo
	.type	_Z16Transformer_InitP8CartInfo, @function
_Z16Transformer_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL16TransformerPowerv
	sw	a5,0(a0)
	lla	a5,_ZL16TransformerClosev
	lla	s1,_ZL8WRAMSIZE
	sw	a5,8(a0)
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,_ZL4WRAM
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L34
	sw	a0,12(s0)
	sw	a1,28(s0)
.L34:
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lla	a3,.LC0
	li	a2,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z16Transformer_InitP8CartInfo, .-_Z16Transformer_InitP8CartInfo
	.section	.sbss._ZL15TransformerChar,"aw",@nobits
	.align	2
	.type	_ZL15TransformerChar, @object
	.size	_ZL15TransformerChar, 4
_ZL15TransformerChar:
	.zero	4
	.section	.sbss._ZL21TransformerCycleCount,"aw",@nobits
	.align	2
	.type	_ZL21TransformerCycleCount, @object
	.size	_ZL21TransformerCycleCount, 4
_ZL21TransformerCycleCount:
	.zero	4
	.section	.bss._ZL7oldkeys,"aw",@nobits
	.align	2
	.type	_ZL7oldkeys, @object
	.size	_ZL7oldkeys, 1024
_ZL7oldkeys:
	.zero	1024
	.section	.sbss._ZL15TransformerKeys,"aw",@nobits
	.align	2
	.type	_ZL15TransformerKeys, @object
	.size	_ZL15TransformerKeys, 4
_ZL15TransformerKeys:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
