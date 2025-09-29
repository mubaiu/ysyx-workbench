#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc1.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL6MBWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL6MBWRAMjh, @function
_ZL6MBWRAMjh:
.LFB6:
	.cfi_startproc
	la a5, _ZL5DRegs+3; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L2
	la a5, _ZL5is155; lw a5, 0(a5);
	beq	a5,zero,.L1
.L2:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
.L1:
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL6MBWRAMjh, .-_ZL6MBWRAMjh
	.section	.text._ZL6MAWRAMj,"ax",@progbits
	.align	2
	.type	_ZL6MAWRAMj, @function
_ZL6MAWRAMj:
.LFB7:
	.cfi_startproc
	la a5, _ZL5DRegs+3; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L12
	la a5, _ZL5is155; lw a5, 0(a5);
	beq	a5,zero,.L17
.L12:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L17:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL6MAWRAMj, .-_ZL6MAWRAMj
	.section	.text._ZL7MMC1CHRv,"ax",@progbits
	.align	2
	.type	_ZL7MMC1CHRv, @function
_ZL7MMC1CHRv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	la a5, _ZL8WRAMSIZE; lw a5, 0(a5);
	li	a4,8192
	lla	s0,_ZL5DRegs
	bleu	a5,a4,.L19
	li	a4,16384
	lbu	a2,1(s0)
	bleu	a5,a4,.L20
	srli	a2,a2,2
	andi	a2,a2,3
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
.L19:
	lla	s1,_ZL12MMC1CHRHook4
	lbu	a5,0(s0)
	lw	a4,0(s1)
	lbu	a1,1(s0)
	andi	a5,a5,16
	beq	a4,zero,.L21
