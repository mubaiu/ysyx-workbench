#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emufile.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata._ZN12EMUFILE_FILE4openEPKcS1_.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Found ROM '%s'\n"
	.align	2
.LC1:
	.string	"ROM '%s' not found, using default ROM '%s'\n"
	.section	.text._ZN12EMUFILE_FILE4openEPKcS1_,"ax",@progbits
	.align	2
	.globl	_ZN12EMUFILE_FILE4openEPKcS1_
	.hidden	_ZN12EMUFILE_FILE4openEPKcS1_
	.type	_ZN12EMUFILE_FILE4openEPKcS1_, @function
_ZN12EMUFILE_FILE4openEPKcS1_:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	la a5, nroms; lw a5, 0(a5);
	sw	a1,0(sp)
	sw	a2,4(sp)
	mv	s0,a0
	lla	s1,roms
	ble	a5,zero,.L2
	lw	a0,0(s1)
	call	strcmp
	beq	a0,zero,.L8
.L2:
	lw	a2,0(s1)
	lw	a1,0(sp)
	lla	a0,.LC1
	call	printf
.L3:
	lw	a3,8(s1)
	lw	a4,0(s1)
	lw	a5,4(s1)
	lw	a3,0(a3)
	lw	a1,4(sp)
	sw	zero,28(s0)
	sw	a3,32(s0)
	sw	a5,0(s0)
	sw	a4,4(s0)
	addi	a0,s0,8
	call	strcpy
	lw	ra,16(sp)
	.cfi_remember_state
	.cfi_restore 1
	sb	zero,24(s0)
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	ra
.L8:
	.cfi_restore_state
	lw	a1,0(sp)
	lla	a0,.LC0
	call	printf
	j	.L3
	.cfi_endproc
.LFE26:
	.size	_ZN12EMUFILE_FILE4openEPKcS1_, .-_ZN12EMUFILE_FILE4openEPKcS1_
	.hidden	nroms
	.globl	nroms
	.section	.sdata.nroms,"aw"
	.align	2
	.type	nroms, @object
	.size	nroms, 4
nroms:
	.word	1
	.hidden	roms
	.globl	roms
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"mario"
	.section	.data.roms,"aw"
	.align	2
	.type	roms, @object
	.size	roms, 12
roms:
	.word	.LC2
	.word	rom_mario_nes
	.word	rom_mario_nes_len
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
