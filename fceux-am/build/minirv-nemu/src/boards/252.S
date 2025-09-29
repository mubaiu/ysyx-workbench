#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"252.cpp"
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL4preg
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL4creg
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	s3,1
	li	s2,8192
	j	.L4
.L2:
	mv	a1,a4
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	beq	s0,s2,.L8
.L4:
	lbu	a4,0(s1)
	mv	a0,s0
	mv	a1,s0
	addi	a5,a4,-6
	andi	a5,a5,0xff
	andi	a2,a4,1
	bgtu	a5,s3,.L2
	li	a0,16
	addi	s0,s0,1024
	call	_Z8setchr1rijj
	addi	s1,s1,1
	bne	s0,s2,.L4
.L8:
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
	.section	.text._ZL9M252Closev,"ax",@progbits
	.align	2
	.type	_ZL9M252Closev, @function
_ZL9M252Closev:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L11
	call	_Z10FCEU_gfreePv
.L11:
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L12
	call	_Z10FCEU_gfreePv
.L12:
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL9M252Closev, .-_ZL9M252Closev
	.section	.text._ZL9M252Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M252Powerv, @function
_ZL9M252Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9M252Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE8:
	.size	_ZL9M252Powerv, .-_ZL9M252Powerv
	.section	.text._ZL7M252IRQi,"ax",@progbits
	.align	2
	.type	_ZL7M252IRQi, @function
_ZL7M252IRQi:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L35
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL8IRQClock
	lw	a4,0(s1)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	ra,12(sp)
	sw	a5,0(s1)
	li	a4,340
	.cfi_offset 1, -4
	ble	a5,a4,.L22
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL8IRQCount
	lw	a4,0(s2)
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	a2,0
	li	s0,340
.L27:
	ble	a5,s0,.L39
	addi	a4,a4,1
	andi	a3,a4,256
	addi	a5,a5,-341
	li	a2,1
	beq	a3,zero,.L27
	li	a0,1
	sw	a4,0(s2)
	sw	a5,0(s1)
	call	_Z14X6502_IRQBegini
	la a4, _ZL8IRQLatch; lw a4, 0(a4);
	lw	a5,0(s1)
	sw	a4,0(s2)
	li	a2,0
	j	.L27
.L39:
	beq	a2,zero,.L38
	sw	a4,0(s2)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s2,0(sp)
	.cfi_restore 18
	sw	a5,0(s1)
.L22:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L35:
	ret
.L38:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L22
	.cfi_endproc
.LFE9:
	.size	_ZL7M252IRQi, .-_ZL7M252IRQi
	.section	.text._ZL9M252Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M252Writejh, @function
_ZL9M252Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-45056
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	add	a5,a0,a5
	li	a4,16384
	mv	s0,a1
	bltu	a5,a4,.L54
	li	a5,61440
	addi	a5,a5,12
	li	a4,61440
	and	a0,a0,a5
	beq	a0,a4,.L42
	bleu	a0,a4,.L55
	li	a5,61440
	addi	a5,a5,4
	beq	a0,a5,.L49
	li	a5,61440
	addi	a5,a5,8
	bne	a0,a5,.L40
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, _ZL8IRQClock; sw zero, 0(a5);
	la a5, _ZL8IRQLatch; lw a5, 0(a5);
	andi	a1,s0,2
	la a4, _ZL8IRQCount; sw a5, 0(a4);
	la a5, _ZL4IRQa; sw a1, 0(a5);
.L40:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L55:
	.cfi_restore_state
	li	a5,32768
	addi	a5,a5,12
	li	a4,32768
	bgtu	a0,a5,.L44
	bltu	a0,a4,.L40
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4preg; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L54:
	.cfi_restore_state
	srli	a4,a0,8
	andi	a5,a0,8
	or	a5,a5,a4
	srli	a5,a5,3
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a4,_ZL4creg
	add	a4,a4,a5
	lbu	a5,0(a4)
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a5,a5,a3
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a4)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L44:
	.cfi_restore_state
	li	a5,-40960
	add	a0,a0,a5
	li	a5,12
	bgtu	a0,a5,.L40
	li	a5,4096
	addi	a5,a5,273
	srl	a5,a5,a0
	andi	a5,a5,1
	beq	a5,zero,.L40
	la a5, _ZL4preg+1; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L49:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lw	a5,0(a4)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	slli	a1,s0,4
	andi	a5,a5,15
	lw	s0,8(sp)
	.cfi_restore 8
	or	a5,a5,a1
	sw	a5,0(a4)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L42:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lw	a5,0(a4)
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a1,s0,15
	andi	a5,a5,240
	lw	s0,8(sp)
	.cfi_restore 8
	or	a5,a5,a1
	sw	a5,0(a4)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_ZL9M252Writejh, .-_ZL9M252Writejh
	.section	.rodata._Z14Mapper252_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z14Mapper252_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper252_InitP8CartInfo
	.hidden	_Z14Mapper252_InitP8CartInfo
	.type	_Z14Mapper252_InitP8CartInfo, @function
_Z14Mapper252_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lla	a4,_ZL9M252Powerv
	li	a5,4096
	addi	a5,a5,-2048
	sw	a4,0(a0)
	lla	a4,_ZL9M252Closev
	lla	s1,_ZL10CHRRAMSIZE
	sw	a4,8(a0)
	mv	s0,a0
	lla	a4,_ZL7M252IRQi
	mv	a0,a5
	la a3, MapIRQHook; sw a4, 0(a3);
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s2,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s2)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	li	a5,8192
	lla	s1,_ZL8WRAMSIZE
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s2,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s2)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC1
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L57
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L57:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper252_InitP8CartInfo, .-_Z14Mapper252_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"PREG"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQL"
	.align	2
.LC7:
	.string	"IRQK"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL4creg
	.word	8
	.word	.LC2
	.word	_ZL4preg
	.word	2
	.word	.LC3
	.word	_ZL4IRQa
	.word	4
	.word	.LC4
	.word	_ZL8IRQCount
	.word	4
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC6
	.word	_ZL8IRQClock
	.word	4
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.section	.sbss._ZL8IRQClock,"aw",@nobits
	.align	2
	.type	_ZL8IRQClock, @object
	.size	_ZL8IRQClock, 4
_ZL8IRQClock:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.align	2
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 4
_ZL4IRQa:
	.zero	4
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 2
_ZL4preg:
	.zero	2
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
