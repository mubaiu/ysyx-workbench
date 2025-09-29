#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sheroes.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL7MSHReadj,"ax",@progbits
	.align	2
	.type	_ZL7MSHReadj, @function
_ZL7MSHReadj:
.LFB8:
	.cfi_startproc
	la a0, _ZL6tekker; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL7MSHReadj, .-_ZL7MSHReadj
	.section	.text._ZL8MSHClosev,"ax",@progbits
	.align	2
	.type	_ZL8MSHClosev, @function
_ZL8MSHClosev:
.LFB11:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L9
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L9:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL8MSHClosev, .-_ZL8MSHClosev
	.section	.text._ZL8MSHResetv,"ax",@progbits
	.align	2
	.type	_ZL8MSHResetv, @function
_ZL8MSHResetv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12MMC3RegResetv
	lla	a4,_ZL6tekker
	lbu	a5,0(a4)
	not	a5,a5
	sb	a5,0(a4)
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL8MSHResetv, .-_ZL8MSHResetv
	.section	.text._ZL8MSHPowerv,"ax",@progbits
	.align	2
	.type	_ZL8MSHPowerv, @function
_ZL8MSHPowerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL6tekker; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	li	a1,16384
	addi	a1,a1,256
	mv	a0,a1
	lla	a2,_ZL8MSHWritejh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,16384
	addi	a1,a1,256
	lla	a2,_ZL7MSHReadj
	mv	a0,a1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE10:
	.size	_ZL8MSHPowerv, .-_ZL8MSHPowerv
	.section	.text._ZL8MSHWritejh,"ax",@progbits
	.align	2
	.type	_ZL8MSHWritejh, @function
_ZL8MSHWritejh:
.LFB7:
	.cfi_startproc
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE7:
	.size	_ZL8MSHWritejh, .-_ZL8MSHWritejh
	.section	.text._ZL5MSHCWjh,"ax",@progbits
	.align	2
	.type	_ZL5MSHCWjh, @function
_ZL5MSHCWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a3,a5,64
	bne	a3,zero,.L22
	li	a3,2047
	bleu	a0,a3,.L23
	li	a3,4096
	bltu	a0,a3,.L24
	li	a3,4096
	addi	a3,a3,2047
	bgtu	a0,a3,.L21
	slli	a5,a5,8
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L23:
	slli	a5,a5,5
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L22:
	li	a1,0
	li	a0,16
	tail	_Z8setchr8rij
.L21:
	slli	a5,a5,7
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L24:
	slli	a5,a5,6
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE6:
	.size	_ZL5MSHCWjh, .-_ZL5MSHCWjh
	.section	.rodata._Z15UNLSHeroes_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.align	2
.LC1:
	.string	"DIPSW"
	.section	.text._Z15UNLSHeroes_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15UNLSHeroes_InitP8CartInfo
	.hidden	_Z15UNLSHeroes_InitP8CartInfo
	.type	_Z15UNLSHeroes_InitP8CartInfo, @function
_Z15UNLSHeroes_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,0
	li	a2,512
	li	a1,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5MSHCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL8MSHPowerv
	sw	a5,0(s0)
	lla	a5,_ZL8MSHResetv
	sw	a5,4(s0)
	lla	a5,_ZL8MSHClosev
	sw	a5,8(s0)
	li	a0,8192
	call	_Z12FCEU_gmallocj
	mv	a5,a0
	mv	a1,a0
	li	a3,1
	li	a2,8192
	li	a0,16
	la a4, _ZL6CHRRAM; sw a5, 0(a4);
	call	_Z19SetupCartCHRMappingiPhji
	lla	a3,.LC0
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL6tekker
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z15UNLSHeroes_InitP8CartInfo, .-_Z15UNLSHeroes_InitP8CartInfo
	.section	.sbss._ZL6tekker,"aw",@nobits
	.type	_ZL6tekker, @object
	.size	_ZL6tekker, 1
_ZL6tekker:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
