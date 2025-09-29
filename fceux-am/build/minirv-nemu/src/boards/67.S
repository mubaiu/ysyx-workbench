#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"67.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s1,_ZL4mirr
	lbu	a0,0(s1)
	lla	s0,_ZL4creg
	call	_Z9setmirrori
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a5,0(s1)
	li	a4,2
	beq	a5,a4,.L2
	bgtu	a5,a4,.L3
	li	a0,0
	bne	a5,zero,.L11
	li	a0,1
.L11:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L3:
	.cfi_restore_state
	li	a4,3
	li	a0,3
	beq	a5,a4,.L11
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,2
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
.LFB10:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M67Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M67Powerv, @function
_ZL8M67Powerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL9suntoggle; sb zero, 0(a5);
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL8M67Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE8:
	.size	_ZL8M67Powerv, .-_ZL8M67Powerv
	.section	.text._ZL8M67Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M67Writejh, @function
_ZL8M67Writejh:
.LFB7:
	.cfi_startproc
	li	a5,65536
	addi	a5,a5,-2048
	and	a0,a0,a5
	li	a4,49152
	beq	a0,a4,.L17
	bgtu	a0,a4,.L18
	li	a5,45056
	addi	a5,a5,-2048
	beq	a0,a5,.L19
	bgtu	a0,a5,.L20
	li	a5,36864
	addi	a5,a5,-2048
	beq	a0,a5,.L21
	li	a5,40960
	addi	a5,a5,-2048
	bne	a0,a5,.L29
	la a5, _ZL4creg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	li	a4,61440
	addi	a4,a4,-2048
	beq	a0,a4,.L25
	bgtu	a0,a4,.L26
	li	a5,53248
	addi	a5,a5,-2048
	beq	a0,a5,.L17
	li	a5,57344
	addi	a5,a5,-2048
	bne	a0,a5,.L30
	andi	a1,a1,16
	li	a0,1
	la a5, _ZL9suntoggle; sb zero, 0(a5);
	la a5, _ZL4IRQa; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L26:
	bne	a0,a5,.L31
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L21:
	la a5, _ZL4creg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L20:
	li	a5,49152
	addi	a5,a5,-2048
	bne	a0,a5,.L32
	la a5, _ZL4creg+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	la a5, _ZL4creg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L17:
	lla	a3,_ZL9suntoggle
	lbu	a5,0(a3)
	lla	a0,_ZL8IRQCount
	lhu	a6,0(a0)
	xori	a2,a5,1
	slli	a4,a5,3
	li	a5,255
	sll	a5,a5,a4
	slli	a4,a2,3
	and	a5,a5,a6
	sll	a1,a1,a4
	or	a5,a5,a1
	sh	a5,0(a0)
	sb	a2,0(a3)
	ret
.L25:
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L30:
	ret
.L32:
	ret
.L31:
	ret
.L29:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL8M67Writejh, .-_ZL8M67Writejh
	.section	.text._Z6M67IRQi,"ax",@progbits
	.align	2
	.globl	_Z6M67IRQi
	.hidden	_Z6M67IRQi
	.type	_Z6M67IRQi, @function
_Z6M67IRQi:
.LFB9:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L38
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQCount
	lhu	a5,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	sub	a0,a5,a0
	slli	a0,a0,16
	srai	a0,a0,16
	sh	a0,0(s0)
	ble	a0,zero,.L41
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L38:
	ret
.L41:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,-1
	lw	ra,12(sp)
	.cfi_restore 1
	sh	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_Z6M67IRQi, .-_Z6M67IRQi
	.section	.text._Z13Mapper67_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper67_InitP8CartInfo
	.hidden	_Z13Mapper67_InitP8CartInfo
	.type	_Z13Mapper67_InitP8CartInfo, @function
_Z13Mapper67_InitP8CartInfo:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL8M67Powerv
	sw	a5,0(a0)
	lla	a5,_Z6M67IRQi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE11:
	.size	_Z13Mapper67_InitP8CartInfo, .-_Z13Mapper67_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"STOG"
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 96
_ZL9StateRegs:
	.word	_ZL4preg
	.word	1
	.word	.LC0
	.word	_ZL9suntoggle
	.word	1
	.word	.LC1
	.word	_ZL4creg
	.word	4
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	2
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC6
	.word	0
	.zero	8
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	1
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 2
_ZL8IRQLatch:
	.zero	2
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL9suntoggle,"aw",@nobits
	.type	_ZL9suntoggle, @object
	.size	_ZL9suntoggle, 1
_ZL9suntoggle:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 4
_ZL4creg:
	.zero	4
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
