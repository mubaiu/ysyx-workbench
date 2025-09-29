#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"199.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9M199Closev,"ax",@progbits
	.align	2
	.type	_ZL9M199Closev, @function
_ZL9M199Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
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
.L7:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL9M199Closev, .-_ZL9M199Closev
	.section	.text._ZL9M199Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M199Powerv, @function
_ZL9M199Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	li	a4,-2
	sb	a4,0(a5)
	li	a4,-1
	sb	a4,1(a5)
	li	a4,1
	sb	a4,2(a5)
	li	a4,3
	sb	a4,3(a5)
	call	_Z12GenMMC3Powerv
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL9M199Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL9M199Powerv, .-_ZL9M199Powerv
	.section	.text._ZL9M199Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M199Writejh, @function
_ZL9M199Writejh:
.LFB9:
	.cfi_startproc
	li	a4,32768
	addi	a4,a4,1
	mv	a5,a0
	beq	a0,a4,.L24
	li	a4,49152
	bltu	a0,a4,.L25
	tail	_Z13MMC3_IRQWritejh
.L24:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a4,a0,8
	bne	a4,zero,.L26
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z13MMC3_CMDWritejh
.L25:
	tail	_Z13MMC3_CMDWritejh
.L26:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a4,a0,3
	lla	a5,EXPREGS
	add	a5,a5,a4
	sb	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE9:
	.size	_ZL9M199Writejh, .-_ZL9M199Writejh
	.section	.text._ZL6M199PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M199PWjh, @function
_ZL6M199PWjh:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setprg8jj
	lla	s0,EXPREGS
	lbu	a1,0(s0)
	li	a0,49152
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,57344
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL6M199PWjh, .-_ZL6M199PWjh
	.section	.text._ZL6M199CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M199CWjh, @function
_ZL6M199CWjh:
.LFB7:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	sltiu	a0,a2,8
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	slli	a0,a0,4
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z8setchr1rijj
	lla	s1,DRegBuf
	lbu	a2,0(s1)
	li	a1,0
	lla	s0,EXPREGS
	sltiu	a0,a2,8
	slli	a0,a0,4
	call	_Z8setchr1rijj
	lbu	a2,2(s0)
	li	a1,1024
	sltiu	a0,a2,8
	slli	a0,a0,4
	call	_Z8setchr1rijj
	lbu	a2,1(s1)
	li	a1,4096
	addi	a1,a1,-2048
	sltiu	a0,a2,8
	slli	a0,a0,4
	call	_Z8setchr1rijj
	lbu	a2,3(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a1,4096
	sltiu	a0,a2,8
	addi	a1,a1,-1024
	slli	a0,a0,4
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE7:
	.size	_ZL6M199CWjh, .-_ZL6M199CWjh
	.section	.text._ZL6M199MWh,"ax",@progbits
	.align	2
	.type	_ZL6M199MWh, @function
_ZL6M199MWh:
.LFB8:
	.cfi_startproc
	andi	a0,a0,3
	li	a5,2
	beq	a0,a5,.L32
	li	a5,3
	beq	a0,a5,.L33
	li	a5,1
	beq	a0,a5,.L34
	li	a0,1
	tail	_Z9setmirrori
.L33:
	li	a0,3
	tail	_Z9setmirrori
.L32:
	li	a0,2
	tail	_Z9setmirrori
.L34:
	li	a0,0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL6M199MWh, .-_ZL6M199MWh
	.section	.rodata._Z14Mapper199_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z14Mapper199_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper199_InitP8CartInfo
	.hidden	_Z14Mapper199_InitP8CartInfo
	.type	_Z14Mapper199_InitP8CartInfo, @function
_Z14Mapper199_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M199CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6M199PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M199MWh
	la a4, mwrap; sw a5, 0(a4);
	lla	a5,_ZL9M199Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M199Closev
	lla	s1,_ZL10CHRRAMSIZE
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
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lla	a3,.LC1
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z14Mapper199_InitP8CartInfo, .-_Z14Mapper199_InitP8CartInfo
	.section	.sbss._ZL10CHRRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSIZE, @object
	.size	_ZL10CHRRAMSIZE, 4
_ZL10CHRRAMSIZE:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
