#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vrc7.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z12UpdateOPLNEOPii,"ax",@progbits
	.align	2
	.globl	_Z12UpdateOPLNEOPii
	.hidden	_Z12UpdateOPLNEOPii
	.type	_Z12UpdateOPLNEOPii, @function
_Z12UpdateOPLNEOPii:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	_Z12UpdateOPLNEOPii, .-_Z12UpdateOPLNEOPii
	.section	.text._Z9UpdateOPLi,"ax",@progbits
	.align	2
	.globl	_Z9UpdateOPLi
	.hidden	_Z9UpdateOPLi
	.type	_Z9UpdateOPLi, @function
_Z9UpdateOPLi:
.LFB7:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE7:
	.size	_Z9UpdateOPLi, .-_Z9UpdateOPLi
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB11:
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
	lla	s0,_ZL4preg
	sw	s2,0(sp)
	.cfi_offset 18, -16
	call	_Z8setprg8rijj
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL4creg
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
.L5:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L5
	la a5, _ZL4mirr; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	li	a0,2
	beq	a5,a4,.L11
	li	a4,3
	li	a0,3
	beq	a5,a4,.L11
	li	a4,1
	li	a0,1
	bne	a5,a4,.L11
	li	a0,0
.L11:
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
.LFE11:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB17:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE17:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9VRC7Closev,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Closev, @function
_ZL9VRC7Closev:
.LFB15:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L19
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L19:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE15:
	.size	_ZL9VRC7Closev, .-_ZL9VRC7Closev
	.section	.text._ZL9VRC7Powerv,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Powerv, @function
_ZL9VRC7Powerv:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL9VRC7Writejh
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
.LFE14:
	.size	_ZL9VRC7Powerv, .-_ZL9VRC7Powerv
	.section	.text._ZL9VRC7SKillv,"ax",@progbits
	.align	2
	.type	_ZL9VRC7SKillv, @function
_ZL9VRC7SKillv:
.LFB9:
	.cfi_startproc
	la a0, _ZL9VRC7Sound; lw a0, 0(a0);
	beq	a0,zero,.L30
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	OPLL_delete
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL9VRC7Sound; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L30:
	la a5, _ZL9VRC7Sound; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9VRC7SKillv, .-_ZL9VRC7SKillv
	.section	.text._ZL6VRC7SCv,"ax",@progbits
	.align	2
	.type	_ZL6VRC7SCv, @function
_ZL6VRC7SCv:
.LFB8:
	.cfi_startproc
	la a0, _ZL9VRC7Sound; lw a0, 0(a0);
	beq	a0,zero,.L33
	la a1, FSettings+60; lw a1, 0(a1);
	tail	OPLL_set_rate
.L33:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL6VRC7SCv, .-_ZL6VRC7SCv
	.section	.text._ZL11VRC7IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL11VRC7IRQHooki, @function
_ZL11VRC7IRQHooki:
.LFB16:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L47
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
	li	s1,256
.L38:
	lw	a4,0(s3)
	li	a3,0
.L39:
	ble	a5,s0,.L50
	addi	a4,a4,1
	addi	a5,a5,-341
	li	a3,1
	bne	a4,s1,.L39
	la a4, _ZL8IRQLatch; lbu a4, 0(a4);
	li	a0,1
	sw	a5,0(s2)
	sw	a4,0(s3)
	call	_Z14X6502_IRQBegini
	lw	a5,0(s2)
	j	.L38
.L47:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	ret
.L50:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	beq	a3,zero,.L35
	sw	a4,0(s3)
	sw	a5,0(s2)
.L35:
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
.LFE16:
	.size	_ZL11VRC7IRQHooki, .-_ZL11VRC7IRQHooki
	.section	.text._ZL9VRC7Writejh,"ax",@progbits
	.align	2
	.type	_ZL9VRC7Writejh, @function
_ZL9VRC7Writejh:
.LFB13:
	.cfi_startproc
	slli	a5,a0,1
	andi	a5,a5,16
	or	a0,a5,a0
	li	a5,-40960
	add	a3,a0,a5
	li	a4,16384
	bltu	a3,a4,.L76
	li	a5,36864
	addi	a5,a5,48
	li	a3,36864
	beq	a0,a5,.L77
	li	a5,61440
	addi	a5,a5,16
	and	a0,a0,a5
	li	a4,57344
	li	a2,61440
	beq	a0,a4,.L55
	bgtu	a0,a4,.L56
	beq	a0,a3,.L57
	bgtu	a0,a3,.L58
	li	a5,32768
	beq	a0,a5,.L59
	addi	a5,a5,16
	bne	a0,a5,.L78
	la a5, _ZL4preg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L76:
	li	a4,61440
	addi	a4,a4,16
	and	a0,a0,a4
	srli	a4,a0,4
	add	a0,a0,a5
	srli	a0,a0,11
	andi	a5,a4,1
	or	a5,a5,a0
	lla	a4,_ZL4creg
	add	a5,a4,a5
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L56:
	beq	a0,a2,.L62
	beq	a0,a5,.L63
	li	a5,57344
	addi	a5,a5,16
	bne	a0,a5,.L79
	li	a0,1
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L58:
	li	a5,36864
	addi	a5,a5,16
	bne	a0,a5,.L80
	la a5, _ZL7vrc7idx; sb a1, 0(a5);
	ret
.L55:
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L62:
	andi	a5,a1,2
	andi	a1,a1,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	la a4, _ZL4IRQd; sb a1, 0(a4);
	beq	a5,zero,.L65
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a4, _ZL8IRQCount; sw a5, 0(a4);
.L65:
	li	a0,1
	la a5, _ZL10CycleCount; sw zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L77:
	la a5, FSettings+60; lw a5, 0(a5);
	bne	a5,zero,.L81
	ret
