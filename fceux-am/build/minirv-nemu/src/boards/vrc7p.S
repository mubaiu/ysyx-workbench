#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc7p.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL3prg
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL3chr
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s2,8192
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L2
	la a5, _ZL4mirr; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L8
	li	a4,3
	li	a0,3
	beq	a5,a4,.L8
	li	a4,1
	li	a0,1
	bne	a5,a4,.L8
	li	a0,0
.L8:
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
	.section	.text._ZL12UNLVRC7Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLVRC7Powerv, @function
_ZL12UNLVRC7Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL12UNLVRC7Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL12UNLVRC7Powerv, .-_ZL12UNLVRC7Powerv
	.section	.text._ZL12UNLVRC7Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLVRC7Writejh, @function
_ZL12UNLVRC7Writejh:
.LFB7:
	.cfi_startproc
	li	a5,61440
	addi	a5,a5,8
	and	a0,a0,a5
	li	a4,49152
	li	a3,61440
	beq	a0,a4,.L14
	bgtu	a0,a4,.L15
	li	a5,40960
	beq	a0,a5,.L16
	bgtu	a0,a5,.L17
	li	a5,32768
	addi	a5,a5,8
	li	a4,32768
	beq	a0,a5,.L18
	li	a5,36864
	beq	a0,a5,.L19
	bne	a0,a4,.L37
	la a5, _ZL3prg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L15:
	li	a4,57344
	beq	a0,a4,.L25
	bgtu	a0,a4,.L26
	li	a5,53248
	beq	a0,a5,.L27
	addi	a5,a5,8
	beq	a0,a5,.L28
	li	a5,49152
	addi	a5,a5,8
	bne	a0,a5,.L38
	la a5, _ZL3chr+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	beq	a0,a3,.L30
	beq	a0,a5,.L31
	li	a5,57344
	addi	a5,a5,8
	bne	a0,a5,.L39
	li	a0,1
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L17:
	li	a5,45056
	beq	a0,a5,.L22
	addi	a5,a5,8
	beq	a0,a5,.L23
	li	a5,40960
	addi	a5,a5,8
	bne	a0,a5,.L40
	la a5, _ZL3chr+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L30:
	andi	a5,a1,2
	andi	a1,a1,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	la a4, _ZL4IRQd; sb a1, 0(a4);
	beq	a5,zero,.L33
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a4, _ZL8IRQCount; sw a5, 0(a4);
.L33:
	li	a0,1
	la a5, _ZL10CycleCount; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L27:
	la a5, _ZL3chr+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L22:
	la a5, _ZL3chr+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	la a5, _ZL3prg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L16:
	la a5, _ZL3chr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	la a5, _ZL3chr+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L31:
	la a5, _ZL4IRQd; lbu a5, 0(a5);
	snez	a5,a5
	li	a0,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L23:
	la a5, _ZL3chr+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L28:
	la a5, _ZL3chr+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L25:
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	la a5, _ZL3prg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L38:
	ret
.L37:
	ret
.L39:
	ret
.L40:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL12UNLVRC7Writejh, .-_ZL12UNLVRC7Writejh
	.section	.text._ZL14UNLVRC7IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14UNLVRC7IRQHooki, @function
_ZL14UNLVRC7IRQHooki:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L53
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s2,16(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL10CycleCount
	lw	a4,0(s2)
	slli	a5,a0,1
	add	a5,a5,a0
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	add	a5,a5,a4
	sw	a5,0(s2)
	lla	s3,_ZL8IRQCount
	li	s0,340
	li	s1,248
.L44:
	lw	a4,0(s3)
	li	a3,0
.L45:
	ble	a5,s0,.L56
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,s1,.L45
	la a4, _ZL8IRQLatch; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s2)
	sw	a4,0(s3)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s2)
	j	.L44
.L53:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	ret
.L56:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	beq	a3,zero,.L41
	sw	a4,0(s3)
	sw	a5,0(s2)
.L41:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL14UNLVRC7IRQHooki, .-_ZL14UNLVRC7IRQHooki
	.section	.text._Z12UNLVRC7_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLVRC7_InitP8CartInfo
	.hidden	_Z12UNLVRC7_InitP8CartInfo
	.type	_Z12UNLVRC7_InitP8CartInfo, @function
_Z12UNLVRC7_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL12UNLVRC7Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLVRC7IRQHooki
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
	.size	_Z12UNLVRC7_InitP8CartInfo, .-_Z12UNLVRC7_InitP8CartInfo
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
	.string	"IRQA"
	.align	2
.LC4:
	.string	"IRQD"
	.align	2
.LC5:
	.string	"IRQL"
	.align	2
.LC6:
	.string	"IRQC"
	.align	2
.LC7:
	.string	"CYCC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL3prg
	.word	3
	.word	.LC0
	.word	_ZL3chr
	.word	8
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL4IRQa
	.word	1
	.word	.LC3
	.word	_ZL4IRQd
	.word	1
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC5
	.word	_ZL8IRQCount
	.word	4
	.word	.LC6
	.word	_ZL10CycleCount
	.word	4
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL10CycleCount,"aw",@nobits
	.align	2
	.type	_ZL10CycleCount, @object
	.size	_ZL10CycleCount, 4
_ZL10CycleCount:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4IRQd,"aw",@nobits
	.type	_ZL4IRQd, @object
	.size	_ZL4IRQd, 1
_ZL4IRQd:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
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
	.size	_ZL3prg, 3
_ZL3prg:
	.zero	3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
