#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"228.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12M228RamWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M228RamWritejh, @function
_ZL12M228RamWritejh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4mram
	add	a5,a5,a0
	andi	a1,a1,15
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL12M228RamWritejh, .-_ZL12M228RamWritejh
	.section	.text._ZL11M228RamReadj,"ax",@progbits
	.align	2
	.type	_ZL11M228RamReadj, @function
_ZL11M228RamReadj:
.LFB8:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4mram
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL11M228RamReadj, .-_ZL11M228RamReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL4areg
	lhu	a0,0(s2)
	sw	ra,12(sp)
	sw	s0,8(sp)
	srli	a5,a0,7
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	a3,48
	andi	a2,a5,48
	andi	a4,a5,63
	bne	a2,a3,.L5
	addi	a4,a4,-16
.L5:
	srli	a5,a0,5
	srli	s1,a0,6
	srli	a0,a0,13
	and	s1,s1,a5
	xori	a0,a0,1
	slli	a4,a4,1
	andi	a0,a0,1
	andi	s1,s1,1
	add	s1,s1,a4
	xori	s0,a5,1
	call	_Z9setmirrori
	mv	a1,s1
	li	a0,32768
	andi	s0,s0,1
	call	_Z8setprg16jj
	add	s0,s0,s1
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	lhu	a5,0(s2)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	la a0, _ZL4vreg; lbu a0, 0(a0);
	slli	a5,a5,2
	andi	a0,a0,3
	andi	a5,a5,60
	or	a0,a5,a0
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
.LFB12:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE12:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M228Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M228Writejh, @function
_ZL9M228Writejh:
.LFB9:
	.cfi_startproc
	la a5, _ZL4areg; sh a0, 0(a5);
	la a5, _ZL4vreg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL9M228Writejh, .-_ZL9M228Writejh
	.section	.text._ZL9M228Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M228Resetv, @function
_ZL9M228Resetv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-32768
	li	a2,4
	li	a1,0
	lla	a0,_ZL4mram
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, _ZL4areg; sh a5, 0(a4);
	la a5, _ZL4vreg; sb zero, 0(a5);
	call	memset
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL9M228Resetv, .-_ZL9M228Resetv
	.section	.text._ZL9M228Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M228Powerv, @function
_ZL9M228Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-32768
	li	a2,4
	li	a1,0
	lla	a0,_ZL4mram
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4areg; sh a5, 0(a4);
	la a5, _ZL4vreg; sb zero, 0(a5);
	call	memset
	call	_ZL4Syncv
	li	a1,24576
	lla	a2,_ZL11M228RamReadj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL12M228RamWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M228Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE11:
	.size	_ZL9M228Powerv, .-_ZL9M228Powerv
	.section	.text._Z14Mapper228_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper228_InitP8CartInfo
	.hidden	_Z14Mapper228_InitP8CartInfo
	.type	_Z14Mapper228_InitP8CartInfo, @function
_Z14Mapper228_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	lla	a5,_ZL9M228Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M228Resetv
	sw	a5,4(a0)
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14Mapper228_InitP8CartInfo, .-_Z14Mapper228_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"MRAM"
	.align	2
.LC1:
	.string	"AREG"
	.align	2
.LC2:
	.string	"VREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4mram
	.word	4
	.word	.LC0
	.word	_ZL4areg
	.word	2
	.word	.LC1
	.word	_ZL4vreg
	.word	1
	.word	.LC2
	.word	0
	.zero	8
	.section	.sbss._ZL4areg,"aw",@nobits
	.align	1
	.type	_ZL4areg, @object
	.size	_ZL4areg, 2
_ZL4areg:
	.zero	2
	.section	.sbss._ZL4vreg,"aw",@nobits
	.type	_ZL4vreg, @object
	.size	_ZL4vreg, 1
_ZL4vreg:
	.zero	1
	.section	.sbss._ZL4mram,"aw",@nobits
	.align	2
	.type	_ZL4mram, @object
	.size	_ZL4mram, 4
_ZL4mram:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