.L59:
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L57:
	la a5, _ZL4preg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L63:
	la a5, _ZL4IRQd; lbu a5, 0(a5);
	li	a0,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L81:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	mv	a2,a1
	la a0, _ZL9VRC7Sound; lw a0, 0(a0);
	la a1, _ZL7vrc7idx; lbu a1, 0(a1);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	OPLL_writeReg
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,GameExpSound
	lla	a4,_Z9UpdateOPLi
	sw	a4,0(a5)
	lla	a4,_Z12UpdateOPLNEOPii
	sw	a4,4(a5)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L79:
	ret
.L80:
	ret
.L78:
	ret
	.cfi_endproc
.LFE13:
	.size	_ZL9VRC7Writejh, .-_ZL9VRC7Writejh
	.section	.rodata._Z13Mapper85_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper85_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper85_InitP8CartInfo
	.hidden	_Z13Mapper85_InitP8CartInfo
	.type	_Z13Mapper85_InitP8CartInfo, @function
_Z13Mapper85_InitP8CartInfo:
.LFB18:
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
	lla	a5,_ZL9VRC7Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9VRC7Closev
	sw	a5,8(a0)
	lla	a5,_ZL11VRC7IRQHooki
	lla	s1,_ZL8WRAMSIZE
	mv	s0,a0
	la a4, MapIRQHook; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L83
	lw	a4,0(s2)
	lw	a5,0(s1)
	sw	a4,12(s0)
	sw	a5,28(s0)
.L83:
	lla	a4,_ZL12StateRestorei
	lla	a5,GameExpSound
	la a3, GameStateRestore; sw a4, 0(a3);
	lla	a4,_ZL6VRC7SCv
	sw	a4,16(a5)
	lla	a4,_ZL9VRC7SKillv
	sw	a4,20(a5)
	la a1, FSettings+60; lw a1, 0(a1);
	bne	a1,zero,.L84
	li	a1,49152
	addi	a1,a1,-1152
.L84:
	li	a0,3579904
	addi	a0,a0,-359
	call	OPLL_new
	lla	s0,_ZL9VRC7Sound
	sw	a0,0(s0)
	call	OPLL_reset
	lw	a0,0(s0)
	call	OPLL_reset
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE18:
	.size	_Z13Mapper85_InitP8CartInfo, .-_Z13Mapper85_InitP8CartInfo
	.section	.text._Z12NSFVRC7_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFVRC7_Initv
	.hidden	_Z12NSFVRC7_Initv
	.type	_Z12NSFVRC7_Initv, @function
_Z12NSFVRC7_Initv:
.LFB19:
	.cfi_startproc
	li	a1,36864
	li	a0,36864
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a2,_ZL9VRC7Writejh
	addi	a1,a1,31
	addi	a0,a0,16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,36864
	li	a0,36864
	addi	a1,a1,63
	lla	a2,_ZL9VRC7Writejh
	addi	a0,a0,48
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a5,GameExpSound
	lla	a4,_ZL6VRC7SCv
	sw	a4,16(a5)
	lla	a4,_ZL9VRC7SKillv
	sw	a4,20(a5)
	la a1, FSettings+60; lw a1, 0(a1);
	bne	a1,zero,.L90
	li	a1,49152
	addi	a1,a1,-1152
.L90:
	li	a0,3579904
	addi	a0,a0,-359
	call	OPLL_new
	lla	s0,_ZL9VRC7Sound
	sw	a0,0(s0)
	call	OPLL_reset
	lw	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	OPLL_reset
	.cfi_endproc
.LFE19:
	.size	_Z12NSFVRC7_Initv, .-_Z12NSFVRC7_Initv
	.section	.text.startup._GLOBAL__sub_I__Z12UpdateOPLNEOPii,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I__Z12UpdateOPLNEOPii, @function
_GLOBAL__sub_I__Z12UpdateOPLNEOPii:
.LFB21:
	.cfi_startproc
	lla	a5,_ZL9VRC7Sound
	la a4, _ZL9StateRegs+108; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE21:
	.size	_GLOBAL__sub_I__Z12UpdateOPLNEOPii, .-_GLOBAL__sub_I__Z12UpdateOPLNEOPii
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I__Z12UpdateOPLNEOPii
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"VRCI"
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"CREG"
	.align	2
.LC4:
	.string	"MIRR"
	.align	2
.LC5:
	.string	"IRQA"
	.align	2
.LC6:
	.string	"IRQD"
	.align	2
.LC7:
	.string	"IRQL"
	.align	2
.LC8:
	.string	"IRQC"
	.align	2
.LC9:
	.string	"CYCC"
	.align	2
.LC10:
	.string	"VRC7"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 132
_ZL9StateRegs:
	.word	_ZL7vrc7idx
	.word	1
	.word	.LC1
	.word	_ZL4preg
	.word	3
	.word	.LC2
	.word	_ZL4creg
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
	.word	_ZL4IRQd
	.word	1
	.word	.LC6
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC7
	.word	_ZL8IRQCount
	.word	4
	.word	.LC8
	.word	_ZL10CycleCount
	.word	4
	.word	.LC9
	.zero	4
	.word	1073743488
	.word	.LC10
	.word	0
	.zero	8
	.section	.sbss._ZL9VRC7Sound,"aw",@nobits
	.align	2
	.type	_ZL9VRC7Sound, @object
	.size	_ZL9VRC7Sound, 4
_ZL9VRC7Sound:
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
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
	.section	.sbss._ZL7vrc7idx,"aw",@nobits
	.type	_ZL7vrc7idx, @object
	.size	_ZL7vrc7idx, 1
_ZL7vrc7idx:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
