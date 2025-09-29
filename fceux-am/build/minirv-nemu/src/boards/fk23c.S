#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"fk23c.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._ZL13BMCFK23CResetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"BMCFK23C dipswitch set to %d\n"
	.section	.text._ZL13BMCFK23CResetv,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CResetv, @function
_ZL13BMCFK23CResetv:
.LFB11:
	.cfi_startproc
	lla	a5,_ZL9dipswitch
	lw	a1,0(a5)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	addi	a1,a1,1
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a1,a1,7
	lla	a0,.LC0
	sw	a1,0(a5)
	call	printf
	lla	a5,EXPREGS
	li	a4,-1
	lla	s0,MMC3_cmd
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	sb	a4,7(a5)
	sb	a4,6(a5)
	sb	a4,5(a5)
	sb	a4,4(a5)
	call	_Z12MMC3RegResetv
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE11:
	.size	_ZL13BMCFK23CResetv, .-_ZL13BMCFK23CResetv
	.section	.text._ZL13BMCFK23CPowerv,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CPowerv, @function
_ZL13BMCFK23CPowerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z12GenMMC3Powerv
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	lla	a5,EXPREGS
	li	a4,-1
	sb	zero,3(a5)
	sb	zero,2(a5)
	sb	zero,1(a5)
	sb	zero,0(a5)
	sb	a4,7(a5)
	sb	a4,6(a5)
	sb	a4,5(a5)
	sb	a4,4(a5)
	la a3, _ZL9dipswitch; sw zero, 0(a3);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	li	a1,24576
	lla	a2,_ZL13BMCFK23CWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL15BMCFK23CHiWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE12:
	.size	_ZL13BMCFK23CPowerv, .-_ZL13BMCFK23CPowerv
	.section	.text._ZL14BMCFK23CAPowerv,"ax",@progbits
	.align	2
	.type	_ZL14BMCFK23CAPowerv, @function
_ZL14BMCFK23CAPowerv:
.LFB21:
	.cfi_startproc
	tail	_ZL13BMCFK23CPowerv
	.cfi_endproc
.LFE21:
	.size	_ZL14BMCFK23CAPowerv, .-_ZL14BMCFK23CAPowerv
	.section	.text._ZL10BMCFK23CPWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCFK23CPWjh, @function
_ZL10BMCFK23CPWjh:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	li	a3,4
	andi	a4,a5,7
	beq	a4,a3,.L17
	li	a3,3
	beq	a4,a3,.L18
	andi	a5,a5,3
	bne	a5,zero,.L19
	li	a1,0
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	andi	a5,a5,2
	bne	a5,zero,.L20
.L9:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a2, A001B; lbu a2, 0(a2);
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg8rijj
.L19:
	.cfi_restore_state
	li	a3,6
	sub	a3,a3,a5
	lbu	a4,1(s0)
	li	a5,1
	sll	a5,a5,a3
	addi	a5,a5,-1
	and	a1,a1,a5
	slli	a5,a4,1
	or	a1,a1,a5
	andi	a1,a1,0xff
	call	_Z7setprg8jj
	lbu	a5,3(s0)
	andi	a5,a5,2
	beq	a5,zero,.L9
