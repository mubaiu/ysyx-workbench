#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cheapocabra.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL11M111FlashIDj,"ax",@progbits
	.align	2
	.type	_ZL11M111FlashIDj, @function
_ZL11M111FlashIDj:
.LFB9:
	.cfi_startproc
	andi	a5,a0,511
	beq	a5,zero,.L3
	li	a4,1
	li	a0,183
	beq	a5,a4,.L2
	li	a0,255
	ret
.L3:
	li	a0,191
.L2:
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL11M111FlashIDj, .-_ZL11M111FlashIDj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	la a2, _ZL3reg; lbu a2, 0(a2);
	li	a5,8192
	sw	s1,20(sp)
	.cfi_offset 9, -12
	slli	s1,a2,8
	and	s1,s1,a5
	sw	s5,4(sp)
	li	a5,16384
	.cfi_offset 21, -28
	srai	s5,a2,4
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	andi	s5,s5,1
	andi	s2,a2,15
	add	s1,s1,a5
	li	s0,0
	lla	s4,_ZL6CHRRAM
	li	s3,4
.L7:
	lw	a0,0(s4)
	mv	a2,s0
	li	a1,1
	add	a0,a0,s1
	addi	s0,s0,1
	call	_Z9setntamemPhij
	addi	s1,s1,1024
	bne	s0,s3,.L7
	mv	a1,s5
	li	a0,16
	call	_Z8setchr8rij
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	mv	a2,s2
	lw	s2,16(sp)
	.cfi_restore 18
	la a0, _ZL5flash; lbu a0, 0(a0);
	li	a1,32768
	slli	a0,a0,4
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z9setprg32rijj
	.cfi_endproc
.LFE7:
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
	.section	.text._ZL9M111Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M111Writejh, @function
_ZL9M111Writejh:
.LFB8:
	.cfi_startproc
	li	a5,-12288
	and	a0,a0,a5
	li	a5,20480
	beq	a0,a5,.L13
	ret
.L13:
	la a5, _ZL3reg; sb a1, 0(a5);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL9M111Writejh, .-_ZL9M111Writejh
	.section	.text._ZL9M111Closev,"ax",@progbits
	.align	2
	.type	_ZL9M111Closev, @function
_ZL9M111Closev:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L15
	call	_Z10FCEU_gfreePv
.L15:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	la a0, _ZL8FLASHROM; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	_Z10FCEU_gfreePv
.L16:
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL8FLASHROM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	_ZL9M111Closev, .-_ZL9M111Closev
	.section	.text._ZL9M111Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M111Powerv, @function
_ZL9M111Powerv:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1
	la a4, _ZL3reg; sb a5, 0(a4);
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL4Syncv
	li	s0,65536
	lla	a2,_Z6CartBRj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_ZL9M111Writejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	lla	a2,_ZL9M111Writejh
	addi	a1,a1,-1
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	la a5, _ZL5flash; lbu a5, 0(a5);
	bne	a5,zero,.L27
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	.cfi_restore_state
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL10flash_mode; sb zero, 0(a5);
	la a5, _ZL14flash_sequence; sb zero, 0(a5);
	la a5, _ZL8flash_id; sb zero, 0(a5);
	lla	a2,_ZL9M111Flashjh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE13:
	.size	_ZL9M111Powerv, .-_ZL9M111Powerv
	.section	.text._ZL9M111Flashjh,"ax",@progbits
	.align	2
	.type	_ZL9M111Flashjh, @function
_ZL9M111Flashjh:
.LFB12:
	.cfi_startproc
	li	a4,-32768
	add	a4,a0,a4
	li	a5,32768
	bgeu	a4,a5,.L54
	la a4, _ZL3reg; lbu a4, 0(a4);
	lla	a6,_ZL10flash_mode
	addi	a5,a5,-1
	li	a2,491520
	slli	a4,a4,15
	lbu	a3,0(a6)
	and	a4,a4,a2
	and	a0,a0,a5
	or	a4,a4,a0
	li	a2,2
	and	a5,a4,a5
	beq	a3,a2,.L30
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	li	a0,3
	beq	a3,a0,.L31
	li	a4,1
	bne	a3,a4,.L57
	lla	a0,_ZL14flash_sequence
	lbu	a4,0(a0)
	bne	a4,zero,.L34
	li	a4,12288
	addi	a4,a4,-1366
	beq	a5,a4,.L58
.L41:
	la a5, _ZL10flash_mode; sb zero, 0(a5);
