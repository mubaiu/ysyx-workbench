#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sl1632.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL11UNLSL1632CWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLSL1632CWjh, @function
_ZL11UNLSL1632CWjh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s1,DRegBuf
	lbu	a1,0(s1)
	la a5, _ZL4bbrk; lbu a5, 0(a5);
	la s0, MMC3_cmd; lbu s0, 0(s0);
	slli	a3,a5,5
	li	a4,4096
	slli	s0,s0,5
	and	s0,s0,a4
	andi	a1,a1,-2
	andi	a4,a3,256
	slli	a3,a5,3
	slli	a5,a5,1
	andi	a5,a5,256
	andi	a3,a3,256
	or	a1,a1,a4
	mv	a0,s0
	sw	a5,8(sp)
	sw	a3,4(sp)
	sw	a4,0(sp)
	call	_Z7setchr1jj
	lw	a4,0(sp)
	lbu	a1,0(s1)
	ori	a0,s0,1024
	or	a1,a1,a4
	ori	a1,a1,1
	call	_Z7setchr1jj
	lbu	a1,1(s1)
	lw	a4,0(sp)
	li	a0,4096
	addi	a0,a0,-2048
	andi	a1,a1,-2
	or	a1,a1,a4
	or	a0,s0,a0
	call	_Z7setchr1jj
	lw	a4,0(sp)
	lbu	a1,1(s1)
	li	a0,4096
	addi	a0,a0,-1024
	or	a1,a1,a4
	or	a0,s0,a0
	ori	a1,a1,1
	call	_Z7setchr1jj
	lw	a3,4(sp)
	lbu	a1,2(s1)
	li	a4,4096
	xor	a0,s0,a4
	or	a1,a1,a3
	call	_Z7setchr1jj
	lw	a3,4(sp)
	lbu	a1,3(s1)
	li	a0,4096
	addi	a0,a0,1024
	or	a1,a1,a3
	xor	a0,s0,a0
	call	_Z7setchr1jj
	lw	a5,8(sp)
	lbu	a1,4(s1)
	li	a0,8192
	addi	a0,a0,-2048
	or	a1,a1,a5
	xor	a0,s0,a0
	call	_Z7setchr1jj
	li	a0,8192
	addi	a0,a0,-1024
	lbu	a1,5(s1)
	lw	a5,8(sp)
	xor	a0,s0,a0
	lw	s0,16(sp)
	.cfi_restore 8
	lw	ra,20(sp)
	.cfi_restore 1
	lw	s1,12(sp)
	.cfi_restore 9
	or	a1,a1,a5
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE7:
	.size	_ZL11UNLSL1632CWjh, .-_ZL11UNLSL1632CWjh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a1, _ZL4prg0; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z7setprg8jj
	la a1, _ZL4prg1; lbu a1, 0(a1);
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lla	s1,_ZL6chrcmd
	li	s0,0
.L5:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L5
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL14UNLSL1632Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLSL1632Powerv, @function
_ZL14UNLSL1632Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,16384
	li	a1,65536
	lla	a2,_ZL17UNLSL1632CMDWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL14UNLSL1632Powerv, .-_ZL14UNLSL1632Powerv
	.section	.text._ZL17UNLSL1632CMDWritejh,"ax",@progbits
	.align	2
	.type	_ZL17UNLSL1632CMDWritejh, @function
_ZL17UNLSL1632CMDWritejh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,40960
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	addi	a5,a5,305
	mv	s0,a0
	mv	s1,a1
	beq	a0,a5,.L21
	la a5, _ZL4bbrk; lbu a5, 0(a5);
	andi	a5,a5,2
	bne	a5,zero,.L22
	li	a5,12288
	li	a4,-45056
	add	a4,a0,a4
	addi	a5,a5,3
	bgtu	a4,a5,.L16
	srli	a4,a0,10
	andi	a5,a0,2
	or	a5,a5,a4
	srli	a5,a5,1
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,_ZL6chrcmd
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	s0,a0,2
	andi	s0,s0,4
	li	a3,240
	sra	a3,a3,s0
	andi	s1,a1,15
	and	a5,a5,a3
	sll	s1,s1,s0
	or	a5,a5,s1
	sb	a5,0(a4)
.L13:
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
.L22:
	.cfi_restore_state
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3CHRi
	li	a5,49152
	bltu	s0,a5,.L19
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a1,s1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z13MMC3_IRQWritejh
.L21:
	.cfi_restore_state
	la a5, _ZL4bbrk; sb a1, 0(a5);
	andi	a5,a1,2
	beq	a5,zero,.L13
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3PRGi
	lla	a5,MMC3_cmd
	lbu	a0,0(a5)
	call	_Z10FixMMC3CHRi
.L19:
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a1,s1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z13MMC3_CMDWritejh
.L16:
	.cfi_restore_state
	li	a5,61440
	addi	a5,a5,3
	and	a5,a0,a5
	li	a4,36864
	beq	a5,a4,.L17
	li	a3,40960
	beq	a5,a3,.L18
	li	a4,32768
	bne	a5,a4,.L13
	la a5, _ZL4prg0; sb a1, 0(a5);
	j	.L13
.L18:
	la a5, _ZL4prg1; sb a1, 0(a5);
	j	.L13
.L17:
	andi	s1,a1,1
	la a5, _ZL4mirr; sb s1, 0(a5);
	j	.L13
	.cfi_endproc
.LFE8:
	.size	_ZL17UNLSL1632CMDWritejh, .-_ZL17UNLSL1632CMDWritejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	la a5, _ZL4bbrk; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L24
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L24:
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._Z14UNLSL1632_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLSL1632_InitP8CartInfo
	.hidden	_Z14UNLSL1632_InitP8CartInfo
	.type	_Z14UNLSL1632_InitP8CartInfo, @function
_Z14UNLSL1632_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,0
	li	a2,512
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL11UNLSL1632CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL14UNLSL1632Powerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14UNLSL1632_InitP8CartInfo, .-_Z14UNLSL1632_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRC"
	.align	2
.LC1:
	.string	"PRG0"
	.align	2
.LC2:
	.string	"PRG1"
	.align	2
.LC3:
	.string	"BRK"
	.align	2
.LC4:
	.string	"MIRR"
	.align	2
.LC5:
	.string	"SWAP"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL6chrcmd
	.word	8
	.word	.LC0
	.word	_ZL4prg0
	.word	1
	.word	.LC1
	.word	_ZL4prg1
	.word	1
	.word	.LC2
	.word	_ZL4bbrk
	.word	1
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	_ZL4swap
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL4swap,"aw",@nobits
	.type	_ZL4swap, @object
	.size	_ZL4swap, 1
_ZL4swap:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4bbrk,"aw",@nobits
	.type	_ZL4bbrk, @object
	.size	_ZL4bbrk, 1
_ZL4bbrk:
	.zero	1
	.section	.sbss._ZL4prg1,"aw",@nobits
	.type	_ZL4prg1, @object
	.size	_ZL4prg1, 1
_ZL4prg1:
	.zero	1
	.section	.sbss._ZL4prg0,"aw",@nobits
	.type	_ZL4prg0, @object
	.size	_ZL4prg0, 1
_ZL4prg0:
	.zero	1
	.section	.sbss._ZL6chrcmd,"aw",@nobits
	.align	2
	.type	_ZL6chrcmd, @object
	.size	_ZL6chrcmd, 8
_ZL6chrcmd:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
