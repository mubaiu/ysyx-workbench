#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"178.cpp"
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
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL3reg
	lbu	a5,2(s0)
	lbu	a1,1(s0)
	li	a0,0
	sw	a5,0(sp)
	andi	s1,a1,7
	call	_Z7setchr8j
	lbu	a2,3(s0)
	li	a1,24576
	li	a0,16
	andi	a2,a2,3
	call	_Z8setprg8rijj
	lbu	a4,0(s0)
	lw	a5,0(sp)
	andi	a3,a4,2
	slli	a5,a5,3
	or	s1,s1,a5
	bne	a3,zero,.L8
	andi	a4,a4,4
	bne	a4,zero,.L9
	srli	a1,s1,1
	li	a0,32768
	call	_Z8setprg32jj
.L4:
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L9:
	.cfi_restore_state
	mv	a1,s1
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s1
	li	a0,49152
	call	_Z8setprg16jj
	j	.L4
.L8:
	mv	a1,s1
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lbu	a4,0(s0)
	lw	a5,0(sp)
	andi	a4,a4,4
	beq	a4,zero,.L3
	lbu	a1,1(s0)
	li	a0,49152
	andi	a1,a1,1
	or	a1,a1,a5
	ori	a1,a1,6
	call	_Z8setprg16jj
	j	.L4
.L3:
	ori	a1,a5,7
	li	a0,49152
	call	_Z8setprg16jj
	j	.L4
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB14:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE14:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M178Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M178Writejh, @function
_ZL9M178Writejh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL3reg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M178Writejh, .-_ZL9M178Writejh
	.section	.text._ZL9M178Closev,"ax",@progbits
	.align	2
	.type	_ZL9M178Closev, @function
_ZL9M178Closev:
.LFB13:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L18
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE13:
	.size	_ZL9M178Closev, .-_ZL9M178Closev
	.section	.text._ZL9M178Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M178Powerv, @function
_ZL9M178Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL11SensorDelay; sw zero, 0(a5);
	la a5, _ZL3reg; sw zero, 0(a5);
	call	_ZL4Syncv
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL9M178Writejh
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL12M178WriteSndjh
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL11M178ReadSndj
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL14M178ReadSensorj
	li	a1,20480
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
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
.LFE11:
	.size	_ZL9M178Powerv, .-_ZL9M178Powerv
	.section	.text._ZL14M178ReadSensorj,"ax",@progbits
	.align	2
	.type	_ZL14M178ReadSensorj, @function
_ZL14M178ReadSensorj:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL14M178ReadSensorj, .-_ZL14M178ReadSensorj
	.section	.text._ZL12M178WriteSndjh,"ax",@progbits
	.align	2
	.type	_ZL12M178WriteSndjh, @function
_ZL12M178WriteSndjh:
.LFB8:
	.cfi_startproc
	li	a5,24576
	addi	a5,a5,-2048
	beq	a0,a5,.L28
	ret
.L28:
	li	a5,15
	bleu	a1,a5,.L27
	li	a5,1
	la a4, _ZL10pcm_enable; sb a5, 0(a4);
	ret
.L27:
	la a5, _ZL10pcm_enable; sb zero, 0(a5);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL12M178WriteSndjh, .-_ZL12M178WriteSndjh
	.section	.text._ZL11M178ReadSndj,"ax",@progbits
	.align	2
	.type	_ZL11M178ReadSndj, @function
_ZL11M178ReadSndj:
.LFB9:
	.cfi_startproc
	li	a5,24576
	mv	a4,a0
	addi	a5,a5,-2048
	la a0, X+24; lbu a0, 0(a0);
	beq	a4,a5,.L31
	ret
.L31:
	la a5, _ZL10pcm_enable; lbu a5, 0(a5);
	slli	a5,a5,6
	andi	a0,a0,-65
	xori	a5,a5,64
	or	a5,a5,a0
	andi	a0,a5,0xff
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL11M178ReadSndj, .-_ZL11M178ReadSndj
	.section	.text._ZL10M178SndClki,"ax",@progbits
	.align	2
	.type	_ZL10M178SndClki, @function
_ZL10M178SndClki:
.LFB12:
	.cfi_startproc
	lla	a4,_ZL11SensorDelay
	lw	a3,0(a4)
	li	a5,204800
	addi	a5,a5,1896
	add	a0,a0,a3
	bgt	a0,a5,.L33
	sw	a0,0(a4)
	ret
.L33:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,-32768
	add	a5,a0,a5
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a0,_ZL9MouseData
	sw	a5,0(a4)
	call	_Z12GetMouseDataRA3_j
	lla	a4,_ZL5click
	lw	a3,0(a4)
	la a5, _ZL9MouseData+8; lw a5, 0(a5);
	andi	a5,a5,1
	sw	a5,0(a4)
	beq	a3,zero,.L32
	bne	a5,zero,.L32
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_IRQBegini
.L32:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_ZL10M178SndClki, .-_ZL10M178SndClki
	.section	.rodata._Z14Mapper178_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper178_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper178_InitP8CartInfo
	.hidden	_Z14Mapper178_InitP8CartInfo
	.type	_Z14Mapper178_InitP8CartInfo, @function
_Z14Mapper178_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL9M178Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M178Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10M178SndClki
	lla	s1,_ZL8WRAMSIZE
	la a4, MapIRQHook; sw a5, 0(a4);
	mv	s0,a0
	li	a5,32768
	li	a0,32768
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,_ZL4WRAM
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L44
	sw	a0,12(s0)
	sw	a1,28(s0)
.L44:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE15:
	.size	_Z14Mapper178_InitP8CartInfo, .-_Z14Mapper178_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	4
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10pcm_enable,"aw",@nobits
	.type	_ZL10pcm_enable, @object
	.size	_ZL10pcm_enable, 1
_ZL10pcm_enable:
	.zero	1
	.section	.sbss._ZL11SensorDelay,"aw",@nobits
	.align	2
	.type	_ZL11SensorDelay, @object
	.size	_ZL11SensorDelay, 4
_ZL11SensorDelay:
	.zero	4
	.section	.sbss._ZL5click,"aw",@nobits
	.align	2
	.type	_ZL5click, @object
	.size	_ZL5click, 4
_ZL5click:
	.zero	4
	.section	.bss._ZL9MouseData,"aw",@nobits
	.align	2
	.type	_ZL9MouseData, @object
	.size	_ZL9MouseData, 12
_ZL9MouseData:
	.zero	12
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
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 4
_ZL3reg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
