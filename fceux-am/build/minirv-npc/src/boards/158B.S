#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"158B.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL15UNL158BProtReadj,"ax",@progbits
	.align	2
	.type	_ZL15UNL158BProtReadj, @function
_ZL15UNL158BProtReadj:
.LFB8:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL3lut
	add	a5,a5,a0
	lbu	a0,0(a5)
	la a5, X+24; lbu a5, 0(a5);
	or	a0,a0,a5
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL15UNL158BProtReadj, .-_ZL15UNL158BProtReadj
	.section	.text._ZL12UNL158BPowerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL158BPowerv, @function
_ZL12UNL158BPowerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,24576
	lla	a2,_ZL16UNL158BProtWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	lla	a2,_ZL15UNL158BProtReadj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE9:
	.size	_ZL12UNL158BPowerv, .-_ZL12UNL158BPowerv
	.section	.rodata._ZL16UNL158BProtWritejh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"UNK PROT WRITE\n"
	.section	.text._ZL16UNL158BProtWritejh,"ax",@progbits
	.align	2
	.type	_ZL16UNL158BProtWritejh, @function
_ZL16UNL158BProtWritejh:
.LFB7:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,EXPREGS
	add	a5,a5,a0
	sb	a1,0(a5)
	beq	a0,zero,.L6
	li	a5,7
	beq	a0,a5,.L7
	ret
.L7:
	lla	a0,.LC0
	tail	printf
.L6:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE7:
	.size	_ZL16UNL158BProtWritejh, .-_ZL16UNL158BProtWritejh
	.section	.text._ZL9UNL158BPWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL158BPWjh, @function
_ZL9UNL158BPWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L11
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	andi	a4,a5,32
	andi	s0,a5,7
	beq	a4,zero,.L12
	srli	a1,s0,1
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L12:
	.cfi_restore_state
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L11:
	andi	a1,a1,15
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL9UNL158BPWjh, .-_ZL9UNL158BPWjh
	.section	.rodata._Z12UNL158B_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z12UNL158B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL158B_InitP8CartInfo
	.hidden	_Z12UNL158B_InitP8CartInfo
	.type	_Z12UNL158B_InitP8CartInfo, @function
_Z12UNL158B_InitP8CartInfo:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9UNL158BPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL158BPowerv
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE10:
	.size	_Z12UNL158B_InitP8CartInfo, .-_Z12UNL158B_InitP8CartInfo
	.section	.srodata._ZL3lut,"a"
	.align	2
	.type	_ZL3lut, @object
	.size	_ZL3lut, 8
_ZL3lut:
	.string	""
	.string	""
	.string	""
	.string	"\001\002\004\017"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
