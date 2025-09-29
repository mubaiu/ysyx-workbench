#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emu2413.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.setInstrument,"ax",@progbits
	.align	2
	.type	setInstrument, @function
setInstrument:
.LFB38:
	.cfi_startproc
	addi	a5,a1,28
	slli	a5,a5,2
	add	a5,a0,a5
	sw	a2,12(a5)
	beq	a2,zero,.L2
	addi	a5,a2,-1
	slli	a5,a5,3
	lla	a4,default_inst
	add	a5,a5,a4
	lbu	a2,0(a5)
.L3:
	slli	a3,a1,1
	slli	a4,a1,6
	sub	a4,a4,a3
	slli	a4,a4,2
	add	a4,a0,a4
	srli	a2,a2,7
	sw	a2,212(a4)
	lbu	a6,0(a5)
	ori	a1,a3,1
	slli	a2,a1,5
	srli	a3,a6,6
	andi	a3,a3,1
	sw	a3,216(a4)
	lbu	a3,0(a5)
	sub	a2,a2,a1
	slli	a2,a2,2
	srli	a3,a3,5
	andi	a3,a3,1
	sw	a3,180(a4)
	lbu	a3,0(a5)
	add	a0,a0,a2
	srli	a3,a3,4
	andi	a3,a3,1
	sw	a3,204(a4)
	lbu	a3,0(a5)
	andi	a3,a3,15
	sw	a3,184(a4)
	lbu	a3,1(a5)
	srli	a3,a3,7
	sw	a3,212(a0)
	lbu	a3,1(a5)
	srli	a3,a3,6
	andi	a3,a3,1
	sw	a3,216(a0)
	lbu	a3,1(a5)
	srli	a3,a3,5
	andi	a3,a3,1
	sw	a3,180(a0)
	lbu	a3,1(a5)
	srli	a3,a3,4
	andi	a3,a3,1
	sw	a3,204(a0)
	lbu	a3,1(a5)
	andi	a3,a3,15
	sw	a3,184(a0)
	lbu	a3,2(a5)
	srli	a3,a3,6
	sw	a3,208(a4)
	lbu	a3,2(a5)
	andi	a3,a3,63
	sw	a3,172(a4)
	lbu	a3,3(a5)
	srli	a3,a3,6
	sw	a3,208(a0)
	lbu	a3,3(a5)
	srli	a3,a3,4
	andi	a3,a3,1
	sw	a3,220(a0)
	lbu	a3,3(a5)
	srli	a3,a3,3
	andi	a3,a3,1
	sw	a3,220(a4)
	lbu	a3,3(a5)
	andi	a3,a3,7
	sw	a3,176(a4)
	lbu	a3,4(a5)
	srli	a3,a3,4
	sw	a3,188(a4)
	lbu	a3,4(a5)
	andi	a3,a3,15
	sw	a3,192(a4)
	lbu	a3,5(a5)
	srli	a3,a3,4
	sw	a3,188(a0)
	lbu	a3,5(a5)
	andi	a3,a3,15
	sw	a3,192(a0)
	lbu	a3,6(a5)
	srli	a3,a3,4
	sw	a3,196(a4)
	lbu	a3,6(a5)
	andi	a3,a3,15
	sw	a3,200(a4)
	lbu	a4,7(a5)
	srli	a4,a4,4
	sw	a4,196(a0)
	lbu	a5,7(a5)
	andi	a5,a5,15
	sw	a5,200(a0)
	ret
.L2:
	lbu	a2,46(a0)
	addi	a5,a0,46
	j	.L3
	.cfi_endproc
.LFE38:
	.size	setInstrument, .-setInstrument
	.section	.rodata.internal_refresh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/boards/emu2413.c"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text.internal_refresh,"ax",@progbits
	.align	2
	.type	internal_refresh, @function
internal_refresh:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,534
	lla	a1,.LC0
	lla	a0,.LC1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE21:
	.size	internal_refresh, .-internal_refresh
	.section	.text.OPLL_delete,"ax",@progbits
	.align	2
	.globl	OPLL_delete
	.hidden	OPLL_delete
	.type	OPLL_delete, @function
OPLL_delete:
.LFB24:
	.cfi_startproc
	tail	free
	.cfi_endproc
.LFE24:
	.size	OPLL_delete, .-OPLL_delete
	.section	.text.OPLL_forceRefresh,"ax",@progbits
	.align	2
	.globl	OPLL_forceRefresh
	.hidden	OPLL_forceRefresh
	.type	OPLL_forceRefresh, @function
