#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"88.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL3reg
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	srli	a1,a1,1
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,1024
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a0,8192
	addi	a0,a0,-2048
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	li	a0,8192
	addi	a0,a0,-1024
	ori	a1,a1,64
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,-1
	li	a0,57344
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL8M88Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M88Writejh, @function
_ZL8M88Writejh:
.LFB8:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	and	a0,a0,a5
	beq	a0,a4,.L5
	beq	a0,a5,.L6
	ret
.L6:
	la a4, _ZL3cmd; lbu a4, 0(a4);
	lla	a5,_ZL3reg
	add	a5,a5,a4
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L5:
	andi	a5,a1,7
	srli	a1,a1,6
	la a4, _ZL3cmd; sb a5, 0(a4);
	la a5, _ZL6mirror; sb a1, 0(a5);
	la a5, _ZL5is154; lbu a5, 0(a5);
	bne	a5,zero,.L11
	ret
.L11:
	andi	a1,a1,1
	addi	a0,a1,2
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL8M88Writejh, .-_ZL8M88Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL4Syncv
	la a5, _ZL5is154; lbu a5, 0(a5);
	bne	a5,zero,.L15
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L15:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL6mirror; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M88Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M88Powerv, @function
_ZL8M88Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	la a5, _ZL3reg; sw zero, 0(a5);
	la a5, _ZL3reg+4; sw zero, 0(a5);
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	la a5, _ZL5is154; lbu a5, 0(a5);
	bne	a5,zero,.L22
.L17:
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL8M88Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
.L22:
	.cfi_restore_state
	la a0, _ZL6mirror; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	a0,a0,2
	call	_Z9setmirrori
	j	.L17
	.cfi_endproc
.LFE9:
	.size	_ZL8M88Powerv, .-_ZL8M88Powerv
	.section	.text._Z13Mapper88_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper88_InitP8CartInfo
	.hidden	_Z13Mapper88_InitP8CartInfo
	.type	_Z13Mapper88_InitP8CartInfo, @function
_Z13Mapper88_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL8M88Powerv
	sw	a5,0(a0)
	la a5, _ZL5is154; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z13Mapper88_InitP8CartInfo, .-_Z13Mapper88_InitP8CartInfo
	.section	.text._Z14Mapper154_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper154_InitP8CartInfo
	.hidden	_Z14Mapper154_InitP8CartInfo
	.type	_Z14Mapper154_InitP8CartInfo, @function
_Z14Mapper154_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M88Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, _ZL5is154; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper154_InitP8CartInfo, .-_Z14Mapper154_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL6mirror
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	8
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL5is154,"aw",@nobits
	.type	_ZL5is154, @object
	.size	_ZL5is154, 1
_ZL5is154:
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
