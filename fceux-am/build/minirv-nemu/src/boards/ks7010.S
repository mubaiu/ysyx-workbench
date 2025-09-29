#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7010.cpp"
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
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,24576
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z7setprg8jj
	li	a1,10
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,11
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,6
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,7
	li	a0,57344
	call	_Z7setprg8jj
	li	a0,12
	call	_Z7setchr8j
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
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
	.section	.rodata._ZL14UNLKS7010Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"preg %02x %02x %02x\n"
	.section	.text._ZL14UNLKS7010Resetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Resetv, @function
_ZL14UNLKS7010Resetv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL4preg
	lbu	a1,0(a5)
	li	a4,16
	lbu	a2,1(a5)
	addi	a1,a1,1
	andi	a1,a1,0xff
	sb	a1,0(a5)
	lbu	a3,2(a5)
	beq	a1,a4,.L10
	lla	a0,.LC0
	call	printf
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L10:
	.cfi_restore_state
	addi	a2,a2,1
	la a4, _ZL4preg; sb zero, 0(a4);
	andi	a2,a2,0xff
	beq	a2,a1,.L8
	li	a1,0
	lla	a0,.LC0
	sb	a2,1(a5)
	call	printf
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L8:
	.cfi_restore_state
	addi	a3,a3,1
	andi	a3,a3,0xff
	li	a2,0
	li	a1,0
	lla	a0,.LC0
	la a4, _ZL4preg+1; sb zero, 0(a4);
	sb	a3,2(a5)
	call	printf
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL14UNLKS7010Resetv, .-_ZL14UNLKS7010Resetv
	.section	.text._ZL14UNLKS7010Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Powerv, @function
_ZL14UNLKS7010Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL4preg
	sb	zero,2(a5)
	sh	zero,0(a5)
	li	s0,32768
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
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
	li	a0,16384
	lla	a2,_ZL14UNLKS7010Writejh
	addi	a0,a0,32
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLKS7010Powerv, .-_ZL14UNLKS7010Powerv
	.section	.rodata._ZL14UNLKS7010Writejh.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"bs %04x %02x\n"
	.section	.text._ZL14UNLKS7010Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7010Writejh, @function
_ZL14UNLKS7010Writejh:
.LFB7:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,37
	mv	a2,a1
	beq	a0,a5,.L15
	mv	a1,a0
	lla	a0,.LC1
	tail	printf
.L15:
	srli	a2,a1,3
	xori	a2,a2,1
	andi	a2,a2,1
	la a5, _ZL4mirr; sb a2, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7010Writejh, .-_ZL14UNLKS7010Writejh
	.section	.text._Z14UNLKS7010_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7010_InitP8CartInfo
	.hidden	_Z14UNLKS7010_InitP8CartInfo
	.type	_Z14UNLKS7010_InitP8CartInfo, @function
_Z14UNLKS7010_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL14UNLKS7010Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7010Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14UNLKS7010_InitP8CartInfo, .-_Z14UNLKS7010_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"CREG"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4preg
	.word	4
	.word	.LC2
	.word	_ZL4creg
	.word	1
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
	.section	.sbss._ZL4creg,"aw",@nobits
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 4
_ZL4preg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
