#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"244.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9M244Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M244Writejh, @function
_ZL9M244Writejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a4,a1,8
	srli	a5,a1,4
	beq	a4,zero,.L2
	andi	a5,a5,7
	slli	a5,a5,3
	lla	a4,_ZL8chr_perm
	andi	a1,a1,7
	add	a5,a4,a5
	add	a5,a5,a1
	lbu	a5,0(a5)
	lla	s0,_ZL4creg
	la a1, _ZL4preg; lbu a1, 0(a1);
	sb	a5,0(s0)
.L3:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L2:
	.cfi_restore_state
	andi	a5,a5,3
	slli	a5,a5,2
	lla	a4,_ZL8prg_perm
	andi	a1,a1,3
	add	a5,a4,a5
	add	a5,a5,a1
	lbu	a1,0(a5)
	lla	s0,_ZL4creg
	la a5, _ZL4preg; sb a1, 0(a5);
	j	.L3
	.cfi_endproc
.LFE7:
	.size	_ZL9M244Writejh, .-_ZL9M244Writejh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,32768
	la a1, _ZL4preg; lbu a1, 0(a1);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4creg; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M244Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M244Powerv, @function
_ZL9M244Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL4creg
	li	a0,32768
	sb	zero,0(s0)
	la a5, _ZL4preg; sb zero, 0(a5);
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	li	s0,65536
	call	_Z7setchr8j
	addi	a1,s0,-1
	lla	a2,_ZL9M244Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL9M244Powerv, .-_ZL9M244Powerv
	.section	.text._Z14Mapper244_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper244_InitP8CartInfo
	.hidden	_Z14Mapper244_InitP8CartInfo
	.type	_Z14Mapper244_InitP8CartInfo, @function
_Z14Mapper244_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M244Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_Z14Mapper244_InitP8CartInfo, .-_Z14Mapper244_InitP8CartInfo
	.section	.rodata._ZL8chr_perm,"a"
	.align	2
	.type	_ZL8chr_perm, @object
	.size	_ZL8chr_perm, 64
_ZL8chr_perm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\002\001\003\004\006\005\007"
	.string	""
	.ascii	"\001\004\005\002\003\006\007"
	.string	""
	.ascii	"\004\001\005\002\006\003\007"
	.string	""
	.ascii	"\004\002\006\001\005\003\007"
	.string	""
	.ascii	"\002\004\006\001\003\005\007"
	.string	"\007\006\005\004\003\002\001"
	.string	"\007\006\005\004\003\002\001"
	.section	.rodata._ZL8prg_perm,"a"
	.align	2
	.type	_ZL8prg_perm, @object
	.size	_ZL8prg_perm, 16
_ZL8prg_perm:
	.string	""
	.ascii	"\001\002\003"
	.string	"\003\002\001"
	.string	""
	.ascii	"\002\001\003"
	.string	"\003\001\002"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL4creg
	.word	1
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL4creg,"aw",@nobits
	.type	_ZL4creg, @object
	.size	_ZL4creg, 1
_ZL4creg:
	.zero	1
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
