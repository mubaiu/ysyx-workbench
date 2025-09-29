#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"246.cpp"
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
	li	a1,28672
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	addi	a1,a1,-2048
	li	a0,16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg2rijj
	lla	s0,_ZL4regs
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,4(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,5(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,6(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,7(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,8192
	addi	a0,a0,-2048
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr2jj
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
	.section	.text._ZL9M246Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M246Writejh, @function
_ZL9M246Writejh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL4regs
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M246Writejh, .-_ZL9M246Writejh
	.section	.text._ZL9M246Closev,"ax",@progbits
	.align	2
	.type	_ZL9M246Closev, @function
_ZL9M246Closev:
.LFB9:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L12
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L12:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9M246Closev, .-_ZL9M246Closev
	.section	.text._ZL9M246Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M246Powerv, @function
_ZL9M246Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, _ZL4regs; sw a5, 0(a4);
	call	_ZL4Syncv
	li	a1,24576
	lla	a2,_ZL9M246Writejh
	addi	a1,a1,2047
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,28672
	li	a0,28672
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	li	a1,28672
	li	a0,28672
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE8:
	.size	_ZL9M246Powerv, .-_ZL9M246Powerv
	.section	.rodata._Z14Mapper246_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper246_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper246_InitP8CartInfo
	.hidden	_Z14Mapper246_InitP8CartInfo
	.type	_Z14Mapper246_InitP8CartInfo, @function
_Z14Mapper246_InitP8CartInfo:
.LFB11:
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
	lla	a4,_ZL9M246Powerv
	li	a5,4096
	addi	a5,a5,-2048
	sw	a4,0(a0)
	lla	a4,_ZL9M246Closev
	lla	s1,_ZL8WRAMSIZE
	sw	a4,8(a0)
	mv	s0,a0
	lla	a4,_ZL12StateRestorei
	mv	a0,a5
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s2,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s2)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L18
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L18:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper246_InitP8CartInfo, .-_Z14Mapper246_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC1
	.word	0
	.zero	8
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
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
