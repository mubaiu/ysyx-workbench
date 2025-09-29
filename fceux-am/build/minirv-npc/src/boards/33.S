#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"33.cpp"
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
	la a0, _ZL4mirr; lbu a0, 0(a0);
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL4regs
	call	_Z9setmirrori
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,4(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	li	a0,4096
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a1,7(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,8192
	addi	a0,a0,-1024
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
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
	.section	.text._ZL8M33Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M33Writejh, @function
_ZL8M33Writejh:
.LFB7:
	.cfi_startproc
	li	a5,61440
	addi	a5,a5,3
	and	a0,a0,a5
	li	a5,40960
	beq	a0,a5,.L6
	bgtu	a0,a5,.L7
	li	a5,32768
	addi	a5,a5,2
	li	a4,32768
	beq	a0,a5,.L8
	bgtu	a0,a5,.L9
	beq	a0,a4,.L10
	li	a5,32768
	addi	a5,a5,1
	bne	a0,a5,.L19
	andi	a1,a1,63
	la a5, _ZL4regs+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L7:
	li	a5,40960
	addi	a5,a5,2
	beq	a0,a5,.L14
	li	a5,40960
	addi	a5,a5,3
	beq	a0,a5,.L15
	li	a5,40960
	addi	a5,a5,1
	bne	a0,a5,.L20
	la a5, _ZL4regs+5; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	andi	a5,a1,63
	la a4, _ZL4regs; sb a5, 0(a4);
	la a5, _ZL4is48; lbu a5, 0(a5);
	bne	a5,zero,.L18
	srli	a1,a1,6
	xori	a5,a1,1
	andi	a5,a5,1
	la a4, _ZL4mirr; sb a5, 0(a4);
.L18:
	tail	_ZL4Syncv
.L15:
	la a5, _ZL4regs+7; sb a1, 0(a5);
	tail	_ZL4Syncv
.L9:
	li	a5,32768
	addi	a5,a5,3
	bne	a0,a5,.L21
	la a5, _ZL4regs+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L6:
	la a5, _ZL4regs+4; sb a1, 0(a5);
	tail	_ZL4Syncv
.L8:
	la a5, _ZL4regs+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	la a5, _ZL4regs+6; sb a1, 0(a5);
	tail	_ZL4Syncv
.L20:
	ret
.L19:
	ret
.L21:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL8M33Writejh, .-_ZL8M33Writejh
	.section	.text._ZL8M33Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M33Powerv, @function
_ZL8M33Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL8M33Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE9:
	.size	_ZL8M33Powerv, .-_ZL8M33Powerv
	.section	.text._ZL8M48Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M48Powerv, @function
_ZL8M48Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,49152
	lla	a2,_ZL8M33Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL8M48Writejh
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL8M48Powerv, .-_ZL8M48Powerv
	.section	.text._ZL6M48IRQv,"ax",@progbits
	.align	2
	.type	_ZL6M48IRQv, @function
_ZL6M48IRQv:
.LFB11:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L31
	lla	a4,_ZL8IRQCount
	lhu	a5,0(a4)
	li	a3,256
	addi	a5,a5,1
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a5,0(a4)
	beq	a5,a3,.L34
.L31:
	ret
.L34:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_ZL6M48IRQv, .-_ZL6M48IRQv
	.section	.text._ZL8M48Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M48Writejh, @function
_ZL8M48Writejh:
.LFB8:
	.cfi_startproc
	li	a4,61440
	addi	a4,a4,3
	li	a5,49152
	and	a0,a0,a4
	addi	a5,a5,2
	li	a4,49152
	beq	a0,a5,.L36
	bleu	a0,a5,.L43
	li	a5,49152
	addi	a5,a5,3
	beq	a0,a5,.L41
	li	a5,57344
	bne	a0,a5,.L44
	srli	a1,a1,6
	xori	a1,a1,1
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L43:
	beq	a0,a4,.L38
	li	a5,49152
	addi	a5,a5,1
	bne	a0,a5,.L45
	la a5, _ZL8IRQLatch; lhu a5, 0(a5);
	la a4, _ZL8IRQCount; sh a5, 0(a4);
	ret
.L44:
	ret
.L45:
	ret
.L38:
	la a5, _ZL8IRQLatch; sh a1, 0(a5);
	ret
.L41:
	li	a0,1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L36:
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL8M48Writejh, .-_ZL8M48Writejh
	.section	.text._Z13Mapper33_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper33_InitP8CartInfo
	.hidden	_Z13Mapper33_InitP8CartInfo
	.type	_Z13Mapper33_InitP8CartInfo, @function
_Z13Mapper33_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	lla	a5,_ZL8M33Powerv
	sw	a5,0(a0)
	la a5, _ZL4is48; sb zero, 0(a5);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z13Mapper33_InitP8CartInfo, .-_Z13Mapper33_InitP8CartInfo
	.section	.text._Z13Mapper48_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper48_InitP8CartInfo
	.hidden	_Z13Mapper48_InitP8CartInfo
	.type	_Z13Mapper48_InitP8CartInfo, @function
_Z13Mapper48_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	lla	a5,_ZL8M48Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, _ZL4is48; sb a5, 0(a4);
	lla	a5,_ZL6M48IRQv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z13Mapper48_InitP8CartInfo, .-_Z13Mapper48_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"MIRR"
	.align	2
.LC2:
	.string	"IRQA"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4regs
	.word	8
	.word	.LC0
	.word	_ZL4mirr
	.word	1
	.word	.LC1
	.word	_ZL4IRQa
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	2
	.word	.LC3
	.word	_ZL8IRQLatch
	.word	2
	.word	.LC4
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
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 8
_ZL4regs:
	.zero	8
	.section	.sbss._ZL4is48,"aw",@nobits
	.type	_ZL4is48, @object
	.size	_ZL4is48, 1
_ZL4is48:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
