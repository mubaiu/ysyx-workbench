#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"253.cpp"
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL3prg
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	li	s1,0
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	lla	s0,_ZL5chrhi
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lla	a3,_ZL5chrlo
	j	.L4
.L2:
	sw	a3,0(sp)
	call	_Z7setchr1jj
	lw	a3,0(sp)
	addi	s1,s1,1024
	li	a5,8192
	addi	a3,a3,1
	addi	s0,s0,1
	beq	s1,a5,.L17
.L4:
	lbu	a1,0(a3)
	lbu	a2,0(s0)
	li	t1,1
	addi	a5,a1,-4
	slli	a2,a2,8
	or	a2,a2,a1
	andi	a5,a5,0xff
	mv	a0,s1
	mv	a1,a2
	bgtu	a5,t1,.L2
	lla	a5,_ZL5vlock
	lbu	a5,0(a5)
	bne	a5,zero,.L2
	mv	a1,s1
	andi	a2,a2,1
	li	a0,16
	sw	a3,0(sp)
	call	_Z8setchr1rijj
	lw	a3,0(sp)
	addi	s1,s1,1024
	li	a5,8192
	addi	a3,a3,1
	addi	s0,s0,1
	bne	s1,a5,.L4
.L17:
	la a5, _ZL4mirr; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L5
	bgtu	a5,a4,.L6
	li	a0,0
	beq	a5,zero,.L18
.L15:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L18:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L6:
	.cfi_restore_state
	li	a4,3
	li	a0,3
	beq	a5,a4,.L15
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,2
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
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M253Closev,"ax",@progbits
	.align	2
	.type	_ZL9M253Closev, @function
_ZL9M253Closev:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L21
	call	_Z10FCEU_gfreePv
.L21:
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L22
	call	_Z10FCEU_gfreePv
.L22:
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL9M253Closev, .-_ZL9M253Closev
	.section	.text._ZL9M253Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M253Powerv, @function
_ZL9M253Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL5vlock; sb zero, 0(a5);
	li	s0,32768
	call	_ZL4Syncv
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
	lla	a2,_ZL9M253Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE8:
	.size	_ZL9M253Powerv, .-_ZL9M253Powerv
	.section	.text._ZL9M253Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M253Writejh, @function
_ZL9M253Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,12288
	li	a4,-45056
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	add	a4,a0,a4
	addi	a5,a5,12
	mv	s0,a1
	bgtu	a4,a5,.L33
	srli	a4,a0,8
	andi	a5,a0,8
	or	a5,a5,a4
	srli	a5,a5,3
	addi	a5,a5,2
	andi	a5,a5,7
	lla	a2,_ZL5chrlo
	add	a2,a2,a5
	lbu	a4,0(a2)
	andi	a0,a0,4
	li	a1,240
	sra	a1,a1,a0
	andi	a3,s0,15
	and	a4,a4,a1
	sll	a3,a3,a0
	or	a4,a4,a3
	andi	a4,a4,0xff
	sb	a4,0(a2)
	bne	a5,zero,.L34
	li	a3,200
	beq	a4,a3,.L50
	li	a3,136
	bne	a4,a3,.L34
	li	a4,1
	la a3, _ZL5vlock; sb a4, 0(a3);
.L34:
	beq	a0,zero,.L49
.L51:
	lla	a4,_ZL5chrhi
	add	a5,a4,a5
	srli	s0,s0,4
	sb	s0,0(a5)
.L49:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L33:
	.cfi_restore_state
	li	a5,61440
	beq	a0,a5,.L37
	bgtu	a0,a5,.L38
	li	a5,36864
	addi	a5,a5,1024
	beq	a0,a5,.L39
	li	a5,40960
	addi	a5,a5,16
	beq	a0,a5,.L40
	li	a5,32768
	addi	a5,a5,16
	bne	a0,a5,.L32
	la a5, _ZL3prg; sb a1, 0(a5);
	j	.L49
.L50:
	la a4, _ZL5vlock; sb zero, 0(a4);
	beq	a0,zero,.L49
	j	.L51
.L39:
	andi	s0,a1,3
	la a5, _ZL4mirr; sb s0, 0(a5);
	j	.L49
.L37:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lw	a5,0(a4)
	andi	s0,s0,15
	andi	a5,a5,240
	or	a5,a5,s0
	sw	a5,0(a4)
.L32:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L38:
	.cfi_restore_state
	li	a5,61440
	addi	a5,a5,4
	beq	a0,a5,.L43
	li	a5,61440
	addi	a5,a5,8
	bne	a0,a5,.L32
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, _ZL8IRQClock; sw zero, 0(a5);
	la a5, _ZL8IRQLatch; lw a5, 0(a5);
	andi	s0,s0,2
	la a4, _ZL8IRQCount; sw a5, 0(a4);
	la a5, _ZL4IRQa; sw s0, 0(a5);
	j	.L32
