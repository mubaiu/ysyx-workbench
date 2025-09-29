#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc42in1r.cpp"
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
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL6latche
	lbu	a5,1(s1)
	lbu	a4,0(s1)
	la a3, _ZL12isresetbased; lbu a3, 0(a3);
	slli	a5,a5,6
	andi	s0,a4,31
	andi	a5,a5,64
	beq	a3,zero,.L2
	la a3, _ZL5reset; lbu a3, 0(a3);
	slli	a3,a3,5
	or	a3,a3,s0
	or	a5,a5,a3
	andi	a4,a4,32
	andi	s0,a5,0xff
	bne	a4,zero,.L4
.L8:
	srli	a1,s0,1
	li	a0,32768
	call	_Z8setprg32jj
.L5:
	lbu	a0,0(s1)
	srli	a0,a0,6
	andi	a0,a0,1
	call	_Z9setmirrori
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L2:
	.cfi_restore_state
	srli	a3,a4,2
	andi	a3,a3,32
	or	s0,s0,a3
	andi	a4,a4,32
	or	s0,s0,a5
	beq	a4,zero,.L8
.L4:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	j	.L5
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB9:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M226Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M226Writejh, @function
_ZL9M226Writejh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,1
	lla	a5,_ZL6latche
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M226Writejh, .-_ZL9M226Writejh
	.section	.text._ZL9M233Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M233Resetv, @function
_ZL9M233Resetv:
.LFB11:
	.cfi_startproc
	lla	a4,_ZL5reset
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL9M233Resetv, .-_ZL9M233Resetv
	.section	.text._ZL9M226Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M226Powerv, @function
_ZL9M226Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL5reset; sb zero, 0(a5);
	li	s0,65536
	la a5, _ZL6latche; sh zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL9M226Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE8:
	.size	_ZL9M226Powerv, .-_ZL9M226Powerv
	.section	.text._Z14Mapper226_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper226_InitP8CartInfo
	.hidden	_Z14Mapper226_InitP8CartInfo
	.type	_Z14Mapper226_InitP8CartInfo, @function
_Z14Mapper226_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M226Powerv
	sw	a5,0(a0)
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a5, _ZL12isresetbased; sb zero, 0(a5);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_Z14Mapper226_InitP8CartInfo, .-_Z14Mapper226_InitP8CartInfo
	.section	.text._Z14Mapper233_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper233_InitP8CartInfo
	.hidden	_Z14Mapper233_InitP8CartInfo
	.type	_Z14Mapper233_InitP8CartInfo, @function
_Z14Mapper233_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL9M226Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M233Resetv
	sw	a5,4(a0)
	li	a3,0
	li	a5,1
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, _ZL12isresetbased; sb a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper233_InitP8CartInfo, .-_Z14Mapper233_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"RST"
	.align	2
.LC1:
	.string	"LATC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL5reset
	.word	1
	.word	.LC0
	.word	_ZL6latche
	.word	2
	.word	.LC1
	.word	0
	.zero	8
	.section	.sbss._ZL5reset,"aw",@nobits
	.type	_ZL5reset, @object
	.size	_ZL5reset, 1
_ZL5reset:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.align	2
	.type	_ZL6latche, @object
	.size	_ZL6latche, 2
_ZL6latche:
	.zero	2
	.section	.sbss._ZL12isresetbased,"aw",@nobits
	.type	_ZL12isresetbased, @object
	.size	_ZL12isresetbased, 1
_ZL12isresetbased:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
