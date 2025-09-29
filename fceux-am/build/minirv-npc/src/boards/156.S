#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"156.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9M156Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M156Resetv, @function
_ZL9M156Resetv:
.LFB8:
	.cfi_startproc
	lla	a5,_ZL5chrhi
	lla	a4,_ZL5chrlo
	sw	zero,0(a5)
	sw	zero,4(a5)
	sw	zero,0(a4)
	sw	zero,4(a4)
	la a5, _ZL3prg; sb zero, 0(a5);
	la a5, _ZL4mirr; sb zero, 0(a5);
	la a5, _ZL10mirrisused; sb zero, 0(a5);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL9M156Resetv, .-_ZL9M156Resetv
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	a3,_ZL5chrlo
	lla	s1,_ZL5chrhi
	li	s0,0
.L4:
	lbu	a5,0(s1)
	lbu	a1,0(a3)
	mv	a0,s0
	slli	a5,a5,8
	or	a1,a5,a1
	sw	a3,0(sp)
	call	_Z7setchr1jj
	lw	a3,0(sp)
	addi	s0,s0,1024
	li	a5,8192
	addi	a3,a3,1
	addi	s1,s1,1
	bne	s0,a5,.L4
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	la a1, _ZL3prg; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	la a5, _ZL10mirrisused; lbu a5, 0(a5);
	li	a0,2
	beq	a5,zero,.L8
	la a0, _ZL4mirr; lbu a0, 0(a0);
	xori	a0,a0,1
.L8:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
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
	.section	.text._ZL9M156Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M156Writejh, @function
_ZL9M156Writejh:
.LFB7:
	.cfi_startproc
	li	a5,-49152
	add	a5,a0,a5
	li	a4,20
	bgtu	a5,a4,.L10
	lla	a4,.L13
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL9M156Writejh,"a",@progbits
	.align	2
	.align	2
.L13:
	.word	.L18-.L13
	.word	.L18-.L13
	.word	.L18-.L13
	.word	.L18-.L13
	.word	.L17-.L13
	.word	.L17-.L13
	.word	.L17-.L13
	.word	.L17-.L13
	.word	.L16-.L13
	.word	.L16-.L13
	.word	.L16-.L13
	.word	.L16-.L13
	.word	.L15-.L13
	.word	.L15-.L13
	.word	.L15-.L13
	.word	.L15-.L13
	.word	.L14-.L13
	.word	.L10-.L13
	.word	.L10-.L13
	.word	.L10-.L13
	.word	.L12-.L13
	.section	.text._ZL9M156Writejh
.L15:
	andi	a0,a0,3
	lla	a5,_ZL5chrhi
	add	a5,a5,a0
	sb	a1,4(a5)
	tail	_ZL4Syncv
.L18:
	andi	a0,a0,3
	lla	a5,_ZL5chrlo
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L17:
	andi	a0,a0,3
	lla	a5,_ZL5chrhi
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
.L16:
	andi	a0,a0,3
	lla	a5,_ZL5chrlo
	add	a5,a5,a0
	sb	a1,4(a5)
	tail	_ZL4Syncv
.L10:
	ret
.L14:
	la a5, _ZL3prg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L12:
	la a5, _ZL4mirr; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL10mirrisused; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M156Writejh, .-_ZL9M156Writejh
	.section	.text._ZL9M156Closev,"ax",@progbits
	.align	2
	.type	_ZL9M156Closev, @function
_ZL9M156Closev:
.LFB10:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L25
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
.L25:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL9M156Closev, .-_ZL9M156Closev
	.section	.text._ZL9M156Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M156Powerv, @function
_ZL9M156Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL5chrhi
	lla	a4,_ZL5chrlo
	sw	zero,0(a5)
	sw	zero,4(a5)
	sw	zero,0(a4)
	sw	zero,4(a4)
	la a5, _ZL3prg; sb zero, 0(a5);
	la a5, _ZL4mirr; sb zero, 0(a5);
	la a5, _ZL10mirrisused; sb zero, 0(a5);
	call	_ZL4Syncv
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
	li	a1,53248
	lla	a2,_ZL9M156Writejh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
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
.LFE9:
	.size	_ZL9M156Powerv, .-_ZL9M156Powerv
	.section	.rodata._Z14Mapper156_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper156_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper156_InitP8CartInfo
	.hidden	_Z14Mapper156_InitP8CartInfo
	.type	_Z14Mapper156_InitP8CartInfo, @function
_Z14Mapper156_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL9M156Resetv
	sw	a5,4(a0)
	lla	a5,_ZL9M156Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M156Closev
	lla	s0,_ZL8WRAMSIZE
	sw	a5,8(a0)
	li	a5,8192
	li	a0,8192
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
.LFE12:
	.size	_Z14Mapper156_InitP8CartInfo, .-_Z14Mapper156_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"CRGL"
	.align	2
.LC3:
	.string	"CRGH"
	.align	2
.LC4:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 60
_ZL9StateRegs:
	.word	_ZL3prg
	.word	1
	.word	.LC1
	.word	_ZL5chrlo
	.word	8
	.word	.LC2
	.word	_ZL5chrhi
	.word	8
	.word	.LC3
	.word	_ZL4mirr
	.word	1
	.word	.LC4
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
	.section	.sbss._ZL10mirrisused,"aw",@nobits
	.type	_ZL10mirrisused, @object
	.size	_ZL10mirrisused, 1
_ZL10mirrisused:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3prg,"aw",@nobits
	.type	_ZL3prg, @object
	.size	_ZL3prg, 1
_ZL3prg:
	.zero	1
	.section	.sbss._ZL5chrhi,"aw",@nobits
	.align	2
	.type	_ZL5chrhi, @object
	.size	_ZL5chrhi, 8
_ZL5chrhi:
	.zero	8
	.section	.sbss._ZL5chrlo,"aw",@nobits
	.align	2
	.type	_ZL5chrlo, @object
	.size	_ZL5chrlo, 8
_ZL5chrlo:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