.L40:
	la a5, _ZL3prg+1; sb a1, 0(a5);
	j	.L49
.L43:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQLatch
	lw	a5,0(a4)
	slli	s0,s0,4
	andi	a5,a5,15
	or	a5,a5,s0
	sw	a5,0(a4)
	j	.L32
	.cfi_endproc
.LFE7:
	.size	_ZL9M253Writejh, .-_ZL9M253Writejh
	.section	.text._ZL7M253IRQi,"ax",@progbits
	.align	2
	.type	_ZL7M253IRQi, @function
_ZL7M253IRQi:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L65
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQClock
	lw	a4,0(s0)
	slli	a5,a0,1
	add	a5,a5,a0
	add	a5,a5,a4
	sw	ra,8(sp)
	sw	a5,0(s0)
	li	a4,340
	.cfi_offset 1, -4
	ble	a5,a4,.L52
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL8IRQCount
	lw	a4,0(s1)
.L56:
	li	a2,0
	li	a1,340
.L57:
	ble	a5,a1,.L69
	addi	a4,a4,1
	andi	a3,a4,256
	addi	a5,a5,-341
	li	a2,1
	beq	a3,zero,.L57
	li	a0,1
	sw	a4,0(s1)
	sw	a5,0(s0)
	call	_Z14X6502_IRQBegini
	la a4, _ZL8IRQLatch; lw a4, 0(a4);
	lw	a5,0(s0)
	sw	a4,0(s1)
	j	.L56
.L69:
	beq	a2,zero,.L68
	sw	a4,0(s1)
	lw	s1,0(sp)
	.cfi_restore 9
	sw	a5,0(s0)
.L52:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L65:
	ret
.L68:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	s1,0(sp)
	.cfi_restore 9
	j	.L52
	.cfi_endproc
.LFE10:
	.size	_ZL7M253IRQi, .-_ZL7M253IRQi
	.section	.rodata._Z14Mapper253_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"WRAM"
	.section	.text._Z14Mapper253_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper253_InitP8CartInfo
	.hidden	_Z14Mapper253_InitP8CartInfo
	.type	_Z14Mapper253_InitP8CartInfo, @function
_Z14Mapper253_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a3,_ZL9M253Powerv
	sw	a3,0(a0)
	li	a4,4096
	lla	a3,_ZL9M253Closev
	addi	a4,a4,-2048
	sw	a3,8(a0)
	lla	a3,_ZL7M253IRQi
	lla	s0,_ZL10CHRRAMSIZE
	la a2, MapIRQHook; sw a3, 0(a2);
	sw	a0,0(sp)
	lla	a3,_ZL12StateRestorei
	mv	a0,a4
	sw	a4,0(s0)
	la a2, GameStateRestore; sw a3, 0(a2);
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	li	a4,8192
	lla	s0,_ZL8WRAMSIZE
	li	a0,8192
	sw	a4,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L71
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L71:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper253_InitP8CartInfo, .-_Z14Mapper253_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"CHRL"
	.align	2
.LC3:
	.string	"CHRH"
	.align	2
.LC4:
	.string	"PRGR"
	.align	2
.LC5:
	.string	"MIRR"
	.align	2
.LC6:
	.string	"VLCK"
	.align	2
.LC7:
	.string	"IRQA"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"IRQL"
	.align	2
.LC10:
	.string	"IRQK"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 120
_ZL9StateRegs:
	.word	_ZL5chrlo
	.word	8
	.word	.LC2
	.word	_ZL5chrhi
	.word	8
	.word	.LC3
	.word	_ZL3prg
	.word	2
	.word	.LC4
	.word	_ZL4mirr
	.word	1
	.word	.LC5
	.word	_ZL5vlock
	.word	1
	.word	.LC6
	.word	_ZL4IRQa
	.word	4
	.word	.LC7
	.word	_ZL8IRQCount
	.word	4
	.word	.LC8
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC9
	.word	_ZL8IRQClock
	.word	4
	.word	.LC10
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
	.section	.sbss._ZL8IRQClock,"aw",@nobits
	.align	2
	.type	_ZL8IRQClock, @object
	.size	_ZL8IRQClock, 4
_ZL8IRQClock:
	.zero	4
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
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
	.section	.sbss._ZL5vlock,"aw",@nobits
	.type	_ZL5vlock, @object
	.size	_ZL5vlock, 1
_ZL5vlock:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3prg,"aw",@nobits
	.align	2
	.type	_ZL3prg, @object
	.size	_ZL3prg, 2
_ZL3prg:
	.zero	2
	.section	.sbss._ZL5chrhi,"aw",@nobits
	.align	2
	.type	_ZL5chrhi, @object
	.size	_ZL5chrhi, 8
_ZL5chrhi:
	.zero	8
	.section	.sbss._ZL5chrlo,"aw",@nobits
	.align	2
	.type	_ZL5chrlo, @object
	.size	_ZL5chrlo, 8
_ZL5chrlo:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