.L28:
	bne	a5,zero,.L27
	andi	a1,a1,254
	li	a0,0
	jalr	a4
	lbu	a1,1(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a5,0(s1)
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,4096
	ori	a1,a1,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L27:
	.cfi_restore_state
	li	a0,0
	jalr	a4
	lbu	a1,2(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a5,0(s1)
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,4096
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L20:
	.cfi_restore_state
	srli	a2,a2,3
	li	a1,24576
	andi	a2,a2,1
	li	a0,16
	call	_Z8setprg8rijj
	lla	s1,_ZL12MMC1CHRHook4
	lbu	a5,0(s0)
	lw	a4,0(s1)
	lbu	a1,1(s0)
	andi	a5,a5,16
	bne	a4,zero,.L28
.L21:
	beq	a5,zero,.L23
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,4096
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
.L23:
	.cfi_restore_state
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a1,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE8:
	.size	_ZL7MMC1CHRv, .-_ZL7MMC1CHRv
	.section	.text._ZL7MMC1PRGv,"ax",@progbits
	.align	2
	.type	_ZL7MMC1PRGv, @function
_ZL7MMC1PRGv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL5DRegs
	lla	s1,_ZL13MMC1PRGHook16
	lbu	s0,1(a5)
	lbu	a4,3(a5)
	lw	a3,0(s1)
	lbu	a5,0(a5)
	andi	s0,s0,16
	andi	a1,a4,15
	andi	a5,a5,12
	beq	a3,zero,.L30
	li	a2,8
	beq	a5,a2,.L31
	bgtu	a5,a2,.L32
	andi	a4,a4,14
	or	s0,s0,a4
	mv	a1,s0
	li	a0,32768
	jalr	a3
	lw	a5,0(s1)
	addi	a1,s0,1
.L37:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L32:
	.cfi_restore_state
	li	a4,12
	bne	a5,a4,.L29
	or	a1,s0,a1
	li	a0,32768
	jalr	a3
	lw	a5,0(s1)
	addi	a1,s0,15
	j	.L37
.L30:
	li	a4,8
	beq	a5,a4,.L34
	bleu	a5,a4,.L40
	li	a4,12
	bne	a5,a4,.L29
	add	a1,a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	addi	a1,s0,15
	li	a0,49152
.L39:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L40:
	.cfi_restore_state
	andi	a1,a1,-2
	add	s0,a1,s0
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	addi	a1,s0,1
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,49152
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L29:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L31:
	.cfi_restore_state
	or	a1,s0,a1
	li	a0,49152
	jalr	a3
	mv	a1,s0
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a5,0(s1)
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L34:
	.cfi_restore_state
	add	a1,a1,s0
	li	a0,49152
	call	_Z8setprg16jj
	mv	a1,s0
	li	a0,32768
	j	.L39
	.cfi_endproc
.LFE9:
	.size	_ZL7MMC1PRGv, .-_ZL7MMC1PRGv
	.section	.rodata._ZL11GenMMC1InitP8CartInfoiiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"CHRR"
	.align	2
.LC2:
	.string	"DREG"
	.align	2
.LC3:
	.string	"LRST"
	.align	2
.LC4:
	.string	"BFFR"
	.align	2
.LC5:
	.string	"BFRS"
	.section	.text._ZL11GenMMC1InitP8CartInfoiiii,"ax",@progbits
	.align	2
	.type	_ZL11GenMMC1InitP8CartInfoiiii, @function
_ZL11GenMMC1InitP8CartInfoiiii:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sub	a5,a3,a4
	sw	s0,12(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	slli	a0,a3,10
	slli	a3,a5,10
	la a5, _ZL5is155; sw zero, 0(a5);
	lla	a5,_ZL12GenMMC1Closev
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL8WRAMSIZE
	lla	t0,_ZL11NONBRAMSIZE
	sw	a5,8(s0)
	sw	a0,0(s1)
	la a5, _ZL12MMC1CHRHook4; sw zero, 0(a5);
	la a5, _ZL13MMC1PRGHook16; sw zero, 0(a5);
	sw	a3,0(t0)
	mv	a5,a2
	bne	a0,zero,.L50
.L43:
	beq	a5,zero,.L51
.L45:
	lla	a3,.LC2
	li	a2,0
	li	a1,4
	lla	a0,_ZL5DRegs
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL12GenMMC1Powerv
	sw	a5,0(s0)
	lla	a3,.LC3
	lla	a5,_ZL12MMC1_Restorei
	li	a2,1
	li	a1,8
	lla	a0,_ZL6lreset
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC4
	li	a2,1
	li	a1,1
	lla	a0,_ZL6Buffer
	call	_Z10AddExStatePvjiPKc
	lw	s0,12(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s1,8(sp)
	.cfi_restore 9
	lla	a3,.LC5
	li	a2,1
	li	a1,1
	lla	a0,_ZL11BufferShift
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
.L50:
	.cfi_restore_state
	sw	a4,4(sp)
	sw	a2,0(sp)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s1)
	lla	s1,_ZL4WRAM
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	a4,4(sp)
	lw	a5,0(sp)
	beq	a4,zero,.L43
	lla	t0,_ZL11NONBRAMSIZE
	lw	a3,0(s1)
	lw	a2,0(t0)
	slli	a4,a4,10
	sw	a4,28(s0)
	add	a4,a3,a2
	sw	a4,12(s0)
	bne	a5,zero,.L45
.L51:
	li	a0,8192
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s1,_ZL6CHRRAM
	li	a3,1
	li	a2,8192
	li	a0,0
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a0,0(s1)
	lla	a3,.LC1
	li	a2,0
	li	a1,8192
	call	_Z10AddExStatePvjiPKc
	j	.L45
	.cfi_endproc
.LFE22:
	.size	_ZL11GenMMC1InitP8CartInfoiiii, .-_ZL11GenMMC1InitP8CartInfoiiii
	.section	.text._ZL12GenMMC1Closev,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC1Closev, @function
_ZL12GenMMC1Closev:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L53
	call	_Z10FCEU_gfreePv
.L53:
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L54
	call	_Z10FCEU_gfreePv
.L54:
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	_ZL12GenMMC1Closev, .-_ZL12GenMMC1Closev
	.section	.text._ZL10MMC1MIRRORv,"ax",@progbits
	.align	2
	.type	_ZL10MMC1MIRRORv, @function
_ZL10MMC1MIRRORv:
.LFB10:
	.cfi_startproc
	la a5, _ZL5is171; lw a5, 0(a5);
	bne	a5,zero,.L62
	la a5, _ZL5DRegs; lbu a5, 0(a5);
	andi	a5,a5,3
	li	a4,2
	beq	a5,a4,.L64
	li	a4,3
	beq	a5,a4,.L65
	li	a4,1
	beq	a5,a4,.L66
	li	a0,2
	tail	_Z9setmirrori
.L62:
	ret
.L66:
	li	a0,3
	tail	_Z9setmirrori
.L64:
	li	a0,1
	tail	_Z9setmirrori
.L65:
	li	a0,0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE10:
	.size	_ZL10MMC1MIRRORv, .-_ZL10MMC1MIRRORv
	.section	.text._ZL10MMC1_writejh,"ax",@progbits
	.align	2
	.type	_ZL10MMC1_writejh, @function
_ZL10MMC1_writejh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL6lreset
	lla	s1,timestampbase
	lla	t1,timestamp
	lw	a4,0(s0)
	lw	a5,0(t1)
	lw	a3,0(s1)
	lw	t2,4(s0)
	lw	t0,4(s1)
	addi	a2,a4,2
	add	a3,a5,a3
	sltu	a4,a2,a4
	sltu	a5,a3,a5
	sw	ra,8(sp)
	.cfi_offset 1, -4
	add	a4,a4,t2
	add	a5,a5,t0
	bgtu	a4,a5,.L69
	beq	a4,a5,.L82
.L70:
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L83
	lla	a3,_ZL11BufferShift
	lbu	a5,0(a3)
	lla	a4,_ZL6Buffer
	lbu	a2,0(a4)
	andi	a1,a1,1
	sll	a1,a1,a5
	or	a1,a1,a2
	addi	a5,a5,1
	andi	a5,a5,0xff
	andi	a1,a1,0xff
	sb	a1,0(a4)
	sb	a5,0(a3)
	li	a4,5
	beq	a5,a4,.L84
.L69:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L82:
	.cfi_restore_state
	bleu	a2,a3,.L70
	j	.L69
.L84:
	srli	a0,a0,13
	addi	a0,a0,-4
	lla	a5,_ZL5DRegs
	add	a5,a5,a0
	sb	a1,0(a5)
	la a5, _ZL6Buffer; sb zero, 0(a5);
	la a5, _ZL11BufferShift; sb zero, 0(a5);
	li	a5,2
	beq	a0,a5,.L75
	bgtu	a0,a5,.L76
	beq	a0,zero,.L85
	call	_ZL7MMC1CHRv
.L79:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7MMC1PRGv
.L83:
	.cfi_restore_state
	lla	a4,_ZL5DRegs
	lbu	a5,0(a4)
	la a3, _ZL6Buffer; sb zero, 0(a3);
	la a3, _ZL11BufferShift; sb zero, 0(a3);
	ori	a5,a5,12
	sb	a5,0(a4)
	call	_ZL7MMC1PRGv
	lla	t1,timestamp
	lw	a5,0(s1)
	lw	a4,0(t1)
	lw	a3,4(s1)
	add	a4,a5,a4
	sltu	a5,a4,a5
	add	a5,a5,a3
	sw	a4,0(s0)
	sw	a5,4(s0)
	j	.L69
.L76:
	li	a5,3
	beq	a0,a5,.L79
	j	.L69
.L75:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7MMC1CHRv
.L85:
	.cfi_restore_state
	call	_ZL10MMC1MIRRORv
	call	_ZL7MMC1CHRv
	j	.L79
	.cfi_endproc
.LFE11:
	.size	_ZL10MMC1_writejh, .-_ZL10MMC1_writejh
	.section	.text._ZL12GenMMC1Powerv,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC1Powerv, @function
_ZL12GenMMC1Powerv:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	li	s0,65536
	lla	a5,_ZL6lreset
	sw	ra,8(sp)
	.cfi_offset 1, -4
	li	a3,0
	li	a4,0
	lla	a2,_ZL10MMC1_writejh
	addi	a1,s0,-1
	li	a0,32768
	sw	a3,0(a5)
	sw	a4,4(a5)
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_Z6CartBRj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a5, _ZL8WRAMSIZE; lw a5, 0(a5);
	bne	a5,zero,.L96
.L87:
	la a5, _ZL11BufferShift; sb zero, 0(a5);
	la a5, _ZL6Buffer; sb zero, 0(a5);
	li	a5,31
	la a4, _ZL5DRegs; sw a5, 0(a4);
	call	_ZL10MMC1MIRRORv
	call	_ZL7MMC1CHRv
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7MMC1PRGv
.L96:
	.cfi_restore_state
	lla	s0,_ZL4WRAM
	lw	a2,0(s0)
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	la a1, _ZL11NONBRAMSIZE; lw a1, 0(a1);
	bne	a1,zero,.L97
.L88:
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL6MAWRAMj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL6MBWRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	j	.L87
.L97:
	lw	a0,0(s0)
	li	a2,1
	call	_Z15FCEU_MemoryRandPhjb
	j	.L88
	.cfi_endproc
.LFE20:
	.size	_ZL12GenMMC1Powerv, .-_ZL12GenMMC1Powerv
	.section	.text._ZL8NWCPowerv,"ax",@progbits
	.align	2
	.type	_ZL8NWCPowerv, @function
_ZL8NWCPowerv:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL12GenMMC1Powerv
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setchr8rij
	.cfi_endproc
.LFE18:
	.size	_ZL8NWCPowerv, .-_ZL8NWCPowerv
	.section	.text._ZL12MMC1_Restorei,"ax",@progbits
	.align	2
	.type	_ZL12MMC1_Restorei, @function
_ZL12MMC1_Restorei:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL10MMC1MIRRORv
	call	_ZL7MMC1CHRv
	call	_ZL7MMC1PRGv
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a5,_ZL6lreset
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	_ZL12MMC1_Restorei, .-_ZL12MMC1_Restorei
	.section	.text._ZL10NWCIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL10NWCIRQHooki, @function
_ZL10NWCIRQHooki:
.LFB15:
	.cfi_startproc
	la a5, _ZL6NWCRec; lbu a5, 0(a5);
	andi	a5,a5,16
	bne	a5,zero,.L102
	lla	a4,_ZL11NWCIRQCount
	lw	a5,0(a4)
	li	a3,1040187392
	add	a0,a0,a5
	li	a5,469762048
	or	a5,a0,a5
	bgeu	a5,a3,.L105
	sw	a0,0(a4)
	ret
.L102:
	ret
.L105:
	li	a0,1
	la a5, _ZL11NWCIRQCount; sw zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE15:
	.size	_ZL10NWCIRQHooki, .-_ZL10NWCIRQHooki
	.section	.text._ZL10NWCPRGHookjh,"ax",@progbits
	.align	2
	.type	_ZL10NWCPRGHookjh, @function
_ZL10NWCPRGHookjh:
.LFB17:
	.cfi_startproc
	la a5, _ZL6NWCRec; lbu a5, 0(a5);
	andi	a4,a5,8
	beq	a4,zero,.L108
	andi	a1,a1,7
	ori	a1,a1,8
	tail	_Z8setprg16jj
.L108:
	srli	a1,a5,1
	andi	a1,a1,3
	li	a0,32768
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE17:
	.size	_ZL10NWCPRGHookjh, .-_ZL10NWCPRGHookjh
	.section	.text._ZL10NWCCHRHookjh,"ax",@progbits
	.align	2
	.type	_ZL10NWCCHRHookjh, @function
_ZL10NWCCHRHookjh:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	andi	a5,a1,16
	mv	s0,a1
	bne	a5,zero,.L116
.L110:
	la a5, _ZL6NWCRec; sb s0, 0(a5);
	andi	a5,s0,8
	beq	a5,zero,.L111
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7MMC1PRGv
.L111:
	.cfi_restore_state
	srli	a1,s0,1
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a1,a1,3
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L116:
	.cfi_restore_state
	li	a0,1
	la a5, _ZL11NWCIRQCount; sw zero, 0(a5);
	call	_Z12X6502_IRQEndi
	j	.L110
	.cfi_endproc
.LFE16:
	.size	_ZL10NWCCHRHookjh, .-_ZL10NWCCHRHookjh
	.section	.text._Z14Mapper105_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper105_InitP8CartInfo
	.hidden	_Z14Mapper105_InitP8CartInfo
	.type	_Z14Mapper105_InitP8CartInfo, @function
_Z14Mapper105_InitP8CartInfo:
.LFB19:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lla	a5,_ZL10NWCIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL10NWCCHRHookjh
	la a4, _ZL12MMC1CHRHook4; sw a5, 0(a4);
	lla	a5,_ZL10NWCPRGHookjh
	la a4, _ZL13MMC1PRGHook16; sw a5, 0(a4);
	lla	a5,_ZL8NWCPowerv
	lw	ra,8(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	_Z14Mapper105_InitP8CartInfo, .-_Z14Mapper105_InitP8CartInfo
	.section	.rodata._Z12Mapper1_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" >8KB external WRAM present.  Use NES 2.0 if you hack the ROM image.\n"
	.section	.text._Z12Mapper1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper1_InitP8CartInfo
	.hidden	_Z12Mapper1_InitP8CartInfo
	.type	_Z12Mapper1_InitP8CartInfo, @function
_Z12Mapper1_InitP8CartInfo:
.LFB23:
	.cfi_startproc
	lw	a5,92(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,-1008828416
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	addi	a4,a4,-919
	lw	a3,48(a0)
	mv	s0,a0
	beq	a5,a4,.L144
	bgtu	a5,a4,.L121
	li	a4,1178787840
	addi	a4,a4,-602
	beq	a5,a4,.L142
	bleu	a5,a4,.L145
	li	a4,-1413517312
	addi	a4,a4,535
	beq	a5,a4,.L142
	li	a2,-1200324608
	addi	a2,a2,-1345
	li	a4,32
	li	s1,32
	beq	a5,a2,.L120
.L123:
	lw	a5,52(s0)
	beq	a5,zero,.L146
	lw	a2,64(s0)
	lw	a3,60(s0)
	li	a4,6
	srai	a5,a2,31
	add	a3,a2,a3
	srai	s1,a3,31
	andi	s1,s1,1023
	add	s1,s1,a3
	srai	s1,s1,10
	andi	a5,a5,1023
	add	a5,a5,a2
	addi	a2,s1,-1
	srai	a5,a5,10
	bgtu	a2,a4,.L127
	mv	a4,a5
	li	a5,8
	ble	a4,a5,.L128
	li	a4,8
.L128:
	li	s1,8
	j	.L126
.L121:
	li	a4,-917147648
	addi	a4,a4,-1226
	beq	a5,a4,.L144
	bleu	a5,a4,.L147
	li	a4,-856465408
	addi	a4,a4,-1022
	beq	a5,a4,.L142
	li	a4,-76976128
	addi	a4,a4,1082
	bne	a5,a4,.L123
.L142:
	li	a4,8
	li	s1,16
.L120:
	lla	a0,.LC6
	sw	a4,0(sp)
	call	printf
	lw	a4,0(sp)
.L126:
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a3,s1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a2,256
	li	a1,512
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL11GenMMC1InitP8CartInfoiiii
.L127:
	.cfi_restore_state
	li	a4,32768
	addi	a4,a4,1023
	ble	a3,a4,.L129
	mv	a4,a5
	li	a5,32
	ble	a4,a5,.L130
.L144:
	li	a4,32
.L130:
	li	s1,32
	j	.L120
.L145:
	li	a4,722591744
	addi	a4,a4,176
	beq	a5,a4,.L142
	li	a4,1065013248
	addi	a4,a4,1045
	beq	a5,a4,.L142
	li	a4,572899328
	addi	a4,a4,527
	bne	a5,a4,.L123
	j	.L142
.L147:
	li	a4,-971497472
	addi	a4,a4,36
	bne	a5,a4,.L123
	j	.L142
.L146:
	snez	a3,a3
	slli	a4,a3,3
	li	s1,8
	j	.L126
.L129:
	mv	a4,s1
	bgt	s1,a5,.L148
.L131:
	li	a5,8192
	addi	a5,a5,1023
	bgt	a3,a5,.L120
	j	.L126
.L148:
	mv	a4,a5
	j	.L131
	.cfi_endproc
.LFE23:
	.size	_Z12Mapper1_InitP8CartInfo, .-_Z12Mapper1_InitP8CartInfo
	.section	.text._Z14Mapper155_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper155_InitP8CartInfo
	.hidden	_Z14Mapper155_InitP8CartInfo
	.type	_Z14Mapper155_InitP8CartInfo, @function
_Z14Mapper155_InitP8CartInfo:
.LFB24:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a3,8
	snez	a4,a4
	slli	a4,a4,3
	li	a2,256
	li	a1,512
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lw	ra,8(sp)
	.cfi_restore 1
	li	a5,1
	la a4, _ZL5is155; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	_Z14Mapper155_InitP8CartInfo, .-_Z14Mapper155_InitP8CartInfo
	.section	.text._Z14Mapper171_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper171_InitP8CartInfo
	.hidden	_Z14Mapper171_InitP8CartInfo
	.type	_Z14Mapper171_InitP8CartInfo, @function
_Z14Mapper171_InitP8CartInfo:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	li	a3,0
	li	a2,32
	li	a1,32
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL11GenMMC1InitP8CartInfoiiii
	lw	ra,8(sp)
	.cfi_restore 1
	li	a5,1
	la a4, _ZL5is171; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	_Z14Mapper171_InitP8CartInfo, .-_Z14Mapper171_InitP8CartInfo
	.section	.text._Z10SAROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SAROM_InitP8CartInfo
	.hidden	_Z10SAROM_InitP8CartInfo
	.type	_Z10SAROM_InitP8CartInfo, @function
_Z10SAROM_InitP8CartInfo:
.LFB26:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,8
	li	a2,64
	snez	a4,a4
	slli	a4,a4,3
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE26:
	.size	_Z10SAROM_InitP8CartInfo, .-_Z10SAROM_InitP8CartInfo
	.section	.text._Z10SBROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SBROM_InitP8CartInfo
	.hidden	_Z10SBROM_InitP8CartInfo
	.type	_Z10SBROM_InitP8CartInfo, @function
_Z10SBROM_InitP8CartInfo:
.LFB27:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE27:
	.size	_Z10SBROM_InitP8CartInfo, .-_Z10SBROM_InitP8CartInfo
	.section	.text._Z10SCROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SCROM_InitP8CartInfo
	.hidden	_Z10SCROM_InitP8CartInfo
	.type	_Z10SCROM_InitP8CartInfo, @function
_Z10SCROM_InitP8CartInfo:
.LFB28:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE28:
	.size	_Z10SCROM_InitP8CartInfo, .-_Z10SCROM_InitP8CartInfo
	.section	.text._Z10SEROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SEROM_InitP8CartInfo
	.hidden	_Z10SEROM_InitP8CartInfo
	.type	_Z10SEROM_InitP8CartInfo, @function
_Z10SEROM_InitP8CartInfo:
.LFB29:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,32
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE29:
	.size	_Z10SEROM_InitP8CartInfo, .-_Z10SEROM_InitP8CartInfo
	.section	.text._Z10SGROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SGROM_InitP8CartInfo
	.hidden	_Z10SGROM_InitP8CartInfo
	.type	_Z10SGROM_InitP8CartInfo, @function
_Z10SGROM_InitP8CartInfo:
.LFB30:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE30:
	.size	_Z10SGROM_InitP8CartInfo, .-_Z10SGROM_InitP8CartInfo
	.section	.text._Z10SKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SKROM_InitP8CartInfo
	.hidden	_Z10SKROM_InitP8CartInfo
	.type	_Z10SKROM_InitP8CartInfo, @function
_Z10SKROM_InitP8CartInfo:
.LFB31:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,8
	li	a2,64
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE31:
	.size	_Z10SKROM_InitP8CartInfo, .-_Z10SKROM_InitP8CartInfo
	.section	.text._Z10SLROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SLROM_InitP8CartInfo
	.hidden	_Z10SLROM_InitP8CartInfo
	.type	_Z10SLROM_InitP8CartInfo, @function
_Z10SLROM_InitP8CartInfo:
.LFB32:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE32:
	.size	_Z10SLROM_InitP8CartInfo, .-_Z10SLROM_InitP8CartInfo
	.section	.text._Z11SL1ROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SL1ROM_InitP8CartInfo
	.hidden	_Z11SL1ROM_InitP8CartInfo
	.type	_Z11SL1ROM_InitP8CartInfo, @function
_Z11SL1ROM_InitP8CartInfo:
.LFB44:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE44:
	.size	_Z11SL1ROM_InitP8CartInfo, .-_Z11SL1ROM_InitP8CartInfo
	.section	.text._Z11SL2ROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SL2ROM_InitP8CartInfo
	.hidden	_Z11SL2ROM_InitP8CartInfo
	.type	_Z11SL2ROM_InitP8CartInfo, @function
_Z11SL2ROM_InitP8CartInfo:
.LFB34:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE34:
	.size	_Z11SL2ROM_InitP8CartInfo, .-_Z11SL2ROM_InitP8CartInfo
	.section	.text._Z10SFROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SFROM_InitP8CartInfo
	.hidden	_Z10SFROM_InitP8CartInfo
	.type	_Z10SFROM_InitP8CartInfo, @function
_Z10SFROM_InitP8CartInfo:
.LFB46:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE46:
	.size	_Z10SFROM_InitP8CartInfo, .-_Z10SFROM_InitP8CartInfo
	.section	.text._Z10SHROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SHROM_InitP8CartInfo
	.hidden	_Z10SHROM_InitP8CartInfo
	.type	_Z10SHROM_InitP8CartInfo, @function
_Z10SHROM_InitP8CartInfo:
.LFB48:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE48:
	.size	_Z10SHROM_InitP8CartInfo, .-_Z10SHROM_InitP8CartInfo
	.section	.text._Z10SNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SNROM_InitP8CartInfo
	.hidden	_Z10SNROM_InitP8CartInfo
	.type	_Z10SNROM_InitP8CartInfo, @function
_Z10SNROM_InitP8CartInfo:
.LFB37:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,8
	li	a2,0
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE37:
	.size	_Z10SNROM_InitP8CartInfo, .-_Z10SNROM_InitP8CartInfo
	.section	.text._Z10SOROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SOROM_InitP8CartInfo
	.hidden	_Z10SOROM_InitP8CartInfo
	.type	_Z10SOROM_InitP8CartInfo, @function
_Z10SOROM_InitP8CartInfo:
.LFB38:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,16
	li	a2,0
	snez	a4,a4
	slli	a4,a4,3
	li	a1,256
	tail	_ZL11GenMMC1InitP8CartInfoiiii
	.cfi_endproc
.LFE38:
	.size	_Z10SOROM_InitP8CartInfo, .-_Z10SOROM_InitP8CartInfo
	.section	.sbss._ZL6NWCRec,"aw",@nobits
	.type	_ZL6NWCRec, @object
	.size	_ZL6NWCRec, 1
_ZL6NWCRec:
	.zero	1
	.section	.sbss._ZL11NWCIRQCount,"aw",@nobits
	.align	2
	.type	_ZL11NWCIRQCount, @object
	.size	_ZL11NWCIRQCount, 4
_ZL11NWCIRQCount:
	.zero	4
	.section	.sbss._ZL6lreset,"aw",@nobits
	.align	3
	.type	_ZL6lreset, @object
	.size	_ZL6lreset, 8
_ZL6lreset:
	.zero	8
	.section	.sbss._ZL5is171,"aw",@nobits
	.align	2
	.type	_ZL5is171, @object
	.size	_ZL5is171, 4
_ZL5is171:
	.zero	4
	.section	.sbss._ZL5is155,"aw",@nobits
	.align	2
	.type	_ZL5is155, @object
	.size	_ZL5is155, 4
_ZL5is155:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL13MMC1PRGHook16,"aw",@nobits
	.align	2
	.type	_ZL13MMC1PRGHook16, @object
	.size	_ZL13MMC1PRGHook16, 4
_ZL13MMC1PRGHook16:
	.zero	4
	.section	.sbss._ZL12MMC1CHRHook4,"aw",@nobits
	.align	2
	.type	_ZL12MMC1CHRHook4, @object
	.size	_ZL12MMC1CHRHook4, 4
_ZL12MMC1CHRHook4:
	.zero	4
	.section	.sbss._ZL11NONBRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL11NONBRAMSIZE, @object
	.size	_ZL11NONBRAMSIZE, 4
_ZL11NONBRAMSIZE:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL11BufferShift,"aw",@nobits
	.type	_ZL11BufferShift, @object
	.size	_ZL11BufferShift, 1
_ZL11BufferShift:
	.zero	1
	.section	.sbss._ZL6Buffer,"aw",@nobits
	.type	_ZL6Buffer, @object
	.size	_ZL6Buffer, 1
_ZL6Buffer:
	.zero	1
	.section	.sbss._ZL5DRegs,"aw",@nobits
	.align	2
	.type	_ZL5DRegs, @object
	.size	_ZL5DRegs, 4
_ZL5DRegs:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
