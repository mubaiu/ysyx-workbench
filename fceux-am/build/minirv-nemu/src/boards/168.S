#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"168.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9M168Dummyjh,"ax",@progbits
	.align	2
	.type	_ZL9M168Dummyjh, @function
_ZL9M168Dummyjh:
.LFB8:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL9M168Dummyjh, .-_ZL9M168Dummyjh
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,0
	li	a1,0
	li	a0,16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setchr4rijj
	lla	s0,_ZL3reg
	lbu	a2,0(s0)
	li	a1,4096
	li	a0,16
	andi	a2,a2,15
	call	_Z8setchr4rijj
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,6
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,-1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
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
	.section	.text._ZL9M168Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M168Writejh, @function
_ZL9M168Writejh:
.LFB7:
	.cfi_startproc
	la a5, _ZL3reg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M168Writejh, .-_ZL9M168Writejh
	.section	.text._ZL9M168Closev,"ax",@progbits
	.align	2
	.type	_ZL9M168Closev, @function
_ZL9M168Closev:
.LFB10:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L13
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L13:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL9M168Closev, .-_ZL9M168Closev
	.section	.text._ZL9M168Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M168Powerv, @function
_ZL9M168Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, _ZL3reg; sb zero, 0(a5);
	call	_ZL4Syncv
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL9M168Dummyjh
	addi	a1,a1,-1
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9M168Writejh
	li	a1,45056
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL9M168Dummyjh
	li	a1,61440
	li	a0,61440
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,61440
	addi	a1,a1,128
	mv	a0,a1
	lla	a2,_ZL9M168Dummyjh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL9M168Powerv, .-_ZL9M168Powerv
	.section	.rodata._Z14Mapper168_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.section	.text._Z14Mapper168_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper168_InitP8CartInfo
	.hidden	_Z14Mapper168_InitP8CartInfo
	.type	_Z14Mapper168_InitP8CartInfo, @function
_Z14Mapper168_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL9M168Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M168Closev
	sw	a5,8(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a5,_ZL12StateRestorei
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	s0,_ZL10CHRRAMSIZE
	li	a5,65536
	li	a0,65536
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC0
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper168_InitP8CartInfo, .-_Z14Mapper168_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REGS"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
