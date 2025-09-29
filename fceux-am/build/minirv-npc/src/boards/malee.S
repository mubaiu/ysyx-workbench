#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"malee.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL10MALEEPowerv,"ax",@progbits
	.align	2
	.type	_ZL10MALEEPowerv, @function
_ZL10MALEEPowerv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,28672
	li	a0,16
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg2rijj
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_Z6CartBRj
	addi	a1,a1,2047
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	lla	a2,_Z6CartBRj
	addi	a1,a1,2047
	li	a0,28672
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	lla	a2,_Z6CartBWjh
	addi	a1,a1,2047
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,1
	call	_Z8setprg2rijj
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL10MALEEPowerv, .-_ZL10MALEEPowerv
	.section	.rodata._Z10MALEE_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z10MALEE_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10MALEE_InitP8CartInfo
	.hidden	_Z10MALEE_InitP8CartInfo
	.type	_Z10MALEE_InitP8CartInfo, @function
_Z10MALEE_InitP8CartInfo:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL10MALEEPowerv
	li	a1,4096
	sw	a5,0(a0)
	li	a2,1
	addi	a1,a1,-2048
	lla	a0,_ZL4WRAM
	call	_Z15FCEU_MemoryRandPhjb
	li	a2,4096
	li	a3,1
	addi	a2,a2,-2048
	lla	a1,_ZL4WRAM
	li	a0,16
	call	_Z19SetupCartPRGMappingiPhji
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,4096
	lla	a3,.LC0
	li	a2,0
	addi	a1,a1,-2048
	lla	a0,_ZL4WRAM
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE7:
	.size	_Z10MALEE_InitP8CartInfo, .-_Z10MALEE_InitP8CartInfo
	.section	.bss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 2048
_ZL4WRAM:
	.zero	2048
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
