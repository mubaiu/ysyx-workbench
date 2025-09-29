#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"206.cpp"
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
	lla	s0,_ZL5DRegs
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	li	a0,8192
	addi	a0,a0,-1024
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
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,-1
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB7:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M206Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M206Powerv, @function
_ZL9M206Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL3cmd; sb zero, 0(a5);
	li	a5,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL5DRegs+6; sh a5, 0(a4);
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
	lla	a2,_ZL9M206Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL9M206Powerv, .-_ZL9M206Powerv
	.section	.text._ZL9M206Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M206Writejh, @function
_ZL9M206Writejh:
.LFB8:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	and	a0,a0,a5
	beq	a0,a4,.L8
	beq	a0,a5,.L9
	ret
.L9:
	la a5, _ZL3cmd; lbu a5, 0(a5);
	li	a4,5
	andi	a3,a1,15
	bgtu	a5,a4,.L13
	li	a4,1
	andi	a3,a1,63
	bgtu	a5,a4,.L13
	srli	a3,a3,1
.L13:
	andi	a5,a5,7
	lla	a4,_ZL5DRegs
	add	a5,a4,a5
	sb	a3,0(a5)
	tail	_ZL4Syncv
.L8:
	andi	a1,a1,7
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL9M206Writejh, .-_ZL9M206Writejh
	.section	.text._Z14Mapper206_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper206_InitP8CartInfo
	.hidden	_Z14Mapper206_InitP8CartInfo
	.type	_Z14Mapper206_InitP8CartInfo, @function
_Z14Mapper206_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL9M206Powerv
	sw	a5,0(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z14Mapper206_InitP8CartInfo, .-_Z14Mapper206_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL5DRegs
	.word	8
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5DRegs,"aw",@nobits
	.align	2
	.type	_ZL5DRegs, @object
	.size	_ZL5DRegs, 8
_ZL5DRegs:
	.zero	8
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
