#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"69.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9M69Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M69Write0jh, @function
_ZL9M69Write0jh:
.LFB9:
	.cfi_startproc
	andi	a1,a1,15
	la a5, _ZL6cmdreg; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9M69Write0jh, .-_ZL9M69Write0jh
	.globl	__umodsi3
	.section	.text._ZL10M69SWrite0jh,"ax",@progbits
	.align	2
	.type	_ZL10M69SWrite0jh, @function
_ZL10M69SWrite0jh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	mv	a0,a1
	li	a1,14
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	__umodsi3
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL6sndcmd; sb a0, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_ZL10M69SWrite0jh, .-_ZL10M69SWrite0jh
	.section	.text._ZL10M69SWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL10M69SWrite1jh, @function
_ZL10M69SWrite1jh:
.LFB12:
	.cfi_startproc
	la a3, _ZL6sndcmd; lbu a3, 0(a3);
	lla	a5,_ZL4sreg
	lla	a4,GameExpSound
	add	a5,a5,a3
	lla	a3,_ZL7AYSoundi
	sw	a3,0(a4)
	lla	a3,_ZL9AYSoundHQv
	sw	a3,8(a4)
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL10M69SWrite1jh, .-_ZL10M69SWrite1jh
	.section	.text._ZL7AYSoundi,"ax",@progbits
	.align	2
	.type	_ZL7AYSoundi, @function
_ZL7AYSoundi:
.LFB15:
	.cfi_startproc
	lla	a5,_ZL5CAYBC
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.cfi_endproc
.LFE15:
	.size	_ZL7AYSoundi, .-_ZL7AYSoundi
	.section	.text._ZL9AYSoundHQv,"ax",@progbits
	.align	2
	.type	_ZL9AYSoundHQv, @function
_ZL9AYSoundHQv:
.LFB16:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE16:
	.size	_ZL9AYSoundHQv, .-_ZL9AYSoundHQv
	.section	.text._Z12Mapper69_ESIv,"ax",@progbits
	.align	2
	.globl	_Z12Mapper69_ESIv
	.hidden	_Z12Mapper69_ESIv
	.type	_Z12Mapper69_ESIv, @function
