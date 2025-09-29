#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"rt-01.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL12UNLRT01Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLRT01Powerv, @function
_ZL12UNLRT01Powerv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a1,0
	li	a0,49152
	call	_Z8setprg16jj
	li	a1,0
	li	a0,0
	call	_Z7setchr2jj
	li	a0,4096
	li	a1,0
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	li	a1,0
	li	a0,4096
	call	_Z7setchr2jj
	li	a0,8192
	li	a1,0
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL11UNLRT01Readj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE7:
	.size	_ZL12UNLRT01Powerv, .-_ZL12UNLRT01Powerv
	.section	.text._ZL11UNLRT01Readj,"ax",@progbits
	.align	2
	.type	_ZL11UNLRT01Readj, @function
_ZL11UNLRT01Readj:
.LFB6:
	.cfi_startproc
	li	a4,-53248
	addi	a4,a4,384
	add	a4,a0,a4
	li	a3,127
	bleu	a4,a3,.L5
	li	a4,-65536
	addi	a4,a4,384
	add	a5,a0,a4
	bgtu	a5,a3,.L11
.L5:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z21xoroshiro128plus_nextv
	lw	ra,8(sp)
	.cfi_restore 1
	ori	a0,a0,-14
	andi	a0,a0,0xff
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L11:
	tail	_Z6CartBRj
	.cfi_endproc
.LFE6:
	.size	_ZL11UNLRT01Readj, .-_ZL11UNLRT01Readj
	.section	.text._Z12UNLRT01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLRT01_InitP8CartInfo
	.hidden	_Z12UNLRT01_InitP8CartInfo
	.type	_Z12UNLRT01_InitP8CartInfo, @function
_Z12UNLRT01_InitP8CartInfo:
.LFB8:
	.cfi_startproc
	lla	a5,_ZL12UNLRT01Powerv
	sw	a5,0(a0)
	ret
	.cfi_endproc
.LFE8:
	.size	_Z12UNLRT01_InitP8CartInfo, .-_Z12UNLRT01_InitP8CartInfo
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
