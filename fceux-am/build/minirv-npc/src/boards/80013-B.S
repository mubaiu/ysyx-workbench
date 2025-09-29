#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"80013-B.cpp"
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	call	_Z7setchr8j
	la a5, _ZL8rom_mode; lbu a5, 0(a5);
	andi	a5,a5,2
	lla	s0,_ZL8bios_prg
	beq	a5,zero,.L2
	lla	s1,_ZL7rom_prg
	lbu	a2,0(s0)
	lbu	a5,0(s1)
	li	a1,32768
	andi	a2,a2,15
	andi	a5,a5,112
	or	a2,a2,a5
	li	a0,0
	call	_Z9setprg16rijj
.L3:
	lbu	a2,0(s1)
	li	a0,0
	li	a1,49152
	andi	a2,a2,127
	call	_Z9setprg16rijj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a0,4
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L2:
	.cfi_restore_state
	lbu	a2,0(s0)
	li	a1,32768
	li	a0,1
	andi	a2,a2,3
	call	_Z9setprg16rijj
	lla	s1,_ZL7rom_prg
	j	.L3
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
	.section	.text._ZL14BMC80013BWritejh,"ax",@progbits
	.align	2
	.type	_ZL14BMC80013BWritejh, @function
_ZL14BMC80013BWritejh:
.LFB7:
	.cfi_startproc
	srli	a0,a0,13
	andi	a0,a0,3
	bne	a0,zero,.L8
	la a5, _ZL8bios_prg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	la a5, _ZL7rom_prg; sb a1, 0(a5);
	la a5, _ZL8rom_mode; sb a0, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL14BMC80013BWritejh, .-_ZL14BMC80013BWritejh
	.section	.text._ZL14BMC80013BResetv,"ax",@progbits
	.align	2
	.type	_ZL14BMC80013BResetv, @function
_ZL14BMC80013BResetv:
.LFB9:
	.cfi_startproc
	la a5, _ZL8rom_mode; sb zero, 0(a5);
	la a5, _ZL7rom_prg; sb zero, 0(a5);
	la a5, _ZL8bios_prg; sb zero, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL14BMC80013BResetv, .-_ZL14BMC80013BResetv
	.section	.text._ZL14BMC80013BPowerv,"ax",@progbits
	.align	2
	.type	_ZL14BMC80013BPowerv, @function
_ZL14BMC80013BPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL8rom_mode; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL7rom_prg; sb zero, 0(a5);
	la a5, _ZL8bios_prg; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL14BMC80013BWritejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL14BMC80013BPowerv, .-_ZL14BMC80013BPowerv
	.section	.text._Z14BMC80013B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMC80013B_InitP8CartInfo
	.hidden	_Z14BMC80013B_InitP8CartInfo
	.type	_Z14BMC80013B_InitP8CartInfo, @function
_Z14BMC80013B_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL14BMC80013BPowerv
	sw	a5,0(a0)
	lla	a5,_ZL14BMC80013BResetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z14BMC80013B_InitP8CartInfo, .-_Z14BMC80013B_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BREG"
	.align	2
.LC1:
	.string	"RREG"
	.align	2
.LC2:
	.string	"RMODE"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8bios_prg
	.word	1
	.word	.LC0
	.word	_ZL7rom_prg
	.word	1
	.word	.LC1
	.word	_ZL8rom_mode
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL8rom_mode,"aw",@nobits
	.type	_ZL8rom_mode, @object
	.size	_ZL8rom_mode, 1
_ZL8rom_mode:
	.zero	1
	.section	.sbss._ZL7rom_prg,"aw",@nobits
	.type	_ZL7rom_prg, @object
	.size	_ZL7rom_prg, 1
_ZL7rom_prg:
	.zero	1
	.section	.sbss._ZL8bios_prg,"aw",@nobits
	.type	_ZL8bios_prg, @object
	.size	_ZL8bios_prg, 1
_ZL8bios_prg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
