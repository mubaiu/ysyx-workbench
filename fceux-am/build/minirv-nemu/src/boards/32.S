#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"32.cpp"
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
	sw	s0,8(sp)
	.cfi_offset 8, -8
	la s0, _ZL4mirr; lbu s0, 0(s0);
	not	a0,s0
	li	a5,16384
	andi	a0,a0,1
	slli	s0,s0,13
	and	s0,s0,a5
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	call	_Z9setmirrori
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	s1,_ZL4preg
	lbu	a1,0(s1)
	li	a0,32768
	or	a0,s0,a0
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s1,_ZL4creg
	call	_Z7setprg8jj
	li	a0,49152
	xor	a0,s0,a0
	li	a1,-2
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	li	s0,0
	li	s2,8192
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L2
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB13:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE13:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL9M32Write3jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write3jh, @function
_ZL9M32Write3jh:
.LFB10:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL4creg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL9M32Write3jh, .-_ZL9M32Write3jh
	.section	.text._ZL9M32Write2jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write2jh, @function
_ZL9M32Write2jh:
.LFB9:
	.cfi_startproc
	la a5, _ZL4preg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL9M32Write2jh, .-_ZL9M32Write2jh
	.section	.text._ZL9M32Write1jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write1jh, @function
_ZL9M32Write1jh:
.LFB8:
	.cfi_startproc
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9M32Write1jh, .-_ZL9M32Write1jh
	.section	.text._ZL9M32Write0jh,"ax",@progbits
	.align	2
	.type	_ZL9M32Write0jh, @function
_ZL9M32Write0jh:
.LFB7:
	.cfi_startproc
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL9M32Write0jh, .-_ZL9M32Write0jh
	.section	.text._ZL8M32Closev,"ax",@progbits
	.align	2
	.type	_ZL8M32Closev, @function
_ZL8M32Closev:
.LFB12:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L17
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L17:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL8M32Closev, .-_ZL8M32Closev
	.section	.text._ZL8M32Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M32Powerv, @function
_ZL8M32Powerv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,36864
	lla	a2,_ZL9M32Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL9M32Write1jh
	addi	a1,a1,-1
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,45056
	lla	a2,_ZL9M32Write2jh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_ZL9M32Write3jh
	addi	a1,a1,-1
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE11:
	.size	_ZL8M32Powerv, .-_ZL8M32Powerv
	.section	.rodata._Z13Mapper32_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper32_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper32_InitP8CartInfo
	.hidden	_Z13Mapper32_InitP8CartInfo
	.type	_Z13Mapper32_InitP8CartInfo, @function
_Z13Mapper32_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL8M32Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M32Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z13Mapper32_InitP8CartInfo, .-_Z13Mapper32_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"PREG"
	.align	2
.LC2:
	.string	"CREG"
	.align	2
.LC3:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 48
_ZL9StateRegs:
	.word	_ZL4preg
	.word	4
	.word	.LC1
	.word	_ZL4creg
	.word	8
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	0
	.zero	8
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 8
_ZL4creg:
	.zero	8
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 2
_ZL4preg:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