.L28:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L54:
	ret
.L57:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	li	a3,20480
	addi	a3,a3,1365
	beq	a5,a3,.L59
.L33:
	li	a5,240
	bne	a1,a5,.L28
	la a5, _ZL8flash_id; lbu a5, 0(a5);
	beq	a5,zero,.L28
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	la a5, _ZL8flash_id; sb zero, 0(a5);
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
.L30:
	la a5, _ZL8FLASHROM; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a4,0(a5)
	and	a4,a1,a4
	sb	a4,0(a5)
	la a5, _ZL10flash_mode; sb zero, 0(a5);
	ret
.L31:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	lla	a0,_ZL14flash_sequence
	lbu	a3,0(a0)
	bne	a3,zero,.L43
	li	a4,20480
	addi	a4,a4,1365
	bne	a5,a4,.L41
	li	a5,170
	bne	a1,a5,.L41
.L44:
	li	a5,1
	sb	a5,0(a0)
	j	.L28
.L34:
	bne	a4,a3,.L41
	li	a4,20480
	addi	a4,a4,1365
	bne	a5,a4,.L41
	la a5, _ZL14flash_sequence; sb zero, 0(a5);
	li	a5,160
	beq	a1,a5,.L37
	bgtu	a1,a5,.L38
	li	a5,128
	beq	a1,a5,.L39
	li	a5,144
	bne	a1,a5,.L41
	lla	a5,_ZL8flash_id
	lbu	a4,0(a5)
	bne	a4,zero,.L41
	li	a1,65536
	li	a4,1
	lla	a2,_ZL11M111FlashIDj
	addi	a1,a1,-1
	li	a0,32768
	sb	a4,0(a5)
	call	_Z14SetReadHandleriiPFhjE
	j	.L41
.L43:
	li	a6,1
	beq	a3,a6,.L60
	bne	a3,a2,.L41
	li	a3,20480
	addi	a3,a3,1365
	beq	a5,a3,.L61
.L46:
	li	a5,48
	bne	a1,a5,.L41
	li	a5,520192
	and	a4,a4,a5
	la a0, _ZL8FLASHROM; lw a0, 0(a0);
	li	a2,4096
	li	a1,255
	add	a0,a0,a4
	call	memset
	j	.L41
.L59:
	li	a5,170
	bne	a1,a5,.L33
	sb	a4,0(a6)
	la a5, _ZL14flash_sequence; sb zero, 0(a5);
	j	.L28
.L60:
	li	a4,12288
	addi	a4,a4,-1366
	bne	a5,a4,.L41
	li	a5,85
	bne	a1,a5,.L41
	sb	a2,0(a0)
	j	.L28
.L58:
	li	a5,85
	bne	a1,a5,.L41
	j	.L44
.L61:
	li	a5,16
	bne	a1,a5,.L46
	li	a2,524288
	li	a1,255
	la a0, _ZL8FLASHROM; lw a0, 0(a0);
	call	memset
	j	.L41
.L38:
	li	a5,240
	bne	a1,a5,.L41
	la a5, _ZL8flash_id; lbu a5, 0(a5);
	beq	a5,zero,.L41
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	la a5, _ZL8flash_id; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	j	.L41
.L39:
	li	a5,3
	sb	a5,0(a6)
	j	.L28
.L37:
	sb	a2,0(a6)
	j	.L28
	.cfi_endproc
.LFE12:
	.size	_ZL9M111Flashjh, .-_ZL9M111Flashjh
	.section	.text._Z16M111FlashIDEnterv,"ax",@progbits
	.align	2
	.globl	_Z16M111FlashIDEnterv
	.hidden	_Z16M111FlashIDEnterv
	.type	_Z16M111FlashIDEnterv, @function
_Z16M111FlashIDEnterv:
.LFB10:
	.cfi_startproc
	lla	a5,_ZL8flash_id
	lbu	a4,0(a5)
	beq	a4,zero,.L64
	ret
.L64:
	li	a1,65536
	li	a4,1
	lla	a2,_ZL11M111FlashIDj
	addi	a1,a1,-1
	li	a0,32768
	sb	a4,0(a5)
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE10:
	.size	_Z16M111FlashIDEnterv, .-_Z16M111FlashIDEnterv
	.section	.text._Z15M111FlashIDExitv,"ax",@progbits
	.align	2
	.globl	_Z15M111FlashIDExitv
	.hidden	_Z15M111FlashIDExitv
	.type	_Z15M111FlashIDExitv, @function
