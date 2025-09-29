#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"186.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL8M186Readj,"ax",@progbits
	.align	2
	.type	_ZL8M186Readj, @function
_ZL8M186Readj:
.LFB8:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,514
	beq	a0,a5,.L4
	bleu	a0,a5,.L6
	li	a5,-16384
	addi	a5,a5,-515
	add	a0,a0,a5
	snez	a0,a0
	neg	a0,a0
	andi	a0,a0,0xff
	ret
.L6:
	li	a5,-16384
	addi	a5,a5,-512
	add	a0,a0,a5
	sltiu	a0,a0,2
	addi	a0,a0,-1
	andi	a0,a0,0xff
	ret
.L4:
	li	a0,64
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL8M186Readj, .-_ZL8M186Readj
	.section	.text._ZL6ASWRAMj,"ax",@progbits
	.align	2
	.type	_ZL6ASWRAMj, @function
_ZL6ASWRAMj:
.LFB9:
	.cfi_startproc
	lla	a5,_ZL5SWRAM-16384
	add	a0,a0,a5
	lbu	a0,-1024(a0)
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL6ASWRAMj, .-_ZL6ASWRAMj
	.section	.text._ZL6BSWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL6BSWRAMjh, @function
_ZL6BSWRAMjh:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL5SWRAM-16384
	add	a0,a0,a5
	sb	a1,-1024(a0)
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL6BSWRAMjh, .-_ZL6BSWRAMjh
	.section	.text._ZL9M186Closev,"ax",@progbits
	.align	2
	.type	_ZL9M186Closev, @function
_ZL9M186Closev:
.LFB12:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L15
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
.L15:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL9M186Closev, .-_ZL9M186Closev
	.section	.text._ZL9M186Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M186Powerv, @function
_ZL9M186Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setchr8j
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL8M186Readj
	addi	a1,a1,1023
	addi	a0,a0,512
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL9M186Writejh
	addi	a1,a1,1023
	addi	a0,a0,512
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,16384
	lla	a2,_ZL6ASWRAMj
	addi	a1,a1,-1
	addi	a0,a0,1024
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	li	a0,16384
	lla	a2,_ZL6BSWRAMjh
	addi	a1,a1,-1
	addi	a0,a0,1024
	call	_Z15SetWriteHandleriiPFvjhE
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	li	a0,32
	call	_Z16FCEU_CheatAddRAMijPh
	lla	s0,_ZL4regs
	lbu	a5,3(s0)
	li	a1,24576
	li	a0,16
	slli	a4,a5,8
	or	a4,a5,a4
	srli	a2,a5,6
	sb	a5,2(s0)
	sh	a4,0(s0)
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE11:
	.size	_ZL9M186Powerv, .-_ZL9M186Powerv
	.section	.text._ZL11M186Restorei,"ax",@progbits
	.align	2
	.type	_ZL11M186Restorei, @function
_ZL11M186Restorei:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL4regs
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE13:
	.size	_ZL11M186Restorei, .-_ZL11M186Restorei
	.section	.text._ZL9M186Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M186Writejh, @function
_ZL9M186Writejh:
.LFB7:
	.cfi_startproc
	li	a5,16384
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a5,a5,515
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	and	a5,a0,a5
	lla	s0,_ZL4regs
	beq	a5,zero,.L23
	andi	a0,a0,3
	add	a0,s0,a0
	sb	a1,0(a0)
.L23:
	lbu	a2,0(s0)
	li	a1,24576
	li	a0,16
	srli	a2,a2,6
	call	_Z8setprg8rijj
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE7:
	.size	_ZL9M186Writejh, .-_ZL9M186Writejh
	.section	.rodata._Z14Mapper186_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14Mapper186_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper186_InitP8CartInfo
	.hidden	_Z14Mapper186_InitP8CartInfo
	.type	_Z14Mapper186_InitP8CartInfo, @function
_Z14Mapper186_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL9M186Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M186Closev
	sw	a5,8(a0)
	lla	a5,_ZL11M186Restorei
	li	a0,32768
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,_ZL4WRAM
	li	a3,1
	li	a2,32768
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,32768
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z14Mapper186_InitP8CartInfo, .-_Z14Mapper186_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"DREG"
	.align	2
.LC2:
	.string	"SWRM"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4regs
	.word	4
	.word	.LC1
	.word	_ZL5SWRAM
	.word	3072
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 4
_ZL4regs:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.bss._ZL5SWRAM,"aw",@nobits
	.align	2
	.type	_ZL5SWRAM, @object
	.size	_ZL5SWRAM, 3072
_ZL5SWRAM:
	.zero	3072
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
