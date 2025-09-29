#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc64in1nr.cpp"
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
	lla	s0,_ZL4regs
	lb	a4,0(s0)
	lbu	a5,1(s0)
	bge	a4,zero,.L2
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L9
	sw	s1,0(sp)
	.cfi_offset 9, -12
	slli	s1,a5,1
	andi	s1,s1,62
	srli	a5,a5,6
	or	s1,s1,a5
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
	lw	s1,0(sp)
	.cfi_restore 9
.L4:
	lbu	a5,0(s0)
	andi	a5,a5,32
	beq	a5,zero,.L5
.L10:
	li	a0,0
	call	_Z9setmirrori
.L6:
	lbu	a5,0(s0)
	lbu	a0,2(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a5,a5,1
	andi	a5,a5,3
	slli	a0,a0,2
	or	a0,a5,a0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L9:
	.cfi_restore_state
	andi	a1,a5,31
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	andi	a5,a5,32
	bne	a5,zero,.L10
.L5:
	li	a0,1
	call	_Z9setmirrori
	j	.L6
.L2:
	slli	a1,a5,1
	srli	a5,a5,6
	andi	a5,a5,1
	andi	a1,a1,62
	or	a1,a1,a5
	li	a0,49152
	call	_Z8setprg16jj
	j	.L4
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
	.section	.text._ZL17BMC64in1nrWriteHijh,"ax",@progbits
	.align	2
	.type	_ZL17BMC64in1nrWriteHijh, @function
_ZL17BMC64in1nrWriteHijh:
.LFB8:
	.cfi_startproc
	la a5, _ZL4regs+3; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL17BMC64in1nrWriteHijh, .-_ZL17BMC64in1nrWriteHijh
	.section	.text._ZL17BMC64in1nrWriteLojh,"ax",@progbits
	.align	2
	.type	_ZL17BMC64in1nrWriteLojh, @function
_ZL17BMC64in1nrWriteLojh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4regs
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL17BMC64in1nrWriteLojh, .-_ZL17BMC64in1nrWriteLojh
	.section	.text._ZL15BMC64in1nrPowerv,"ax",@progbits
	.align	2
	.type	_ZL15BMC64in1nrPowerv, @function
_ZL15BMC64in1nrPowerv:
.LFB9:
	.cfi_startproc
	li	a5,16384
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a5,a5,896
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4regs; sw a5, 0(a4);
	call	_ZL4Syncv
	li	a1,20480
	lla	a2,_ZL17BMC64in1nrWriteLojh
	addi	a1,a1,3
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL17BMC64in1nrWriteHijh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL15BMC64in1nrPowerv, .-_ZL15BMC64in1nrPowerv
	.section	.text._Z15BMC64in1nr_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC64in1nr_InitP8CartInfo
	.hidden	_Z15BMC64in1nr_InitP8CartInfo
	.type	_Z15BMC64in1nr_InitP8CartInfo, @function
_Z15BMC64in1nr_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL15BMC64in1nrPowerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_Z15BMC64in1nr_InitP8CartInfo, .-_Z15BMC64in1nr_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
