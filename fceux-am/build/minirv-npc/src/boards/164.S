#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"164.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB7:
	.cfi_startproc
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE7:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL5Writejh,"ax",@progbits
	.align	2
	.type	_ZL5Writejh, @function
_ZL5Writejh:
.LFB10:
	.cfi_startproc
	li	a4,28672
	addi	a4,a4,768
	li	a5,20480
	and	a0,a0,a4
	addi	a5,a5,512
	li	a4,20480
	beq	a0,a5,.L4
	bgtu	a0,a5,.L5
	beq	a0,a4,.L6
	li	a5,20480
	addi	a5,a5,256
	bne	a0,a5,.L10
	la a5, _ZL3reg; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L5:
	li	a5,20480
	addi	a5,a5,768
	bne	a0,a5,.L11
	la a5, _ZL3reg+2; sb a1, 0(a5);
	ret
.L4:
	la a5, _ZL3reg+3; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L6:
	la a5, _ZL3reg+1; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L11:
	ret
.L10:
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL5Writejh, .-_ZL5Writejh
	.section	.text._ZL6Write3jh,"ax",@progbits
	.align	2
	.type	_ZL6Write3jh, @function
_ZL6Write3jh:
.LFB18:
	.cfi_startproc
	srli	a0,a0,8
	andi	a0,a0,3
	lla	a5,_ZL3reg
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE18:
	.size	_ZL6Write3jh, .-_ZL6Write3jh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg8rijj
	lla	a5,_ZL3reg
	lbu	a1,0(a5)
	lbu	a5,1(a5)
	li	a0,32768
	slli	a1,a1,4
	andi	a5,a5,15
	or	a1,a1,a5
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL5Sync3v,"ax",@progbits
	.align	2
	.type	_ZL5Sync3v, @function
_ZL5Sync3v:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	a4,_ZL3reg
	lbu	a3,3(a4)
	li	a5,1
	andi	a3,a3,7
	sll	a5,a5,a3
	andi	a3,a5,160
	bne	a3,zero,.L16
	andi	a3,a5,80
	bne	a3,zero,.L17
	andi	a5,a5,10
	bne	a5,zero,.L18
	lbu	a1,0(a4)
	lbu	a5,2(a4)
	lbu	a3,1(a4)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a1,a1,12
	andi	a4,a3,2
	slli	a5,a5,4
	or	a1,a1,a4
	andi	a5,a5,255
	or	a1,a5,a1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L17:
	.cfi_restore_state
	lbu	a5,1(a4)
	lbu	a1,2(a4)
	lbu	a3,0(a4)
	srli	a5,a5,1
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a5,a5,1
	andi	a4,a3,14
	slli	a1,a1,4
	or	a5,a5,a4
	andi	a1,a1,255
	or	a1,a5,a1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L16:
	.cfi_restore_state
	lbu	a5,2(a4)
	lbu	a1,0(a4)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	slli	a5,a5,4
	andi	a5,a5,255
	andi	a1,a1,15
	li	a0,32768
	or	a1,a5,a1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L18:
	.cfi_restore_state
	lbu	a5,2(a4)
	lbu	a1,0(a4)
	lw	ra,8(sp)
	.cfi_restore 1
	slli	a5,a5,4
	andi	a5,a5,255
	andi	a1,a1,12
	li	a0,32768
	or	a1,a5,a1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE17:
	.size	_ZL5Sync3v, .-_ZL5Sync3v
	.section	.text._ZL5Closev,"ax",@progbits
	.align	2
	.type	_ZL5Closev, @function
_ZL5Closev:
.LFB12:
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
.LFE12:
	.size	_ZL5Closev, .-_ZL5Closev
	.section	.text._ZL5Powerv,"ax",@progbits
	.align	2
	.type	_ZL5Powerv, @function
_ZL5Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,8
	li	a1,0
	lla	a0,_ZL3reg
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	memset
	li	a1,24576
	li	a5,-1
	lla	a2,_ZL5Writejh
	addi	a1,a1,-1
	li	a0,20480
	la a4, _ZL3reg+1; sb a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL5WSync; lw a5, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
	.cfi_endproc
