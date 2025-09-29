#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"super24.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9Super24PWjh,"ax",@progbits
	.align	2
	.type	_ZL9Super24PWjh, @function
_ZL9Super24PWjh:
.LFB6:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	lbu	a2,1(a4)
	lla	a4,_ZL6masko8
	andi	a5,a5,7
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	slli	a2,a2,1
	and	a5,a1,a5
	or	a2,a2,a5
	mv	a1,a0
	srli	a0,a2,6
	tail	_Z8setprg8rijj
	.cfi_endproc
.LFE6:
	.size	_ZL9Super24PWjh, .-_ZL9Super24PWjh
	.section	.text._ZL12Super24Closev,"ax",@progbits
	.align	2
	.type	_ZL12Super24Closev, @function
_ZL12Super24Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L9
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L9:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL12Super24Closev, .-_ZL12Super24Closev
	.section	.text._ZL12Super24Resetv,"ax",@progbits
	.align	2
	.type	_ZL12Super24Resetv, @function
_ZL12Super24Resetv:
.LFB10:
	.cfi_startproc
	lla	a5,EXPREGS
	li	a4,36
	sb	a4,0(a5)
	li	a4,-97
	sb	a4,1(a5)
	sb	zero,2(a5)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE10:
	.size	_ZL12Super24Resetv, .-_ZL12Super24Resetv
	.section	.text._ZL12Super24Powerv,"ax",@progbits
	.align	2
	.type	_ZL12Super24Powerv, @function
_ZL12Super24Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	li	a4,36
	sb	a4,0(a5)
	li	a4,-97
	sb	a4,1(a5)
	sb	zero,2(a5)
	call	_Z12GenMMC3Powerv
	li	a1,32768
	lla	a2,_ZL12Super24Writejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL12Super24Powerv, .-_ZL12Super24Powerv
	.section	.text._ZL9Super24CWjh,"ax",@progbits
	.align	2
	.type	_ZL9Super24CWjh, @function
_ZL9Super24CWjh:
.LFB7:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,0(a4)
	mv	a2,a1
	mv	a1,a0
	andi	a5,a5,32
	beq	a5,zero,.L16
	li	a0,16
	tail	_Z8setchr1rijj
.L16:
	lbu	a0,2(a4)
	slli	a5,a0,3
	or	a2,a5,a2
	srli	a0,a0,6
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE7:
	.size	_ZL9Super24CWjh, .-_ZL9Super24CWjh
	.section	.text._ZL12Super24Writejh,"ax",@progbits
	.align	2
	.type	_ZL12Super24Writejh, @function
_ZL12Super24Writejh:
.LFB8:
	.cfi_startproc
	li	a5,24576
	addi	a5,a5,-15
	beq	a0,a5,.L18
	li	a5,24576
	addi	a5,a5,-14
	beq	a0,a5,.L19
	li	a5,24576
	addi	a5,a5,-16
	bne	a0,a5,.L17
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L19:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS+2; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
.L18:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS+1; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L17:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL12Super24Writejh, .-_ZL12Super24Writejh
	.section	.rodata._Z12Super24_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"BIG2"
	.section	.text._Z12Super24_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Super24_InitP8CartInfo
	.hidden	_Z12Super24_InitP8CartInfo
	.type	_Z12Super24_InitP8CartInfo, @function
_Z12Super24_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,128
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL12Super24Powerv
	sw	a5,0(s0)
	lla	a5,_ZL12Super24Resetv
	sw	a5,4(s0)
	lla	a5,_ZL12Super24Closev
	sw	a5,8(s0)
	lla	a5,_ZL9Super24CWjh
	la a4, cwrap; sw a5, 0(a4);
	li	a0,8192
	lla	a5,_ZL9Super24PWjh
	la a4, pwrap; sw a5, 0(a4);
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,_ZL6CHRRAM
	li	a3,1
	li	a2,8192
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z12Super24_InitP8CartInfo, .-_Z12Super24_InitP8CartInfo
	.section	.rodata._ZL6masko8,"a"
	.align	2
	.type	_ZL6masko8, @object
	.size	_ZL6masko8, 32
_ZL6masko8:
	.word	63
	.word	31
	.word	15
	.word	1
	.word	3
	.word	0
	.word	0
	.word	0
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
