#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"57.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL7M57Readj,"ax",@progbits
	.align	2
	.type	_ZL7M57Readj, @function
_ZL7M57Readj:
.LFB7:
	.cfi_startproc
	la a0, _ZL8hrd_flag; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL7M57Readj, .-_ZL7M57Readj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL7prg_reg
	lbu	a1,0(s0)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L7
	srli	a1,a1,5
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,5
	andi	a1,a1,3
	call	_Z8setprg16jj
.L5:
	lbu	a0,0(s0)
	srli	a0,a0,3
	andi	a0,a0,1
	call	_Z9setmirrori
	lbu	a5,0(s0)
	la a0, _ZL7chr_reg; lbu a0, 0(a0);
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a4,a5,7
	andi	a0,a0,3
	srli	a5,a5,1
	or	a0,a0,a4
	andi	a5,a5,8
	or	a0,a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L7:
	.cfi_restore_state
	srli	a1,a1,6
	li	a0,32768
	call	_Z8setprg32jj
	j	.L5
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
	.section	.text._ZL8M57Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M57Writejh, @function
_ZL8M57Writejh:
.LFB8:
	.cfi_startproc
	li	a5,36864
	addi	a5,a5,-2048
	and	a0,a0,a5
	beq	a0,a5,.L12
	la a5, _ZL7chr_reg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L12:
	la a5, _ZL7prg_reg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL8M57Writejh, .-_ZL8M57Writejh
	.section	.rodata._ZL8M57Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Select Register = %02x\n"
	.section	.text._ZL8M57Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M57Resetv, @function
_ZL8M57Resetv:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL8hrd_flag
	lbu	a1,0(a5)
	lla	a0,.LC0
	addi	a1,a1,1
	andi	a1,a1,3
	sb	a1,0(a5)
	tail	printf
	.cfi_endproc
.LFE10:
	.size	_ZL8M57Resetv, .-_ZL8M57Resetv
	.section	.text._ZL8M57Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M57Powerv, @function
_ZL8M57Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL7prg_reg; sb zero, 0(a5);
	la a5, _ZL7chr_reg; sb zero, 0(a5);
	la a5, _ZL8hrd_flag; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL8M57Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL7M57Readj
	li	a1,24576
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL8M57Powerv, .-_ZL8M57Powerv
	.section	.text._Z13Mapper57_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper57_InitP8CartInfo
	.hidden	_Z13Mapper57_InitP8CartInfo
	.type	_Z13Mapper57_InitP8CartInfo, @function
_Z13Mapper57_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M57Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M57Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13Mapper57_InitP8CartInfo, .-_Z13Mapper57_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"DPSW"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL8hrd_flag
	.word	1
	.word	.LC1
	.word	_ZL7prg_reg
	.word	1
	.word	.LC2
	.word	_ZL7chr_reg
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL8hrd_flag,"aw",@nobits
	.type	_ZL8hrd_flag, @object
	.size	_ZL8hrd_flag, 1
_ZL8hrd_flag:
	.zero	1
	.section	.sbss._ZL7chr_reg,"aw",@nobits
	.type	_ZL7chr_reg, @object
	.size	_ZL7chr_reg, 1
_ZL7chr_reg:
	.zero	1
	.section	.sbss._ZL7prg_reg,"aw",@nobits
	.type	_ZL7prg_reg, @object
	.size	_ZL7prg_reg, 1
_ZL7prg_reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
