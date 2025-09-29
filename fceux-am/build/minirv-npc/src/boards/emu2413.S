#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"emu2413.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	lla	a4,default_inst
	slli	a5,a5,3
	add	a5,a5,a4
	lbu	a4,0(a5)
.L3:
	slli	a2,a1,1
	slli	a1,a1,6
	sub	a1,a1,a2
	slli	a1,a1,2
	add	a1,a0,a1
	srli	a4,a4,7
	sw	a4,212(a1)
	lbu	a4,0(a5)
	ori	a2,a2,1
	slli	a3,a2,5
	srli	a4,a4,6
	andi	a4,a4,1
	sw	a4,216(a1)
	lbu	a4,0(a5)
	sub	a3,a3,a2
	slli	a3,a3,2
	srli	a4,a4,5
	andi	a4,a4,1
	sw	a4,180(a1)
	lbu	a4,0(a5)
	add	a0,a0,a3
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,204(a1)
	lbu	a4,0(a5)
	andi	a4,a4,15
	sw	a4,184(a1)
	lbu	a4,1(a5)
	srli	a4,a4,7
	sw	a4,212(a0)
	lbu	a4,1(a5)
	srli	a4,a4,6
	andi	a4,a4,1
	sw	a4,216(a0)
	lbu	a4,1(a5)
	srli	a4,a4,5
	andi	a4,a4,1
	sw	a4,180(a0)
	lbu	a4,1(a5)
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,204(a0)
	lbu	a4,1(a5)
	andi	a4,a4,15
	sw	a4,184(a0)
	lbu	a4,2(a5)
	srli	a4,a4,6
	sw	a4,208(a1)
	lbu	a4,2(a5)
	andi	a4,a4,63
	sw	a4,172(a1)
	lbu	a4,3(a5)
	srli	a4,a4,6
	sw	a4,208(a0)
	lbu	a4,3(a5)
	srli	a4,a4,4
	andi	a4,a4,1
	sw	a4,220(a0)
	lbu	a4,3(a5)
	srli	a4,a4,3
	andi	a4,a4,1
	sw	a4,220(a1)
	lbu	a4,3(a5)
	andi	a4,a4,7
	sw	a4,176(a1)
	lbu	a4,4(a5)
	srli	a4,a4,4
	sw	a4,188(a1)
	lbu	a4,4(a5)
	andi	a4,a4,15
	sw	a4,192(a1)
	lbu	a4,5(a5)
	srli	a4,a4,4
	sw	a4,188(a0)
	lbu	a4,5(a5)
	andi	a4,a4,15
	sw	a4,192(a0)
	lbu	a4,6(a5)
	srli	a4,a4,4
	sw	a4,196(a1)
	lbu	a4,6(a5)
	andi	a4,a4,15
	sw	a4,200(a1)
	lbu	a4,7(a5)
	srli	a4,a4,4
	sw	a4,196(a0)
	lbu	a5,7(a5)
	andi	a5,a5,15
	sw	a5,200(a0)
	ret