.LFE11:
	.size	_ZL5Powerv, .-_ZL5Powerv
	.section	.text._ZL6Power3v,"ax",@progbits
	.align	2
	.type	_ZL6Power3v, @function
_ZL6Power3v:
.LFB19:
	.cfi_startproc
	li	a5,117440512
	li	a1,24576
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a5,a5,3
	lla	a2,_ZL6Write3jh
	addi	a1,a1,-1
	li	a0,20480
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a4, _ZL3reg; sw a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL5WSync; lw a5, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
	.cfi_endproc
.LFE19:
	.size	_ZL6Power3v, .-_ZL6Power3v
	.section	.text._ZL6Power2v,"ax",@progbits
	.align	2
	.type	_ZL6Power2v, @function
_ZL6Power2v:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,8
	li	a1,0
	lla	a0,_ZL3reg
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	memset
	li	a0,16384
	li	a5,1
	addi	a0,a0,17
	la a4, _ZL10laststrobe; sb a5, 0(a4);
	call	_Z15GetWriteHandleri
	li	a1,24576
	lla	a2,_ZL7ReadLowj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL6Write2jh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL5WSync; lw a5, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
	.cfi_endproc
.LFE15:
	.size	_ZL6Power2v, .-_ZL6Power2v
	.section	.text._ZL7ReadLowj,"ax",@progbits
	.align	2
	.type	_ZL7ReadLowj, @function
_ZL7ReadLowj:
.LFB8:
	.cfi_startproc
	li	a4,28672
	addi	a4,a4,1792
	li	a5,20480
	and	a0,a0,a4
	addi	a5,a5,256
	beq	a0,a5,.L38
	li	a5,20480
	addi	a5,a5,1280
	beq	a0,a5,.L39
	li	a0,4
	ret
.L39:
	la a0, _ZL7trigger; lbu a0, 0(a0);
	beq	a0,zero,.L40
	lla	a5,_ZL3reg
	lbu	a0,2(a5)
	lbu	a5,1(a5)
	or	a0,a0,a5
.L40:
	ret
.L38:
	lla	a5,_ZL3reg
	lbu	a0,2(a5)
	lbu	a3,0(a5)
	lbu	a4,1(a5)
	lbu	a5,3(a5)
	or	a0,a0,a3
	or	a0,a0,a4
	not	a5,a5
	or	a0,a0,a5
	andi	a0,a0,0xff
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL7ReadLowj, .-_ZL7ReadLowj
	.section	.text._ZL6Write2jh,"ax",@progbits
	.align	2
	.type	_ZL6Write2jh, @function
_ZL6Write2jh:
.LFB14:
	.cfi_startproc
	li	a5,20480
	addi	a5,a5,257
	beq	a0,a5,.L60
	li	a5,20480
	addi	a5,a5,256
	beq	a0,a5,.L61
	li	a3,28672
	addi	a3,a3,768
	li	a4,20480
	and	a0,a0,a3
	addi	a4,a4,512
	beq	a0,a4,.L50
	bgtu	a0,a4,.L51
	li	a2,20480
	bne	a0,a2,.L62
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL3reg
	la a5, _ZL5WSync; lw a5, 0(a5);
	sb	a1,1(s0)
	jalr	a5
	lb	a5,1(s0)
	blt	a5,zero,.L44
	la a4, scanline; lw a4, 0(a4);
	li	a5,127
	ble	a4,a5,.L63
.L44:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L61:
	li	a5,6
	beq	a1,a5,.L64
.L49:
	la a5, _ZL3reg+3; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L60:
	lla	a5,_ZL10laststrobe
	lbu	a4,0(a5)
	beq	a4,zero,.L46
	bne	a1,zero,.L46
	lla	a3,_ZL7trigger
	lbu	a4,0(a3)
	xori	a4,a4,1
	sb	a4,0(a3)
.L46:
	sb	a1,0(a5)
	ret