OPLL_forceRefresh:
.LFB26:
	.cfi_startproc
	beq	a0,zero,.L8
	addi	a5,a0,220
	lla	a3,waveform
	addi	a0,a0,1708
.L10:
	lw	a4,0(a5)
	sw	zero,28(a5)
	sw	zero,56(a5)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	sw	zero,52(a5)
	sw	zero,68(a5)
	sw	a4,20(a5)
	addi	a5,a5,124
	bne	a5,a0,.L10
.L8:
	ret
	.cfi_endproc
.LFE26:
	.size	OPLL_forceRefresh, .-OPLL_forceRefresh
	.section	.text.OPLL_set_rate,"ax",@progbits
	.align	2
	.globl	OPLL_set_rate
	.hidden	OPLL_set_rate
	.type	OPLL_set_rate, @function
OPLL_set_rate:
.LFB27:
	.cfi_startproc
	lw	a5,120(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L16
	li	a1,49152
	addi	a1,a1,564
.L16:
	la a5, rate; sw a1, 0(a5);
	call	internal_refresh
	.cfi_endproc
.LFE27:
	.size	OPLL_set_rate, .-OPLL_set_rate
	.section	.text.OPLL_set_quality,"ax",@progbits
	.align	2
	.globl	OPLL_set_quality
	.hidden	OPLL_set_quality
	.type	OPLL_set_quality, @function
OPLL_set_quality:
.LFB28:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	sw	a1,120(a0)
	la a1, rate; lw a1, 0(a1);
	call	OPLL_set_rate
	.cfi_endproc
.LFE28:
	.size	OPLL_set_quality, .-OPLL_set_quality
	.section	.text.OPLL_fillbuf,"ax",@progbits
	.align	2
	.globl	OPLL_fillbuf
	.hidden	OPLL_fillbuf
	.type	OPLL_fillbuf, @function
OPLL_fillbuf:
.LFB35:
	.cfi_startproc
	ble	a2,zero,.L51
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s1,40(sp)
	li	t1,262144
	.cfi_offset 9, -8
	mv	s1,a3
	li	a3,65536
	sw	s0,44(sp)
	sw	s2,36(sp)
	sw	s3,32(sp)
	sw	s4,28(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	.cfi_offset 8, -4
	.cfi_offset 18, -12
	.cfi_offset 19, -16
	.cfi_offset 20, -20
	.cfi_offset 21, -24
	.cfi_offset 22, -28
	.cfi_offset 23, -32
	.cfi_offset 24, -36
	.cfi_offset 25, -40
	.cfi_offset 26, -44
	addi	s3,a0,180
	addi	t3,a0,1668
	addi	s5,a0,228
	addi	a3,a3,-1
	addi	t1,t1,-1
	li	a6,3
	li	s0,4
	li	t2,127
	li	a7,1
	li	t5,6
	li	t6,2
	li	s2,15
	lla	t0,SL.0
	li	t4,255
	li	s4,32768
.L24:
	lw	a4,104(a0)
	lw	a5,112(a0)
	sw	zero,116(a0)
	and	a4,a4,a3
	and	a5,a5,a3
	sw	a5,112(a0)
	sw	a4,104(a0)
	sw	zero,108(a0)
	mv	a5,s3
.L39:
	lw	s6,36(a5)
	lw	a4,64(a5)
	bne	s6,zero,.L25
	lw	s6,68(a5)
	add	a4,a4,s6
.L25:
	and	a4,a4,t1
	lw	s6,100(a5)
	srli	s7,a4,9
	sw	a4,64(a5)
	sw	s7,72(a5)
	beq	s6,a6,.L26
	bgt	s6,a6,.L27
	beq	s6,a7,.L28
	bne	s6,t6,.L30
	lw	s6,16(a5)
	lw	a4,104(a5)
	lw	s7,108(a5)
	slli	s6,s6,2
	add	s6,t0,s6
	lw	s8,0(s6)
	add	s6,a4,s7
	sw	s6,104(a5)
	bltu	s6,s8,.L37
	lw	s6,0(a5)
	sw	s8,104(a5)
	beq	s6,zero,.L54
	sw	a6,100(a5)
	sw	zero,108(a5)
.L37:
	srli	a4,a4,15
.L33:
	lw	s6,92(a5)
	add	a4,a4,s6
	slli	a4,a4,1
	bleu	a4,t4,.L38
	li	a4,255
.L38:
	sw	a4,112(a5)
	addi	a5,a5,124
	bne	t3,a5,.L39
	lw	s8,1660(a0)
	mv	s6,s5
	li	s7,0
	li	a4,0
.L41:
	slli	s9,a4,1
	ori	s9,s9,1
	slli	a5,s9,5
	sub	a5,a5,s9
	sll	s9,a7,a4
	slli	a5,a5,2
	and	s9,s9,s8
	add	a5,a0,a5
	addi	a4,a4,1
	bne	s9,zero,.L40
	lw	s9,280(a5)
	beq	s9,t5,.L40
	lw	s9,4(s6)
	sw	zero,4(s6)
	srai	s10,s9,1
	sw	s10,0(s6)
	sw	s9,8(s6)
	lw	s9,232(a5)
	sw	zero,232(a5)
	srai	s10,s9,1
	sw	s9,236(a5)
	add	s7,s7,s10
.L40:
	addi	s6,s6,248
	bne	a4,t5,.L41
	slli	s7,s7,16
	lw	a5,0(a1)
	srai	s7,s7,16
	add	s7,s7,s4
	sll	s7,s7,s1
	add	a5,a5,s7
	sw	a5,0(a1)
	addi	a2,a2,-1
	addi	a1,a1,4
	bne	a2,zero,.L24
	lw	s0,44(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,40(sp)
	.cfi_restore 9
	lw	s2,36(sp)
	.cfi_restore 18
	lw	s3,32(sp)
	.cfi_restore 19
	lw	s4,28(sp)
	.cfi_restore 20
	lw	s5,24(sp)
	.cfi_restore 21
	lw	s6,20(sp)
	.cfi_restore 22
	lw	s7,16(sp)
	.cfi_restore 23
	lw	s8,12(sp)
	.cfi_restore 24
	lw	s9,8(sp)
	.cfi_restore 25
	lw	s10,4(sp)
	.cfi_restore 26
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	.cfi_restore_state
	addi	s6,s6,-4
	bgtu	s6,a7,.L30
	lw	s7,104(a5)
	lw	s6,108(a5)
	srli	a4,s7,15
	add	s6,s6,s7
	sw	s6,104(a5)
	bleu	a4,t2,.L33
	sw	t5,100(a5)
.L30:
	li	a4,127
	j	.L33
.L28:
	lw	a4,104(a5)
	lw	s6,108(a5)
	add	a4,a4,s6
	sw	a4,104(a5)
	slli	s6,a4,9
	blt	s6,zero,.L32
	lw	a4,8(a5)
	beq	a4,s2,.L32
	li	a4,0
	j	.L33
.L32:
	sw	zero,104(a5)
	sw	t6,100(a5)
	sw	zero,108(a5)
	li	a4,0
	j	.L33
.L26:
	lw	s6,0(a5)
	lw	a4,104(a5)
	bne	s6,zero,.L37
.L54:
	sw	s0,100(a5)
	sw	zero,108(a5)
	j	.L37
.L51:
	.cfi_def_cfa_offset 0
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	ret
	.cfi_endproc
.LFE35:
	.size	OPLL_fillbuf, .-OPLL_fillbuf
	.section	.text.OPLL_setMask,"ax",@progbits
	.align	2
	.globl	OPLL_setMask
	.hidden	OPLL_setMask
	.type	OPLL_setMask, @function
OPLL_setMask:
.LFB36:
	.cfi_startproc
	mv	a5,a0
	beq	a0,zero,.L57
	lw	a0,1660(a0)
	sw	a1,1660(a5)
	ret
.L57:
	li	a0,0
	ret
	.cfi_endproc
.LFE36:
	.size	OPLL_setMask, .-OPLL_setMask
	.section	.text.OPLL_toggleMask,"ax",@progbits
	.align	2
	.globl	OPLL_toggleMask
	.hidden	OPLL_toggleMask
	.type	OPLL_toggleMask, @function
OPLL_toggleMask:
.LFB37:
	.cfi_startproc
	mv	a5,a0
	beq	a0,zero,.L60
	lw	a0,1660(a0)
	xor	a1,a0,a1
	sw	a1,1660(a5)
	ret
.L60:
	li	a0,0
	ret
	.cfi_endproc
.LFE37:
	.size	OPLL_toggleMask, .-OPLL_toggleMask
	.section	.text.OPLL_writeReg,"ax",@progbits
	.align	2
	.globl	OPLL_writeReg
	.hidden	OPLL_writeReg
	.type	OPLL_writeReg, @function
OPLL_writeReg:
.LFB39:
	.cfi_startproc
	andi	a1,a1,63
	li	a5,53
	bgtu	a1,a5,.L117
	lla	a4,.L64
	slli	a5,a1,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	add	a5,a5,a4
	sw	s2,16(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	mv	s2,a2
	sw	s1,20(sp)
	mv	s0,a0
	andi	a2,a2,255
	.cfi_offset 9, -12
	jr	a5
	.section	.rodata.OPLL_writeReg,"a",@progbits
	.align	2
	.align	2
.L64:
	.word	.L74-.L64
	.word	.L73-.L64
	.word	.L72-.L64
	.word	.L71-.L64
	.word	.L70-.L64
	.word	.L69-.L64
	.word	.L68-.L64
	.word	.L67-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L66-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L65-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L61-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.word	.L63-.L64
	.section	.text.OPLL_writeReg
.L122:
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
.L61:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L117:
	ret
.L63:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	addi	s1,a1,-48
	add	a5,a0,s1
	sb	s2,40(a5)
	srli	a2,a2,4
	mv	a1,s1
	call	setInstrument
	slli	a2,s1,1
	ori	a3,a2,1
	slli	a5,s1,6
	slli	a4,a3,5
	sub	a5,a5,a2
	sub	a4,a4,a3
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a4,2
	add	s0,s0,a4
	lw	a4,220(a5)
	lw	a2,220(s0)
	lla	a3,waveform
	slli	a4,a4,2
	add	a4,a3,a4
	slli	a2,a2,2
	lw	a1,0(a4)
	slli	s2,s2,2
	add	a3,a3,a2
	lw	a4,0(a3)
	andi	s2,s2,60
	sw	s2,264(s0)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a1,240(a5)
	sw	zero,288(a5)
	sw	zero,248(s0)
	sw	zero,272(s0)
	sw	zero,276(s0)
	sw	a4,240(s0)
	sw	zero,288(s0)
	j	.L61
.L66:
	addi	a1,a1,-16
	slli	a0,a1,1
	ori	a3,a0,1
	slli	a4,a1,6
	slli	a5,a3,5
	sub	a4,a4,a0
	add	a1,s0,a1
	sub	a5,a5,a3
	slli	a4,a4,2
	sb	s2,28(a1)
	add	a4,s0,a4
	slli	a5,a5,2
	lw	a0,220(a4)
	add	a5,s0,a5
	lbu	a3,34(a1)
	lw	a7,220(a5)
	lla	a6,waveform
	slli	a1,a0,2
	add	a1,a6,a1
	slli	a3,a3,8
	slli	a0,a7,2
	lw	a1,0(a1)
	andi	a3,a3,256
	add	a6,a6,a0
	or	a3,a3,a2
	lw	a2,0(a6)
	sw	a3,256(a5)
	sw	a3,256(a4)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a1,240(a4)
	sw	zero,288(a4)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a2,240(a5)
	sw	zero,288(a5)
	j	.L61
.L65:
	addi	a1,a1,-32
	slli	a6,a1,1
	add	a7,a0,a1
	ori	t1,a6,1
	lbu	t3,28(a7)
	slli	a5,t1,5
	slli	a0,a2,8
	sub	a3,a5,t1
	slli	a4,a1,6
	andi	a0,a0,256
	slli	a3,a3,2
	sub	a4,a4,a6
	sb	s2,34(a7)
	add	a3,s0,a3
	add	a0,a0,t3
	slli	a4,a4,2
	add	a4,s0,a4
	sw	a0,256(a3)
	srli	a7,a2,1
	sw	a0,256(a4)
	andi	a0,a7,7
	sw	a0,260(a3)
	lw	a7,224(a4)
	srli	a2,a2,5
	sw	a0,260(a4)
	andi	a2,a2,1
	sw	a2,268(a3)
	beq	a7,zero,.L92
	sw	a2,268(a4)
.L92:
	andi	s2,s2,16
	bne	s2,zero,.L123
	addi	a4,a6,13
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a4,8(a4)
	beq	a4,zero,.L97
	sub	a4,a5,t1
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a2,280(a4)
	li	a3,1
	bne	a2,a3,.L98
	sw	zero,284(a4)
.L98:
	sub	a4,a5,t1
	slli	a4,a4,2
	add	a4,s0,a4
	li	a3,5
	sw	a3,280(a4)
.L97:
	li	a7,0
	slli	a4,a6,5
.L96:
	sub	a4,a4,a6
	slli	a4,a4,2
	sub	a5,a5,t1
	add	a4,s0,a4
	slli	a5,a5,2
	add	a5,s0,a5
	lw	a3,220(a4)
	lw	a0,220(a5)
	lla	a2,waveform
	slli	a3,a3,2
	add	a3,a2,a3
	addi	a1,a1,36
	slli	a0,a0,2
	lw	a6,0(a3)
	slli	a1,a1,2
	add	a2,a2,a0
	lw	a3,0(a2)
	add	a1,s0,a1
	sw	a7,4(a1)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a6,240(a4)
	sw	zero,288(a4)
	sw	a3,240(a5)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	zero,288(a5)
	addi	a3,s0,34
	addi	a5,s0,56
	addi	s0,s0,104
.L99:
	lbu	a4,0(a3)
	addi	a5,a5,8
	addi	a3,a3,1
	andi	a4,a4,16
	sw	a4,-4(a5)
	sw	a4,-8(a5)
	bne	a5,s0,.L99
	j	.L61
.L74:
	sw	s3,12(sp)
	sw	s4,8(sp)
	sb	s2,46(a0)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	s3,a0,248
	addi	s2,a0,124
	li	s1,0
	li	s4,6
	j	.L76
.L75:
	addi	s1,s1,1
	addi	s2,s2,4
	addi	s3,s3,248
	beq	s1,s4,.L122
.L76:
	lw	a5,0(s2)
	bne	a5,zero,.L75
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	sw	zero,0(s3)
	sw	zero,28(s3)
	sw	zero,40(s3)
	j	.L75
.L72:
	.cfi_restore 19
	.cfi_restore 20
	sw	s3,12(sp)
	sw	s4,8(sp)
	sb	s2,48(a0)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	s3,a0,272
	addi	s2,a0,124
	li	s1,0
	li	s4,6
	j	.L81
.L80:
	addi	s1,s1,1
	addi	s2,s2,4
	addi	s3,s3,248
	beq	s1,s4,.L122
.L81:
	lw	a5,0(s2)
	bne	a5,zero,.L80
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	sw	zero,0(s3)
	j	.L80
.L71:
	.cfi_restore 19
	.cfi_restore 20
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sb	s2,49(a0)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	addi	s3,a0,220
	addi	s2,a0,124
	li	s1,0
	lla	s5,waveform
	li	s4,6
	j	.L83
.L82:
	addi	s1,s1,1
	addi	s2,s2,4
	addi	s3,s3,248
	beq	s1,s4,.L124
.L83:
	lw	a5,0(s2)
	bne	a5,zero,.L82
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	lw	a3,0(s3)
	add	a5,s0,a5
	lw	a4,220(a5)
	slli	a3,a3,2
	add	a3,s5,a3
	slli	a4,a4,2
	lw	a3,0(a3)
	add	a4,s5,a4
	lw	a4,0(a4)
	sw	a3,20(s3)
	sw	a4,240(a5)
	j	.L82
.L70:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	sw	s3,12(sp)
	sw	s4,8(sp)
	sb	s2,50(a0)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	s3,a0,288
	addi	s2,a0,124
	li	s1,0
	li	s4,6
	j	.L85
.L84:
	addi	s1,s1,1
	addi	s2,s2,4
	addi	s3,s3,248
	beq	s1,s4,.L122
.L85:
	lw	a5,0(s2)
	bne	a5,zero,.L84
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	sw	zero,0(s3)
	j	.L84
.L69:
	.cfi_restore 19
	.cfi_restore 20
	sw	s3,12(sp)
	sb	s2,51(a0)
	li	s1,0
	addi	s2,a0,124
	.cfi_offset 19, -20
	li	s3,6
	j	.L87
.L86:
	addi	s1,s1,1
	addi	s2,s2,4
	beq	s1,s3,.L121
.L87:
	lw	a5,0(s2)
	bne	a5,zero,.L86
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,s0,a5
	sw	zero,288(a5)
	j	.L86
.L68:
	.cfi_restore 19
	sw	s3,12(sp)
	sw	s4,8(sp)
	sb	s2,52(a0)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	s3,a0,288
	addi	s2,a0,124
	li	s1,0
	li	s4,6
	j	.L89
.L88:
	addi	s1,s1,1
	addi	s2,s2,4
	addi	s3,s3,248
	beq	s1,s4,.L122
.L89:
	lw	a5,0(s2)
	bne	a5,zero,.L88
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	sw	zero,0(s3)
	j	.L88
.L67:
	.cfi_restore 19
	.cfi_restore 20
	sw	s3,12(sp)
	sb	s2,53(a0)
	li	s1,0
	addi	s2,a0,124
	.cfi_offset 19, -20
	li	s3,6
	j	.L91
.L90:
	addi	s1,s1,1
	addi	s2,s2,4
	beq	s1,s3,.L121
.L91:
	lw	a5,0(s2)
	bne	a5,zero,.L90
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,s0,a5
	sw	zero,288(a5)
	j	.L90
.L73:
	.cfi_restore 19
	sw	s3,12(sp)
	.cfi_offset 19, -20
	sb	s2,47(a0)
	li	s1,0
	addi	s2,a0,124
	li	s3,6
	j	.L78
.L77:
	addi	s1,s1,1
	addi	s2,s2,4
	beq	s1,s3,.L121
.L78:
	lw	a5,0(s2)
	bne	a5,zero,.L77
	li	a2,0
	mv	a1,s1
	mv	a0,s0
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,s0,a5
	sw	zero,248(a5)
	sw	zero,276(a5)
	sw	zero,288(a5)
	j	.L77
.L121:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L124:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	j	.L61
.L123:
	slli	a3,a1,3
	add	a3,s0,a3
	lw	a2,56(a3)
	slli	a4,a6,5
	bne	a2,zero,.L94
	sub	a2,a4,a6
	slli	a2,a2,2
	add	a2,s0,a2
	li	a0,1
	sw	a0,280(a2)
	sw	zero,284(a2)
	sw	zero,244(a2)
.L94:
	lw	a3,60(a3)
	bne	a3,zero,.L95
	sub	a3,a5,t1
	slli	a3,a3,2
	add	a3,s0,a3
	li	a2,1
	sw	a2,280(a3)
	sw	zero,284(a3)
	sw	zero,244(a3)
.L95:
	li	a7,1
	j	.L96
	.cfi_endproc
.LFE39:
	.size	OPLL_writeReg, .-OPLL_writeReg
	.globl	__udivsi3
	.section	.text.OPLL_reset,"ax",@progbits
	.align	2
	.globl	OPLL_reset
	.hidden	OPLL_reset
	.type	OPLL_reset, @function
OPLL_reset:
.LFB25:
	.cfi_startproc
	beq	a0,zero,.L135
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s2,0(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	mv	s1,a0
	sw	zero,0(a0)
	sw	zero,4(a0)
	sw	zero,104(a0)
	sw	zero,112(a0)
	sw	zero,1660(a0)
	addi	a5,a0,224
	li	a4,0
	lla	a0,fullsintable
	li	a1,4194304
	li	a2,12
.L127:
	andi	a3,a4,1
	sw	a3,0(a5)
	sw	a0,16(a5)
	sw	zero,20(a5)
	sw	zero,24(a5)
	sw	zero,8(a5)
	sw	zero,12(a5)
	sw	zero,4(a5)
	sw	zero,56(a5)
	sw	a1,60(a5)
	sw	zero,64(a5)
	sw	zero,52(a5)
	sw	zero,48(a5)
	sw	zero,44(a5)
	sw	zero,32(a5)
	sw	zero,36(a5)
	sw	zero,40(a5)
	sw	zero,28(a5)
	sw	zero,68(a5)
	addi	a4,a4,1
	addi	a5,a5,124
	bne	a4,a2,.L127
	sw	zero,148(s1)
	sw	zero,152(s1)
	sw	zero,156(s1)
	sw	zero,160(s1)
	sw	zero,164(s1)
	sw	zero,168(s1)
	li	s0,0
	li	s2,64
.L128:
	mv	a1,s0
	li	a2,0
	mv	a0,s1
	addi	s0,s0,1
	call	OPLL_writeReg
	bne	s0,s2,.L128
	la a1, rate; lw a1, 0(a1);
	li	a0,-2147483648
	call	__udivsi3
	sw	a0,8(s1)
	li	a1,72
	la a0, clk; lw a0, 0(a0);
	call	__udivsi3
	mv	a1,a0
	li	a0,-2147483648
	call	__udivsi3
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	a0,16(s1)
	sw	zero,12(s1)
	lw	s2,0(sp)
	.cfi_restore 18
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L135:
	ret
	.cfi_endproc
.LFE25:
	.size	OPLL_reset, .-OPLL_reset
	.section	.text.OPLL_new,"ax",@progbits
	.align	2
	.globl	OPLL_new
	.hidden	OPLL_new
	.type	OPLL_new, @function
OPLL_new:
.LFB23:
	.cfi_startproc
	lla	a4,clk
	lw	a3,0(a4)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	bne	a0,a3,.L146
	lla	a5,rate
	lw	a4,0(a5)
	bne	a1,a4,.L147
	li	a0,1664
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L138
	li	a2,1664
	li	a1,0
	call	memset
	mv	a0,s0
	sw	zero,1660(s0)
	call	OPLL_reset
.L138:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L146:
	.cfi_restore_state
	mv	a5,a0
	li	a2,260
	lla	a1,.LC0
	lla	a0,.LC1
	sw	a5,0(a4)
	call	printf
	li	a0,1
	call	halt
.L147:
	sw	a1,0(a5)
	call	internal_refresh
	.cfi_endproc
.LFE23:
	.size	OPLL_new, .-OPLL_new
	.section	.text.OPLL_writeIO,"ax",@progbits
	.align	2
	.globl	OPLL_writeIO
	.hidden	OPLL_writeIO
	.type	OPLL_writeIO, @function
OPLL_writeIO:
.LFB40:
	.cfi_startproc
	andi	a1,a1,1
	mv	a5,a0
	bne	a1,zero,.L150
	sw	a2,0(a5)
	ret
.L150:
	lw	a1,0(a0)
	tail	OPLL_writeReg
	.cfi_endproc
.LFE40:
	.size	OPLL_writeIO, .-OPLL_writeIO
	.section	.rodata.SL.0,"a"
	.align	2
	.type	SL.0, @object
	.size	SL.0, 64
SL.0:
	.word	0
	.word	262144
	.word	524288
	.word	786432
	.word	1048576
	.word	1310720
	.word	1572864
	.word	1835008
	.word	2097152
	.word	2359296
	.word	2621440
	.word	2883584
	.word	3145728
	.word	3407872
	.word	3670016
	.word	4194304
	.section	.srodata.waveform,"a"
	.align	2
	.type	waveform, @object
	.size	waveform, 8
waveform:
	.word	fullsintable
	.word	halfsintable
	.section	.bss.halfsintable,"aw",@nobits
	.align	2
	.type	halfsintable, @object
	.size	halfsintable, 1024
halfsintable:
	.zero	1024
	.section	.bss.fullsintable,"aw",@nobits
	.align	2
	.type	fullsintable, @object
	.size	fullsintable, 1024
fullsintable:
	.zero	1024
	.section	.sdata.rate,"aw"
	.align	2
	.type	rate, @object
	.size	rate, 4
rate:
	.word	3354932
	.section	.sdata.clk,"aw"
	.align	2
	.type	clk, @object
	.size	clk, 4
clk:
	.word	844451141
	.section	.rodata.default_inst,"a"
	.align	2
	.type	default_inst, @object
	.size	default_inst, 120
default_inst:
	.ascii	"\003!\005\006\350\201B'"
	.ascii	"\023A\024\r\330\366#\022"
	.ascii	"\021\021\b\b\372\262 \022"
	.ascii	"1a\f\007\250da'"
	.ascii	"2!\036\006\341v\001("
	.string	"\002\001\006"
	.ascii	"\243\342\364\364"
	.ascii	"!a\035\007\202\201\021\007"
	.ascii	"#!\"\027\242r\001\027"
	.string	"5\021%"
	.ascii	"@sr\001"
	.ascii	"\265\001\017\017\250\245Q\002"
	.ascii	"\027\301$\007\370\370\"\022"
	.ascii	"q#\021\006et\030\026"
	.ascii	"\001\002\323\005\311\225\003\002"
	.string	"ac\f"
	.ascii	"\224\3003\366"
	.string	"!r\r"
	.ascii	"\301\325V\006"
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
