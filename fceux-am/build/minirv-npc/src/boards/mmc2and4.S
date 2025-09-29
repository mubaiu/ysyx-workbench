#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc2and4.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL15MMC2and4PPUHookj,"ax",@progbits
	.align	2
	.type	_ZL15MMC2and4PPUHookj, @function
_ZL15MMC2and4PPUHookj:
.LFB8:
	.cfi_startproc
	srli	a5,a0,8
	andi	a4,a5,0xff
	li	a3,31
	bgtu	a4,a3,.L1
	andi	a5,a5,15
	li	a3,15
	beq	a5,a3,.L7
.L1:
	ret
.L7:
	andi	a0,a0,240
	bgtu	a4,a5,.L3
	li	a5,208
	beq	a0,a5,.L8
	li	a5,224
	bne	a0,a5,.L1
	li	a5,1
	la a1, _ZL4creg+1; lbu a1, 0(a1);
	li	a0,0
	la a4, _ZL6latch0; sb a5, 0(a4);
	tail	_Z7setchr4jj
.L3:
	li	a5,208
	beq	a0,a5,.L9
	li	a5,224
	bne	a0,a5,.L1
	li	a5,1
	la a1, _ZL4creg+3; lbu a1, 0(a1);
	li	a0,4096
	la a4, _ZL6latch1; sb a5, 0(a4);
	tail	_Z7setchr4jj
.L8:
	la a1, _ZL4creg; lbu a1, 0(a1);
	li	a0,0
	la a5, _ZL6latch0; sb zero, 0(a5);
	tail	_Z7setchr4jj
.L9:
	la a1, _ZL4creg+2; lbu a1, 0(a1);
	li	a0,4096
	la a5, _ZL6latch1; sb zero, 0(a5);
	tail	_Z7setchr4jj
	.cfi_endproc
.LFE8:
	.size	_ZL15MMC2and4PPUHookj, .-_ZL15MMC2and4PPUHookj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL4is10; lbu a5, 0(a5);
	beq	a5,zero,.L11
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
.L12:
	lla	s0,_ZL4creg
	la a5, _ZL6latch0; lbu a5, 0(a5);
	add	a5,s0,a5
	lbu	a1,0(a5)
	li	a0,0
	call	_Z7setchr4jj
	la a5, _ZL6latch1; lbu a5, 0(a5);
	add	s0,s0,a5
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr4jj
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L11:
	.cfi_restore_state
	la a1, _ZL4preg; lbu a1, 0(a1);
	li	a0,32768
	call	_Z7setprg8jj
	li	a1,-3
	li	a0,40960
	call	_Z7setprg8jj
	li	a1,-2
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	j	.L12
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._Z13MMC2and4Writejh,"ax",@progbits
	.align	2
	.globl	_Z13MMC2and4Writejh
	.hidden	_Z13MMC2and4Writejh
	.type	_Z13MMC2and4Writejh, @function
_Z13MMC2and4Writejh:
.LFB7:
	.cfi_startproc
	li	a4,61440
	and	a0,a0,a4
	li	a5,53248
	beq	a0,a5,.L15
	bgtu	a0,a5,.L16
	li	a5,45056
	beq	a0,a5,.L17
	li	a5,49152
	beq	a0,a5,.L18
	li	a5,40960
	bne	a0,a5,.L23
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L16:
	li	a5,57344
	beq	a0,a5,.L21
	bne	a0,a4,.L24
	not	a1,a1
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L24:
	ret
.L23:
	ret
.L21:
	la a5, _ZL4creg+3; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	la a5, _ZL4creg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L17:
	la a5, _ZL4creg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L15:
	la a5, _ZL4creg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_Z13MMC2and4Writejh, .-_Z13MMC2and4Writejh
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
	.section	.text._ZL13MMC2and4Powerv,"ax",@progbits
	.align	2
	.type	_ZL13MMC2and4Powerv, @function
_ZL13MMC2and4Powerv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,1
	la a4, _ZL6latch1; sb a5, 0(a4);
	la a4, _ZL6latch0; sb a5, 0(a4);
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4preg; sb zero, 0(a4);
	call	_ZL4Syncv
	la a5, _ZL4is10; lbu a5, 0(a5);
	bne	a5,zero,.L32
.L27:
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_Z13MMC2and4Writejh
	li	a0,40960
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
.L32:
	.cfi_restore_state
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
	j	.L27
	.cfi_endproc
.LFE9:
	.size	_ZL13MMC2and4Powerv, .-_ZL13MMC2and4Powerv
	.section	.text._ZL13MMC2and4Closev,"ax",@progbits
	.align	2
	.type	_ZL13MMC2and4Closev, @function
_ZL13MMC2and4Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L39
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L39:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL13MMC2and4Closev, .-_ZL13MMC2and4Closev
	.section	.text._Z12Mapper9_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper9_InitP8CartInfo
	.hidden	_Z12Mapper9_InitP8CartInfo
	.type	_Z12Mapper9_InitP8CartInfo, @function
_Z12Mapper9_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL13MMC2and4Powerv
	sw	a5,0(a0)
	la a5, _ZL4is10; sb zero, 0(a5);
	lla	a5,_ZL15MMC2and4PPUHookj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z12Mapper9_InitP8CartInfo, .-_Z12Mapper9_InitP8CartInfo
	.section	.rodata._Z13Mapper10_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper10_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper10_InitP8CartInfo
	.hidden	_Z13Mapper10_InitP8CartInfo
	.type	_Z13Mapper10_InitP8CartInfo, @function
_Z13Mapper10_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL13MMC2and4Powerv
	sw	a4,0(a0)
	lla	a4,_ZL13MMC2and4Closev
	sw	a4,8(a0)
	li	a4,1
	la a3, _ZL4is10; sb a4, 0(a3);
	lla	a4,_ZL15MMC2and4PPUHookj
	lla	s0,_ZL8WRAMSIZE
	la a3, PPU_hook; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
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
	lw	a5,0(sp)
	lw	a4,48(a5)
	beq	a4,zero,.L44
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L44:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a5,_ZL12StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z13Mapper10_InitP8CartInfo, .-_Z13Mapper10_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"PREG"
	.align	2
.LC3:
	.string	"MIRR"
	.align	2
.LC4:
	.string	"LAT0"
	.align	2
.LC5:
	.string	"LAT1"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 72
_ZL9StateRegs:
	.word	_ZL4creg
	.word	4
	.word	.LC1
	.word	_ZL4preg
	.word	1
	.word	.LC2
	.word	_ZL4mirr
	.word	1
	.word	.LC3
	.word	_ZL6latch0
	.word	1
	.word	.LC4
	.word	_ZL6latch1
	.word	1
	.word	.LC5
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
	.section	.sbss._ZL4preg,"aw",@nobits
	.type	_ZL4preg, @object
	.size	_ZL4preg, 1
_ZL4preg:
	.zero	1
	.section	.sbss._ZL6latch1,"aw",@nobits
	.type	_ZL6latch1, @object
	.size	_ZL6latch1, 1
_ZL6latch1:
	.zero	1
	.section	.sbss._ZL6latch0,"aw",@nobits
	.type	_ZL6latch0, @object
	.size	_ZL6latch0, 1
_ZL6latch0:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 4
_ZL4creg:
	.zero	4
	.section	.sbss._ZL4is10,"aw",@nobits
	.type	_ZL4is10, @object
	.size	_ZL4is10, 1
_ZL4is10:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
