#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"185.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL6MWritejh,"ax",@progbits
	.align	2
	.type	_ZL6MWritejh, @function
_ZL6MWritejh:
.LFB8:
	.cfi_startproc
	la a5, _ZL7datareg; sb a1, 0(a5);
	la a5, _ZL4Sync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE8:
	.size	_ZL6MWritejh, .-_ZL6MWritejh
	.section	.text._ZL8MRestorei,"ax",@progbits
	.align	2
	.type	_ZL8MRestorei, @function
_ZL8MRestorei:
.LFB11:
	.cfi_startproc
	la a5, _ZL4Sync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE11:
	.size	_ZL8MRestorei, .-_ZL8MRestorei
	.section	.text._ZL6MClosev,"ax",@progbits
	.align	2
	.type	_ZL6MClosev, @function
_ZL6MClosev:
.LFB10:
	.cfi_startproc
	la a0, _ZL8DummyCHR; lw a0, 0(a0);
	beq	a0,zero,.L10
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL8DummyCHR; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	la a5, _ZL8DummyCHR; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL6MClosev, .-_ZL6MClosev
	.section	.text._ZL6MPowerv,"ax",@progbits
	.align	2
	.type	_ZL6MPowerv, @function
_ZL6MPowerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL7datareg; sb zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4Sync; lw a5, 0(a5);
	jalr	a5
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL6MWritejh
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
	.size	_ZL6MPowerv, .-_ZL6MPowerv
	.section	.text._ZL7Sync185v,"ax",@progbits
	.align	2
	.type	_ZL7Sync185v, @function
_ZL7Sync185v:
.LFB6:
	.cfi_startproc
	la a5, _ZL7datareg; lbu a5, 0(a5);
	andi	a4,a5,3
	beq	a4,zero,.L16
	li	a4,19
	bne	a5,a4,.L20
.L16:
	li	a1,0
	li	a0,16
	tail	_Z8setchr8rij
.L20:
	li	a0,0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL7Sync185v, .-_ZL7Sync185v
	.section	.text._ZL7Sync181v,"ax",@progbits
	.align	2
	.type	_ZL7Sync181v, @function
_ZL7Sync181v:
.LFB7:
	.cfi_startproc
	la a5, _ZL7datareg; lbu a5, 0(a5);
	andi	a5,a5,1
	bne	a5,zero,.L22
	li	a0,0
	tail	_Z7setchr8j
.L22:
	li	a1,0
	li	a0,16
	tail	_Z8setchr8rij
	.cfi_endproc
.LFE7:
	.size	_ZL7Sync181v, .-_ZL7Sync181v
	.section	.text._Z14Mapper185_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper185_InitP8CartInfo
	.hidden	_Z14Mapper185_InitP8CartInfo
	.type	_Z14Mapper185_InitP8CartInfo, @function
_Z14Mapper185_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL6MPowerv
	sw	a5,0(a0)
	lla	a5,_ZL6MClosev
	sw	a5,8(a0)
	lla	a5,_ZL7Sync185v
	la a4, _ZL4Sync; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL8MRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	la a5, _ZL8DummyCHR; sw a0, 0(a5);
	li	a4,8192
	mv	a1,a0
	mv	a5,a0
	add	a4,a0,a4
	li	a3,-1
.L24:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L24
	li	a3,0
	li	a2,8192
	li	a0,16
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper185_InitP8CartInfo, .-_Z14Mapper185_InitP8CartInfo
	.section	.text._Z14Mapper181_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper181_InitP8CartInfo
	.hidden	_Z14Mapper181_InitP8CartInfo
	.type	_Z14Mapper181_InitP8CartInfo, @function
_Z14Mapper181_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL6MPowerv
	sw	a5,0(a0)
	lla	a5,_ZL6MClosev
	sw	a5,8(a0)
	lla	a5,_ZL7Sync181v
	la a4, _ZL4Sync; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL8MRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	la a5, _ZL8DummyCHR; sw a0, 0(a5);
	li	a4,8192
	mv	a1,a0
	mv	a5,a0
	add	a4,a0,a4
	li	a3,-1
.L28:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L28
	li	a3,0
	li	a2,8192
	li	a0,16
	call	_Z19SetupCartCHRMappingiPhji
	lw	ra,8(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14Mapper181_InitP8CartInfo, .-_Z14Mapper181_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"DREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL7datareg
	.word	1
	.word	.LC0
	.word	0
	.zero	8
	.section	.sbss._ZL4Sync,"aw",@nobits
	.align	2
	.type	_ZL4Sync, @object
	.size	_ZL4Sync, 4
_ZL4Sync:
	.zero	4
	.section	.sbss._ZL7datareg,"aw",@nobits
	.type	_ZL7datareg, @object
	.size	_ZL7datareg, 1
_ZL7datareg:
	.zero	1
	.section	.sbss._ZL8DummyCHR,"aw",@nobits
	.align	2
	.type	_ZL8DummyCHR, @object
	.size	_ZL8DummyCHR, 4
_ZL8DummyCHR:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