_Z15M111FlashIDExitv:
.LFB11:
	.cfi_startproc
	la a5, _ZL8flash_id; lbu a5, 0(a5);
	bne	a5,zero,.L67
	ret
.L67:
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	la a5, _ZL8flash_id; sb zero, 0(a5);
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE11:
	.size	_Z15M111FlashIDExitv, .-_Z15M111FlashIDExitv
	.section	.rodata._Z14Mapper111_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CRAM"
	.align	2
.LC1:
	.string	"FROM"
	.section	.text._Z14Mapper111_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper111_InitP8CartInfo
	.hidden	_Z14Mapper111_InitP8CartInfo
	.type	_Z14Mapper111_InitP8CartInfo, @function
_Z14Mapper111_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lla	a5,_ZL9M111Powerv
	sw	a5,0(a0)
	lla	a5,_ZL9M111Closev
	sw	a5,8(a0)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s1,a0
	li	a0,32768
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s0,_ZL6CHRRAM
	li	a3,1
	li	a2,32768
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	a0,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,32768
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s1)
	snez	a4,a5
	la a3, _ZL5flash; sb a4, 0(a3);
	bne	a5,zero,.L74
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
.L74:
	.cfi_restore_state
	li	a0,524288
	sw	s2,0(sp)
	.cfi_offset 18, -16
	li	s0,524288
	call	_Z12FCEU_gmallocj
	lla	s2,_ZL8FLASHROM
	sw	a0,12(s1)
	lla	a3,.LC1
	li	a2,0
	li	a1,524288
	sw	s0,28(s1)
	sw	a0,0(s2)
	call	_Z10AddExStatePvjiPKc
	li	a1,-1
	lla	a0,_ZL9FlashRegs
	li	a3,0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a1,0(s2)
	la a6, ROM_size; lw a6, 0(a6);
	slli	a6,a6,14
	mv	a4,a1
	add	a0,a1,s0
	li	a5,0
	lla	a7,ROM
.L71:
	lw	a3,0(a7)
	addi	a4,a4,1
	add	a3,a3,a5
	lbu	a2,0(a3)
	addi	a5,a5,1
	sgtu	a3,a6,a5
	neg	a3,a3
	sb	a2,-1(a4)
	and	a5,a5,a3
	bne	a0,a4,.L71
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s2,0(sp)
	.cfi_restore 18
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,524288
	li	a0,16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z19SetupCartPRGMappingiPhji
	.cfi_endproc
.LFE16:
	.size	_Z14Mapper111_InitP8CartInfo, .-_Z14Mapper111_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"FMOD"
	.align	2
.LC3:
	.string	"FSEQ"
	.align	2
.LC4:
	.string	"FMID"
	.section	.data._ZL9FlashRegs,"aw"
	.align	2
	.type	_ZL9FlashRegs, @object
	.size	_ZL9FlashRegs, 48
_ZL9FlashRegs:
	.word	_ZL10flash_mode
	.word	1
	.word	.LC2
	.word	_ZL14flash_sequence
	.word	1
	.word	.LC3
	.word	_ZL8flash_id
	.word	1
	.word	.LC4
	.word	0
	.zero	8
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"REG"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 24
_ZL9StateRegs:
	.word	_ZL3reg
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL8FLASHROM,"aw",@nobits
	.align	2
	.type	_ZL8FLASHROM, @object
	.size	_ZL8FLASHROM, 4
_ZL8FLASHROM:
	.zero	4
	.section	.sbss._ZL8flash_id,"aw",@nobits
	.type	_ZL8flash_id, @object
	.size	_ZL8flash_id, 1
_ZL8flash_id:
	.zero	1
	.section	.sbss._ZL14flash_sequence,"aw",@nobits
	.type	_ZL14flash_sequence, @object
	.size	_ZL14flash_sequence, 1
_ZL14flash_sequence:
	.zero	1
	.section	.sbss._ZL10flash_mode,"aw",@nobits
	.type	_ZL10flash_mode, @object
	.size	_ZL10flash_mode, 1
_ZL10flash_mode:
	.zero	1
	.section	.sbss._ZL5flash,"aw",@nobits
	.type	_ZL5flash, @object
	.size	_ZL5flash, 1
_ZL5flash:
	.zero	1
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL3reg,"aw",@nobits
	.type	_ZL3reg, @object
	.size	_ZL3reg, 1
_ZL3reg:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
