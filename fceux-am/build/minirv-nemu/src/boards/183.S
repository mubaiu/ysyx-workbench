#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"183.cpp"
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
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL3prg
	lbu	a1,3(s0)
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
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
	.size	_ZL7SyncPrgv, .-_ZL7SyncPrgv
	.section	.text._ZL8SyncMirrv,"ax",@progbits
	.align	2
	.type	_ZL8SyncMirrv, @function
_ZL8SyncMirrv:
.LFB7:
	.cfi_startproc
	la a5, _ZL4mirr; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L5
	bgtu	a5,a4,.L6
	beq	a5,zero,.L13
	li	a0,0
	tail	_Z9setmirrori
.L6:
	li	a4,3
	bne	a5,a4,.L14
	li	a0,3
	tail	_Z9setmirrori
.L5:
	li	a0,2
	tail	_Z9setmirrori
.L13:
	li	a0,1
	tail	_Z9setmirrori
.L14:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL8SyncMirrv, .-_ZL8SyncMirrv
	.section	.text._ZL9M183Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M183Writejh, @function
_ZL9M183Writejh:
.LFB10:
	.cfi_startproc
	li	a5,65536
	addi	a5,a5,-2048
	li	a4,28672
	and	a5,a0,a5
	addi	a4,a4,-2048
	beq	a5,a4,.L36
	li	a5,65536
	addi	a5,a5,-2036
	and	a5,a0,a5
	li	a4,12288
	li	a3,-45056
	add	a3,a5,a3
	addi	a4,a4,12
	bleu	a3,a4,.L37
	li	a4,61440
	beq	a5,a4,.L20
	bgtu	a5,a4,.L21
	li	a4,40960
	beq	a5,a4,.L22
	bgtu	a5,a4,.L23
	li	a4,36864
	addi	a4,a4,-2048
	beq	a5,a4,.L24
	li	a4,40960
	addi	a4,a4,-2048
	bne	a5,a4,.L38
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL8SyncMirrv
.L37:
	srli	a5,a0,11
	srli	a4,a0,3
	addi	a5,a5,-6
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	or	a5,a5,a4
	sw	s1,4(sp)
	andi	a5,a5,7
	.cfi_offset 9, -12
	lla	s1,_ZL3chr
	sw	s0,8(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	add	a5,s1,a5
	lbu	a4,0(a5)
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a4,a4,a3
	sll	a1,a1,a0
	or	a4,a4,a1
	sb	a4,0(a5)
	li	s0,0
	li	s2,8192
.L18:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L18
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L21:
	li	a4,61440
	addi	a4,a4,8
	beq	a5,a4,.L27
	li	a4,61440
	addi	a4,a4,12
	beq	a5,a4,.L28
	li	a4,61440
	addi	a4,a4,4
	bne	a5,a4,.L39
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	slli	a1,a1,4
	andi	a5,a5,15
	or	a5,a5,a1
	sb	a5,0(a4)
	ret
.L36:
	andi	a0,a0,63
	la a5, _ZL3prg+3; sb a0, 0(a5);
	tail	_ZL7SyncPrgv
.L23:
	li	a4,45056
	addi	a4,a4,-2048
	bne	a5,a4,.L40
	la a5, _ZL3prg+1; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L27:
	la a5, _ZL4IRQa; sb a1, 0(a5);
	bne	a1,zero,.L30
	la a5, _ZL6IRQPre; sb zero, 0(a5);
.L30:
	li	a0,1
	tail	_Z12X6502_IRQEndi
.L20:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	andi	a1,a1,15
	andi	a5,a5,-16
	or	a5,a5,a1
	sb	a5,0(a4)
	ret
.L24:
	la a5, _ZL3prg; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L22:
	la a5, _ZL3prg+2; sb a1, 0(a5);
	tail	_ZL7SyncPrgv
.L28:
	li	a5,16
	la a4, _ZL6IRQPre; sb a5, 0(a4);
	ret
.L39:
	ret
.L40:
	ret
.L38:
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL9M183Writejh, .-_ZL9M183Writejh
	.section	.text._ZL14M183IRQCounterv,"ax",@progbits
	.align	2
	.type	_ZL14M183IRQCounterv, @function
_ZL14M183IRQCounterv:
.LFB11:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L41
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	la a3, _ZL6IRQPre; lbu a3, 0(a3);
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	addi	a5,a5,-238
	beq	a5,a3,.L45
.L41:
	ret
.L45:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE11:
	.size	_ZL14M183IRQCounterv, .-_ZL14M183IRQCounterv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
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
.L47:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L47
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL8SyncMirrv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M183Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M183Powerv, @function
_ZL9M183Powerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
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
	lla	a2,_ZL9M183Writejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lla	s1,_ZL3chr
	call	_ZL7SyncPrgv
	li	s0,0
	li	s2,8192
.L51:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L51
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_ZL9M183Powerv, .-_ZL9M183Powerv
	.section	.text._Z14Mapper183_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper183_InitP8CartInfo
	.hidden	_Z14Mapper183_InitP8CartInfo
	.type	_Z14Mapper183_InitP8CartInfo, @function
_Z14Mapper183_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	lla	a5,_ZL9M183Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14M183IRQCounterv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14Mapper183_InitP8CartInfo, .-_Z14Mapper183_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PRG"
	.align	2
.LC1:
	.string	"CHR"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQP"
	.align	2
.LC5:
	.string	"IRQA"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL3prg
	.word	4
	.word	.LC0
	.word	_ZL3chr
	.word	8
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	1
	.word	.LC3
	.word	_ZL6IRQPre
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
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
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.type	_ZL3chr, @object
	.size	_ZL3chr, 8
_ZL3chr:
	.zero	8
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.type	_ZL3prg, @object
	.size	_ZL3prg, 4
_ZL3prg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
