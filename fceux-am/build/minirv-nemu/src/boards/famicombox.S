#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"famicombox.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12SSSNROMWritejh,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMWritejh, @function
_ZL12SSSNROMWritejh:
.LFB7:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL12SSSNROMWritejh, .-_ZL12SSSNROMWritejh
	.section	.text._ZL11SSSNROMReadj,"ax",@progbits
	.align	2
	.type	_ZL11SSSNROMReadj, @function
_ZL11SSSNROMReadj:
.LFB8:
	.cfi_startproc
	andi	a5,a0,7
	li	a4,2
	beq	a5,a4,.L5
	li	a4,7
	li	a0,34
	beq	a5,a4,.L4
	li	a0,0
	bne	a5,zero,.L4
	li	a5,-1
	la a4, _ZL4regs; sb a5, 0(a4);
	li	a0,255
	ret
.L5:
	li	a0,192
.L4:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL11SSSNROMReadj, .-_ZL11SSSNROMReadj
	.section	.text._ZL12SSSNROMResetv,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMResetv, @function
_ZL12SSSNROMResetv:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL4regs
	sb	zero,1(a5)
	sh	zero,2(a5)
	sh	zero,4(a5)
	sb	zero,6(a5)
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL12SSSNROMResetv, .-_ZL12SSSNROMResetv
	.section	.text._ZL14SSSNROMIRQHookv,"ax",@progbits
	.align	2
	.type	_ZL14SSSNROMIRQHookv, @function
_ZL14SSSNROMIRQHookv:
.LFB12:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL14SSSNROMIRQHookv, .-_ZL14SSSNROMIRQHookv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	li	a1,4096
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	addi	a1,a1,-2048
	li	a0,16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg2rijj
	li	a2,1
	li	a1,4096
	li	a0,16
	call	_Z8setprg2rijj
	li	a1,8192
	li	a2,2
	addi	a1,a1,-2048
	li	a0,16
	call	_Z8setprg2rijj
	li	a2,1
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	li	a1,0
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB13:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE13:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL12SSSNROMClosev,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMClosev, @function
_ZL12SSSNROMClosev:
.LFB11:
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
.LFE11:
	.size	_ZL12SSSNROMClosev, .-_ZL12SSSNROMClosev
	.section	.text._ZL12SSSNROMPowerv,"ax",@progbits
	.align	2
	.type	_ZL12SSSNROMPowerv, @function
_ZL12SSSNROMPowerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	lla	a5,_ZL4regs
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	li	a4,-16777216
	sw	zero,0(a5)
	sw	a4,4(a5)
	lla	s1,_ZL8WRAMSIZE
	call	_ZL4Syncv
	lla	s0,_ZL4WRAM
	lw	a1,0(s1)
	lw	a0,0(s0)
	li	a2,1
	li	s2,8192
	call	_Z15FCEU_MemoryRandPhjb
	li	a0,4096
	addi	a1,s2,-1
	lla	a2,_Z6CartBRj
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	li	a0,4096
	addi	a1,s2,-1
	lla	a2,_Z6CartBWjh
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	lla	a2,_ZL11SSSNROMReadj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL12SSSNROMWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s2,32768
	addi	a1,s2,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s2,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	a0,0(s1)
	lw	a2,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE9:
	.size	_ZL12SSSNROMPowerv, .-_ZL12SSSNROMPowerv
	.section	.rodata._Z12SSSNROM_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z12SSSNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SSSNROM_InitP8CartInfo
	.hidden	_Z12SSSNROM_InitP8CartInfo
	.type	_Z12SSSNROM_InitP8CartInfo, @function
_Z12SSSNROM_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL12SSSNROMPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SSSNROMResetv
	sw	a5,4(a0)
	lla	a5,_ZL12SSSNROMClosev
	sw	a5,8(a0)
	lla	a5,_ZL14SSSNROMIRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,16384
	li	a5,16384
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
.LFE14:
	.size	_Z12SSSNROM_InitP8CartInfo, .-_Z12SSSNROM_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC1
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
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
