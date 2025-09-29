#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"hp898f.cpp"
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
	sw	s1,0(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	lla	a4,_ZL4regs
	lbu	a5,0(a4)
	lbu	s0,1(a4)
	slli	a0,a5,2
	andi	a3,a5,2
	andi	a0,a0,4
	or	a0,a0,a3
	srli	a5,a5,4
	andi	a5,a5,7
	not	a0,a0
	and	a0,a0,a5
	srli	s1,s0,3
	srli	s0,s0,4
	call	_Z7setchr8j
	andi	s0,s0,4
	andi	s1,s1,7
	not	a1,s0
	and	a1,a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	or	a1,s1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lla	a4,_ZL4regs
	lbu	a0,1(a4)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a0,7
	addi	sp,sp,12
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
	.section	.text._ZL11HP898FResetv,"ax",@progbits
	.align	2
	.type	_ZL11HP898FResetv, @function
_ZL11HP898FResetv:
.LFB9:
	.cfi_startproc
	la a5, _ZL4regs; sh zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL11HP898FResetv, .-_ZL11HP898FResetv
	.section	.text._ZL11HP898FPowerv,"ax",@progbits
	.align	2
	.type	_ZL11HP898FPowerv, @function
_ZL11HP898FPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4regs; sh zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL11HP898FWritejh
	li	a0,24576
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL11HP898FPowerv, .-_ZL11HP898FPowerv
	.section	.text._ZL11HP898FWritejh,"ax",@progbits
	.align	2
	.type	_ZL11HP898FWritejh, @function
_ZL11HP898FWritejh:
.LFB7:
	.cfi_startproc
	li	a5,24576
	and	a4,a0,a5
	beq	a4,a5,.L10
	ret
.L10:
	srli	a0,a0,2
	andi	a0,a0,1
	lla	a5,_ZL4regs
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL11HP898FWritejh, .-_ZL11HP898FWritejh
	.section	.text._Z14BMCHP898F_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCHP898F_InitP8CartInfo
	.hidden	_Z14BMCHP898F_InitP8CartInfo
	.type	_Z14BMCHP898F_InitP8CartInfo, @function
_Z14BMCHP898F_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL11HP898FPowerv
	sw	a5,0(a0)
	lla	a5,_ZL11HP898FResetv
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
	.size	_Z14BMCHP898F_InitP8CartInfo, .-_Z14BMCHP898F_InitP8CartInfo
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
	.word	2
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 2
_ZL4regs:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
