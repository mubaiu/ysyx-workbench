#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"18.cpp"
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
	lla	s1,_ZL4creg
	li	s0,0
.L2:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L2
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lla	s0,_ZL4preg
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	la a0, _ZL4mirr; lbu a0, 0(a0);
	andi	a5,a0,2
	andi	a0,a0,1
	beq	a5,zero,.L6
	li	a0,2
.L6:
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
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
	.section	.text._ZL11M18WriteChrjh,"ax",@progbits
	.align	2
	.type	_ZL11M18WriteChrjh, @function
_ZL11M18WriteChrjh:
.LFB9:
	.cfi_startproc
	li	a4,-40960
	srli	a5,a0,1
	add	a4,a0,a4
	srli	a4,a4,11
	andi	a5,a5,1
	or	a5,a5,a4
	lla	a4,_ZL4creg
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	a0,a0,2
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a5,a5,a3
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL11M18WriteChrjh, .-_ZL11M18WriteChrjh
	.section	.text._ZL11M18WritePrgjh,"ax",@progbits
	.align	2
	.type	_ZL11M18WritePrgjh, @function
_ZL11M18WritePrgjh:
.LFB8:
	.cfi_startproc
	li	a4,-32768
	srli	a5,a0,1
	add	a4,a0,a4
	srli	a4,a4,11
	andi	a5,a5,1
	or	a5,a5,a4
	lla	a4,_ZL4preg
	add	a4,a4,a5
	lbu	a5,0(a4)
	slli	a0,a0,2
	andi	a0,a0,4
	li	a3,240
	sra	a3,a3,a0
	andi	a1,a1,15
	and	a5,a5,a3
	sll	a1,a1,a0
	or	a5,a5,a1
	sb	a5,0(a4)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL11M18WritePrgjh, .-_ZL11M18WritePrgjh
	.section	.text._ZL8M18Closev,"ax",@progbits
	.align	2
	.type	_ZL8M18Closev, @function
_ZL8M18Closev:
.LFB12:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L17
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
.L17:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL8M18Closev, .-_ZL8M18Closev
	.section	.text._ZL8M18Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M18Powerv, @function
_ZL8M18Powerv:
.LFB10:
	.cfi_startproc
	li	a5,-131072
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a5,a5,256
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL4preg; sw a5, 0(a4);
	li	s0,65536
	la a4, _ZL4IRQa; sb zero, 0(a4);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL11M18WritePrgjh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,57344
	lla	a2,_ZL11M18WriteChrjh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL11M18WriteIRQjh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE10:
	.size	_ZL8M18Powerv, .-_ZL8M18Powerv
	.section	.text._ZL11M18WriteIRQjh,"ax",@progbits
	.align	2
	.type	_ZL11M18WriteIRQjh, @function
_ZL11M18WriteIRQjh:
.LFB7:
	.cfi_startproc
	li	a4,61440
	addi	a4,a4,3
	li	a5,57344
	and	a0,a0,a4
	addi	a5,a5,3
	li	a4,61440
	li	a3,57344
	beq	a0,a5,.L23
	bgtu	a0,a5,.L24
	li	a5,57344
	addi	a5,a5,1
	beq	a0,a5,.L25
	li	a5,57344
	addi	a5,a5,2
	beq	a0,a5,.L26
	bne	a0,a3,.L32
	lla	a3,_ZL8IRQLatch
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-16
	and	a5,a5,a4
	andi	a1,a1,15
	or	a1,a5,a1
	sw	a1,0(a3)
	ret
.L24:
	li	a5,61440
	addi	a5,a5,1
	beq	a0,a5,.L29
	li	a5,61440
	addi	a5,a5,2
	beq	a0,a5,.L30
	bne	a0,a4,.L33
	la a5, _ZL8IRQLatch; lw a5, 0(a5);
	la a4, _ZL8IRQCount; sw a5, 0(a4);
	ret
.L30:
	andi	a1,a1,3
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	lla	a2,_ZL8IRQLatch
	lw	a5,0(a2)
	li	a3,61440
	li	a4,4096
	addi	a3,a3,255
	slli	a1,a1,8
	addi	a4,a4,-256
	and	a5,a5,a3
	and	a1,a1,a4
	or	a5,a5,a1
	sw	a5,0(a2)
	ret
.L23:
	lla	a4,_ZL8IRQLatch
	lw	a5,0(a4)
	slli	a1,a1,12
	li	a3,61440
	slli	a5,a5,20
	srli	a5,a5,20
	and	a1,a1,a3
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
.L25:
	lla	a3,_ZL8IRQLatch
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-241
	slli	a1,a1,4
	and	a5,a5,a4
	andi	a1,a1,255
	or	a5,a5,a1
	sw	a5,0(a3)
	ret
.L29:
	andi	a1,a1,1
	li	a0,1
	la a5, _ZL4IRQa; sb a1, 0(a5);
	tail	_Z12X6502_IRQEndi
.L33:
	ret
.L32:
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL11M18WriteIRQjh, .-_ZL11M18WriteIRQjh
	.section	.text._ZL10M18IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M18IRQHooki, @function
_ZL10M18IRQHooki:
.LFB11:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L42
	lla	a4,_ZL8IRQCount
	lw	a5,0(a4)
	beq	a5,zero,.L42
	sub	a5,a5,a0
	sw	a5,0(a4)
	ble	a5,zero,.L45
.L42:
	ret
.L45:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL8IRQCount; sw zero, 0(a5);
	la a5, _ZL4IRQa; sb zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	_ZL10M18IRQHooki, .-_ZL10M18IRQHooki
	.section	.rodata._Z13Mapper18_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper18_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper18_InitP8CartInfo
	.hidden	_Z13Mapper18_InitP8CartInfo
	.type	_Z13Mapper18_InitP8CartInfo, @function
_Z13Mapper18_InitP8CartInfo:
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
	lla	a4,_ZL8M18Powerv
	sw	a4,0(a0)
	lla	a4,_ZL8M18Closev
	sw	a4,8(a0)
	lla	a4,_ZL10M18IRQHooki
	la a3, MapIRQHook; sw a4, 0(a3);
	lla	a4,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a3, GameStateRestore; sw a4, 0(a3);
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
	beq	a4,zero,.L47
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L47:
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
	.size	_Z13Mapper18_InitP8CartInfo, .-_Z13Mapper18_InitP8CartInfo
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
	.size	_ZL9StateRegs, 84
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
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	4
	.word	.LC5
	.word	_ZL8IRQLatch
	.word	4
	.word	.LC6
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
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.align	2
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 4
_ZL8IRQLatch:
	.zero	4
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
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
	.size	_ZL4preg, 4
_ZL4preg:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
