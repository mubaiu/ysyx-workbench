#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"190.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL14Mapper190_Syncv,"ax",@progbits
	.align	2
	.type	_ZL14Mapper190_Syncv, @function
_ZL14Mapper190_Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg8rijj
	la a1, _ZL4prgr; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,0
	li	a0,49152
	call	_Z8setprg16jj
	lla	s0,_ZL4chrr
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
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
	.size	_ZL14Mapper190_Syncv, .-_ZL14Mapper190_Syncv
	.section	.text._ZL17Mapper190_Restorei,"ax",@progbits
	.align	2
	.type	_ZL17Mapper190_Restorei, @function
_ZL17Mapper190_Restorei:
.LFB12:
	.cfi_startproc
	tail	_ZL14Mapper190_Syncv
	.cfi_endproc
.LFE12:
	.size	_ZL17Mapper190_Restorei, .-_ZL17Mapper190_Restorei
	.section	.text._ZL17Mapper190_WriteCDjh,"ax",@progbits
	.align	2
	.type	_ZL17Mapper190_WriteCDjh, @function
_ZL17Mapper190_WriteCDjh:
.LFB8:
	.cfi_startproc
	andi	a1,a1,7
	ori	a1,a1,8
	la a5, _ZL4prgr; sb a1, 0(a5);
	tail	_ZL14Mapper190_Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL17Mapper190_WriteCDjh, .-_ZL17Mapper190_WriteCDjh
	.section	.text._ZL17Mapper190_WriteABjh,"ax",@progbits
	.align	2
	.type	_ZL17Mapper190_WriteABjh, @function
_ZL17Mapper190_WriteABjh:
.LFB9:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4chrr
	add	a5,a5,a0
	andi	a1,a1,63
	sb	a1,0(a5)
	tail	_ZL14Mapper190_Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL17Mapper190_WriteABjh, .-_ZL17Mapper190_WriteABjh
	.section	.text._ZL17Mapper190_Write89jh,"ax",@progbits
	.align	2
	.type	_ZL17Mapper190_Write89jh, @function
_ZL17Mapper190_Write89jh:
.LFB7:
	.cfi_startproc
	andi	a1,a1,7
	la a5, _ZL4prgr; sb a1, 0(a5);
	tail	_ZL14Mapper190_Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL17Mapper190_Write89jh, .-_ZL17Mapper190_Write89jh
	.section	.text._ZL15Mapper190_Closev,"ax",@progbits
	.align	2
	.type	_ZL15Mapper190_Closev, @function
_ZL15Mapper190_Closev:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL4WRAM
	lw	a0,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	zero,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_ZL15Mapper190_Closev, .-_ZL15Mapper190_Closev
	.section	.text._ZL15Mapper190_Powerv,"ax",@progbits
	.align	2
	.type	_ZL15Mapper190_Powerv, @function
_ZL15Mapper190_Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	li	a0,8
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z16FCEU_CheatAddRAMijPh
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL17Mapper190_Write89jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_ZL17Mapper190_WriteABjh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	li	a0,49152
	lla	a2,_ZL17Mapper190_WriteCDjh
	addi	a1,a1,-1
	call	_Z15SetWriteHandleriiPFvjhE
	call	_ZL14Mapper190_Syncv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE10:
	.size	_ZL15Mapper190_Powerv, .-_ZL15Mapper190_Powerv
	.section	.rodata._Z14Mapper190_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRGR"
	.align	2
.LC1:
	.string	"CHRR"
	.align	2
.LC2:
	.string	"WRAM"
	.section	.text._Z14Mapper190_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper190_InitP8CartInfo
	.hidden	_Z14Mapper190_InitP8CartInfo
	.type	_Z14Mapper190_InitP8CartInfo, @function
_Z14Mapper190_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL15Mapper190_Powerv
	sw	a5,0(a0)
	lla	a5,_ZL15Mapper190_Closev
	sw	a5,8(a0)
	lla	a5,_ZL17Mapper190_Restorei
	li	a0,8192
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,_ZL4WRAM
	li	a3,1
	li	a2,8192
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartPRGMappingiPhji
	lla	a0,_ZL4prgr
	lla	s1,_ZL4chrr
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	sb	zero,0(a0)
	sw	zero,0(s1)
	call	_Z10AddExStatePvjiPKc
	mv	a0,s1
	lla	a3,.LC1
	li	a2,0
	li	a1,4
	call	_Z10AddExStatePvjiPKc
	lw	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC2
	li	a2,0
	li	a1,8192
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14Mapper190_InitP8CartInfo, .-_Z14Mapper190_InitP8CartInfo
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4chrr,"aw",@nobits
	.align	2
	.type	_ZL4chrr, @object
	.size	_ZL4chrr, 4
_ZL4chrr:
	.zero	4
	.section	.sbss._ZL4prgr,"aw",@nobits
	.type	_ZL4prgr, @object
	.size	_ZL4prgr, 1
_ZL4prgr:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
