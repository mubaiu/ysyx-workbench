#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7013.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL15UNLKS7013BPowerv,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7013BPowerv, @function
_ZL15UNLKS7013BPowerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL4mirr
	li	a0,32768
	sb	zero,0(s0)
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	li	a1,32768
	lla	a2,_ZL17UNLKS7013BLoWritejh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL17UNLKS7013BHiWritejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL15UNLKS7013BPowerv, .-_ZL15UNLKS7013BPowerv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL17UNLKS7013BLoWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7013BLoWritejh, @function
_ZL17UNLKS7013BLoWritejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, _ZL3reg; sb a1, 0(a4);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE7:
	.size	_ZL17UNLKS7013BLoWritejh, .-_ZL17UNLKS7013BLoWritejh
	.section	.text._ZL15UNLKS7013BResetv,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7013BResetv, @function
_ZL15UNLKS7013BResetv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,0
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	call	_Z9setmirrori
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE10:
	.size	_ZL15UNLKS7013BResetv, .-_ZL15UNLKS7013BResetv
	.section	.text._ZL17UNLKS7013BHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7013BHiWritejh, @function
_ZL17UNLKS7013BHiWritejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	not	a5,a1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a5,a5,1
	lla	s0,_ZL4mirr
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	sb	a5,0(s0)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	call	_Z9setmirrori
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
	.size	_ZL17UNLKS7013BHiWritejh, .-_ZL17UNLKS7013BHiWritejh
	.section	.text._Z15UNLKS7013B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLKS7013B_InitP8CartInfo
	.hidden	_Z15UNLKS7013B_InitP8CartInfo
	.type	_Z15UNLKS7013B_InitP8CartInfo, @function
_Z15UNLKS7013B_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL15UNLKS7013BPowerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLKS7013BResetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z15UNLKS7013B_InitP8CartInfo, .-_Z15UNLKS7013B_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