.L2:
	lbu	a4,46(a0)
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,534
	lla	a1,.LC0
	lla	a0,.LC1
	sw	ra,8(sp)
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a5,a0,180
	sw	a5,12(sp)
	addi	a5,a0,228
	sw	a3,8(sp)
	sw	a5,20(sp)
	ble	a2,zero,.L23
	li	a5,65536
	addi	a5,a5,-1
	li	t1,262144
	sw	s0,28(sp)
	sw	s1,24(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	mv	s0,a2
	mv	s1,a1
	addi	t0,a0,1668
	sw	a5,16(sp)
	addi	t1,t1,-1
	li	a1,1
.L24:
	lw	a5,112(a0)
	lw	a3,16(sp)
	lw	a4,104(a0)
	sw	zero,116(a0)
	and	a5,a5,a3
	sw	a5,112(a0)
	lw	a5,12(sp)
	and	a4,a4,a3
	sw	a4,104(a0)
	sw	zero,108(a0)
	li	a2,3
	li	t2,127
	sw	a0,0(sp)
.L39:
	lw	a3,36(a5)
	lw	a4,64(a5)
	bne	a3,zero,.L25
	lw	a3,68(a5)
	add	a4,a4,a3
.L25:
	and	a4,a4,t1
	lw	a3,100(a5)
	srli	a0,a4,9
	sw	a4,64(a5)
	sw	a0,72(a5)
	beq	a3,a2,.L26
	bgt	a3,a2,.L27
	beq	a3,a1,.L28
	li	a4,2
	bne	a3,a4,.L30
	lw	a3,16(a5)
	lla	a0,SL.0
	lw	a4,104(a5)
	slli	a3,a3,2
	add	a3,a0,a3
	lw	a0,0(a3)
	lw	a3,108(a5)
	add	a3,a4,a3
	sw	a3,104(a5)
	bltu	a3,a0,.L37
	lw	a3,0(a5)
	sw	a0,104(a5)
	beq	a3,zero,.L51
	sw	a2,100(a5)
	sw	zero,108(a5)
.L37:
	srli	a4,a4,15
.L33:
	lw	a0,92(a5)
	li	a3,255
	add	a4,a4,a0
	slli	a4,a4,1
	bleu	a4,a3,.L38
	li	a4,255
.L38:
	sw	a4,112(a5)
	addi	a5,a5,124
	bne	t0,a5,.L39
	lw	a0,0(sp)
	lw	a3,20(sp)
	li	a2,0
	lw	t2,1660(a0)
	li	a4,0
	sw	s1,0(sp)
	sw	s0,4(sp)
.L41:
	slli	s0,a4,1
	ori	s0,s0,1
	slli	a5,s0,5
	sub	a5,a5,s0
	sll	s0,a1,a4
	slli	a5,a5,2
	and	s0,s0,t2
	add	a5,a0,a5
	addi	a4,a4,1
	bne	s0,zero,.L40
	lw	s0,280(a5)
	li	s1,6
	beq	s0,s1,.L40
	lw	s0,4(a3)
	sw	zero,4(a3)
	srai	s1,s0,1
	sw	s1,0(a3)
	sw	s0,8(a3)
	lw	s0,232(a5)
	sw	zero,232(a5)
	srai	s1,s0,1
	sw	s0,236(a5)
	add	a2,a2,s1
.L40:
	li	a5,6
	addi	a3,a3,248
	bne	a4,a5,.L41
	lw	s1,0(sp)
	slli	a2,a2,16
	li	a5,32768
	srai	a2,a2,16
	add	a2,a2,a5
	lw	a5,8(sp)
	lw	a4,0(s1)
	lw	s0,4(sp)
	sll	a2,a2,a5
	add	a4,a4,a2
	sw	a4,0(s1)
	addi	s0,s0,-1
	addi	s1,s1,4
	bne	s0,zero,.L24
	lw	s0,28(sp)
	.cfi_restore 8
	lw	s1,24(sp)
	.cfi_restore 9
.L23:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
	.cfi_def_cfa_offset 32
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	addi	a3,a3,-4
	bgtu	a3,a1,.L30
	lw	a0,104(a5)
	lw	a3,108(a5)
	srli	a4,a0,15
	add	a3,a3,a0
	sw	a3,104(a5)
	bleu	a4,t2,.L33
	li	a4,6
	sw	a4,100(a5)
.L30:
	li	a4,127
	j	.L33
.L28:
	lw	a4,104(a5)
	lw	a3,108(a5)
	add	a4,a4,a3
	sw	a4,104(a5)
	slli	a3,a4,9
	blt	a3,zero,.L32
	lw	a3,8(a5)
	li	a4,15
	beq	a3,a4,.L32
	li	a4,0
	j	.L33
.L32:
	li	a4,2
	sw	a4,100(a5)
	sw	zero,104(a5)
	sw	zero,108(a5)
	li	a4,0
	j	.L33
.L26:
	lw	a3,0(a5)
	lw	a4,104(a5)
	bne	a3,zero,.L37
.L51:
	li	a3,4
	sw	a3,100(a5)
	sw	zero,108(a5)
	j	.L37
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
	beq	a0,zero,.L54
	lw	a0,1660(a0)
	sw	a1,1660(a5)
	ret
.L54:
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
	beq	a0,zero,.L57
	lw	a0,1660(a0)
	xor	a1,a0,a1
	sw	a1,1660(a5)
	ret
.L57:
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
	bgtu	a1,a5,.L114
	lla	a4,.L61
	slli	a5,a1,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	s0,12(sp)
	add	a5,a5,a4
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a2
	mv	s0,a0
	andi	a2,a2,255
	jr	a5
	.section	.rodata.OPLL_writeReg,"a",@progbits
	.align	2
	.align	2
.L61:
	.word	.L71-.L61
	.word	.L70-.L61
	.word	.L69-.L61
	.word	.L68-.L61
	.word	.L67-.L61
	.word	.L66-.L61
	.word	.L65-.L61
	.word	.L64-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L63-.L61
	.word	.L63-.L61
	.word	.L63-.L61
	.word	.L63-.L61
	.word	.L63-.L61
	.word	.L63-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L62-.L61
	.word	.L62-.L61
	.word	.L62-.L61
	.word	.L62-.L61
	.word	.L62-.L61
	.word	.L62-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L58-.L61
	.word	.L60-.L61
	.word	.L60-.L61
	.word	.L60-.L61
	.word	.L60-.L61
	.word	.L60-.L61
	.word	.L60-.L61
	.section	.text.OPLL_writeReg
.L60:
	addi	a1,a1,-48
	add	a5,a0,a1
	sb	s1,40(a5)
	srli	a2,a2,4
	sw	a1,0(sp)
	call	setInstrument
	lw	a1,0(sp)
	lla	a2,waveform
	slli	s1,s1,2
	slli	a5,a1,1
	ori	a3,a5,1
	slli	a1,a1,6
	slli	a4,a3,5
	sub	a5,a1,a5
	sub	a4,a4,a3
	slli	a5,a5,2
	add	a5,s0,a5
	slli	a4,a4,2
	lw	a3,220(a5)
	add	a4,s0,a4
	lw	a1,220(a4)
	slli	a3,a3,2
	add	a3,a2,a3
	slli	a1,a1,2
	lw	a0,0(a3)
	add	a2,a2,a1
	lw	a3,0(a2)
	andi	s1,s1,60
	sw	s1,264(a4)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a0,240(a5)
	sw	zero,288(a5)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a3,240(a4)
	sw	zero,288(a4)
.L58:
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	ra
.L114:
	ret
.L63:
	.cfi_def_cfa_offset 20
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	addi	a1,a1,-16
	slli	a0,a1,1
	ori	a5,a0,1
	slli	a3,a1,6
	slli	a4,a5,5
	sub	a3,a3,a0
	add	a1,s0,a1
	sub	a4,a4,a5
	slli	a3,a3,2
	sb	s1,28(a1)
	add	a3,s0,a3
	slli	a4,a4,2
	lw	a0,220(a3)
	add	a4,s0,a4
	lbu	a5,34(a1)
	lw	t0,220(a4)
	lla	t1,waveform
	slli	a1,a0,2
	add	a1,t1,a1
	slli	a5,a5,8
	slli	a0,t0,2
	lw	a1,0(a1)
	andi	a5,a5,256
	add	t1,t1,a0
	or	a5,a5,a2
	lw	a2,0(t1)
	sw	a5,256(a4)
	sw	a5,256(a3)
	sw	zero,248(a3)
	sw	zero,272(a3)
	sw	zero,276(a3)
	sw	a1,240(a3)
	sw	zero,288(a3)
	sw	zero,248(a4)
	sw	zero,272(a4)
	sw	zero,276(a4)
	sw	a2,240(a4)
	sw	zero,288(a4)
	j	.L58
.L62:
	addi	a1,a1,-32
	add	t2,a0,a1
	lbu	a5,28(t2)
	slli	t1,a1,1
	ori	t0,t1,1
	sw	a5,0(sp)
	sb	s1,34(t2)
	slli	a5,t0,5
	lw	t2,0(sp)
	slli	a0,a2,8
	sub	a3,a5,t0
	slli	a4,a1,6
	andi	a0,a0,256
	slli	a3,a3,2
	sub	a4,a4,t1
	add	a0,a0,t2
	add	a3,s0,a3
	slli	a4,a4,2
	add	a4,s0,a4
	sw	a0,256(a3)
	srli	t2,a2,1
	sw	a0,256(a4)
	andi	a0,t2,7
	sw	a0,260(a3)
	lw	t2,224(a4)
	srli	a2,a2,5
	sw	a0,260(a4)
	andi	a2,a2,1
	sw	a2,268(a3)
	beq	t2,zero,.L89
	sw	a2,268(a4)
.L89:
	andi	s1,s1,16
	bne	s1,zero,.L117
	addi	a4,t1,13
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a4,8(a4)
	beq	a4,zero,.L94
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	lw	a2,280(a4)
	li	a3,1
	bne	a2,a3,.L95
	sw	zero,284(a4)
.L95:
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	li	a3,5
	sw	a3,280(a4)
.L94:
	li	a4,0
	slli	a3,t1,5
.L93:
	sub	a3,a3,t1
	slli	a3,a3,2
	sub	a5,a5,t0
	add	a3,s0,a3
	slli	a5,a5,2
	lw	a2,220(a3)
	add	a5,s0,a5
	lw	t1,220(a5)
	lla	a0,waveform
	slli	a2,a2,2
	add	a2,a0,a2
	addi	a1,a1,36
	slli	t1,t1,2
	lw	a2,0(a2)
	slli	a1,a1,2
	add	a0,a0,t1
	add	a1,s0,a1
	lw	a0,0(a0)
	sw	a4,4(a1)
	sw	zero,248(a3)
	sw	zero,272(a3)
	sw	zero,276(a3)
	sw	a2,240(a3)
	sw	zero,288(a3)
	sw	zero,248(a5)
	sw	zero,272(a5)
	sw	zero,276(a5)
	sw	a0,240(a5)
	sw	zero,288(a5)
	addi	a3,s0,34
	addi	a5,s0,56
	addi	s0,s0,104
.L96:
	lbu	a4,0(a3)
	addi	a5,a5,8
	addi	a3,a3,1
	andi	a4,a4,16
	sw	a4,-4(a5)
	sw	a4,-8(a5)
	bne	a5,s0,.L96
	j	.L58
.L71:
	addi	a5,a0,124
	sb	s1,46(a0)
	addi	a4,a0,248
	li	s1,0
	li	t1,6
	sw	a0,4(sp)
	mv	s0,a5
	j	.L73
.L72:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L58
.L73:
	lw	a3,0(s0)
	bne	a3,zero,.L72
	lw	a0,4(sp)
	li	a2,0
	mv	a1,s1
	sw	a4,0(sp)
	call	setInstrument
	lw	a4,0(sp)
	li	t1,6
	sw	zero,0(a4)
	sw	zero,28(a4)
	sw	zero,40(a4)
	j	.L72
.L70:
	addi	a4,a0,124
	sb	s1,47(a0)
	li	a3,6
	li	s1,0
	mv	s0,a4
	j	.L75
.L74:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L58
.L75:
	lw	a5,0(s0)
	bne	a5,zero,.L74
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,248(a5)
	sw	zero,276(a5)
	sw	zero,288(a5)
	li	a3,6
	j	.L74
.L65:
	addi	a5,a0,124
	sb	s1,52(a0)
	addi	a4,a0,288
	li	s1,0
	li	t1,6
	sw	a0,4(sp)
	mv	s0,a5
	j	.L86
.L85:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L58
.L86:
	lw	a3,0(s0)
	bne	a3,zero,.L85
	lw	a0,4(sp)
	li	a2,0
	mv	a1,s1
	sw	a4,0(sp)
	call	setInstrument
	lw	a4,0(sp)
	li	t1,6
	sw	zero,0(a4)
	j	.L85
.L64:
	addi	a5,a0,124
	sb	s1,53(a0)
	li	a3,6
	li	s1,0
	mv	s0,a5
	j	.L88
.L87:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L58
.L88:
	lw	a5,0(s0)
	bne	a5,zero,.L87
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,288(a5)
	li	a3,6
	j	.L87
.L69:
	addi	a5,a0,124
	sb	s1,48(a0)
	addi	a4,a0,272
	li	s1,0
	li	t1,6
	sw	a0,4(sp)
	mv	s0,a5
	j	.L78
.L77:
	addi	s1,s1,1
	addi	s0,s0,4
	addi	a4,a4,248
	beq	s1,t1,.L58
.L78:
	lw	a3,0(s0)
	bne	a3,zero,.L77
	lw	a0,4(sp)
	li	a2,0
	mv	a1,s1
	sw	a4,0(sp)
	call	setInstrument
	lw	a4,0(sp)
	li	t1,6
	sw	zero,0(a4)
	j	.L77
.L68:
	addi	a5,a0,124
	sb	s1,49(a0)
	addi	a3,a0,220
	li	s1,0
	mv	s0,a5
	j	.L80
.L79:
	addi	s1,s1,1
	li	a5,6
	addi	s0,s0,4
	addi	a3,a3,248
	beq	s1,a5,.L58
.L80:
	lw	a5,0(s0)
	bne	a5,zero,.L79
	li	a2,0
	mv	a1,s1
	sw	a3,4(sp)
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a3,4(sp)
	slli	a5,a4,5
	lw	a0,0(sp)
	sub	a5,a5,a4
	slli	a5,a5,2
	lw	a2,0(a3)
	add	a5,a0,a5
	lw	a4,220(a5)
	lla	t1,waveform
	slli	a2,a2,2
	add	a2,t1,a2
	slli	a4,a4,2
	lw	a2,0(a2)
	add	a4,t1,a4
	lw	a4,0(a4)
	sw	a2,20(a3)
	sw	a4,240(a5)
	j	.L79
.L67:
	addi	a4,a0,288
	sb	s1,50(a0)
	addi	a5,a0,124
	li	s1,0
	li	t1,6
	sw	a0,4(sp)
	mv	s0,a4
	j	.L82
.L81:
	addi	s1,s1,1
	addi	a5,a5,4
	addi	s0,s0,248
	beq	s1,t1,.L58
.L82:
	lw	a3,0(a5)
	bne	a3,zero,.L81
	lw	a0,4(sp)
	li	a2,0
	mv	a1,s1
	sw	a5,0(sp)
	call	setInstrument
	lw	a5,0(sp)
	sw	zero,0(s0)
	li	t1,6
	j	.L81
.L66:
	addi	a5,a0,124
	sb	s1,51(a0)
	li	a3,6
	li	s1,0
	mv	s0,a5
	j	.L84
.L83:
	addi	s1,s1,1
	addi	s0,s0,4
	beq	s1,a3,.L58
.L84:
	lw	a5,0(s0)
	bne	a5,zero,.L83
	li	a2,0
	mv	a1,s1
	sw	a0,0(sp)
	call	setInstrument
	slli	a4,s1,1
	ori	a4,a4,1
	lw	a0,0(sp)
	slli	a5,a4,5
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a5,a0,a5
	sw	zero,288(a5)
	li	a3,6
	j	.L83
.L117:
	slli	a4,a1,3
	add	a4,s0,a4
	lw	a2,56(a4)
	slli	a3,t1,5
	bne	a2,zero,.L91
	sub	a2,a3,t1
	slli	a2,a2,2
	add	a2,s0,a2
	li	a0,1
	sw	a0,280(a2)
	sw	zero,284(a2)
	sw	zero,244(a2)
.L91:
	lw	a4,60(a4)
	bne	a4,zero,.L92
	sub	a4,a5,t0
	slli	a4,a4,2
	add	a4,s0,a4
	li	a2,1
	sw	a2,280(a4)
	sw	zero,284(a4)
	sw	zero,244(a4)
.L92:
	li	a4,1
	j	.L93
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	a0,0(sp)
	.cfi_offset 1, -4
	beq	a0,zero,.L118
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
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
.L120:
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
	bne	a4,a2,.L120
	lw	a5,0(sp)
	li	s0,0
	li	s1,64
	sw	zero,148(a5)
	sw	zero,152(a5)
	sw	zero,156(a5)
	sw	zero,160(a5)
	sw	zero,164(a5)
	sw	zero,168(a5)
.L121:
	lw	a0,0(sp)
	mv	a1,s0
	li	a2,0
	addi	s0,s0,1
	call	OPLL_writeReg
	bne	s0,s1,.L121
	la a1, rate; lw a1, 0(a1);
	li	a0,-2147483648
	call	__udivsi3
	lw	s0,0(sp)
	li	a1,72
	sw	a0,8(s0)
	la a0, clk; lw a0, 0(a0);
	call	__udivsi3
	mv	a1,a0
	li	a0,-2147483648
	call	__udivsi3
	sw	a0,16(s0)
	sw	zero,12(s0)
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s0,8(sp)
	.cfi_restore 8
.L118:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	bne	a0,a3,.L136
	lla	a5,rate
	lw	a4,0(a5)
	bne	a1,a4,.L137
	li	a0,1664
	call	malloc
	mv	s0,a0
	beq	a0,zero,.L128
	li	a2,1664
	li	a1,0
	call	memset
	mv	a0,s0
	sw	zero,1660(s0)
	call	OPLL_reset
.L128:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L136:
	.cfi_restore_state
	mv	a5,a0
	li	a2,260
	lla	a1,.LC0
	lla	a0,.LC1
	sw	a5,0(a4)
	call	printf
	li	a0,1
	call	halt
.L137:
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
	bne	a1,zero,.L140
	sw	a2,0(a5)
	ret
.L140:
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
