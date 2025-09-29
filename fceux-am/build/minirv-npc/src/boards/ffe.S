#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ffe.cpp"
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
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg8rijj
	la a5, _ZL7ffemode; lbu a5, 0(a5);
	beq	a5,zero,.L2
	sw	s1,0(sp)
	.cfi_offset 9, -12
	li	s0,0
	lla	s1,_ZL4creg
.L3:
	lbu	a1,0(s1)
	mv	a0,s0
	addi	s0,s0,1024
	call	_Z7setchr1jj
	li	a5,8192
	addi	s1,s1,1
	bne	s0,a5,.L3
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
	lbu	a1,3(s0)
	li	a0,57344
	call	_Z7setprg8jj
	la a5, _ZL4mirr; lbu a5, 0(a5);
	li	a4,2
	lw	s1,0(sp)
	.cfi_restore 9
	beq	a5,a4,.L5
.L17:
	bgtu	a5,a4,.L6
	li	a0,3
	bne	a5,zero,.L15
	li	a0,2
.L15:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L6:
	.cfi_restore_state
	li	a4,3
	li	a0,0
	beq	a5,a4,.L15
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	lla	s0,_ZL5latch
	lbu	a0,0(s0)
	andi	a0,a0,3
	call	_Z7setchr8j
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	call	_Z8setprg16jj
	li	a1,7
	li	a0,49152
	call	_Z8setprg16jj
	la a5, _ZL4mirr; lbu a5, 0(a5);
	li	a4,2
	bne	a5,a4,.L17
.L5:
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,1
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
.LFB15:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE15:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13FFEWriteLatchjh,"ax",@progbits
	.align	2
	.type	_ZL13FFEWriteLatchjh, @function
_ZL13FFEWriteLatchjh:
.LFB11:
	.cfi_startproc
	la a5, _ZL5latch; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL13FFEWriteLatchjh, .-_ZL13FFEWriteLatchjh
	.section	.text._ZL11FFEWriteChrjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWriteChrjh, @function
_ZL11FFEWriteChrjh:
.LFB10:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL4creg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE10:
	.size	_ZL11FFEWriteChrjh, .-_ZL11FFEWriteChrjh
	.section	.text._ZL11FFEWritePrgjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWritePrgjh, @function
_ZL11FFEWritePrgjh:
.LFB9:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4preg
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL11FFEWritePrgjh, .-_ZL11FFEWritePrgjh
	.section	.text._ZL12FFEWriteMirrjh,"ax",@progbits
	.align	2
	.type	_ZL12FFEWriteMirrjh, @function
_ZL12FFEWriteMirrjh:
.LFB7:
	.cfi_startproc
	slli	a0,a0,1
	srli	a1,a1,4
	andi	a0,a0,2
	andi	a1,a1,1
	or	a0,a0,a1
	la a5, _ZL4mirr; sb a0, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE7:
	.size	_ZL12FFEWriteMirrjh, .-_ZL12FFEWriteMirrjh
	.section	.text._ZL8FFEClosev,"ax",@progbits
	.align	2
	.type	_ZL8FFEClosev, @function
_ZL8FFEClosev:
.LFB14:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L29
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
.L29:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE14:
	.size	_ZL8FFEClosev, .-_ZL8FFEClosev
	.section	.text._ZL8FFEPowerv,"ax",@progbits
	.align	2
	.type	_ZL8FFEPowerv, @function
_ZL8FFEPowerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a5,-1
	sw	ra,8(sp)
	la a4, _ZL4preg+3; sb a5, 0(a4);
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	s0,65536
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL12FFEWriteMirrjh
	addi	a1,a1,767
	addi	a0,a0,766
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL11FFEWriteIRQjh
	addi	a1,a1,1283
	addi	a0,a0,1280
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL11FFEWritePrgjh
	addi	a1,a1,1287
	addi	a0,a0,1284
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL11FFEWriteChrjh
	addi	a1,a1,1303
	addi	a0,a0,1296
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL11FFEWriteChrjh
	addi	a1,a1,1303
	addi	a0,a0,1296
	call	_Z15SetWriteHandleriiPFvjhE
	li	s1,32768
	addi	a1,s1,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s1,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL13FFEWriteLatchjh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE12:
	.size	_ZL8FFEPowerv, .-_ZL8FFEPowerv
	.section	.text._ZL10FFEIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10FFEIRQHooki, @function
