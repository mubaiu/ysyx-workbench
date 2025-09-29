#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7017.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL14UNLKS7017Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Closev, @function
_ZL14UNLKS7017Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
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
.L7:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL14UNLKS7017Closev, .-_ZL14UNLKS7017Closev
	.section	.text._ZL11FDSRead4030j,"ax",@progbits
	.align	2
	.type	_ZL11FDSRead4030j, @function
_ZL11FDSRead4030j:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, X+20; lw a0, 0(a0);
	andi	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	_ZL11FDSRead4030j, .-_ZL11FDSRead4030j
	.section	.text._ZL10UNL7017IRQi,"ax",@progbits
	.align	2
	.type	_ZL10UNL7017IRQi, @function
_ZL10UNL7017IRQi:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lw a5, 0(a5);
	beq	a5,zero,.L13
	lla	a4,_ZL8IRQCount
	lw	a5,0(a4)
	sub	a5,a5,a0
	sw	a5,0(a4)
	ble	a5,zero,.L17
.L13:
	ret
.L17:
	li	a0,1
	la a5, _ZL4IRQa; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE9:
	.size	_ZL10UNL7017IRQi, .-_ZL10UNL7017IRQi
	.section	.text._ZL14UNLKS7017Writejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Writejh, @function
_ZL14UNLKS7017Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	s0,s0,-256
	li	a5,20480
	sw	ra,12(sp)
	.cfi_offset 1, -4
	and	a4,a0,s0
	addi	a5,a5,-1536
	beq	a4,a5,.L25
	li	a5,20480
	addi	a5,a5,256
	beq	a4,a5,.L26
	li	a5,16384
	addi	a5,a5,32
	beq	a0,a5,.L27
	li	a5,16384
	addi	a5,a5,33
	beq	a0,a5,.L28
	li	a5,16384
	addi	a5,a5,37
	bne	a0,a5,.L18
	srli	a1,a1,3
	xori	a1,a1,1
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
.L18:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L25:
	.cfi_restore_state
	srli	a5,a0,2
	srli	a0,a0,4
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	andi	a5,a5,3
	andi	a0,a0,4
	or	a5,a5,a0
	la a4, _ZL3reg; sb a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	.cfi_restore_state
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQCount
	lw	a5,0(a4)
	lw	a1,0(sp)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	and	a5,a5,s0
	lw	s0,8(sp)
	.cfi_restore 8
	or	a5,a5,a1
	sw	a5,0(a4)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L26:
	.cfi_restore_state
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,2
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L28:
	.cfi_restore_state
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8IRQCount
	lw	a1,0(sp)
	lbu	a5,0(a4)
	slli	a1,a1,8
	or	a5,a5,a1
	sw	a5,0(a4)
	li	a5,1
	la a4, _ZL4IRQa; sw a5, 0(a4);
	j	.L18
	.cfi_endproc
.LFE7:
	.size	_ZL14UNLKS7017Writejh, .-_ZL14UNLKS7017Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,2
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE12:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL14UNLKS7017Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7017Powerv, @function
_ZL14UNLKS7017Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a1, _ZL3reg; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg16jj
	li	a1,2
	li	a0,49152
	call	_Z8setprg16jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	call	_Z9setmirrori
	li	a0,0
	call	_Z7setchr8j
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
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
	li	a1,16384
	addi	a1,a1,48
	mv	a0,a1
	lla	a2,_ZL11FDSRead4030j
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL14UNLKS7017Writejh
	addi	a1,a1,-1
	addi	a0,a0,32
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
.LFE10:
	.size	_ZL14UNLKS7017Powerv, .-_ZL14UNLKS7017Powerv
	.section	.rodata._Z14UNLKS7017_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7017_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7017_InitP8CartInfo
	.hidden	_Z14UNLKS7017_InitP8CartInfo
	.type	_Z14UNLKS7017_InitP8CartInfo, @function
_Z14UNLKS7017_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL14UNLKS7017Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7017Closev
	sw	a5,8(a0)
	lla	a5,_ZL10UNL7017IRQi
	lla	s0,_ZL8WRAMSIZE
	la a4, MapIRQHook; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
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
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
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
.LFE13:
	.size	_Z14UNLKS7017_InitP8CartInfo, .-_Z14UNLKS7017_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"REGS"
	.align	2
.LC3:
	.string	"IRQA"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	_ZL3reg
	.word	1
	.word	.LC2
	.word	_ZL4IRQa
	.word	4
	.word	.LC3
	.word	_ZL8IRQCount
	.word	4
	.word	.LC4
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC5
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
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
