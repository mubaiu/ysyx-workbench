#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7032.cpp"
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
	lbu	a1,4(s0)
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
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
	.section	.text._ZL14UNLKS7032Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7032Powerv, @function
_ZL14UNLKS7032Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,16384
	lla	a2,_ZL14UNLKS7032Writejh
	addi	a0,a0,32
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLKS7032Powerv, .-_ZL14UNLKS7032Powerv
	.section	.text._ZL14UNLKS7032Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7032Writejh, @function
_ZL14UNLKS7032Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	li	s0,61440
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	and	a0,a0,s0
	li	a5,45056
	mv	s1,a1
	beq	a0,a5,.L8
	bgtu	a0,a5,.L9
	li	a5,36864
	beq	a0,a5,.L10
	li	a5,40960
	beq	a0,a5,.L11
	li	a5,32768
	bne	a0,a5,.L7
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQCount
	lw	a5,0(a4)
	li	a3,1
	la a2, _ZL9isirqused; sb a3, 0(a2);
	or	a5,s1,a5
	andi	a5,a5,15
	sw	a5,0(a4)
.L7:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L9:
	.cfi_restore_state
	li	a5,57344
	beq	a0,a5,.L14
	beq	a0,s0,.L15
	li	a5,49152
	bne	a0,a5,.L7
	la a5, _ZL9isirqused; lbu a5, 0(a5);
	beq	a5,zero,.L7
	li	a0,1
	call	_Z12X6502_IRQEndi
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	j	.L7
.L15:
	la a4, _ZL3cmd; lbu a4, 0(a4);
	lla	a5,_ZL3reg
	add	a5,a5,a4
	sb	a1,0(a5)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L11:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQCount
	lw	a3,0(a4)
	slli	a1,s1,8
	li	a5,4096
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	a5,a5,-256
	or	a1,a1,a3
	and	a1,a1,a5
	li	a5,1
	sw	a1,0(a4)
	la a4, _ZL9isirqused; sb a5, 0(a4);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L8:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a5,_ZL8IRQCount
	lw	a4,0(a5)
	slli	a1,s1,12
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	and	s0,s0,a4
	or	a1,s0,a1
	lw	s0,4(sp)
	.cfi_restore 8
	sw	a1,0(a5)
	li	a5,1
	la a4, _ZL9isirqused; sb a5, 0(a4);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	andi	a1,a1,7
	la a5, _ZL3cmd; sb a1, 0(a5);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a5,_ZL8IRQCount
	lw	a4,0(a5)
	slli	a1,s1,4
	lw	ra,8(sp)
	.cfi_restore 1
	or	a1,a1,a4
	lw	s0,4(sp)
	.cfi_restore 8
	andi	a1,a1,240
	sw	a1,0(a5)
	li	a5,1
	la a4, _ZL9isirqused; sb a5, 0(a4);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7032Writejh, .-_ZL14UNLKS7032Writejh
	.section	.text._ZL15UNLSMB2JIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL15UNLSMB2JIRQHooki, @function
_ZL15UNLSMB2JIRQHooki:
.LFB8:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L21
	lla	a4,_ZL8IRQCount
	lw	a3,0(a4)
	li	a5,65536
	addi	a5,a5,-2
	add	a0,a0,a3
	sw	a0,0(a4)
	bgt	a0,a5,.L25
.L21:
	ret
.L25:
	li	a0,1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE8:
	.size	_ZL15UNLSMB2JIRQHooki, .-_ZL15UNLSMB2JIRQHooki
	.section	.text._Z14UNLKS7032_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7032_InitP8CartInfo
	.hidden	_Z14UNLKS7032_InitP8CartInfo
	.type	_Z14UNLKS7032_InitP8CartInfo, @function
_Z14UNLKS7032_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL14UNLKS7032Powerv
	sw	a5,0(a0)
	lla	a5,_ZL15UNLSMB2JIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14UNLKS7032_InitP8CartInfo, .-_Z14UNLKS7032_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CMD"
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3cmd
	.word	1
	.word	.LC0
	.word	_ZL3reg
	.word	8
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL9isirqused,"aw",@nobits
	.type	_ZL9isirqused, @object
	.size	_ZL9isirqused, 1
_ZL9isirqused:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
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
