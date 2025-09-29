#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"tf-1201.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL7SyncPrgv,"ax",@progbits
	.align	2
	.type	_ZL7SyncPrgv, @function
_ZL7SyncPrgv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4swap; lbu a5, 0(a5);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	andi	a5,a5,3
	beq	a5,zero,.L2
	li	a1,-2
	li	a0,32768
	call	_Z7setprg8jj
	la a1, _ZL4prg0; lbu a1, 0(a1);
	li	a0,49152
	call	_Z7setprg8jj
.L3:
	la a1, _ZL4prg1; lbu a1, 0(a1);
	li	a0,40960
	call	_Z7setprg8jj
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a1,-1
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L2:
	.cfi_restore_state
	la a1, _ZL4prg0; lbu a1, 0(a1);
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	j	.L3
	.cfi_endproc
.LFE6:
	.size	_ZL7SyncPrgv, .-_ZL7SyncPrgv
	.section	.text._ZL19UNLTF1201IRQCounterv,"ax",@progbits
	.align	2
	.type	_ZL19UNLTF1201IRQCounterv, @function
_ZL19UNLTF1201IRQCounterv:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L6
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	li	a3,237
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	beq	a5,a3,.L10
.L6:
	ret
.L10:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE10:
	.size	_ZL19UNLTF1201IRQCounterv, .-_ZL19UNLTF1201IRQCounterv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	lla	s1,_ZL3chr
	call	_ZL7SyncPrgv
	li	s0,0
	li	s2,8192
.L12:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L12
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLTF1201Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLTF1201Powerv, @function
_ZL14UNLTF1201Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sb zero, 0(a5);
	la a5, _ZL6IRQPre; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL14UNLTF1201Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	s1,_ZL3chr
	call	_ZL7SyncPrgv
	li	s0,0
	li	s2,8192
.L16:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L16
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE11:
	.size	_ZL14UNLTF1201Powerv, .-_ZL14UNLTF1201Powerv
	.section	.text._ZL14UNLTF1201Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLTF1201Writejh, @function
_ZL14UNLTF1201Writejh:
.LFB9:
	.cfi_startproc
	li	a5,61440
	srli	a4,a0,2
	addi	a5,a5,3
	andi	a4,a4,3
	and	a0,a0,a5
	or	a0,a0,a4
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	li	a4,12288
	li	a3,-45056
	sw	ra,28(sp)
	add	a3,a0,a3
	addi	a4,a4,3
	.cfi_offset 1, -4
	bleu	a3,a4,.L36
	li	a4,40960
	beq	a0,a4,.L22
	bgtu	a0,a4,.L23
	li	a5,36864
	beq	a0,a5,.L24
	addi	a5,a5,1
	beq	a0,a5,.L25
	li	a5,32768
	bne	a0,a5,.L19
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL4prg0; sb a1, 0(a5);
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPrgv
.L23:
	.cfi_restore_state
	li	a4,61440
	addi	a4,a4,2
	beq	a0,a4,.L28
	bgtu	a0,a4,.L29
	li	a2,61440
	bne	a0,a2,.L37
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
.L19:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L36:
	.cfi_restore_state
	srli	a5,a0,11
	andi	a4,a0,1
	addi	a5,a5,-6
	or	a5,a5,a4
	sw	s1,20(sp)
	andi	a5,a5,7
	.cfi_offset 9, -12
	lla	s1,_ZL3chr
	sw	s0,24(sp)
	sw	s2,16(sp)
	add	a5,s1,a5
	lbu	a4,0(a5)
	slli	a0,a0,1
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a4,a4,a3
	sll	a1,a1,a0
	or	a4,a4,a1
	sb	a4,0(a5)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	li	s0,0
	li	s2,8192
.L21:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L21
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	ra,28(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L25:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a1,a1,3
	la a5, _ZL4swap; sb a1, 0(a5);
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPrgv
.L29:
	.cfi_restore_state
	bne	a0,a5,.L19
.L31:
	andi	a1,a1,2
	li	a0,1
	la a5, _ZL4IRQa; sb a1, 0(a5);
	call	_Z12X6502_IRQEndi
	la a4, scanline; lw a4, 0(a4);
	li	a5,239
	bgt	a4,a5,.L19
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	addi	a5,a5,-8
	sb	a5,0(a4)
	j	.L19
.L24:
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	andi	a1,a1,1
	lla	s3,_ZL4mirr
	sb	a1,0(s3)
	lla	s1,_ZL3chr
	li	s0,0
	li	s2,8192
.L32:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L32
	lbu	a0,0(s3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	ra,28(sp)
	.cfi_restore 1
	xori	a0,a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L28:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	j	.L19
.L22:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL4prg1; sb a1, 0(a5);
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_ZL7SyncPrgv
.L37:
	.cfi_restore_state
	li	a5,61440
	addi	a5,a5,1
	beq	a0,a5,.L31
	j	.L19
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLTF1201Writejh, .-_ZL14UNLTF1201Writejh
	.section	.text._Z14UNLTF1201_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLTF1201_InitP8CartInfo
	.hidden	_Z14UNLTF1201_InitP8CartInfo
	.type	_Z14UNLTF1201_InitP8CartInfo, @function
_Z14UNLTF1201_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL14UNLTF1201Powerv
	sw	a5,0(a0)
	lla	a5,_ZL19UNLTF1201IRQCounterv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14UNLTF1201_InitP8CartInfo, .-_Z14UNLTF1201_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG0"
	.align	2
.LC1:
	.string	"PRG1"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"SWAP"
	.align	2
.LC4:
	.string	"CHR"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQP"
	.align	2
.LC7:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4prg0
	.word	1
	.word	.LC0
	.word	_ZL4prg0
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL4swap
	.word	1
	.word	.LC3
	.word	_ZL3chr
	.word	8
	.word	.LC4
	.word	_ZL8IRQCount
	.word	1
	.word	.LC5
	.word	_ZL6IRQPre
	.word	1
	.word	.LC6
	.word	_ZL4IRQa
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL6IRQPre,"aw",@nobits
	.type	_ZL6IRQPre, @object
	.size	_ZL6IRQPre, 1
_ZL6IRQPre:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
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
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