.L51:
	li	a5,20480
	addi	a5,a5,768
	bne	a0,a5,.L65
	la a5, _ZL3reg+2; sb a1, 0(a5);
	ret
.L50:
	la a5, _ZL3reg; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L62:
	beq	a0,a5,.L49
	ret
.L65:
	ret
.L64:
	li	a1,3
	li	a0,32768
	tail	_Z8setprg32jj
.L63:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE14:
	.size	_ZL6Write2jh, .-_ZL6Write2jh
	.section	.text._ZL6M163HBv,"ax",@progbits
	.align	2
	.type	_ZL6M163HBv, @function
_ZL6M163HBv:
.LFB9:
	.cfi_startproc
	la a5, _ZL3reg+1; lb a5, 0(a5);
	blt	a5,zero,.L74
	ret
.L74:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, scanline; lw a5, 0(a5);
	li	a4,239
	beq	a5,a4,.L75
	li	a4,127
	beq	a5,a4,.L76
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L75:
	.cfi_restore_state
	li	a1,0
	li	a0,0
	call	_Z7setchr4jj
	li	a1,0
.L73:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,4096
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
.L76:
	.cfi_restore_state
	li	a1,1
	li	a0,0
	call	_Z7setchr4jj
	li	a1,1
	j	.L73
	.cfi_endproc
.LFE9:
	.size	_ZL6M163HBv, .-_ZL6M163HBv
	.section	.rodata._Z14Mapper164_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper164_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper164_InitP8CartInfo
	.hidden	_Z14Mapper164_InitP8CartInfo
	.type	_Z14Mapper164_InitP8CartInfo, @function
_Z14Mapper164_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL5Powerv
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL4Syncv
	lla	s0,_ZL8WRAMSIZE
	la a3, _ZL5WSync; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L78
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L78:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
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
.LFE13:
	.size	_Z14Mapper164_InitP8CartInfo, .-_Z14Mapper164_InitP8CartInfo
	.section	.text._Z14Mapper163_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper163_InitP8CartInfo
	.hidden	_Z14Mapper163_InitP8CartInfo
	.type	_Z14Mapper163_InitP8CartInfo, @function
_Z14Mapper163_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL6Power2v
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL4Syncv
	la a3, _ZL5WSync; sw a4, 0(a3);
	lla	a4,_ZL6M163HBv
	lla	s0,_ZL8WRAMSIZE
	la a3, GameHBIRQHook; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L84
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L84:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
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
.LFE16:
	.size	_Z14Mapper163_InitP8CartInfo, .-_Z14Mapper163_InitP8CartInfo
	.section	.text._Z13UNLFS304_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNLFS304_InitP8CartInfo
	.hidden	_Z13UNLFS304_InitP8CartInfo
	.type	_Z13UNLFS304_InitP8CartInfo, @function
_Z13UNLFS304_InitP8CartInfo:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL6Power3v
	sw	a4,0(a0)
	lla	a4,_ZL5Closev
	sw	a4,8(a0)
	lla	a4,_ZL5Sync3v
	lla	s0,_ZL8WRAMSIZE
	la a3, _ZL5WSync; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L90
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L90:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
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
.LFE20:
	.size	_Z13UNLFS304_InitP8CartInfo, .-_Z13UNLFS304_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"STB"
	.align	2
.LC2:
	.string	"TRG"
	.align	2
.LC3:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL10laststrobe
	.word	1
	.word	.LC1
	.word	_ZL7trigger
	.word	1
	.word	.LC2
	.word	_ZL3reg
	.word	8
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
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
	.section	.sbss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 8
_ZL3reg:
	.zero	8
	.section	.sbss._ZL7trigger,"aw",@nobits
	.type	_ZL7trigger, @object
	.size	_ZL7trigger, 1
_ZL7trigger:
	.zero	1
	.section	.sbss._ZL10laststrobe,"aw",@nobits
	.type	_ZL10laststrobe, @object
	.size	_ZL10laststrobe, 1
_ZL10laststrobe:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
