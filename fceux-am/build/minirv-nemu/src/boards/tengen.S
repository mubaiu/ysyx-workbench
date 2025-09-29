#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"tengen.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL3cmd; lbu a5, 0(a5);
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL4regs
	andi	a5,a5,32
	lbu	a1,0(s0)
	beq	a5,zero,.L2
	li	a0,0
	call	_Z7setchr1jj
	lbu	a1,8(s0)
	li	a0,1024
	call	_Z7setchr1jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a1,9(s0)
	li	a0,4096
	addi	a0,a0,-1024
	call	_Z7setchr1jj
.L3:
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	li	a0,8192
	addi	a0,a0,-1024
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,7(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,10(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a0,57344
	li	a1,-1
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L2:
	.cfi_restore_state
	srli	a1,a1,1
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	srli	a1,a1,1
	call	_Z7setchr2jj
	j	.L3
	.cfi_endproc
.LFE8:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M64Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M64Powerv, @function
_ZL8M64Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL4regs
	li	a4,-1
	li	s0,65536
	sb	a4,10(a5)
	sh	a4,8(a5)
	sw	a4,0(a5)
	sw	a4,4(a5)
	la a3, _ZL4mirr; sb zero, 0(a3);
	la a3, _ZL3cmd; sb zero, 0(a3);
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
	lla	a2,_ZL8M64Writejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL8M64Powerv, .-_ZL8M64Powerv
	.section	.text._ZL8M64Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M64Writejh, @function
_ZL8M64Writejh:
.LFB9:
	.cfi_startproc
	li	a5,61440
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,49152
	beq	a0,a5,.L10
	bgtu	a0,a5,.L11
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	beq	a0,a5,.L12
	li	a5,40960
	beq	a0,a5,.L13
	bne	a0,a4,.L26
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
.L11:
	li	a5,57344
	beq	a0,a5,.L16
	addi	a5,a5,1
	beq	a0,a5,.L17
	li	a5,49152
	addi	a5,a5,1
	bne	a0,a5,.L27
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	li	a4,1
	andi	a1,a1,1
	la a3, _ZL5rmode; sb a4, 0(a3);
	la a4, _ZL8IRQCount; sb a5, 0(a4);
	la a5, _ZL7IRQmode; sb a1, 0(a5);
	ret
.L17:
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	la a4, _ZL5rmode; lbu a4, 0(a4);
	beq	a4,a5,.L28
.L24:
	ret
.L13:
	not	a1,a1
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L10:
	la a5, _ZL8IRQLatch; sb a1, 0(a5);
	la a4, _ZL5rmode; lbu a4, 0(a4);
	li	a5,1
	bne	a4,a5,.L24
	la a5, _ZL8IRQCount; sb a1, 0(a5);
	ret
.L12:
	la a5, _ZL3cmd; lbu a5, 0(a5);
	andi	a5,a5,15
	li	a4,9
	bgtu	a5,a4,.L19
	lla	a4,_ZL4regs
	add	a5,a4,a5
	sb	a1,0(a5)
.L20:
	tail	_ZL4Syncv
.L16:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	la a4, _ZL5rmode; lbu a4, 0(a4);
	li	a5,1
	bne	a4,a5,.L9
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a4, _ZL8IRQCount; sb a5, 0(a4);
.L9:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	ret
.L26:
	ret
.L19:
	li	a4,15
	bne	a5,a4,.L20
	la a5, _ZL4regs+10; sb a1, 0(a5);
	j	.L20
.L28:
	la a5, _ZL8IRQLatch; lbu a5, 0(a5);
	la a4, _ZL8IRQCount; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M64Writejh, .-_ZL8M64Writejh
	.section	.text._ZL10M64IRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10M64IRQHooki, @function
_ZL10M64IRQHooki:
.LFB6:
	.cfi_startproc
	la a5, _ZL7IRQmode; lbu a5, 0(a5);
	beq	a5,zero,.L39
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lla	s1,_ZZL10M64IRQHookiE10smallcount
	lw	a4,0(s1)
	sw	ra,28(sp)
	li	a5,3
	add	a0,a0,a4
	sw	a0,0(s1)
	.cfi_offset 1, -4
	ble	a0,a5,.L29
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lla	s0,_ZL8IRQCount
	li	s3,255
	lla	s4,_ZL4IRQa
	li	s2,3
.L33:
	lbu	a5,0(s0)
	addi	a0,a0,-4
	sw	a0,0(s1)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(s0)
	beq	a5,s3,.L42
.L32:
	bgt	a0,s2,.L33
.L43:
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
.L29:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L39:
	ret
.L42:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lbu	a5,0(s4)
	beq	a5,zero,.L32
	li	a0,1
	call	_Z14X6502_IRQBegini
	lw	a0,0(s1)
	bgt	a0,s2,.L33
	j	.L43
	.cfi_endproc
.LFE6:
	.size	_ZL10M64IRQHooki, .-_ZL10M64IRQHooki
	.section	.text._ZL9M64HBHookv,"ax",@progbits
	.align	2
	.type	_ZL9M64HBHookv, @function
_ZL9M64HBHookv:
.LFB7:
	.cfi_startproc
	la a5, _ZL7IRQmode; lbu a5, 0(a5);
	bne	a5,zero,.L44
	la a4, scanline; lw a4, 0(a4);
	li	a5,240
	beq	a4,a5,.L44
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	la a3, _ZL5rmode; sb zero, 0(a3);
	li	a3,255
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	beq	a5,a3,.L51
.L44:
	ret
.L51:
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L44
	li	a5,1
	li	a0,1
	la a4, _ZL5rmode; sb a5, 0(a4);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE7:
	.size	_ZL9M64HBHookv, .-_ZL9M64HBHookv
	.section	.text._Z13Mapper64_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper64_InitP8CartInfo
	.hidden	_Z13Mapper64_InitP8CartInfo
	.type	_Z13Mapper64_InitP8CartInfo, @function
_Z13Mapper64_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL8M64Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M64HBHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL10M64IRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13Mapper64_InitP8CartInfo, .-_Z13Mapper64_InitP8CartInfo
	.section	.sbss._ZZL10M64IRQHookiE10smallcount,"aw",@nobits
	.align	2
	.type	_ZZL10M64IRQHookiE10smallcount, @object
	.size	_ZZL10M64IRQHookiE10smallcount, 4
_ZZL10M64IRQHookiE10smallcount:
	.zero	4
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGS"
	.align	2
.LC1:
	.string	"CMDR"
	.align	2
.LC2:
	.string	"MIRR"
	.align	2
.LC3:
	.string	"RMOD"
	.align	2
.LC4:
	.string	"IRQM"
	.align	2
.LC5:
	.string	"IRQC"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"IRQL"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4regs
	.word	11
	.word	.LC0
	.word	_ZL3cmd
	.word	1
	.word	.LC1
	.word	_ZL4mirr
	.word	1
	.word	.LC2
	.word	_ZL5rmode
	.word	1
	.word	.LC3
	.word	_ZL7IRQmode
	.word	1
	.word	.LC4
	.word	_ZL8IRQCount
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL8IRQLatch
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL8IRQLatch,"aw",@nobits
	.type	_ZL8IRQLatch, @object
	.size	_ZL8IRQLatch, 1
_ZL8IRQLatch:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL7IRQmode,"aw",@nobits
	.type	_ZL7IRQmode, @object
	.size	_ZL7IRQmode, 1
_ZL7IRQmode:
	.zero	1
	.section	.sbss._ZL5rmode,"aw",@nobits
	.type	_ZL5rmode, @object
	.size	_ZL5rmode, 1
_ZL5rmode:
	.zero	1
	.section	.bss._ZL4regs,"aw",@nobits
	.align	2
	.type	_ZL4regs, @object
	.size	_ZL4regs, 11
_ZL4regs:
	.zero	11
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
