#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"175.cpp"
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
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL3reg
	lbu	a0,0(s0)
	call	_Z7setchr8j
	la a5, _ZL5delay; lbu a5, 0(a5);
	beq	a5,zero,.L5
.L2:
	lbu	a1,0(s0)
	li	a0,57344
	slli	a1,a1,1
	addi	a1,a1,1
	call	_Z7setprg8jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,2
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L5:
	.cfi_restore_state
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	slli	a1,a1,1
	call	_Z7setprg8jj
	j	.L2
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10M175Write2jh,"ax",@progbits
	.align	2
	.type	_ZL10M175Write2jh, @function
_ZL10M175Write2jh:
.LFB8:
	.cfi_startproc
	andi	a1,a1,15
	la a5, _ZL3reg; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL5delay; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL10M175Write2jh, .-_ZL10M175Write2jh
	.section	.text._ZL10M175Write1jh,"ax",@progbits
	.align	2
	.type	_ZL10M175Write1jh, @function
_ZL10M175Write1jh:
.LFB7:
	.cfi_startproc
	la a5, _ZL4mirr; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL5delay; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL10M175Write1jh, .-_ZL10M175Write1jh
	.section	.text._ZL9M175Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M175Powerv, @function
_ZL9M175Powerv:
.LFB10:
	.cfi_startproc
	li	a1,65536
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a2,_ZL8M175Readj
	addi	a1,a1,-1
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL5delay; sb zero, 0(a5);
	la a5, _ZL4mirr; sb zero, 0(a5);
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL10M175Write1jh
	li	a1,32768
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL10M175Write2jh
	li	a1,40960
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL9M175Powerv, .-_ZL9M175Powerv
	.section	.text._ZL8M175Readj,"ax",@progbits
	.align	2
	.type	_ZL8M175Readj, @function
_ZL8M175Readj:
.LFB9:
	.cfi_startproc
	li	a5,65536
	addi	a5,a5,-4
	beq	a0,a5,.L17
	tail	_Z6CartBRj
.L17:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	sw	a0,0(sp)
	la a5, _ZL5delay; sb zero, 0(a5);
	call	_ZL4Syncv
	lw	a0,0(sp)
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z6CartBRj
	.cfi_endproc
.LFE9:
	.size	_ZL8M175Readj, .-_ZL8M175Readj
	.section	.text._Z14Mapper175_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper175_InitP8CartInfo
	.hidden	_Z14Mapper175_InitP8CartInfo
	.type	_Z14Mapper175_InitP8CartInfo, @function
_Z14Mapper175_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL9M175Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper175_InitP8CartInfo, .-_Z14Mapper175_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REG"
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
	.section	.sbss._ZL5delay,"aw",@nobits
	.type	_ZL5delay, @object
	.size	_ZL5delay, 1
_ZL5delay:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
