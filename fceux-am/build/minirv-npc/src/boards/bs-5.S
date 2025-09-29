#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bs-5.cpp"
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
	lla	s0,_ZL7reg_prg
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,3(s0)
	li	a0,57344
	lla	s0,_ZL7reg_chr
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,1
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
	.section	.text._ZL9MBS5Resetv,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Resetv, @function
_ZL9MBS5Resetv:
.LFB8:
	.cfi_startproc
	lla	a4,_ZL10dip_switch
	lbu	a5,0(a4)
	li	a3,-1
	la a2, _ZL7reg_prg; sw a3, 0(a2);
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9MBS5Resetv, .-_ZL9MBS5Resetv
	.section	.text._ZL9MBS5Writejh,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Writejh, @function
_ZL9MBS5Writejh:
.LFB7:
	.cfi_startproc
	li	a5,61440
	srli	a3,a0,10
	and	a5,a0,a5
	li	a4,32768
	andi	a3,a3,3
	beq	a5,a4,.L7
	li	a4,40960
	beq	a5,a4,.L8
.L9:
	tail	_ZL4Syncv
.L8:
	la a4, _ZL10dip_switch; lbu a4, 0(a4);
	addi	a4,a4,4
	li	a5,1
	sll	a5,a5,a4
	and	a5,a5,a0
	beq	a5,zero,.L9
	lla	a5,_ZL7reg_prg
	add	a5,a5,a3
	andi	a0,a0,15
	sb	a0,0(a5)
	tail	_ZL4Syncv
.L7:
	lla	a5,_ZL7reg_chr
	add	a5,a5,a3
	andi	a0,a0,31
	sb	a0,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9MBS5Writejh, .-_ZL9MBS5Writejh
	.section	.text._ZL9MBS5Powerv,"ax",@progbits
	.align	2
	.type	_ZL9MBS5Powerv, @function
_ZL9MBS5Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL10dip_switch; sb zero, 0(a5);
	li	a5,-1
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL7reg_prg; sw a5, 0(a4);
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
	lla	a2,_ZL9MBS5Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL9MBS5Powerv, .-_ZL9MBS5Powerv
	.section	.text._Z11BMCBS5_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11BMCBS5_InitP8CartInfo
	.hidden	_Z11BMCBS5_InitP8CartInfo
	.type	_Z11BMCBS5_InitP8CartInfo, @function
_Z11BMCBS5_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9MBS5Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9MBS5Resetv
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
	.size	_Z11BMCBS5_InitP8CartInfo, .-_Z11BMCBS5_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL7reg_prg
	.word	4
	.word	.LC0
	.word	_ZL7reg_chr
	.word	4
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10dip_switch,"aw",@nobits
	.type	_ZL10dip_switch, @object
	.size	_ZL10dip_switch, 1
_ZL10dip_switch:
	.zero	1
	.section	.sbss._ZL7reg_chr,"aw",@nobits
	.align	2
	.type	_ZL7reg_chr, @object
	.size	_ZL7reg_chr, 4
_ZL7reg_chr:
	.zero	4
	.section	.sbss._ZL7reg_prg,"aw",@nobits
	.align	2
	.type	_ZL7reg_prg, @object
	.size	_ZL7reg_prg, 4
_ZL7reg_prg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
