#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"77.cpp"
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
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,7
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,4
	call	_Z7setchr2jj
	li	a1,4096
	li	a2,2
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setchr2rijj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setchr4rijj
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
	.section	.text._ZL8M77Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M77Writejh, @function
_ZL8M77Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL6latche; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL8M77Writejh, .-_ZL8M77Writejh
	.section	.text._ZL8M77Closev,"ax",@progbits
	.align	2
	.type	_ZL8M77Closev, @function
_ZL8M77Closev:
.LFB9:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L12:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M77Closev, .-_ZL8M77Closev
	.section	.text._ZL8M77Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M77Powerv, @function
_ZL8M77Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL6latche; sb zero, 0(a5);
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
	lla	a2,_ZL8M77Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M77Powerv, .-_ZL8M77Powerv
	.section	.rodata._Z13Mapper77_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.section	.text._Z13Mapper77_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper77_InitP8CartInfo
	.hidden	_Z13Mapper77_InitP8CartInfo
	.type	_Z13Mapper77_InitP8CartInfo, @function
_Z13Mapper77_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL8M77Powerv
	li	a5,8192
	addi	a5,a5,-2048
	sw	a4,0(a0)
	lla	a4,_ZL8M77Closev
	lla	s0,_ZL10CHRRAMSIZE
	sw	a4,8(a0)
	lla	a4,_ZL12StateRestorei
	mv	a0,a5
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z13Mapper77_InitP8CartInfo, .-_Z13Mapper77_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL6latche
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
