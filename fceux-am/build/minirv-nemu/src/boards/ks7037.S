#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7037.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB12:
	.cfi_startproc
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE12:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10SyncKS7037v,"ax",@progbits
	.align	2
	.type	_ZL10SyncKS7037v, @function
_ZL10SyncKS7037v:
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
	call	_Z8setprg4rijj
	li	a1,15
	li	a0,28672
	call	_Z7setprg4jj
	lla	s0,_ZL3reg
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-4
	li	a0,40960
	call	_Z7setprg4jj
	li	a2,1
	li	a1,45056
	li	a0,16
	call	_Z8setprg4rijj
	lbu	a1,7(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a3,5(s0)
	lbu	a2,3(s0)
	lbu	a1,4(s0)
	lbu	a0,2(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a3,a3,1
	andi	a2,a2,1
	andi	a1,a1,1
	andi	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10setmirrorwiiii
	.cfi_endproc
.LFE6:
	.size	_ZL10SyncKS7037v, .-_ZL10SyncKS7037v
	.section	.text._ZL5Closev,"ax",@progbits
	.align	2
	.type	_ZL5Closev, @function
_ZL5Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L11
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
.L11:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL5Closev, .-_ZL5Closev
	.section	.text._ZL14UNLKS7037Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7037Powerv, @function
_ZL14UNLKS7037Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL3reg
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a5, _ZL5WSync; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL14UNLKS7037Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL14UNLKS7037Writejh
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLKS7037Powerv, .-_ZL14UNLKS7037Powerv
	.section	.text._ZL8SyncLH10v,"ax",@progbits
	.align	2
	.type	_ZL8SyncLH10v, @function
_ZL8SyncLH10v:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,-2
	li	a0,24576
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setprg8jj
	lla	s0,_ZL3reg
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a2,0
	li	a1,49152
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,0
	call	_Z7setchr8j
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
	.size	_ZL8SyncLH10v, .-_ZL8SyncLH10v
	.section	.text._ZL9LH10Powerv,"ax",@progbits
	.align	2
	.type	_ZL9LH10Powerv, @function
_ZL9LH10Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL3reg
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a5, _ZL5WSync; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_ZL14UNLKS7037Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL14UNLKS7037Writejh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
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
.LFE10:
	.size	_ZL9LH10Powerv, .-_ZL9LH10Powerv
	.section	.text._ZL14UNLKS7037Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7037Writejh, @function
_ZL14UNLKS7037Writejh:
.LFB8:
	.cfi_startproc
	li	a5,57344
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,32768
	beq	a0,a5,.L21
	addi	a5,a5,1
	beq	a0,a5,.L22
	ret
.L22:
	la a4, _ZL3cmd; lbu a4, 0(a4);
	lla	a5,_ZL3reg
	add	a5,a5,a4
	sb	a1,0(a5)
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L21:
	andi	a1,a1,7
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLKS7037Writejh, .-_ZL14UNLKS7037Writejh
	.section	.rodata._Z14UNLKS7037_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7037_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7037_InitP8CartInfo
	.hidden	_Z14UNLKS7037_InitP8CartInfo
	.type	_Z14UNLKS7037_InitP8CartInfo, @function
_Z14UNLKS7037_InitP8CartInfo:
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
	lla	a5,_ZL14UNLKS7037Powerv
	sw	a5,0(a0)
	lla	a5,_ZL5Closev
	sw	a5,8(a0)
	lla	a5,_ZL10SyncKS7037v
	lla	s0,_ZL8WRAMSIZE
	la a4, _ZL5WSync; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
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
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14UNLKS7037_InitP8CartInfo, .-_Z14UNLKS7037_InitP8CartInfo
	.section	.text._Z9LH10_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9LH10_InitP8CartInfo
	.hidden	_Z9LH10_InitP8CartInfo
	.type	_Z9LH10_InitP8CartInfo, @function
_Z9LH10_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL9LH10Powerv
	sw	a5,0(a0)
	lla	a5,_ZL5Closev
	sw	a5,8(a0)
	lla	a5,_ZL8SyncLH10v
	lla	s0,_ZL8WRAMSIZE
	la a4, _ZL5WSync; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
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
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z9LH10_InitP8CartInfo, .-_Z9LH10_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	8
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
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
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
