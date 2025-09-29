#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"3d-block.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._ZL15UNL3DBlockResetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Count=%04x\n"
	.section	.text._ZL15UNL3DBlockResetv,"ax",@progbits
	.align	2
	.type	_ZL15UNL3DBlockResetv, @function
_ZL15UNL3DBlockResetv:
.LFB9:
	.cfi_startproc
	lla	a5,_ZL5Count
	lhu	a1,0(a5)
	lla	a0,.LC0
	addi	a1,a1,16
	slli	a1,a1,16
	srai	a1,a1,16
	sh	a1,0(a5)
	tail	printf
	.cfi_endproc
.LFE9:
	.size	_ZL15UNL3DBlockResetv, .-_ZL15UNL3DBlockResetv
	.section	.text._ZL15UNL3DBlockPowerv,"ax",@progbits
	.align	2
	.type	_ZL15UNL3DBlockPowerv, @function
_ZL15UNL3DBlockPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL15UNL3DBlockWritejh
	addi	a1,a1,-512
	addi	a0,a0,-2048
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL15UNL3DBlockPowerv, .-_ZL15UNL3DBlockPowerv
	.section	.text._ZL17UNL3DBlockIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL17UNL3DBlockIRQHooki, @function
_ZL17UNL3DBlockIRQHooki:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L5
	lla	a4,_ZL8IRQCount
	lh	a5,0(a4)
	ble	a5,zero,.L7
	sub	a5,a5,a0
	sh	a5,0(a4)
	ret
.L5:
	ret
.L7:
	lla	a3,_ZL8IRQPause
	lh	a5,0(a3)
	ble	a5,zero,.L8
	sub	a5,a5,a0
	li	a0,1
	sh	a5,0(a3)
	tail	_Z14X6502_IRQBegini
.L8:
	la a5, _ZL5Count; lhu a5, 0(a5);
	sh	a5,0(a4)
	li	a0,1
	li	a5,16
	sh	a5,0(a3)
	tail	_Z12X6502_IRQEndi
	.cfi_endproc
.LFE10:
	.size	_ZL17UNL3DBlockIRQHooki, .-_ZL17UNL3DBlockIRQHooki
	.section	.text._ZL15UNL3DBlockWritejh,"ax",@progbits
	.align	2
	.type	_ZL15UNL3DBlockWritejh, @function
_ZL15UNL3DBlockWritejh:
.LFB7:
	.cfi_startproc
	li	a5,20480
	addi	a5,a5,-1536
	beq	a0,a5,.L13
	bgtu	a0,a5,.L14
	li	a5,20480
	addi	a5,a5,-2048
	beq	a0,a5,.L15
	li	a5,20480
	addi	a5,a5,-1792
	bne	a0,a5,.L19
	la a5, _ZL3reg+1; sb a1, 0(a5);
	ret
.L14:
	li	a5,20480
	addi	a5,a5,-512
	bne	a0,a5,.L20
	la a5, _ZL5Count; lhu a5, 0(a5);
	la a4, _ZL8IRQCount; sh a5, 0(a4);
	li	a5,16
	la a4, _ZL8IRQPause; sh a5, 0(a4);
	li	a5,1
	li	a0,1
	la a4, _ZL3reg+3; sb a1, 0(a4);
	la a4, _ZL4IRQa; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L13:
	la a5, _ZL3reg+2; sb a1, 0(a5);
	ret
.L15:
	la a5, _ZL3reg; sb a1, 0(a5);
	ret
.L20:
	ret
.L19:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL15UNL3DBlockWritejh, .-_ZL15UNL3DBlockWritejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,32768
	li	a1,0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._Z15UNL3DBlock_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNL3DBlock_InitP8CartInfo
	.hidden	_Z15UNL3DBlock_InitP8CartInfo
	.type	_Z15UNL3DBlock_InitP8CartInfo, @function
_Z15UNL3DBlock_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL15UNL3DBlockPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNL3DBlockResetv
	sw	a5,4(a0)
	lla	a5,_ZL17UNL3DBlockIRQHooki
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
	.size	_Z15UNL3DBlock_InitP8CartInfo, .-_Z15UNL3DBlock_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3reg
	.word	4
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	2
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL5Count,"aw",@nobits
	.align	1
	.type	_ZL5Count, @object
	.size	_ZL5Count, 2
_ZL5Count:
	.zero	2
	.section	.sbss._ZL8IRQPause,"aw",@nobits
	.align	1
	.type	_ZL8IRQPause, @object
	.size	_ZL8IRQPause, 2
_ZL8IRQPause:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 4
_ZL3reg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