_ZL10FFEIRQHooki:
.LFB13:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L39
	lla	a5,_ZL8IRQCount
	lw	a3,0(a5)
	li	a4,65536
	add	a0,a0,a3
	sw	a0,0(a5)
	bge	a0,a4,.L42
.L39:
	ret
.L42:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14X6502_IRQBegini
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	_ZL10FFEIRQHooki, .-_ZL10FFEIRQHooki
	.section	.text._ZL11FFEWriteIRQjh,"ax",@progbits
	.align	2
	.type	_ZL11FFEWriteIRQjh, @function
_ZL11FFEWriteIRQjh:
.LFB8:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,1282
	beq	a0,a5,.L44
	li	a5,16384
	addi	a5,a5,1283
	beq	a0,a5,.L45
	li	a5,16384
	addi	a5,a5,1281
	bne	a0,a5,.L43
	li	a0,1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L45:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	slli	a1,a1,8
	li	a0,1
	or	a5,a5,a1
	sw	a5,0(a4)
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	tail	_Z12X6502_IRQEndi
.L44:
	lla	a3,_ZL8IRQCount
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L43:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL11FFEWriteIRQjh, .-_ZL11FFEWriteIRQjh
	.section	.rodata._Z12Mapper6_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z12Mapper6_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper6_InitP8CartInfo
	.hidden	_Z12Mapper6_InitP8CartInfo
	.type	_Z12Mapper6_InitP8CartInfo, @function
_Z12Mapper6_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	lw	a3,44(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL8FFEPowerv
	sw	a4,0(a0)
	andi	a3,a3,1
	li	a4,3
	sub	a4,a4,a3
	lla	a3,_ZL8FFEClosev
	sw	a3,8(a0)
	la a3, _ZL4mirr; sb a4, 0(a3);
	lla	a4,_ZL10FFEIRQHooki
	la a3, MapIRQHook; sw a4, 0(a3);
	lla	a4,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a3, GameStateRestore; sw a4, 0(a3);
	sw	a0,0(sp)
	li	a4,8192
	li	a0,8192
	sw	a4,0(s0)
	la a3, _ZL7ffemode; sb zero, 0(a3);
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
	beq	a4,zero,.L48
	lw	a3,0(s1)
	lw	a4,0(s0)
	sw	a3,12(a5)
	sw	a4,28(a5)
.L48:
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
.LFE16:
	.size	_Z12Mapper6_InitP8CartInfo, .-_Z12Mapper6_InitP8CartInfo
	.section	.text._Z13Mapper17_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper17_InitP8CartInfo
	.hidden	_Z13Mapper17_InitP8CartInfo
	.type	_Z13Mapper17_InitP8CartInfo, @function
_Z13Mapper17_InitP8CartInfo:
.LFB17:
	.cfi_startproc
	li	a5,1
	la a4, _ZL7ffemode; sb a5, 0(a4);
	tail	_Z12Mapper6_InitP8CartInfo
	.cfi_endproc
.LFE17:
	.size	_Z13Mapper17_InitP8CartInfo, .-_Z13Mapper17_InitP8CartInfo
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
	.section	.sbss._ZL7ffemode,"aw",@nobits
	.type	_ZL7ffemode, @object
	.size	_ZL7ffemode, 1
_ZL7ffemode:
	.zero	1
	.section	.sbss._ZL5latch,"aw",@nobits
	.type	_ZL5latch, @object
	.size	_ZL5latch, 1
_ZL5latch:
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