.L20:
	lbu	a1,4(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,5(s0)
	li	a0,57344
	call	_Z7setprg8jj
	j	.L9
.L17:
	lbu	a1,1(s0)
	li	a0,32768
	srli	a1,a1,1
	call	_Z8setprg32jj
	j	.L9
.L18:
	lbu	a1,1(s0)
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,1(s0)
	li	a0,49152
	call	_Z8setprg16jj
	j	.L9
	.cfi_endproc
.LFE8:
	.size	_ZL10BMCFK23CPWjh, .-_ZL10BMCFK23CPWjh
	.section	.text._ZL14BMCFK23CAClosev,"ax",@progbits
	.align	2
	.type	_ZL14BMCFK23CAClosev, @function
_ZL14BMCFK23CAClosev:
.LFB14:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L27
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE14:
	.size	_ZL14BMCFK23CAClosev, .-_ZL14BMCFK23CAClosev
	.section	.text._ZL13BMCFK23CWritejh,"ax",@progbits
	.align	2
	.type	_ZL13BMCFK23CWritejh, @function
_ZL13BMCFK23CWritejh:
.LFB10:
	.cfi_startproc
	la a3, _ZL9dipswitch; lw a3, 0(a3);
	addi	a3,a3,4
	li	a5,1
	sll	a5,a5,a3
	and	a5,a5,a0
	bne	a5,zero,.L49
	la a5, _ZL12is_BMCFK23CA; lbu a5, 0(a5);
	beq	a5,zero,.L45
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	andi	a5,a5,2
	beq	a5,zero,.L45
	lbu	a5,0(a4)
	andi	a5,a5,-8
	sb	a5,0(a4)
	ret
.L45:
	ret
.L49:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,MMC3_cmd
	mv	a4,a0
	lbu	a0,0(s0)
	andi	a4,a4,3
	lla	a5,EXPREGS
	add	a5,a5,a4
	sb	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	call	_Z10FixMMC3CHRi
	la a5, _ZL12is_BMCFK23CA; lbu a5, 0(a5);
	beq	a5,zero,.L30
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	andi	a5,a5,2
	beq	a5,zero,.L30
	lbu	a5,0(a4)
	andi	a5,a5,-8
	sb	a5,0(a4)
.L30:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL13BMCFK23CWritejh, .-_ZL13BMCFK23CWritejh
	.section	.text._ZL15BMCFK23CHiWritejh,"ax",@progbits
	.align	2
	.type	_ZL15BMCFK23CHiWritejh, @function
_ZL15BMCFK23CHiWritejh:
.LFB9:
	.cfi_startproc
	lla	a2,EXPREGS
	lbu	a3,0(a2)
	li	a6,64
	mv	a4,a1
	andi	a7,a3,96
	beq	a7,a6,.L72
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,32768
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	a3,a3,1
	mv	a5,a0
	li	a6,32768
	beq	a0,a3,.L73
	li	a3,49152
	bgeu	a0,a3,.L56
	la a3, UNIFchrrama; lw a3, 0(a3);
	lla	s0,MMC3_cmd
	beq	a3,zero,.L55
	bne	a0,a6,.L55
	li	a3,70
	beq	a1,a3,.L57
	li	a3,71
	beq	a1,a3,.L74
.L55:
	mv	a0,a5
	mv	a1,a4
	call	_Z13MMC3_CMDWritejh
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3PRGi
.L73:
	.cfi_restore_state
	lbu	a3,3(a2)
	lla	s0,MMC3_cmd
	andi	a3,a3,2
	beq	a3,zero,.L55
	lbu	a0,0(s0)
	andi	a3,a0,8
	beq	a3,zero,.L55
	andi	a5,a0,3
	ori	a5,a5,4
	add	a2,a2,a5
	sb	a1,0(a2)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L72:
	andi	a3,a3,48
	beq	a3,zero,.L52
	la a5, _ZL8unromchr; sb zero, 0(a5);
	ret
.L56:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z13MMC3_IRQWritejh
.L52:
	andi	a1,a1,3
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, _ZL8unromchr; sb a1, 0(a5);
	tail	_Z10FixMMC3CHRi
.L74:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a4,70
	j	.L55
.L57:
	li	a4,71
	j	.L55
	.cfi_endproc
.LFE9:
	.size	_ZL15BMCFK23CHiWritejh, .-_ZL15BMCFK23CHiWritejh
	.section	.text._ZL10BMCFK23CCWjh,"ax",@progbits
	.align	2
	.type	_ZL10BMCFK23CCWjh, @function
_ZL10BMCFK23CCWjh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	andi	a3,a5,64
	bne	a3,zero,.L81
	andi	a5,a5,32
	bne	a5,zero,.L82
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lbu	s1,2(s0)
	lbu	a5,3(s0)
	slli	s1,s1,3
	andi	s1,s1,1016
	andi	a5,a5,2
	or	a1,a1,s1
	beq	a5,zero,.L78
	sw	s2,16(sp)
	.cfi_offset 18, -16
	la s2, MMC3_cmd; lbu s2, 0(s2);
	li	a5,4096
	slli	s2,s2,5
	sw	s3,12(sp)
	.cfi_offset 19, -20
	and	s2,s2,a5
	lla	s3,DRegBuf
	call	_Z7setchr1jj
	lbu	a1,0(s3)
	mv	a0,s2
	or	a1,a1,s1
	call	_Z7setchr1jj
	lbu	a1,6(s0)
	ori	a0,s2,1024
	or	a1,a1,s1
	call	_Z7setchr1jj
	lbu	a1,1(s3)
	li	a0,4096
	addi	a0,a0,-2048
	or	a1,a1,s1
	or	a0,s2,a0
	call	_Z7setchr1jj
	lbu	a1,7(s0)
	li	a0,4096
	lw	s0,24(sp)
	.cfi_restore 8
	addi	a0,a0,-1024
	lw	s3,12(sp)
	.cfi_restore 19
	lw	ra,28(sp)
	.cfi_restore 1
	or	a1,a1,s1
	or	a0,s2,a0
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
.L82:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a2,a1
	mv	a1,a0
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	li	a0,16
	tail	_Z8setchr1rijj
.L81:
	.cfi_restore_state
	lbu	a0,2(s0)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	la a5, _ZL8unromchr; lbu a5, 0(a5);
	or	a0,a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L78:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE7:
	.size	_ZL10BMCFK23CCWjh, .-_ZL10BMCFK23CCWjh
	.section	.rodata._Z13BMCFK23C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"EXPR"
	.align	2
.LC2:
	.string	"UCHR"
	.align	2
.LC3:
	.string	"DPSW"
	.align	2
.LC4:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/boards/fk23c.cpp"
	.align	2
.LC5:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z13BMCFK23C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCFK23C_InitP8CartInfo
	.hidden	_Z13BMCFK23C_InitP8CartInfo
	.type	_Z13BMCFK23C_InitP8CartInfo, @function
_Z13BMCFK23C_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL12is_BMCFK23CA; sb zero, 0(a5);
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10BMCFK23CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10BMCFK23CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL13BMCFK23CPowerv
	sw	a5,0(s0)
	lla	a5,_ZL13BMCFK23CResetv
	sw	a5,4(s0)
	lla	a3,.LC1
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,_ZL8unromchr
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,_ZL9dipswitch
	call	_Z10AddExStatePvjiPKc
	li	a2,255
	lla	a1,.LC4
	lla	a0,.LC5
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE15:
	.size	_Z13BMCFK23C_InitP8CartInfo, .-_Z13BMCFK23C_InitP8CartInfo
	.section	.rodata._Z14BMCFK23CA_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"CRAM"
	.section	.text._Z14BMCFK23CA_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMCFK23CA_InitP8CartInfo
	.hidden	_Z14BMCFK23CA_InitP8CartInfo
	.type	_Z14BMCFK23CA_InitP8CartInfo, @function
_Z14BMCFK23CA_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	li	a5,1
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	la a6, _ZL12is_BMCFK23CA; sb a5, 0(a6);
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10BMCFK23CCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10BMCFK23CPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL14BMCFK23CAPowerv
	sw	a5,0(s0)
	lla	a5,_ZL13BMCFK23CResetv
	sw	a5,4(s0)
	lla	a5,_ZL14BMCFK23CAClosev
	lla	s1,_ZL10CHRRAMSize
	sw	a5,8(s0)
	li	a0,8192
	li	a5,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s0,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s0)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s0)
	lla	a3,.LC6
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,8
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,_ZL8unromchr
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,_ZL9dipswitch
	call	_Z10AddExStatePvjiPKc
	li	a2,283
	lla	a1,.LC4
	lla	a0,.LC5
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE16:
	.size	_Z14BMCFK23CA_InitP8CartInfo, .-_Z14BMCFK23CA_InitP8CartInfo
	.section	.sbss._ZL10CHRRAMSize,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL9dipswitch,"aw",@nobits
	.align	2
	.type	_ZL9dipswitch, @object
	.size	_ZL9dipswitch, 4
_ZL9dipswitch:
	.zero	4
	.section	.sbss._ZL8unromchr,"aw",@nobits
	.type	_ZL8unromchr, @object
	.size	_ZL8unromchr, 1
_ZL8unromchr:
	.zero	1
	.section	.sbss._ZL12is_BMCFK23CA,"aw",@nobits
	.type	_ZL12is_BMCFK23CA, @object
	.size	_ZL12is_BMCFK23CA, 1
_ZL12is_BMCFK23CA:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
