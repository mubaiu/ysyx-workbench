#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"eh8813a.cpp"
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
	sw	s1,0(sp)
	la a0, _ZL9datalatch; lbu a0, 0(a0);
	.cfi_offset 9, -12
	lla	s1,_ZL9addrlatch
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lhu	s0,0(s1)
	call	_Z7setchr8j
	lhu	a5,0(s1)
	andi	s0,s0,7
	andi	a5,a5,128
	beq	a5,zero,.L2
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L2:
	.cfi_restore_state
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
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
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL12EH8813AWritejh,"ax",@progbits
	.align	2
	.type	_ZL12EH8813AWritejh, @function
_ZL12EH8813AWritejh:
.LFB7:
	.cfi_startproc
	lla	a4,_ZL9addrlatch
	lhu	a5,0(a4)
	andi	a5,a5,256
	bne	a5,zero,.L8
	andi	a0,a0,511
	andi	a1,a1,15
	sh	a0,0(a4)
	la a5, _ZL9datalatch; sb a1, 0(a5);
.L8:
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL12EH8813AWritejh, .-_ZL12EH8813AWritejh
	.section	.text._ZL12EH8813APowerv,"ax",@progbits
	.align	2
	.type	_ZL12EH8813APowerv, @function
_ZL12EH8813APowerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL7hw_mode; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL9datalatch; sb zero, 0(a5);
	la a5, _ZL9addrlatch; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL11EH8813AReadj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL12EH8813AWritejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL12EH8813APowerv, .-_ZL12EH8813APowerv
	.section	.text._ZL11EH8813AReadj,"ax",@progbits
	.align	2
	.type	_ZL11EH8813AReadj, @function
_ZL11EH8813AReadj:
.LFB8:
	.cfi_startproc
	la a5, _ZL9addrlatch; lhu a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L12
	li	a5,65536
	addi	a5,a5,-16
	and	a0,a0,a5
	la a5, _ZL7hw_mode; lbu a5, 0(a5);
	add	a0,a5,a0
.L12:
	tail	_Z6CartBRj
	.cfi_endproc
.LFE8:
	.size	_ZL11EH8813AReadj, .-_ZL11EH8813AReadj
	.section	.rodata._ZL12EH8813AResetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hardware Switch is %01X\n"
	.section	.text._ZL12EH8813AResetv,"ax",@progbits
	.align	2
	.type	_ZL12EH8813AResetv, @function
_ZL12EH8813AResetv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL7hw_mode
	lbu	a1,0(a5)
	lla	a0,.LC0
	la a4, _ZL9datalatch; sb zero, 0(a4);
	addi	a1,a1,1
	andi	a1,a1,15
	la a4, _ZL9addrlatch; sh zero, 0(a4);
	sb	a1,0(a5)
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12EH8813AResetv, .-_ZL12EH8813AResetv
	.section	.text._Z15UNLEH8813A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLEH8813A_InitP8CartInfo
	.hidden	_Z15UNLEH8813A_InitP8CartInfo
	.type	_Z15UNLEH8813A_InitP8CartInfo, @function
_Z15UNLEH8813A_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL12EH8813APowerv
	sw	a5,0(a0)
	lla	a5,_ZL12EH8813AResetv
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
	.size	_Z15UNLEH8813A_InitP8CartInfo, .-_Z15UNLEH8813A_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"ADRL"
	.align	2
.LC2:
	.string	"DATL"
	.align	2
.LC3:
	.string	"HWMO"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL9addrlatch
	.word	2
	.word	.LC1
	.word	_ZL9datalatch
	.word	1
	.word	.LC2
	.word	_ZL7hw_mode
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL7hw_mode,"aw",@nobits
	.type	_ZL7hw_mode, @object
	.size	_ZL7hw_mode, 1
_ZL7hw_mode:
	.zero	1
	.section	.sbss._ZL9datalatch,"aw",@nobits
	.type	_ZL9datalatch, @object
	.size	_ZL9datalatch, 1
_ZL9datalatch:
	.zero	1
	.section	.sbss._ZL9addrlatch,"aw",@nobits
	.align	1
	.type	_ZL9addrlatch, @object
	.size	_ZL9addrlatch, 2
_ZL9addrlatch:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
