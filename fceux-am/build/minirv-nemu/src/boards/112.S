#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"112.cpp"
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
	la a0, _ZL6mirror; lbu a0, 0(a0);
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	xori	a0,a0,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL3reg
	call	_Z9setmirrori
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL4bank
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,-2048
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a5,0(s1)
	lbu	a1,4(s0)
	li	a0,4096
	slli	a5,a5,4
	andi	a5,a5,256
	or	a1,a5,a1
	call	_Z7setchr1jj
	lbu	a5,0(s1)
	lbu	a1,5(s0)
	li	a0,4096
	slli	a5,a5,3
	andi	a5,a5,256
	or	a1,a5,a1
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a5,0(s1)
	lbu	a1,6(s0)
	li	a0,8192
	slli	a5,a5,2
	andi	a5,a5,256
	or	a1,a5,a1
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a5,0(s1)
	lbu	a1,7(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a5,a5,1
	li	a0,8192
	andi	a5,a5,256
	or	a1,a5,a1
	addi	a0,a0,-1024
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
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
	.section	.text._ZL9M112Closev,"ax",@progbits
	.align	2
	.type	_ZL9M112Closev, @function
_ZL9M112Closev:
.LFB8:
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
.LFE8:
	.size	_ZL9M112Closev, .-_ZL9M112Closev
	.section	.text._ZL9M112Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M112Powerv, @function
_ZL9M112Powerv:
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
	la a5, _ZL4bank; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9M112Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL9M112Writejh
	addi	a1,a1,-1
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	li	a0,8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE9:
	.size	_ZL9M112Powerv, .-_ZL9M112Powerv
	.section	.text._ZL9M112Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M112Writejh, @function
_ZL9M112Writejh:
.LFB7:
	.cfi_startproc
	li	a5,49152
	beq	a0,a5,.L17
	bgtu	a0,a5,.L18
	li	a5,32768
	beq	a0,a5,.L19
	li	a5,40960
	bne	a0,a5,.L22
	la a4, _ZL3cmd; lbu a4, 0(a4);
	lla	a5,_ZL3reg
	add	a5,a5,a4
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L18:
	li	a5,57344
	bne	a0,a5,.L16
	andi	a1,a1,1
	la a5, _ZL6mirror; sb a1, 0(a5);
	tail	_ZL4Syncv
.L16:
	ret
.L19:
	andi	a1,a1,7
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
.L17:
	la a5, _ZL4bank; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL9M112Writejh, .-_ZL9M112Writejh
	.section	.rodata._Z14Mapper112_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper112_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper112_InitP8CartInfo
	.hidden	_Z14Mapper112_InitP8CartInfo
	.type	_Z14Mapper112_InitP8CartInfo, @function
_Z14Mapper112_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL9M112Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M112Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
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
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14Mapper112_InitP8CartInfo, .-_Z14Mapper112_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"BANK"
	.align	2
.LC4:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	_ZL6mirror
	.word	1
	.word	.LC2
	.word	_ZL4bank
	.word	1
	.word	.LC3
	.word	_ZL3reg
	.word	8
	.word	.LC4
	.word	0
	.zero	8
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4bank,"aw",@nobits
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL6mirror,"aw",@nobits
	.type	_ZL6mirror, @object
	.size	_ZL6mirror, 1
_ZL6mirror:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
