#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"novel.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10NovelWritejh,"ax",@progbits
	.align	2
	.type	_ZL10NovelWritejh, @function
_ZL10NovelWritejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	andi	a5,a0,0xff
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	li	a0,32768
	andi	a1,a5,3
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a0,a0,7
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL10NovelWritejh, .-_ZL10NovelWritejh
	.section	.text._ZL10NovelResetv,"ax",@progbits
	.align	2
	.type	_ZL10NovelResetv, @function
_ZL10NovelResetv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL10NovelWritejh
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE8:
	.size	_ZL10NovelResetv, .-_ZL10NovelResetv
	.section	.text._ZL12NovelRestorei,"ax",@progbits
	.align	2
	.type	_ZL12NovelRestorei, @function
_ZL12NovelRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a0,a0,7
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL12NovelRestorei, .-_ZL12NovelRestorei
	.section	.rodata._Z10Novel_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"L1"
	.section	.text._Z10Novel_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10Novel_InitP8CartInfo
	.hidden	_Z10Novel_InitP8CartInfo
	.type	_Z10Novel_InitP8CartInfo, @function
_Z10Novel_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	lla	a3,.LC0
	.cfi_offset 8, -8
	mv	s0,a0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL10NovelResetv
	sw	a5,0(s0)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lla	a5,_ZL12NovelRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_Z10Novel_InitP8CartInfo, .-_Z10Novel_InitP8CartInfo
	.section	.sbss._ZL5latch,"aw",@nobits
	.type	_ZL5latch, @object
	.size	_ZL5latch, 1
_ZL5latch:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
