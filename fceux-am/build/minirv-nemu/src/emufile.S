#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emufile.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	la a5, nroms; lw a5, 0(a5);
	mv	s1,a0
	mv	s3,a1
	mv	s2,a2
	lla	s0,roms
	ble	a5,zero,.L2
	lw	a0,0(s0)
	call	strcmp
	beq	a0,zero,.L8
.L2:
	lw	a2,0(s0)
	mv	a1,s3
	lla	a0,.LC1
	call	printf
.L3:
	lw	a3,8(s0)
	lw	a5,0(s0)
	lw	a4,4(s0)
	lw	a3,0(a3)
	mv	a1,s2
	sw	zero,28(s1)
	sw	a3,32(s1)
	sw	a4,0(s1)
	sw	a5,4(s1)
	addi	a0,s1,8
	call	strcpy
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	sb	zero,24(s1)
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L8:
	.cfi_restore_state
	mv	a1,s3
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