_Z12Mapper69_ESIv:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,GameExpSound
	lla	a4,_Z12Mapper69_ESIv
	sw	a4,16(a5)
	li	a2,12
	lla	a4,_ZL8AYHiSynci
	li	a1,0
	lla	a0,_ZL6dcount
	sw	a4,12(a5)
	call	memset
	li	a2,12
	li	a1,0
	lla	a0,_ZL6vcount
	call	memset
	li	a2,12
	li	a1,0
	lla	a0,_ZL5CAYBC
	call	memset
	lw	ra,8(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL10SStateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE18:
	.size	_Z12Mapper69_ESIv, .-_Z12Mapper69_ESIv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	lla	s0,_ZL4preg
	lbu	a1,3(s0)
	li	a5,192
	andi	a4,a1,192
	andi	a1,a1,63
	beq	a4,a5,.L20
	li	a0,24576
	call	_Z7setprg8jj
.L12:
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL4creg
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	li	s0,0
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
.L13:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L13
	la a5, _ZL4mirr; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L19
	li	a4,3
	li	a0,3
	beq	a5,a4,.L19
	li	a4,1
	li	a0,1
	bne	a5,a4,.L19
	li	a0,0
.L19:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L20:
	.cfi_restore_state
	mv	a2,a1
	li	a0,16
	li	a1,24576
	call	_Z8setprg8rijj
	j	.L12
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB22:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE22:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M69Closev,"ax",@progbits
	.align	2
	.type	_ZL8M69Closev, @function
_ZL8M69Closev:
.LFB20:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L28
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
.L28:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE20:
	.size	_ZL8M69Closev, .-_ZL8M69Closev
	.section	.text._ZL11M69WRAMReadj,"ax",@progbits
	.align	2
	.type	_ZL11M69WRAMReadj, @function
_ZL11M69WRAMReadj:
.LFB8:
	.cfi_startproc
	la a5, _ZL4preg+3; lbu a5, 0(a5);
	andi	a5,a5,192
	li	a4,64
	beq	a5,a4,.L35
	tail	_Z6CartBRj
.L35:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL11M69WRAMReadj, .-_ZL11M69WRAMReadj
	.section	.text._ZL8M69Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M69Powerv, @function
_ZL8M69Powerv:
.LFB19:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	s0,s0,-1
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	la a5, _ZL8IRQCount; sw s0, 0(a5);
	li	s1,32768
	la a5, _ZL6sndcmd; sb zero, 0(a5);
	la a5, _ZL6cmdreg; sb zero, 0(a5);
	la a5, _ZL4IRQa; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s1,-1
	lla	a2,_ZL11M69WRAMReadj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s1,-1
	lla	a2,_ZL12M69WRAMWritejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	mv	a1,s0
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,40960
	lla	a2,_ZL9M69Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_ZL9M69Write1jh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	lla	a2,_ZL10M69SWrite0jh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	mv	a1,s0
	lla	a2,_ZL10M69SWrite1jh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE19:
	.size	_ZL8M69Powerv, .-_ZL8M69Powerv
	.section	.text._ZL9M69Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M69Write1jh, @function
_ZL9M69Write1jh:
.LFB10:
	.cfi_startproc
	la a5, _ZL6cmdreg; lbu a5, 0(a5);
	li	a4,15
	bgtu	a5,a4,.L38
	lla	a4,.L41
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL9M69Write1jh,"a",@progbits
	.align	2
	.align	2
.L41:
	.word	.L56-.L41
	.word	.L55-.L41
	.word	.L54-.L41
	.word	.L53-.L41
	.word	.L52-.L41
	.word	.L51-.L41
	.word	.L50-.L41
	.word	.L49-.L41
	.word	.L48-.L41
	.word	.L47-.L41
	.word	.L46-.L41
	.word	.L45-.L41
	.word	.L44-.L41
	.word	.L43-.L41
	.word	.L42-.L41
	.word	.L40-.L41
	.section	.text._ZL9M69Write1jh
.L42:
	lla	a3,_ZL8IRQCount
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	sw	a5,0(a3)
	ret
.L40:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	slli	a1,a1,8
	or	a5,a5,a1
	sw	a5,0(a4)
.L38:
	ret
.L56:
	la a5, _ZL4creg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L55:
	la a5, _ZL4creg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L54:
	la a5, _ZL4creg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L53:
	la a5, _ZL4creg+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L52:
	la a5, _ZL4creg+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L51:
	la a5, _ZL4creg+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L50:
	la a5, _ZL4creg+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L49:
	la a5, _ZL4creg+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L48:
	la a5, _ZL4preg+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L47:
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L46:
	la a5, _ZL4preg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L45:
	la a5, _ZL4preg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L44:
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L43:
	li	a0,1
	la a5, _ZL4IRQa; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
	.cfi_endproc
.LFE10:
	.size	_ZL9M69Write1jh, .-_ZL9M69Write1jh
	.section	.text._ZL12M69WRAMWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M69WRAMWritejh, @function
_ZL12M69WRAMWritejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL4preg+3; lbu a5, 0(a5);
	andi	a5,a5,192
	li	a4,192
	beq	a5,a4,.L59
	ret
.L59:
	tail	_Z6CartBWjh
	.cfi_endproc
.LFE7:
	.size	_ZL12M69WRAMWritejh, .-_ZL12M69WRAMWritejh
	.section	.text._ZL10M69IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M69IRQHooki, @function
_ZL10M69IRQHooki:
.LFB21:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L65
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQCount
	lw	a5,0(s0)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	sub	a5,a5,a0
	sw	a5,0(s0)
	ble	a5,zero,.L68
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
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,65536
	addi	a5,a5,-1
	lw	ra,8(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	_ZL10M69IRQHooki, .-_ZL10M69IRQHooki
	.section	.text._ZL8AYHiSynci,"ax",@progbits
	.align	2
	.type	_ZL8AYHiSynci, @function
_ZL8AYHiSynci:
.LFB27:
	.cfi_startproc
	lla	a5,_ZL5CAYBC
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	ret
	.cfi_endproc
.LFE27:
	.size	_ZL8AYHiSynci, .-_ZL8AYHiSynci
	.section	.rodata._Z13Mapper69_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper69_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper69_InitP8CartInfo
	.hidden	_Z13Mapper69_InitP8CartInfo
	.type	_Z13Mapper69_InitP8CartInfo, @function
_Z13Mapper69_InitP8CartInfo:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a3,_ZL8M69Powerv
	sw	a3,0(a0)
	lw	a4,52(a0)
	lla	a3,_ZL8M69Closev
	sw	a3,8(a0)
	lla	a3,_ZL10M69IRQHooki
	la a2, MapIRQHook; sw a3, 0(a2);
	mv	a5,a0
	li	a0,8192
	beq	a4,zero,.L71
	lw	a0,60(a5)
	lw	a4,64(a5)
	add	a0,a0,a4
.L71:
	lla	s0,_ZL8WRAMSIZE
	sw	a5,0(sp)
	sw	a0,0(s0)
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L72
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L72:
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12Mapper69_ESIv
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
.LFE23:
	.size	_Z13Mapper69_InitP8CartInfo, .-_Z13Mapper69_InitP8CartInfo
	.section	.text._Z10NSFAY_Initv,"ax",@progbits
	.align	2
	.globl	_Z10NSFAY_Initv
	.hidden	_Z10NSFAY_Initv
	.type	_Z10NSFAY_Initv, @function
_Z10NSFAY_Initv:
.LFB24:
	.cfi_startproc
	li	a1,57344
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a2,_ZL10M69SWrite0jh
	addi	a1,a1,-1
	li	a0,49152
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL6sndcmd; sb zero, 0(a5);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_ZL10M69SWrite1jh
	addi	a1,a1,-1
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z12Mapper69_ESIv
	.cfi_endproc
.LFE24:
	.size	_Z10NSFAY_Initv, .-_Z10NSFAY_Initv
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"SCMD"
	.align	2
.LC2:
	.string	"SREG"
	.section	.data._ZL10SStateRegs,"aw"
	.align	2
	.type	_ZL10SStateRegs, @object
	.size	_ZL10SStateRegs, 36
_ZL10SStateRegs:
	.word	_ZL6sndcmd
	.word	1
	.word	.LC1
	.word	_ZL4sreg
	.word	14
	.word	.LC2
	.word	0
	.zero	8
	.section	.bss._ZL5CAYBC,"aw",@nobits
	.align	2
	.type	_ZL5CAYBC, @object
	.size	_ZL5CAYBC, 12
_ZL5CAYBC:
	.zero	12
	.section	.bss._ZL6dcount,"aw",@nobits
	.align	2
	.type	_ZL6dcount, @object
	.size	_ZL6dcount, 12
_ZL6dcount:
	.zero	12
	.section	.bss._ZL6vcount,"aw",@nobits
	.align	2
	.type	_ZL6vcount, @object
	.size	_ZL6vcount, 12
_ZL6vcount:
	.zero	12
	.section	.bss._ZL4sreg,"aw",@nobits
	.align	2
	.type	_ZL4sreg, @object
	.size	_ZL4sreg, 14
_ZL4sreg:
	.zero	14
	.section	.sbss._ZL6sndcmd,"aw",@nobits
	.type	_ZL6sndcmd, @object
	.size	_ZL6sndcmd, 1
_ZL6sndcmd:
	.zero	1
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	"CMDR"
	.align	2
.LC4:
	.string	"PREG"
	.align	2
.LC5:
	.string	"CREG"
	.align	2
.LC6:
	.string	"MIRR"
	.align	2
.LC7:
	.string	"IRQA"
	.align	2
.LC8:
	.string	"IRQC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL6cmdreg
	.word	1
	.word	.LC3
	.word	_ZL4preg
	.word	4
	.word	.LC4
	.word	_ZL4creg
	.word	8
	.word	.LC5
	.word	_ZL4mirr
	.word	1
	.word	.LC6
	.word	_ZL4IRQa
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	4
	.word	.LC8
	.word	0
	.zero	8
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
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 4
_ZL4preg:
	.zero	4
	.section	.sbss._ZL6cmdreg,"aw",@nobits
	.type	_ZL6cmdreg, @object
	.size	_ZL6cmdreg, 1
_ZL6cmdreg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
