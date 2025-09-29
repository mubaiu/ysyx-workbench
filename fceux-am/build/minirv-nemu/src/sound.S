#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sound.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL9Dummyfuncv,"ax",@progbits
	.align	2
	.type	_ZL9Dummyfuncv, @function
_ZL9Dummyfuncv:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL9Dummyfuncv, .-_ZL9Dummyfuncv
	.globl	__mulsi3
	.section	.text._Z6RDoPCMv,"ax",@progbits
	.align	2
	.globl	_Z6RDoPCMv
	.hidden	_Z6RDoPCMv
	.type	_Z6RDoPCMv, @function
_Z6RDoPCMv:
.LFB20:
	.cfi_startproc
	la a0, RawDALatch; lbu a0, 0(a0);
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a1, FSettings+28; lw a1, 0(a1);
	slli	a0,a0,8
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	__mulsi3
	lla	a1,_ZL9ChannelBC
	lw	a5,16(a1)
	la a4, soundtsoffs; lw a4, 0(a4);
	la a2, soundtimestamp; lw a2, 0(a2);
	add	a2,a2,a4
	li	a4,-65536
	and	a0,a0,a4
	bgeu	a5,a2,.L4
	lla	a4,WaveHi
	slli	a5,a5,2
	slli	a3,a2,2
	add	a5,a5,a4
	add	a3,a3,a4
.L5:
	lw	a4,0(a5)
	addi	a5,a5,4
	add	a4,a4,a0
	sw	a4,-4(a5)
	bne	a5,a3,.L5
.L4:
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a2,16(a1)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	_Z6RDoPCMv, .-_Z6RDoPCMv
	.section	.text._ZL11RDoTrianglev,"ax",@progbits
	.align	2
	.type	_ZL11RDoTrianglev, @function
_ZL11RDoTrianglev:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	s7,28(sp)
	.cfi_offset 23, -36
	lla	s7,_ZL7tristep
	sw	s8,24(sp)
	.cfi_offset 24, -40
	lw	s8,0(s7)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	andi	a3,s8,16
	andi	a5,s8,15
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	bne	a3,zero,.L9
	xori	a5,a5,15
.L9:
	slli	s1,a5,1
	add	s1,s1,a5
	lla	s3,_ZL9ChannelBC
	la s2, soundtimestamp; lw s2, 0(s2);
	la a3, soundtsoffs; lw a3, 0(a3);
	la a5, lengthcount+8; lw a5, 0(a5);
	lw	s0,8(s3)
	slli	s1,s1,16
	add	s2,s2,a3
	beq	a5,zero,.L10
	la a5, TriCount; lbu a5, 0(a5);
	beq	a5,zero,.L10
	bgeu	s0,s2,.L13
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	lla	a5,PSG
	sw	s4,40(sp)
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	.cfi_offset 20, -24
	lbu	s4,11(a5)
	lbu	a3,10(a5)
	lla	a5,_ZL7wlcount
	slli	s4,s4,8
	andi	s4,s4,1792
	lw	s11,8(a5)
	or	s4,s4,a3
	lla	a5,WaveHi
	slli	s0,s0,2
	slli	s5,s2,2
	la s9, FSettings+12; lw s9, 0(s9);
	addi	s4,s4,1
	add	s0,s0,a5
	add	s5,s5,a5
	li	s10,0
	li	s6,-65536
.L18:
	mv	a1,s9
	srai	a0,s1,8
	call	__mulsi3
	lw	a5,0(s0)
	and	a0,a0,s6
	addi	s11,s11,-1
	add	a0,a0,a5
	bne	s11,zero,.L16
	addi	s8,s8,1
	andi	a3,s8,16
	andi	a5,s8,15
	bne	a3,zero,.L17
	xori	a5,a5,15
.L17:
	slli	s1,a5,1
	add	s1,s1,a5
	slli	s1,s1,16
	mv	s11,s4
	li	s10,1
.L16:
	sw	a0,0(s0)
	addi	s0,s0,4
	bne	s0,s5,.L18
	lla	a5,_ZL7wlcount
	sw	s11,8(a5)
	beq	s10,zero,.L28
	sw	s8,0(s7)
.L28:
	lw	s4,40(sp)
	.cfi_restore 20
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	lw	s11,12(sp)
	.cfi_restore 27
.L13:
	lw	ra,60(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	sw	s2,8(s3)
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	la a1, FSettings+12; lw a1, 0(a1);
	srai	a0,s1,8
	call	__mulsi3
	li	a5,-65536
	and	a0,a0,a5
	bgeu	s0,s2,.L13
	lla	a4,WaveHi
	slli	s0,s0,2
	slli	a3,s2,2
	add	a5,s0,a4
	add	a3,a3,a4
.L14:
	lw	a4,0(a5)
	addi	a5,a5,4
	add	a4,a4,a0
	sw	a4,-4(a5)
	bne	a5,a3,.L14
	j	.L13
	.cfi_endproc
.LFE25:
	.size	_ZL11RDoTrianglev, .-_ZL11RDoTrianglev
	.globl	__udivsi3
	.section	.text._ZL21RDoTriangleNoisePCMLQv,"ax",@progbits
	.align	2
	.type	_ZL21RDoTriangleNoisePCMLQv, @function
_ZL21RDoTriangleNoisePCMLQv:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sw	s2,80(sp)
	la a0, soundtimestamp; lw a0, 0(a0);
	la a5, soundtsoffs; lw a5, 0(a5);
	.cfi_offset 18, -16
	lla	s2,_ZL9ChannelBC
	sw	s0,88(sp)
	add	a0,a0,a5
	.cfi_offset 8, -8
	lw	s0,8(s2)
	la a1, soundtsinc; lw a1, 0(a1);
	slli	a0,a0,16
	sw	ra,92(sp)
	.cfi_offset 1, -4
	call	__udivsi3
	bge	s0,a0,.L29
	sw	s1,84(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	lla	s4,PSG
	lbu	a1,11(s4)
	lbu	a4,10(s4)
	lla	s5,lengthcount
	slli	a1,a1,8
	lw	a5,8(s5)
	andi	a1,a1,1792
	or	a1,a1,a4
	sw	a0,8(s2)
	mv	s1,a0
	la s6, nesincsize; lw s6, 0(s6);
	addi	s3,a1,1
	li	s2,0
	bne	a5,zero,.L98
.L31:
	lla	a4,EnvUnits
	lbu	a5,17(a4)
	andi	a5,a5,1
	bne	a5,zero,.L99
.L32:
	lbu	a1,19(a4)
.L33:
	la a0, FSettings+12; lw a0, 0(a0);
	li	a5,256
	beq	a0,a5,.L34
	call	__mulsi3
	srli	a1,a0,8
.L34:
	lw	t6,12(s5)
	sw	zero,28(sp)
	li	a2,0
	beq	t6,zero,.L35
	slli	a2,a1,1
	mv	t6,s6
.L35:
	lla	s9,_ZL4nreg
	lhu	a3,0(s9)
	lbu	t4,14(s4)
	sw	a2,24(sp)
	srli	a5,a3,14
	andi	a4,a5,1
	slli	a4,a4,2
	lla	s8,_ZZL21RDoTriangleNoisePCMLQvE5tcout
	addi	a4,a4,16
	addi	a2,sp,16
	add	a4,a4,a2
	lw	t5,0(s8)
	lw	t2,-8(a4)
	la s5, RawDALatch; lbu s5, 0(s5);
	slli	a7,t4,24
	srai	a7,a7,24
	add	a1,t5,s5
	not	a7,a7
	add	a4,t2,a1
	srai	a7,a7,31
	lla	s4,_ZL8wlookup2
	slli	a4,a4,2
	andi	a7,a7,5
	add	a4,s4,a4
	lw	t1,0(a4)
	addi	a7,a7,8
	bne	s2,zero,.L100
	lla	t3,Wave
	beq	t6,zero,.L56
	andi	t4,t4,15
	slli	t4,t4,2
	lla	t2,NoiseFreqTableNTSC
	lla	t0,NoiseFreqTablePAL
	lla	a0,_ZZL21RDoTriangleNoisePCMLQvE8noiseacc
	add	t2,t2,t4
	add	t0,t0,t4
	li	t4,32768
	lw	a2,0(a0)
	la t5, PAL; lbu t5, 0(t5);
	li	s2,0
	lla	t3,Wave
	addi	t4,t4,-1
	mv	s3,a5
	j	.L61
.L57:
	addi	s0,s0,1
	beq	s1,s0,.L101
.L61:
	srai	a4,s0,4
	slli	a4,a4,2
	add	a4,t3,a4
	lw	a6,0(a4)
	sub	a2,a2,t6
	add	a6,a6,t1
	sw	a6,0(a4)
	bgt	a2,zero,.L57
.L58:
	beq	t5,zero,.L59
.L102:
	lw	a5,0(t0)
	slli	a5,a5,17
	add	a2,a5,a2
.L60:
	sra	a5,a3,a7
	xor	a5,s3,a5
	slli	a3,a3,1
	andi	a5,a5,1
	add	a5,a5,a3
	and	a5,a5,t4
	slli	a3,a5,16
	srli	a3,a3,16
	bgt	a2,zero,.L91
	srli	s3,a3,14
	bne	t5,zero,.L102
.L59:
	lw	a5,0(t2)
	slli	a5,a5,17
	add	a2,a5,a2
	j	.L60
.L104:
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	sw	a4,0(s10)
	beq	a0,zero,.L94
	sw	t5,0(s8)
	sw	a2,0(s11)
.L94:
	lw	s1,84(sp)
	.cfi_restore 9
	lw	s3,76(sp)
	.cfi_restore 19
	lw	s4,72(sp)
	.cfi_restore 20
	lw	s5,68(sp)
	.cfi_restore 21
	lw	s6,64(sp)
	.cfi_restore 22
	lw	s8,56(sp)
	.cfi_restore 24
	lw	s9,52(sp)
	.cfi_restore 25
	lw	s10,48(sp)
	.cfi_restore 26
	lw	s11,44(sp)
	.cfi_restore 27
.L29:
	lw	ra,92(sp)
	.cfi_restore 1
	lw	s0,88(sp)
	.cfi_restore 8
	lw	s2,80(sp)
	.cfi_restore 18
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.L56:
	.cfi_def_cfa_offset 96
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	srai	a5,s0,4
	slli	a5,a5,2
	add	a5,t3,a5
	lw	a4,0(a5)
	addi	s0,s0,1
	add	a4,a4,t1
	sw	a4,0(a5)
	bne	s1,s0,.L56
.L95:
	lw	ra,92(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,88(sp)
	.cfi_restore 8
	lw	s1,84(sp)
	.cfi_restore 9
	lw	s3,76(sp)
	.cfi_restore 19
	lw	s4,72(sp)
	.cfi_restore 20
	lw	s5,68(sp)
	.cfi_restore 21
	lw	s6,64(sp)
	.cfi_restore 22
	lw	s8,56(sp)
	.cfi_restore 24
	lw	s9,52(sp)
	.cfi_restore 25
	lw	s2,80(sp)
	.cfi_restore 18
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.L99:
	.cfi_restore_state
	lbu	a1,16(a4)
	j	.L33
.L98:
	la a5, TriCount; lbu a5, 0(a5);
	beq	a5,zero,.L31
	lla	a4,EnvUnits
	lbu	a5,17(a4)
	li	s2,4
	sgt	s2,s3,s2
	neg	s2,s2
	andi	a5,a5,1
	and	s2,s6,s2
	beq	a5,zero,.L32
	j	.L99
.L100:
	sw	s10,48(sp)
	sw	s11,44(sp)
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	lla	s10,_ZZL21RDoTriangleNoisePCMLQvE6triacc
	lla	s11,_ZL7tristep
	lw	a4,0(s10)
	lw	a2,0(s11)
	slli	a1,s3,17
	bne	t6,zero,.L103
	li	a0,0
	lla	t3,Wave
	add	t2,s5,t2
	j	.L38
.L51:
	addi	s0,s0,1
	beq	s1,s0,.L104
.L38:
	srai	a5,s0,4
	slli	a5,a5,2
	add	a5,t3,a5
	lw	a3,0(a5)
	sub	a4,a4,s2
	add	a3,a3,t1
	sw	a3,0(a5)
	bgt	a4,zero,.L51
.L52:
	addi	a5,a2,1
	add	a4,a4,a1
	andi	a2,a5,31
	ble	a4,zero,.L52
	andi	a3,a5,16
	bne	a3,zero,.L97
	not	a5,a5
.L97:
	andi	a5,a5,15
	slli	t5,a5,1
	add	t5,t5,a5
	add	a5,t2,t5
	slli	a5,a5,2
	add	a5,s4,a5
	lw	t1,0(a5)
	li	a0,1
	j	.L51
.L103:
	lla	a0,_ZZL21RDoTriangleNoisePCMLQvE8noiseacc
	andi	t4,t4,15
	lw	a6,0(a0)
	slli	t4,t4,2
	sw	s7,60(sp)
	.cfi_offset 23, -36
	lla	s6,NoiseFreqTablePAL
	lla	s7,NoiseFreqTableNTSC
	li	t0,32768
	la s3, PAL; lbu s3, 0(s3);
	sw	zero,4(sp)
	sw	zero,8(sp)
	lla	t3,Wave
	add	s7,s7,t4
	add	s6,s6,t4
	addi	t0,t0,-1
	sw	a0,12(sp)
.L47:
	srai	a0,s0,4
	slli	a0,a0,2
	add	a0,t3,a0
	lw	t4,0(a0)
	sub	a4,a4,s2
	sub	a6,a6,t6
	add	t4,t4,t1
	sw	t4,0(a0)
	ble	a4,zero,.L40
	ble	a6,zero,.L105
.L43:
	addi	s0,s0,1
	bne	s1,s0,.L47
	lw	a0,12(sp)
	lw	a5,4(sp)
	sw	a4,0(s10)
	sw	a6,0(a0)
	beq	a5,zero,.L48
	sw	t5,0(s8)
	sw	a2,0(s11)
.L48:
	lw	a5,8(sp)
	beq	a5,zero,.L93
	sh	a3,0(s9)
.L93:
	lw	s1,84(sp)
	.cfi_remember_state
	.cfi_restore 9
	lw	s3,76(sp)
	.cfi_restore 19
	lw	s4,72(sp)
	.cfi_restore 20
	lw	s5,68(sp)
	.cfi_restore 21
	lw	s6,64(sp)
	.cfi_restore 22
	lw	s7,60(sp)
	.cfi_restore 23
	lw	s8,56(sp)
	.cfi_restore 24
	lw	s9,52(sp)
	.cfi_restore 25
	lw	s10,48(sp)
	.cfi_restore 26
	lw	s11,44(sp)
	.cfi_restore 27
	j	.L29
.L40:
	.cfi_restore_state
	addi	a0,a2,1
	add	a4,a4,a1
	andi	a2,a0,31
	ble	a4,zero,.L40
	andi	t1,a0,16
	bne	t1,zero,.L96
	not	a0,a0
.L96:
	andi	a0,a0,15
	slli	t5,a0,1
	add	t5,t5,a0
	add	a0,s5,t2
	add	a0,a0,t5
	slli	a0,a0,2
	add	a0,s4,a0
	lw	t1,0(a0)
	li	a0,1
	sw	a0,4(sp)
	bgt	a6,zero,.L43
.L105:
.L44:
	mv	a0,a3
	beq	s3,zero,.L45
.L106:
	lw	a3,0(s6)
	slli	a3,a3,17
	add	a6,a3,a6
.L46:
	sra	a3,a0,a7
	xor	a3,a5,a3
	slli	a0,a0,1
	andi	a3,a3,1
	add	a3,a3,a0
	and	a3,a3,t0
	slli	a0,a3,16
	srli	a0,a0,16
	bgt	a6,zero,.L89
	srli	a5,a0,14
	bne	s3,zero,.L106
.L45:
	lw	a3,0(s7)
	slli	a3,a3,17
	add	a6,a3,a6
	j	.L46
.L89:
	srli	a5,a0,14
	slli	a5,a5,2
	mv	a3,a0
	addi	a5,a5,16
	addi	a0,sp,16
	add	a5,a5,a0
	lw	t2,-8(a5)
	li	a0,1
	sw	a0,8(sp)
	add	a0,s5,t2
	add	a0,a0,t5
	slli	a0,a0,2
	add	a0,s4,a0
	lw	t1,0(a0)
	srli	a5,a3,14
	j	.L43
.L91:
	.cfi_restore 23
	.cfi_restore 26
	.cfi_restore 27
	srli	a5,a3,14
	slli	a5,a5,2
	addi	a5,a5,16
	addi	a4,sp,16
	add	a5,a5,a4
	lw	a5,-8(a5)
	addi	s0,s0,1
	srli	s3,a3,14
	add	a5,a1,a5
	slli	a5,a5,2
	add	a5,s4,a5
	lw	t1,0(a5)
	li	s2,1
	bne	s1,s0,.L61
.L101:
	sw	a2,0(a0)
	beq	s2,zero,.L95
	sh	a3,0(s9)
	j	.L95
	.cfi_endproc
.LFE26:
	.size	_ZL21RDoTriangleNoisePCMLQv, .-_ZL21RDoTriangleNoisePCMLQv
	.section	.text._ZL8RDoNoisev,"ax",@progbits
	.align	2
	.type	_ZL8RDoNoisev, @function
_ZL8RDoNoisev:
.LFB27:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	lla	a4,EnvUnits
	lbu	a5,17(a4)
	andi	a5,a5,1
	.cfi_offset 1, -4
	beq	a5,zero,.L108
	lbu	a1,16(a4)
.L109:
	la a0, FSettings+24; lw a0, 0(a0);
	li	a5,256
	beq	a0,a5,.L110
	call	__mulsi3
	srli	a1,a0,8
.L110:
	lla	a7,_ZL4nreg
	lhu	a5,0(a7)
	slli	a1,a1,17
	sw	zero,12(sp)
	srli	t1,a5,14
	andi	a4,t1,1
	slli	a4,a4,2
	addi	a4,a4,16
	sw	a1,8(sp)
	add	a4,a4,sp
	la t3, lengthcount+12; lw t3, 0(t3);
	lw	a4,-8(a4)
	beq	t3,zero,.L125
	mv	t3,a4
.L111:
	la a3, PSG+14; lbu a3, 0(a3);
	sw	a1,8(sp)
	slli	a1,a3,24
	lla	a6,_ZL9ChannelBC
	la a2, soundtimestamp; lw a2, 0(a2);
	la a0, soundtsoffs; lw a0, 0(a0);
	srai	a1,a1,24
	lw	a4,12(a6)
	add	a2,a2,a0
	blt	a1,zero,.L140
	bgeu	a4,a2,.L114
	lla	t5,WaveHi
	andi	a3,a3,15
	slli	a4,a4,2
	slli	t4,a2,2
	slli	a3,a3,2
	sw	s0,24(sp)
	lla	a1,_ZL7wlcount
	add	a4,a4,t5
	add	t4,t4,t5
	.cfi_offset 8, -8
	lla	s0,NoiseFreqTableNTSC
	li	t5,32768
	lla	t2,NoiseFreqTablePAL
	lw	a0,12(a1)
	la t0, PAL; lbu t0, 0(t0);
	li	t6,0
	addi	t5,t5,-1
	add	s0,s0,a3
	add	t2,t2,a3
	j	.L124
.L141:
	lw	a0,0(t2)
.L123:
	srli	a3,a5,13
	xor	a3,a3,t1
	andi	a3,a3,1
	slli	a5,a5,1
	add	a5,a5,a3
	and	a5,a5,t5
	slli	a5,a5,16
	srli	a5,a5,16
	srli	a3,a5,14
	slli	a3,a3,2
	addi	a3,a3,16
	add	a3,a3,sp
	lw	t3,-8(a3)
	srli	t1,a5,14
	li	t6,1
.L121:
	addi	a4,a4,4
	beq	t4,a4,.L134
.L124:
	lw	a3,0(a4)
	addi	a0,a0,-1
	add	a3,a3,t3
	sw	a3,0(a4)
	bne	a0,zero,.L121
	bne	t0,zero,.L141
	lw	a0,0(s0)
	j	.L123
.L134:
	sw	a0,12(a1)
	beq	t6,zero,.L137
	lw	s0,24(sp)
	.cfi_restore 8
	sh	a5,0(a7)
.L114:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	a2,12(a6)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L125:
	.cfi_restore_state
	li	a1,0
	j	.L111
.L108:
	lbu	a1,19(a4)
	j	.L109
.L140:
	bgeu	a4,a2,.L114
	lla	t5,WaveHi
	andi	a3,a3,15
	slli	a4,a4,2
	slli	t4,a2,2
	slli	a3,a3,2
	sw	s0,24(sp)
	.cfi_offset 8, -8
	lla	a1,_ZL7wlcount
	add	a4,a4,t5
	add	t4,t4,t5
	lla	s0,NoiseFreqTableNTSC
	li	t5,32768
	lla	t2,NoiseFreqTablePAL
	lw	a0,12(a1)
	la t0, PAL; lbu t0, 0(t0);
	li	t6,0
	addi	t5,t5,-1
	add	s0,s0,a3
	add	t2,t2,a3
	j	.L118
.L142:
	lw	a0,0(t2)
.L117:
	srli	a3,a5,8
	xor	a3,a3,t1
	andi	a3,a3,1
	slli	a5,a5,1
	add	a5,a5,a3
	and	a5,a5,t5
	slli	a5,a5,16
	srli	a5,a5,16
	srli	a3,a5,14
	slli	a3,a3,2
	addi	a3,a3,16
	add	a3,a3,sp
	lw	t3,-8(a3)
	srli	t1,a5,14
	li	t6,1
.L115:
	addi	a4,a4,4
	beq	a4,t4,.L134
.L118:
	lw	a3,0(a4)
	addi	a0,a0,-1
	add	a3,a3,t3
	sw	a3,0(a4)
	bne	a0,zero,.L115
	bne	t0,zero,.L142
	lw	a0,0(s0)
	j	.L117
.L137:
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	sw	a2,12(a6)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE27:
	.size	_ZL8RDoNoisev, .-_ZL8RDoNoisev
	.section	.text._ZL10StatusReadj,"ax",@progbits
	.align	2
	.type	_ZL10StatusReadj, @function
_ZL10StatusReadj:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	a7,_ZL8SIRQStat
	lbu	a1,0(a7)
	lla	a3,lengthcount
	li	a4,0
	mv	s0,a1
	li	a6,1
	li	a0,4
.L145:
	lw	a2,0(a3)
	sll	a5,a6,a4
	or	a5,s0,a5
	addi	a4,a4,1
	beq	a2,zero,.L144
	andi	s0,a5,0xff
.L144:
	addi	a3,a3,4
	bne	a4,a0,.L145
	la a5, _ZL7DMCSize; lw a5, 0(a5);
	beq	a5,zero,.L146
	ori	s0,s0,16
.L146:
	andi	a1,a1,-65
	li	a0,512
	sb	a1,0(a7)
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	_ZL10StatusReadj, .-_ZL10StatusReadj
	.section	.text._ZL11StatusWritejh,"ax",@progbits
	.align	2
	.type	_ZL11StatusWritejh, @function
_ZL11StatusWritejh:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	mv	s0,a1
	jalr	a5
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL5DoPCM; lw a5, 0(a5);
	jalr	a5
	lla	a3,lengthcount
	li	a5,0
	li	a2,4
.L157:
	sra	a4,s0,a5
	andi	a4,a4,1
	addi	a5,a5,1
	bne	a4,zero,.L156
	sw	zero,0(a3)
.L156:
	addi	a3,a3,4
	bne	a5,a2,.L157
	andi	a5,s0,16
	beq	a5,zero,.L158
	lla	a5,_ZL7DMCSize
	lw	a4,0(a5)
	beq	a4,zero,.L162
.L159:
	lla	a4,_ZL8SIRQStat
	lbu	a5,0(a4)
	li	a0,256
	andi	s0,s0,31
	andi	a5,a5,127
	sb	a5,0(a4)
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, EnabledChannels; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L158:
	.cfi_restore_state
	la a5, _ZL7DMCSize; sw zero, 0(a5);
	j	.L159
.L162:
	la a4, DMCSizeLatch; lbu a4, 0(a4);
	slli	a4,a4,4
	addi	a4,a4,1
	sw	a4,0(a5)
	j	.L159
	.cfi_endproc
.LFE13:
	.size	_ZL11StatusWritejh, .-_ZL11StatusWritejh
	.section	.text._ZL7RDoSQLQv,"ax",@progbits
	.align	2
	.type	_ZL7RDoSQLQv, @function
_ZL7RDoSQLQv:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-176
	.cfi_def_cfa_offset 176
	sw	s1,164(sp)
	la a0, soundtimestamp; lw a0, 0(a0);
	la a5, soundtsoffs; lw a5, 0(a5);
	.cfi_offset 9, -12
	lla	s1,_ZL9ChannelBC
	sw	s0,168(sp)
	add	a0,a0,a5
	.cfi_offset 8, -8
	lw	s0,0(s1)
	la a1, soundtsinc; lw a1, 0(a1);
	slli	a0,a0,16
	sw	ra,172(sp)
	.cfi_offset 1, -4
	call	__udivsi3
	bge	s0,a0,.L163
	lla	t0,FSettings
	lw	t6,16(t0)
	sw	s2,160(sp)
	sw	s4,152(sp)
	sw	s5,148(sp)
	sw	s6,144(sp)
	sw	s7,140(sp)
	sw	s8,136(sp)
	sw	s9,132(sp)
	sw	s10,128(sp)
	sw	s11,124(sp)
	sw	s3,156(sp)
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	.cfi_offset 19, -20
	lla	a7,PSG
	sw	a0,0(s1)
	mv	s4,a0
	la t5, nesincsize; lw t5, 0(t5);
	lla	a6,curfreq
	addi	s11,sp,32
	addi	s1,sp,24
	addi	s10,sp,48
	mv	s9,a7
	lla	s6,EnvUnits
	addi	s5,sp,40
	lla	s8,lengthcount
	li	s7,0
	lla	t4,_ZL10RectDuties
	li	t3,2039
	li	t1,256
	li	s2,8
.L175:
	lw	s3,0(a6)
	slli	a4,s7,2
	ori	a4,a4,1
	addi	a5,s3,-8
	add	a4,a7,a4
	lbu	a4,0(a4)
	sgtu	a5,a5,t3
	addi	a5,a5,-1
	and	a5,t5,a5
	sw	a5,0(s5)
	andi	a5,a4,8
	bne	a5,zero,.L166
	andi	a5,a4,7
	srl	a5,s3,a5
	add	a5,a5,s3
	slli	a4,a5,20
	blt	a4,zero,.L210
.L166:
	lw	a4,0(s8)
	beq	a4,zero,.L167
	lw	a4,0(s5)
.L167:
	lbu	a5,1(s6)
	sw	a4,0(s5)
	andi	a5,a5,1
	beq	a5,zero,.L168
	lbu	a0,0(s6)
	mv	a1,t6
	sw	a0,0(s1)
	beq	s7,zero,.L211
.L170:
	beq	a1,t1,.L171
	sw	a6,12(sp)
	sw	t6,8(sp)
	sw	a4,4(sp)
	sw	t5,0(sp)
	call	__mulsi3
	srai	a5,a0,31
	andi	a5,a5,255
	add	a5,a5,a0
	lw	a6,12(sp)
	lw	t6,8(sp)
	lw	a4,4(sp)
	lw	t5,0(sp)
	srai	a5,a5,8
	sw	a5,0(s1)
	lla	t0,FSettings
	lla	a7,PSG
	lla	t4,_ZL10RectDuties
	li	t1,256
	li	t3,2039
.L171:
	bne	a4,zero,.L172
	sw	zero,0(s1)
.L172:
	lbu	a3,0(s9)
	mv	a4,s10
	li	a5,0
	srli	a3,a3,6
	slli	a3,a3,2
	add	a3,t4,a3
	lw	a2,0(a3)
.L174:
	li	a3,0
	ble	a2,a5,.L173
	lw	a3,0(s1)
.L173:
	addi	a5,a5,1
	sw	a3,0(a4)
	addi	a4,a4,4
	bne	a5,s2,.L174
	addi	s3,s3,1
	slli	s3,s3,18
	sw	s3,0(s11)
	addi	a6,a6,4
	addi	s11,s11,4
	addi	s1,s1,4
	addi	s10,s10,32
	addi	s9,s9,4
	addi	s6,s6,8
	addi	s5,s5,4
	addi	s8,s8,4
	bne	s7,zero,.L212
	li	s7,1
	j	.L175
.L212:
	lla	s1,_ZL13RectDutyCount
	lw	a2,4(s1)
	lw	a3,0(s1)
	addi	a1,sp,16
	addi	t6,a2,8
	slli	t0,a3,2
	slli	a4,t6,2
	addi	a5,t0,96
	addi	a4,a4,96
	add	a5,a5,a1
	add	a4,a4,a1
	lw	a4,-64(a4)
	lw	a5,-64(a5)
	lw	t4,40(sp)
	lw	t5,44(sp)
	add	a5,a5,a4
	lla	t2,_ZL8wlookup1
	slli	a5,a5,2
	add	a5,t2,a5
	or	a4,t4,t5
	lw	t1,0(a5)
	beq	a4,zero,.L213
	lla	s2,_ZL5sqacc
	lw	a7,32(sp)
	lw	a4,0(s2)
	lw	a0,36(sp)
	lw	a5,4(s2)
	li	s3,0
	li	s5,0
	lla	t3,Wave
.L183:
	srai	a1,s0,4
	slli	a1,a1,2
	add	a1,t3,a1
	lw	a6,0(a1)
	sub	a4,a4,t4
	sub	a5,a5,t5
	add	a6,a6,t1
	sw	a6,0(a1)
	ble	a4,zero,.L180
	ble	a5,zero,.L182
.L181:
	addi	s0,s0,1
	bne	s4,s0,.L183
	sw	a4,0(s2)
	sw	a5,4(s2)
	beq	s3,zero,.L184
	sw	a3,0(s1)
.L184:
	beq	s5,zero,.L209
	sw	a2,4(s1)
.L209:
	lw	s2,160(sp)
	.cfi_restore 18
	lw	s3,156(sp)
	.cfi_restore 19
	lw	s4,152(sp)
	.cfi_restore 20
	lw	s5,148(sp)
	.cfi_restore 21
	lw	s6,144(sp)
	.cfi_restore 22
	lw	s7,140(sp)
	.cfi_restore 23
	lw	s8,136(sp)
	.cfi_restore 24
	lw	s9,132(sp)
	.cfi_restore 25
	lw	s10,128(sp)
	.cfi_restore 26
	lw	s11,124(sp)
	.cfi_restore 27
.L163:
	lw	ra,172(sp)
	.cfi_restore 1
	lw	s0,168(sp)
	.cfi_restore 8
	lw	s1,164(sp)
	.cfi_restore 9
	addi	sp,sp,176
	.cfi_def_cfa_offset 0
	jr	ra
.L168:
	.cfi_def_cfa_offset 176
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	lbu	a0,3(s6)
	mv	a1,t6
	sw	a0,0(s1)
	bne	s7,zero,.L170
.L211:
	lw	a1,20(t0)
	j	.L170
.L180:
	addi	a3,a3,1
	add	a4,a4,a7
	andi	a3,a3,7
	ble	a4,zero,.L180
	slli	t0,a3,2
	slli	a6,t6,2
	addi	t1,sp,16
	addi	a1,t0,96
	addi	a6,a6,96
	add	a1,a1,t1
	add	a6,a6,t1
	lw	a1,-64(a1)
	lw	a6,-64(a6)
	li	s3,1
	add	a1,a1,a6
	slli	a1,a1,2
	add	a1,t2,a1
	lw	t1,0(a1)
	bgt	a5,zero,.L181
.L182:
	addi	a2,a2,1
	add	a5,a5,a0
	andi	a2,a2,7
	ble	a5,zero,.L182
	addi	t6,a2,8
	slli	a6,t6,2
	addi	a1,a6,96
	addi	a6,sp,16
	add	a6,a1,a6
	addi	t1,sp,16
	addi	a1,t0,96
	add	a1,a1,t1
	lw	a1,-64(a1)
	lw	a6,-64(a6)
	li	s5,1
	add	a1,a1,a6
	slli	a1,a1,2
	add	a1,t2,a1
	lw	t1,0(a1)
	j	.L181
.L213:
	lla	t3,Wave
.L177:
	srai	a5,s0,4
	slli	a5,a5,2
	add	a5,t3,a5
	lw	a4,0(a5)
	addi	s0,s0,1
	add	a4,a4,t1
	sw	a4,0(a5)
	bne	s4,s0,.L177
	j	.L209
.L210:
	sw	zero,0(s5)
	j	.L166
	.cfi_endproc
.LFE24:
	.size	_ZL7RDoSQLQv, .-_ZL7RDoSQLQv
	.section	.text._ZL6RDoSQ1v,"ax",@progbits
	.align	2
	.type	_ZL6RDoSQ1v, @function
_ZL6RDoSQ1v:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	la s0, curfreq; lw s0, 0(s0);
	sw	s1,4(sp)
	la a3, soundtsoffs; lw a3, 0(a3);
	.cfi_offset 9, -12
	la s1, soundtimestamp; lw s1, 0(s1);
	sw	ra,12(sp)
	addi	a4,s0,-8
	li	a5,2039
	add	s1,s1,a3
	lla	t1,_ZL9ChannelBC
	.cfi_offset 1, -4
	bgtu	a4,a5,.L215
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,PSG
	lbu	a5,1(s2)
	andi	a4,a5,8
	bne	a4,zero,.L216
	andi	a5,a5,7
	srl	a5,s0,a5
	add	a5,a5,s0
	slli	a4,a5,20
	blt	a4,zero,.L233
.L216:
	la a5, lengthcount; lw a5, 0(a5);
	lla	t1,_ZL9ChannelBC
	beq	a5,zero,.L233
	lla	a4,EnvUnits
	lbu	a5,1(a4)
	andi	a5,a5,1
	bne	a5,zero,.L234
	lbu	a1,3(a4)
.L218:
	la a0, FSettings+16; lw a0, 0(a0);
	li	a5,256
	beq	a0,a5,.L219
	call	__mulsi3
	srai	a1,a0,31
	andi	a1,a1,255
	add	a1,a1,a0
	srai	a1,a1,8
.L219:
	lbu	a5,0(s2)
	lla	t1,_ZL9ChannelBC
	lw	a4,0(t1)
	srli	a5,a5,6
	lla	a3,_ZL10RectDuties
	slli	a5,a5,2
	add	a5,a3,a5
	lla	t4,_ZL13RectDutyCount
	slli	a3,a4,2
	addi	s0,s0,1
	lla	t3,_ZL7wlcount
	lla	a0,WaveHi
	sub	a4,s1,a4
	lw	a7,0(a5)
	lw	a2,0(t4)
	lw	a5,0(t3)
	slli	a1,a1,24
	add	a3,a3,a0
	slli	s0,s0,1
	ble	a4,zero,.L220
.L223:
	addi	a5,a5,-1
	addi	a4,a4,-1
	addi	a6,a2,1
	bge	a2,a7,.L221
	lw	a0,0(a3)
	add	a0,a0,a1
	sw	a0,0(a3)
.L221:
	bne	a5,zero,.L222
	andi	a2,a6,7
	mv	a5,s0
.L222:
	addi	a3,a3,4
	bne	a4,zero,.L223
.L220:
	lw	s2,0(sp)
	.cfi_restore 18
	sw	a2,0(t4)
	sw	a5,0(t3)
.L215:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s1,0(t1)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L233:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s1,0(t1)
	lw	s2,0(sp)
	.cfi_restore 18
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L234:
	.cfi_restore_state
	lbu	a1,0(a4)
	j	.L218
	.cfi_endproc
.LFE22:
	.size	_ZL6RDoSQ1v, .-_ZL6RDoSQ1v
	.section	.text._ZL9Write_PSGjh,"ax",@progbits
	.align	2
	.type	_ZL9Write_PSGjh, @function
_ZL9Write_PSGjh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	andi	s0,a0,31
	li	a5,16
	mv	s1,a1
	bgtu	s0,a5,.L253
	lla	a4,.L238
	slli	a5,s0,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL9Write_PSGjh,"a",@progbits
	.align	2
	.align	2
.L238:
	.word	.L251-.L238
	.word	.L250-.L238
	.word	.L249-.L238
	.word	.L248-.L238
	.word	.L247-.L238
	.word	.L246-.L238
	.word	.L245-.L238
	.word	.L244-.L238
	.word	.L253-.L238
	.word	.L253-.L238
	.word	.L243-.L238
	.word	.L242-.L238
	.word	.L241-.L238
	.word	.L253-.L238
	.word	.L240-.L238
	.word	.L239-.L238
	.word	.L237-.L238
	.section	.text._ZL9Write_PSGjh
.L251:
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	slli	a4,s1,4
	andi	a4,a4,768
	andi	a5,s1,15
	or	a5,a5,a4
	la a4, EnvUnits; sh a5, 0(a4);
	la a5, swapDuty; lbu a5, 0(a5);
	beq	a5,zero,.L253
.L252:
	srli	a5,s1,1
	andi	a4,s1,63
	andi	a5,a5,64
	slli	s1,s1,1
	or	a5,a5,a4
	andi	s1,s1,128
	or	s1,a5,s1
.L253:
	lla	a5,PSG
	add	a5,a5,s0
	sb	s1,0(a5)
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
.L237:
	.cfi_restore_state
	la a5, _ZL5DoPCM; lw a5, 0(a5);
	sw	s2,0(sp)
	.cfi_offset 18, -16
	jalr	a5
	andi	a5,s1,15
	la a4, PAL; lbu a4, 0(a4);
	slli	a5,a5,2
	bne	a4,zero,.L276
	lla	a4,_ZL12NTSCDMCTable
	add	a5,a4,a5
	lw	a4,0(a5)
.L260:
	lla	s2,_ZL8SIRQStat
	lb	a5,0(s2)
	la a3, DMCPeriod; sw a4, 0(a3);
	blt	a5,zero,.L277
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L253
.L250:
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	andi	a5,s1,-128
	la a4, _ZL7sweepon; sb a5, 0(a4);
	li	a5,1
	la a4, _ZL11SweepReload; sb a5, 0(a4);
	j	.L253
.L248:
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	la a5, EnabledChannels; lbu a5, 0(a5);
	andi	a5,a5,1
	beq	a5,zero,.L254
	srli	a4,s1,3
	lla	a5,_ZL11lengthtable
	add	a5,a5,a4
	lbu	a5,0(a5)
	la a4, lengthcount; sw a5, 0(a4);
.L254:
	lla	a3,curfreq
	lbu	a5,0(a3)
	slli	a4,s1,8
	andi	a4,a4,1792
	or	a5,a5,a4
	sw	a5,0(a3)
	li	a5,7
	la a4, _ZL13RectDutyCount; sw a5, 0(a4);
	li	a5,1
	la a4, EnvUnits+4; sw a5, 0(a4);
	j	.L253
.L247:
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	slli	a4,s1,4
	andi	a4,a4,768
	andi	a5,s1,15
	or	a5,a5,a4
	la a4, EnvUnits+8; sh a5, 0(a4);
	la a5, swapDuty; lbu a5, 0(a5);
	bne	a5,zero,.L252
	j	.L253
.L249:
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	lla	a3,curfreq
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,s1
	sw	a5,0(a3)
	j	.L253
.L246:
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	andi	a5,s1,-128
	la a4, _ZL7sweepon+1; sb a5, 0(a4);
	li	a5,1
	la a4, _ZL11SweepReload+1; sb a5, 0(a4);
	j	.L253
.L245:
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	lla	a3,curfreq
	lw	a5,4(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,s1
	sw	a5,4(a3)
	j	.L253
.L244:
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, EnabledChannels; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L256
	srli	a4,s1,3
	lla	a5,_ZL11lengthtable
	add	a5,a5,a4
	lbu	a5,0(a5)
	la a4, lengthcount+4; sw a5, 0(a4);
.L256:
	lla	a3,curfreq
	lbu	a5,4(a3)
	slli	a4,s1,8
	andi	a4,a4,1792
	or	a5,a5,a4
	sw	a5,4(a3)
	li	a5,7
	la a4, _ZL13RectDutyCount+4; sw a5, 0(a4);
	li	a5,1
	la a4, EnvUnits+12; sw a5, 0(a4);
	j	.L253
.L243:
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
	j	.L253
.L242:
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
	la a5, EnabledChannels; lbu a5, 0(a5);
	andi	a5,a5,4
	beq	a5,zero,.L257
	srli	a4,s1,3
	lla	a5,_ZL11lengthtable
	add	a5,a5,a4
	lbu	a5,0(a5)
	la a4, lengthcount+8; sw a5, 0(a4);
.L257:
	li	a5,1
	la a4, _ZL7TriMode; sb a5, 0(a4);
	j	.L253
.L241:
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	slli	a4,s1,4
	andi	a4,a4,768
	andi	a5,s1,15
	or	a5,a5,a4
	la a4, EnvUnits+16; sh a5, 0(a4);
	j	.L253
.L240:
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	j	.L253
.L239:
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, EnabledChannels; lbu a5, 0(a5);
	andi	a5,a5,8
	beq	a5,zero,.L258
	srli	a4,s1,3
	lla	a5,_ZL11lengthtable
	add	a5,a5,a4
	lbu	a5,0(a5)
	la a4, lengthcount+12; sw a5, 0(a4);
.L258:
	li	a5,1
	la a4, EnvUnits+20; sw a5, 0(a4);
	j	.L253
.L276:
	.cfi_offset 18, -16
	lla	a4,_ZL11PALDMCTable
	add	a5,a4,a5
	lw	a4,0(a5)
	j	.L260
.L277:
	slli	a5,s1,24
	srai	a5,a5,24
	li	a0,256
	blt	a5,zero,.L261
	call	_Z12X6502_IRQEndi
	lbu	a5,0(s2)
	andi	a5,a5,127
	sb	a5,0(s2)
	lw	s2,0(sp)
	.cfi_remember_state
	.cfi_restore 18
	j	.L253
.L261:
	.cfi_restore_state
	call	_Z14X6502_IRQBegini
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L253
	.cfi_endproc
.LFE11:
	.size	_ZL9Write_PSGjh, .-_ZL9Write_PSGjh
	.section	.text._ZL6RDoSQ2v,"ax",@progbits
	.align	2
	.type	_ZL6RDoSQ2v, @function
_ZL6RDoSQ2v:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	la s0, curfreq+4; lw s0, 0(s0);
	sw	s1,4(sp)
	la a3, soundtsoffs; lw a3, 0(a3);
	.cfi_offset 9, -12
	la s1, soundtimestamp; lw s1, 0(s1);
	sw	ra,12(sp)
	addi	a4,s0,-8
	li	a5,2039
	add	s1,s1,a3
	lla	t1,_ZL9ChannelBC
	.cfi_offset 1, -4
	bgtu	a4,a5,.L279
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,PSG
	lbu	a5,5(s2)
	andi	a4,a5,8
	bne	a4,zero,.L280
	andi	a5,a5,7
	srl	a5,s0,a5
	add	a5,a5,s0
	slli	a4,a5,20
	blt	a4,zero,.L297
.L280:
	la a5, lengthcount+4; lw a5, 0(a5);
	lla	t1,_ZL9ChannelBC
	beq	a5,zero,.L297
	lla	a4,EnvUnits
	lbu	a5,9(a4)
	andi	a5,a5,1
	bne	a5,zero,.L298
	lbu	a1,11(a4)
.L282:
	la a0, FSettings+20; lw a0, 0(a0);
	li	a5,256
	beq	a0,a5,.L283
	call	__mulsi3
	srai	a1,a0,31
	andi	a1,a1,255
	add	a1,a1,a0
	srai	a1,a1,8
.L283:
	lbu	a5,4(s2)
	lla	t1,_ZL9ChannelBC
	lw	a4,4(t1)
	srli	a5,a5,6
	lla	a3,_ZL10RectDuties
	slli	a5,a5,2
	add	a5,a3,a5
	lla	t4,_ZL13RectDutyCount
	slli	a3,a4,2
	addi	s0,s0,1
	lla	t3,_ZL7wlcount
	lla	a0,WaveHi
	sub	a4,s1,a4
	lw	a7,0(a5)
	lw	a2,4(t4)
	lw	a5,4(t3)
	slli	a1,a1,24
	add	a3,a3,a0
	slli	s0,s0,1
	ble	a4,zero,.L284
.L287:
	addi	a5,a5,-1
	addi	a4,a4,-1
	addi	a6,a2,1
	bge	a2,a7,.L285
	lw	a0,0(a3)
	add	a0,a0,a1
	sw	a0,0(a3)
.L285:
	bne	a5,zero,.L286
	andi	a2,a6,7
	mv	a5,s0
.L286:
	addi	a3,a3,4
	bne	a4,zero,.L287
.L284:
	lw	s2,0(sp)
	.cfi_restore 18
	sw	a2,4(t4)
	sw	a5,4(t3)
.L279:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s1,4(t1)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L297:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s1,4(t1)
	lw	s2,0(sp)
	.cfi_restore 18
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L298:
	.cfi_restore_state
	lbu	a1,8(a4)
	j	.L282
	.cfi_endproc
.LFE23:
	.size	_ZL6RDoSQ2v, .-_ZL6RDoSQ2v
	.section	.text._ZL13Write_DMCRegsjh,"ax",@progbits
	.align	2
	.type	_ZL13Write_DMCRegsjh, @function
_ZL13Write_DMCRegsjh:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	andi	a0,a0,15
	li	a5,2
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a1
	beq	a0,a5,.L300
	bgtu	a0,a5,.L301
	beq	a0,zero,.L319
	la a5, _ZL5DoPCM; lw a5, 0(a5);
	andi	s0,s0,127
	jalr	a5
	la a5, InitialRawDALatch; sb s0, 0(a5);
	la a5, RawDALatch; sb s0, 0(a5);
	beq	s0,zero,.L299
	li	a5,1
	la a4, DMC_7bit; sb a5, 0(a4);
.L299:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L301:
	.cfi_restore_state
	li	a5,3
	bne	a0,a5,.L299
	la a5, DMCSizeLatch; sb a1, 0(a5);
	beq	a1,zero,.L299
	la a5, DMC_7bit; sb zero, 0(a5);
.L320:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L300:
	.cfi_restore_state
	la a5, DMCAddressLatch; sb a1, 0(a5);
	beq	a1,zero,.L299
	la a5, DMC_7bit; sb zero, 0(a5);
	j	.L320
.L319:
	la a5, _ZL5DoPCM; lw a5, 0(a5);
	sw	s1,4(sp)
	.cfi_offset 9, -12
	jalr	a5
	andi	a5,s0,15
	la a4, PAL; lbu a4, 0(a4);
	slli	a5,a5,2
	beq	a4,zero,.L306
	lla	a4,_ZL11PALDMCTable
	add	a5,a4,a5
	lw	a4,0(a5)
.L307:
	lla	s1,_ZL8SIRQStat
	lb	a5,0(s1)
	la a3, DMCPeriod; sw a4, 0(a3);
	blt	a5,zero,.L321
.L308:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, DMCFormat; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L306:
	.cfi_restore_state
	lla	a4,_ZL12NTSCDMCTable
	add	a5,a4,a5
	lw	a4,0(a5)
	j	.L307
.L321:
	slli	a5,s0,24
	srai	a5,a5,24
	li	a0,256
	blt	a5,zero,.L309
	call	_Z12X6502_IRQEndi
	lbu	a5,0(s1)
	andi	a5,a5,127
	sb	a5,0(s1)
	j	.L308
.L309:
	call	_Z14X6502_IRQBegini
	j	.L308
	.cfi_endproc
.LFE12:
	.size	_ZL13Write_DMCRegsjh, .-_ZL13Write_DMCRegsjh
	.section	.text._Z9CheckFreqjh,"ax",@progbits
	.align	2
	.globl	_Z9CheckFreqjh
	.hidden	_Z9CheckFreqjh
	.type	_Z9CheckFreqjh, @function
_Z9CheckFreqjh:
.LFB9:
	.cfi_startproc
	andi	a5,a1,8
	bne	a5,zero,.L324
	andi	a1,a1,7
	srl	a1,a0,a1
	add	a0,a1,a0
	srli	a0,a0,11
	xori	a0,a0,1
	andi	a0,a0,1
	ret
.L324:
	li	a0,1
	ret
	.cfi_endproc
.LFE9:
	.size	_Z9CheckFreqjh, .-_Z9CheckFreqjh
	.section	.text._Z16FrameSoundUpdatev,"ax",@progbits
	.align	2
	.globl	_Z16FrameSoundUpdatev
	.hidden	_Z16FrameSoundUpdatev
	.type	_Z16FrameSoundUpdatev, @function
_Z16FrameSoundUpdatev:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	lla	s0,_ZL4fcnt
	lbu	s1,0(s0)
	bne	s1,zero,.L326
	la a5, IRQFrameMode; lbu a5, 0(a5);
	andi	a5,a5,3
	beq	a5,zero,.L382
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
.L354:
	lla	a5,PSG
	lbu	a1,8(a5)
	lla	a4,lengthcount
	slli	a7,a1,24
	srai	a7,a7,24
	blt	a7,zero,.L331
	lw	a3,8(a4)
	ble	a3,zero,.L331
	addi	a3,a3,-1
	sw	a3,8(a4)
.L331:
	lbu	a5,12(a5)
	andi	a5,a5,32
	bne	a5,zero,.L332
	lw	a5,12(a4)
	ble	a5,zero,.L332
	addi	a5,a5,-1
	sw	a5,12(a4)
.L332:
	lla	a3,PSG
	lla	a4,_ZL10SweepCount
	lla	a2,_ZL11SweepReload
	lla	t1,curfreq
	lla	a0,lengthcount
	li	a6,0
	lla	t4,_ZL7sweepon
.L341:
	lbu	a5,0(a3)
	andi	a5,a5,32
	bne	a5,zero,.L333
	lw	a5,0(a0)
	ble	a5,zero,.L333
	addi	a5,a5,-1
	sw	a5,0(a0)
.L333:
	lbu	a5,0(a4)
	bne	a5,zero,.L334
.L337:
	add	a5,a6,t4
	lbu	t3,0(a5)
	lbu	a5,1(a3)
	beq	t3,zero,.L336
	andi	t3,a5,7
	bne	t3,zero,.L383
.L336:
	srli	a5,a5,4
	andi	a5,a5,7
	addi	a5,a5,1
	sb	a5,0(a4)
.L338:
	lbu	a5,0(a2)
	beq	a5,zero,.L340
	lbu	a5,1(a3)
	sb	zero,0(a2)
	srli	a5,a5,4
	andi	a5,a5,7
	addi	a5,a5,1
	sb	a5,0(a4)
.L340:
	addi	a3,a3,4
	addi	a4,a4,1
	addi	a2,a2,1
	addi	t1,t1,4
	addi	a0,a0,4
	bne	a6,zero,.L342
	li	a6,1
	j	.L341
.L382:
	lla	a4,_ZL8SIRQStat
	lbu	a5,0(a4)
	li	a0,512
	ori	a5,a5,64
	sb	a5,0(a4)
	call	_Z14X6502_IRQBegini
	lbu	s1,0(s0)
.L326:
	li	a5,3
	bne	s1,a5,.L328
	la a5, IRQFrameMode; lbu a5, 0(a5);
	andi	a5,a5,2
	bne	a5,zero,.L384
.L329:
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
	la a1, PSG+8; lbu a1, 0(a1);
	slli	a7,a1,24
	srai	a7,a7,24
.L342:
	la a5, _ZL7TriMode; lbu a5, 0(a5);
	beq	a5,zero,.L343
.L386:
	andi	a1,a1,127
	la a5, TriCount; sb a1, 0(a5);
.L344:
	blt	a7,zero,.L345
	la a5, _ZL7TriMode; sb zero, 0(a5);
.L345:
	lla	a5,EnvUnits
	lla	a2,EnvUnits+24
	li	a1,15
.L353:
	lw	a4,4(a5)
	bne	a4,zero,.L385
	lbu	a3,2(a5)
	addi	a4,a3,-1
	andi	a4,a4,0xff
	bne	a3,zero,.L348
.L351:
	lbu	a3,0(a5)
	lbu	a4,3(a5)
	addi	a3,a3,1
	sb	a3,2(a5)
	bne	a4,zero,.L349
	lbu	a3,1(a5)
	andi	a3,a3,2
	beq	a3,zero,.L347
.L349:
	addi	a4,a4,-1
	andi	a4,a4,15
	sb	a4,3(a5)
.L347:
	addi	a5,a5,8
	bne	a2,a5,.L353
	lbu	a5,0(s0)
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(s0)
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
.L328:
	.cfi_restore_state
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	andi	s1,s1,1
	jalr	a5
	beq	s1,zero,.L354
	la a1, PSG+8; lbu a1, 0(a1);
	slli	a7,a1,24
	la a5, _ZL7TriMode; lbu a5, 0(a5);
	srai	a7,a7,24
	bne	a5,zero,.L386
.L343:
	lla	a4,TriCount
	lbu	a5,0(a4)
	beq	a5,zero,.L344
	addi	a5,a5,-1
	sb	a5,0(a4)
	j	.L344
.L348:
	sb	a4,2(a5)
	bne	a4,zero,.L347
	j	.L351
.L385:
	lbu	a4,0(a5)
	sb	a1,3(a5)
	sw	zero,4(a5)
	addi	a4,a4,1
	sb	a4,2(a5)
	j	.L347
.L334:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L338
	j	.L337
.L384:
	lla	a4,_ZL5fhcnt
	lw	a5,0(a4)
	la a3, _ZL5fhinc; lw a3, 0(a3);
	add	a5,a5,a3
	sw	a5,0(a4)
	j	.L329
.L383:
	lw	t5,0(t1)
	li	t6,7
	ble	t5,t6,.L336
	andi	t6,a5,8
	sra	t3,t5,t3
	bne	t6,zero,.L387
	add	t5,t5,t3
	li	t3,2047
	bgt	t5,t3,.L336
	sw	t5,0(t1)
	j	.L336
.L387:
	xori	t6,a6,1
	add	t3,t6,t3
	sub	t5,t5,t3
	sw	t5,0(t1)
	j	.L336
	.cfi_endproc
.LFE16:
	.size	_Z16FrameSoundUpdatev, .-_Z16FrameSoundUpdatev
	.section	.text._Z11Write_IRQFMjh,"ax",@progbits
	.align	2
	.globl	_Z11Write_IRQFMjh
	.hidden	_Z11Write_IRQFMjh
	.type	_Z11Write_IRQFMjh, @function
_Z11Write_IRQFMjh:
.LFB28:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	la a5, _ZL4fcnt; sb zero, 0(a5);
	.cfi_offset 8, -8
	srli	s0,a1,6
	sw	ra,12(sp)
	.cfi_offset 1, -4
	andi	a5,s0,2
	bne	a5,zero,.L394
.L389:
	li	a5,1
	la a4, _ZL4fcnt; sb a5, 0(a4);
	li	a0,512
	la a5, _ZL5fhinc; lw a5, 0(a5);
	la a4, _ZL5fhcnt; sw a5, 0(a4);
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL8SIRQStat
	lbu	a5,0(a4)
	la a3, IRQFrameMode; sb s0, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L394:
	.cfi_restore_state
	call	_Z16FrameSoundUpdatev
	j	.L389
	.cfi_endproc
.LFE28:
	.size	_Z11Write_IRQFMjh, .-_Z11Write_IRQFMjh
	.section	.text._Z17FCEU_SoundCPUHooki,"ax",@progbits
	.align	2
	.globl	_Z17FCEU_SoundCPUHooki
	.hidden	_Z17FCEU_SoundCPUHooki
	.type	_Z17FCEU_SoundCPUHooki, @function
_Z17FCEU_SoundCPUHooki:
.LFB19:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE19:
	.size	_Z17FCEU_SoundCPUHooki, .-_Z17FCEU_SoundCPUHooki
	.section	.text._Z14SetNESSoundMapv,"ax",@progbits
	.align	2
	.globl	_Z14SetNESSoundMapv
	.hidden	_Z14SetNESSoundMapv
	.type	_Z14SetNESSoundMapv, @function
_Z14SetNESSoundMapv:
.LFB29:
	.cfi_startproc
	li	a1,16384
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a2,_ZL9Write_PSGjh
	addi	a1,a1,15
	li	a0,16384
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL13Write_DMCRegsjh
	addi	a1,a1,19
	addi	a0,a0,16
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	addi	a1,a1,23
	mv	a0,a1
	lla	a2,_Z11Write_IRQFMjh
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	addi	a1,a1,21
	mv	a0,a1
	lla	a2,_ZL11StatusWritejh
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,16384
	addi	a1,a1,21
	lla	a2,_ZL10StatusReadj
	mv	a0,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE29:
	.size	_Z14SetNESSoundMapv, .-_Z14SetNESSoundMapv
	.section	.text._Z17FlushEmulateSoundv,"ax",@progbits
	.align	2
	.globl	_Z17FlushEmulateSoundv
	.hidden	_Z17FlushEmulateSoundv
	.type	_Z17FlushEmulateSoundv, @function
_Z17FlushEmulateSoundv:
.LFB30:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s4,24(sp)
	.cfi_offset 20, -24
	lla	s4,soundtimestamp
	lw	a5,0(s4)
	sw	s3,28(sp)
	sw	ra,44(sp)
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	li	s3,0
	beq	a5,zero,.L398
	sw	s5,20(sp)
	.cfi_offset 21, -28
	lla	s5,FSettings
	lw	a5,60(s5)
	sw	s0,40(sp)
	.cfi_offset 8, -8
	beq	a5,zero,.L426
	la a5, _ZL5DoSQ1; lw a5, 0(a5);
	sw	s1,36(sp)
	sw	s2,32(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	jalr	a5
	la a5, _ZL5DoSQ2; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL10DoTriangle; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL7DoNoise; lw a5, 0(a5);
	jalr	a5
	la a5, _ZL5DoPCM; lw a5, 0(a5);
	jalr	a5
	lw	a5,64(s5)
	lla	s0,soundtsoffs
	ble	a5,zero,.L402
	lw	t1,0(s0)
	lla	s2,GameExpSound
	lw	a5,8(s2)
	slli	s3,t1,2
	lla	s1,WaveHi
	add	s3,s1,s3
	beq	a5,zero,.L403
	jalr	a5
	lw	t1,0(s0)
.L403:
	lw	a2,0(s4)
	li	a0,65536
	lla	a7,_ZL8wlookup1
	mv	a1,a2
	lla	a6,_ZL8wlookup2
	addi	a0,a0,-1
	beq	a2,zero,.L407
.L404:
	lw	a5,0(s3)
	addi	s3,s3,4
	addi	a1,a1,-1
	srli	a3,a5,24
	srli	a4,a5,14
	slli	a3,a3,2
	add	a3,a7,a3
	andi	a4,a4,1020
	lw	a3,0(a3)
	add	a4,a6,a4
	lw	a4,0(a4)
	and	a5,a5,a0
	add	a5,a5,a3
	add	a5,a5,a4
	sw	a5,-4(s3)
	bne	a1,zero,.L404
.L407:
	add	a2,a2,t1
	addi	a3,sp,12
	lla	a1,WaveFinal
	lla	a0,WaveHi
	call	_Z14NeoFilterSoundPiS_jS_
	lw	a5,0(s0)
	lw	a1,0(s4)
	lw	a2,12(sp)
	mv	s3,a0
	add	a1,a1,a5
	sub	a1,a1,a2
	slli	a1,a1,2
	slli	a2,a2,2
	add	a1,s1,a1
	lla	a0,WaveHi
	call	memmove
	lw	a0,12(sp)
	li	a2,40960
	addi	a2,a2,-960
	sub	a2,a2,a0
	slli	a0,a0,2
	slli	a2,a2,2
	li	a1,0
	add	a0,s1,a0
	call	memset
	lw	a5,12(s2)
	beq	a5,zero,.L406
	lw	a0,12(sp)
	jalr	a5
.L406:
	lw	a4,12(sp)
	lla	a5,_ZL9ChannelBC
	lw	s1,36(sp)
	.cfi_restore 9
	sw	a4,0(a5)
	sw	a4,4(a5)
	sw	a4,8(a5)
	sw	a4,12(a5)
	sw	a4,16(a5)
	lw	a5,64(s5)
	lw	s2,32(sp)
	.cfi_restore 18
	bgt	a5,zero,.L427
.L410:
	andi	a0,s3,15
	lla	a5,_ZL9ChannelBC
	la a1, soundtsinc; lw a1, 0(a1);
	sw	a0,0(a5)
	sw	a0,4(a5)
	sw	a0,8(a5)
	sw	a0,12(a5)
	sw	a0,16(a5)
	call	__mulsi3
	srli	a0,a0,16
	sw	a0,0(s0)
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s0,40(sp)
	.cfi_restore 8
	srai	s3,s3,4
.L398:
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s4,24(sp)
	.cfi_restore 20
	mv	a0,s3
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L426:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	sw	zero,12(sp)
	lla	s0,soundtsoffs
.L401:
	lw	a5,64(s5)
	ble	a5,zero,.L410
.L427:
	lw	a5,12(sp)
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s5,20(sp)
	.cfi_restore 21
	sw	a5,0(s0)
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s4,24(sp)
	.cfi_restore 20
	mv	a0,s3
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L402:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	lw	a5,0(s0)
	lw	a0,0(s4)
	la a1, soundtsinc; lw a1, 0(a1);
	add	a0,a0,a5
	slli	a0,a0,16
	call	__udivsi3
	la a5, GameExpSound; lw a5, 0(a5);
	mv	s1,a0
	mv	s3,a0
	andi	s2,a0,15
	beq	a5,zero,.L408
	mv	a0,s2
	jalr	a5
.L408:
	srai	s1,s1,4
	mv	a2,s1
	lla	a1,WaveFinal
	lla	a0,Wave
	call	_Z10SexyFilterPiS_i
	lla	a5,Wave
	slli	s1,s1,2
	beq	s2,zero,.L409
	add	a4,a5,s1
	lw	a4,0(a4)
	sw	a4,0(a5)
.L409:
	add	a5,a5,s1
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s1,36(sp)
	.cfi_restore 9
	sw	zero,0(a5)
	j	.L401
	.cfi_endproc
.LFE30:
	.size	_Z17FlushEmulateSoundv, .-_Z17FlushEmulateSoundv
	.section	.rodata._Z13FCEUSND_Resetv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Warning: These variables were not found in the save state and will keep their current value: DMCacc=%d, DMCBitCount=%d\n"
	.section	.text._Z13FCEUSND_Resetv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUSND_Resetv
	.hidden	_Z13FCEUSND_Resetv
	.type	_Z13FCEUSND_Resetv, @function
_Z13FCEUSND_Resetv:
.LFB31:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a4, IRQFrameMode; sb zero, 0(a4);
	la a4, _ZL5fhinc; lw a4, 0(a4);
	la a3, _ZL5fhcnt; sw a4, 0(a3);
	li	a5,4096
	la a4, _ZL4fcnt; sb zero, 0(a4);
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL7wlcount
	addi	a5,a5,-2048
	li	a4,1
	la a3, _ZL4nreg; sh a4, 0(a3);
	sw	a5,0(s0)
	la a1, nesincsize; lw a1, 0(a1);
	li	a0,1
	beq	a1,zero,.L429
	li	a0,268435456
	call	__udivsi3
.L429:
	li	a5,4096
	addi	a5,a5,-2048
	sw	a5,4(s0)
	sw	a5,12(s0)
	lla	a4,_ZL5sqacc
	li	a3,1
	la a5, DMCHaveSample; sb zero, 0(a5);
	la a5, _ZL8SIRQStat; sb zero, 0(a5);
	la a5, RawDALatch; sb zero, 0(a5);
	la a5, TriCount; sb zero, 0(a5);
	la a5, _ZL7TriMode; sb zero, 0(a5);
	la a5, _ZL7tristep; sw zero, 0(a5);
	la a5, EnabledChannels; sb zero, 0(a5);
	la a5, lengthcount; sw zero, 0(a5);
	la a5, lengthcount+4; sw zero, 0(a5);
	la a5, lengthcount+8; sw zero, 0(a5);
	la a5, lengthcount+12; sw zero, 0(a5);
	la a5, DMCAddressLatch; sb zero, 0(a5);
	la a5, DMCSizeLatch; sb zero, 0(a5);
	la a5, DMCFormat; sb zero, 0(a5);
	la a5, _ZL7DMCSize; sw zero, 0(a5);
	sw	a0,0(a4)
	sw	a0,4(a4)
	la a2, curfreq; sw zero, 0(a2);
	la a4, _ZL7sweepon; sh zero, 0(a4);
	la a4, curfreq+4; sw zero, 0(a4);
	sw	a3,8(s0)
	la a5, movieSyncHackOn; lw a5, 0(a5);
	beq	a5,zero,.L430
	la a5, resetDMCacc; lw a5, 0(a5);
	bne	a5,zero,.L439
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L430:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	la a5, DMCacc; sw a3, 0(a5);
	la a5, DMCBitCount; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L439:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a2, DMCBitCount; lbu a2, 0(a2);
	la a1, DMCacc; lw a1, 0(a1);
	lla	a0,.LC0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE31:
	.size	_Z13FCEUSND_Resetv, .-_Z13FCEUSND_Resetv
	.section	.text._Z13FCEUSND_Powerv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUSND_Powerv
	.hidden	_Z13FCEUSND_Powerv
	.type	_Z13FCEUSND_Powerv, @function
_Z13FCEUSND_Powerv:
.LFB32:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z14SetNESSoundMapv
	li	a2,16
	li	a1,0
	lla	a0,PSG
	call	memset
	call	_Z13FCEUSND_Resetv
	li	a2,12288
	addi	a2,a2,-2048
	li	a1,0
	lla	a0,Wave
	call	memset
	li	a2,159744
	addi	a2,a2,256
	li	a1,0
	lla	a0,WaveHi
	call	memset
	li	a2,24
	li	a1,0
	lla	a0,EnvUnits
	call	memset
	la a5, DMCFormat; lbu a5, 0(a5);
	la a4, _ZL9ChannelBC; sw zero, 0(a4);
	la a4, _ZL9ChannelBC+4; sw zero, 0(a4);
	la a4, _ZL9ChannelBC+8; sw zero, 0(a4);
	la a4, _ZL9ChannelBC+12; sw zero, 0(a4);
	la a4, _ZL9ChannelBC+16; sw zero, 0(a4);
	la a4, soundtsoffs; sw zero, 0(a4);
	andi	a5,a5,15
	la a4, PAL; lbu a4, 0(a4);
	slli	a5,a5,2
	beq	a4,zero,.L441
	lla	a4,_ZL11PALDMCTable
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a4, DMCPeriod; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L441:
	.cfi_restore_state
	lla	a4,_ZL12NTSCDMCTable
	add	a5,a4,a5
	lw	a5,0(a5)
	lw	ra,12(sp)
	.cfi_restore 1
	la a4, DMCPeriod; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE32:
	.size	_Z13FCEUSND_Powerv, .-_Z13FCEUSND_Powerv
	.globl	__divsi3
	.section	.text._Z17SetSoundVariablesv,"ax",@progbits
	.align	2
	.globl	_Z17SetSoundVariablesv
	.hidden	_Z17SetSoundVariablesv
	.type	_Z17SetSoundVariablesv, @function
_Z17SetSoundVariablesv:
.LFB33:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s4,24(sp)
	sw	ra,44(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	lla	s4,PAL
	lbu	a4,0(s4)
	beq	a4,zero,.L470
	lla	s5,FSettings
	li	a5,397312
	lw	s6,60(s5)
	addi	a5,a5,1712
	la a4, _ZL5fhinc; sw a5, 0(a4);
	beq	s6,zero,.L446
.L477:
	sw	s1,36(sp)
	.cfi_offset 9, -12
	li	s1,1564672
	sw	s2,32(sp)
	addi	s1,s1,328
	.cfi_offset 18, -16
	li	s2,8192
	sw	s0,40(sp)
	sw	s3,28(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	lw	s3,64(s5)
	la a5, _ZL8wlookup1; sw zero, 0(a5);
	lla	s0,_ZL8wlookup1+4
	lla	s8,_ZL8wlookup1+128
	addi	s2,s2,36
	mv	s7,s1
	j	.L449
.L473:
	sw	a0,0(s0)
	addi	s0,s0,4
	add	s1,s1,s7
	addi	s2,s2,100
	beq	s0,s8,.L472
.L449:
	mv	a1,s2
	mv	a0,s1
	call	__divsi3
	srli	a5,a0,4
	bne	s3,zero,.L473
	sw	a5,0(s0)
	addi	s0,s0,4
	add	s1,s1,s7
	addi	s2,s2,100
	bne	s0,s8,.L449
.L472:
	li	s1,2682880
	li	s2,24576
	addi	s1,s1,-1311
	la a5, _ZL8wlookup2; sw zero, 0(a5);
	lla	s0,_ZL8wlookup2+4
	lla	s8,_ZL8wlookup2+812
	addi	s2,s2,-147
	mv	s7,s1
	j	.L452
.L475:
	sw	a0,0(s0)
	addi	s0,s0,4
	add	s1,s1,s7
	addi	s2,s2,100
	beq	s8,s0,.L474
.L452:
	mv	a1,s2
	mv	a0,s1
	call	__divsi3
	srli	a5,a0,4
	bne	s3,zero,.L475
	sw	a5,0(s0)
	addi	s0,s0,4
	add	s1,s1,s7
	addi	s2,s2,100
	bne	s8,s0,.L452
.L474:
	ble	s3,zero,.L453
	lla	a5,_ZL8RDoNoisev
	la a4, _ZL7DoNoise; sw a5, 0(a4);
	lla	a5,_ZL11RDoTrianglev
	la a4, _ZL10DoTriangle; sw a5, 0(a4);
	lla	a5,_Z6RDoPCMv
	la a4, _ZL5DoPCM; sw a5, 0(a4);
	lla	a5,_ZL6RDoSQ1v
	la a4, _ZL5DoSQ1; sw a5, 0(a4);
	lla	a5,_ZL6RDoSQ2v
	la a4, _ZL5DoSQ2; sw a5, 0(a4);
.L454:
	mv	a0,s6
	call	_Z11MakeFiltersi
	la a5, GameExpSound+16; lw a5, 0(a5);
	beq	a5,zero,.L456
	jalr	a5
.L456:
	lbu	a5,0(s4)
	li	a0,-889946112
	addi	a0,a0,-1792
	bne	a5,zero,.L457
	li	a0,-629514240
	la a5, dendy; lw a5, 0(a5);
	addi	a0,a0,1489
	bne	a5,zero,.L476
.L457:
	lw	a1,60(s5)
	lla	s0,nesincsize
	srli	a1,a1,2
	call	__udivsi3
	mv	a5,a0
	li	a2,8
	li	a1,0
	lla	a0,_ZL5sqacc
	sw	a5,0(s0)
	call	memset
	li	a2,20
	li	a1,0
	lla	a0,_ZL9ChannelBC
	call	memset
	lbu	a4,0(s4)
	la a5, DMCFormat; lbu a5, 0(a5);
	andi	a5,a5,15
	slli	a5,a5,2
	beq	a4,zero,.L458
	lla	a4,_ZL11PALDMCTable
	add	a5,a4,a5
	lw	a5,0(a5)
.L459:
	lw	a4,0(s0)
	la a3, DMCPeriod; sw a5, 0(a3);
	lw	s0,40(sp)
	.cfi_restore 8
	srli	a5,a4,31
	lw	ra,44(sp)
	.cfi_restore 1
	add	a5,a5,a4
	srai	a5,a5,1
	la a4, soundtsinc; sw a5, 0(a4);
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s7,12(sp)
	.cfi_restore 23
	lw	s8,8(sp)
	.cfi_restore 24
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L470:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	lla	s5,FSettings
	li	a5,356352
	lw	s6,60(s5)
	addi	a5,a5,1608
	la a4, _ZL5fhinc; sw a5, 0(a4);
	bne	s6,zero,.L477
.L446:
	lw	ra,44(sp)
	.cfi_restore 1
	lla	a5,_ZL9Dummyfuncv
	la a4, _ZL5DoSQ2; sw a5, 0(a4);
	la a4, _ZL5DoSQ1; sw a5, 0(a4);
	la a4, _ZL5DoPCM; sw a5, 0(a4);
	la a4, _ZL10DoTriangle; sw a5, 0(a4);
	la a4, _ZL7DoNoise; sw a5, 0(a4);
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L453:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	lla	a4,_ZL7RDoSQLQv
	lla	a5,_ZL21RDoTriangleNoisePCMLQv
	la a3, _ZL5DoSQ1; sw a4, 0(a3);
	la a3, _ZL5DoSQ2; sw a4, 0(a3);
	la a4, _ZL10DoTriangle; sw a5, 0(a4);
	la a4, _ZL7DoNoise; sw a5, 0(a4);
	la a4, _ZL5DoPCM; sw a5, 0(a4);
	j	.L454
.L458:
	lla	a4,_ZL12NTSCDMCTable
	add	a5,a4,a5
	lw	a5,0(a5)
	j	.L459
.L476:
	li	a0,-662945792
	addi	a0,a0,-1092
	j	.L457
	.cfi_endproc
.LFE33:
	.size	_Z17SetSoundVariablesv, .-_Z17SetSoundVariablesv
	.section	.text._Z11FCEUI_Soundi,"ax",@progbits
	.align	2
	.globl	_Z11FCEUI_Soundi
	.hidden	_Z11FCEUI_Soundi
	.type	_Z11FCEUI_Soundi, @function
_Z11FCEUI_Soundi:
.LFB34:
	.cfi_startproc
	la a5, FSettings+60; sw a0, 0(a5);
	tail	_Z17SetSoundVariablesv
	.cfi_endproc
.LFE34:
	.size	_Z11FCEUI_Soundi, .-_Z11FCEUI_Soundi
	.section	.text._Z21FCEUI_SetSoundQualityi,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_SetSoundQualityi
	.hidden	_Z21FCEUI_SetSoundQualityi
	.type	_Z21FCEUI_SetSoundQualityi, @function
_Z21FCEUI_SetSoundQualityi:
.LFB35:
	.cfi_startproc
	la a5, FSettings+64; sw a0, 0(a5);
	tail	_Z17SetSoundVariablesv
	.cfi_endproc
.LFE35:
	.size	_Z21FCEUI_SetSoundQualityi, .-_Z21FCEUI_SetSoundQualityi
	.section	.text._Z20FCEUI_SetSoundVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetSoundVolumej
	.hidden	_Z20FCEUI_SetSoundVolumej
	.type	_Z20FCEUI_SetSoundVolumej, @function
_Z20FCEUI_SetSoundVolumej:
.LFB36:
	.cfi_startproc
	la a5, FSettings+8; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE36:
	.size	_Z20FCEUI_SetSoundVolumej, .-_Z20FCEUI_SetSoundVolumej
	.section	.text._Z23FCEUI_SetTriangleVolumej,"ax",@progbits
	.align	2
	.globl	_Z23FCEUI_SetTriangleVolumej
	.hidden	_Z23FCEUI_SetTriangleVolumej
	.type	_Z23FCEUI_SetTriangleVolumej, @function
_Z23FCEUI_SetTriangleVolumej:
.LFB37:
	.cfi_startproc
	la a5, FSettings+12; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE37:
	.size	_Z23FCEUI_SetTriangleVolumej, .-_Z23FCEUI_SetTriangleVolumej
	.section	.text._Z22FCEUI_SetSquare1Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare1Volumej
	.hidden	_Z22FCEUI_SetSquare1Volumej
	.type	_Z22FCEUI_SetSquare1Volumej, @function
_Z22FCEUI_SetSquare1Volumej:
.LFB38:
	.cfi_startproc
	la a5, FSettings+16; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE38:
	.size	_Z22FCEUI_SetSquare1Volumej, .-_Z22FCEUI_SetSquare1Volumej
	.section	.text._Z22FCEUI_SetSquare2Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare2Volumej
	.hidden	_Z22FCEUI_SetSquare2Volumej
	.type	_Z22FCEUI_SetSquare2Volumej, @function
_Z22FCEUI_SetSquare2Volumej:
.LFB39:
	.cfi_startproc
	la a5, FSettings+20; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE39:
	.size	_Z22FCEUI_SetSquare2Volumej, .-_Z22FCEUI_SetSquare2Volumej
	.section	.text._Z20FCEUI_SetNoiseVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetNoiseVolumej
	.hidden	_Z20FCEUI_SetNoiseVolumej
	.type	_Z20FCEUI_SetNoiseVolumej, @function
_Z20FCEUI_SetNoiseVolumej:
.LFB40:
	.cfi_startproc
	la a5, FSettings+24; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE40:
	.size	_Z20FCEUI_SetNoiseVolumej, .-_Z20FCEUI_SetNoiseVolumej
	.section	.text._Z18FCEUI_SetPCMVolumej,"ax",@progbits
	.align	2
	.globl	_Z18FCEUI_SetPCMVolumej
	.hidden	_Z18FCEUI_SetPCMVolumej
	.type	_Z18FCEUI_SetPCMVolumej, @function
_Z18FCEUI_SetPCMVolumej:
.LFB41:
	.cfi_startproc
	la a5, FSettings+28; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE41:
	.size	_Z18FCEUI_SetPCMVolumej, .-_Z18FCEUI_SetPCMVolumej
	.section	.sbss._ZZL21RDoTriangleNoisePCMLQvE8noiseacc,"aw",@nobits
	.align	2
	.type	_ZZL21RDoTriangleNoisePCMLQvE8noiseacc, @object
	.size	_ZZL21RDoTriangleNoisePCMLQvE8noiseacc, 4
_ZZL21RDoTriangleNoisePCMLQvE8noiseacc:
	.zero	4
	.section	.sbss._ZZL21RDoTriangleNoisePCMLQvE6triacc,"aw",@nobits
	.align	2
	.type	_ZZL21RDoTriangleNoisePCMLQvE6triacc, @object
	.size	_ZZL21RDoTriangleNoisePCMLQvE6triacc, 4
_ZZL21RDoTriangleNoisePCMLQvE6triacc:
	.zero	4
	.section	.sbss._ZZL21RDoTriangleNoisePCMLQvE5tcout,"aw",@nobits
	.align	2
	.type	_ZZL21RDoTriangleNoisePCMLQvE5tcout, @object
	.size	_ZZL21RDoTriangleNoisePCMLQvE5tcout, 4
_ZZL21RDoTriangleNoisePCMLQvE5tcout:
	.zero	4
	.hidden	movieConvertOffset2
	.globl	movieConvertOffset2
	.section	.sbss.movieConvertOffset2,"aw",@nobits
	.align	2
	.type	movieConvertOffset2, @object
	.size	movieConvertOffset2, 4
movieConvertOffset2:
	.zero	4
	.hidden	movieConvertOffset1
	.globl	movieConvertOffset1
	.section	.sbss.movieConvertOffset1,"aw",@nobits
	.align	2
	.type	movieConvertOffset1, @object
	.size	movieConvertOffset1, 4
movieConvertOffset1:
	.zero	4
	.hidden	resetDMCacc
	.globl	resetDMCacc
	.section	.sbss.resetDMCacc,"aw",@nobits
	.align	2
	.type	resetDMCacc, @object
	.size	resetDMCacc, 4
resetDMCacc:
	.zero	4
	.hidden	movieSyncHackOn
	.globl	movieSyncHackOn
	.section	.sbss.movieSyncHackOn,"aw",@nobits
	.align	2
	.type	movieSyncHackOn, @object
	.size	movieSyncHackOn, 4
movieSyncHackOn:
	.zero	4
	.section	.bss._ZL9ChannelBC,"aw",@nobits
	.align	2
	.type	_ZL9ChannelBC, @object
	.size	_ZL9ChannelBC, 20
_ZL9ChannelBC:
	.zero	20
	.section	.sdata._ZL5DoSQ2,"aw"
	.align	2
	.type	_ZL5DoSQ2, @object
	.size	_ZL5DoSQ2, 4
_ZL5DoSQ2:
	.word	_ZL9Dummyfuncv
	.section	.sdata._ZL5DoSQ1,"aw"
	.align	2
	.type	_ZL5DoSQ1, @object
	.size	_ZL5DoSQ1, 4
_ZL5DoSQ1:
	.word	_ZL9Dummyfuncv
	.section	.sdata._ZL5DoPCM,"aw"
	.align	2
	.type	_ZL5DoPCM, @object
	.size	_ZL5DoPCM, 4
_ZL5DoPCM:
	.word	_ZL9Dummyfuncv
	.section	.sdata._ZL10DoTriangle,"aw"
	.align	2
	.type	_ZL10DoTriangle, @object
	.size	_ZL10DoTriangle, 4
_ZL10DoTriangle:
	.word	_ZL9Dummyfuncv
	.section	.sdata._ZL7DoNoise,"aw"
	.align	2
	.type	_ZL7DoNoise, @object
	.size	_ZL7DoNoise, 4
_ZL7DoNoise:
	.word	_ZL9Dummyfuncv
	.hidden	DMCHaveSample
	.globl	DMCHaveSample
	.section	.sbss.DMCHaveSample,"aw",@nobits
	.type	DMCHaveSample, @object
	.size	DMCHaveSample, 1
DMCHaveSample:
	.zero	1
	.section	.sbss._ZL8SIRQStat,"aw",@nobits
	.type	_ZL8SIRQStat, @object
	.size	_ZL8SIRQStat, 1
_ZL8SIRQStat:
	.zero	1
	.section	.sbss._ZL7DMCSize,"aw",@nobits
	.align	2
	.type	_ZL7DMCSize, @object
	.size	_ZL7DMCSize, 4
_ZL7DMCSize:
	.zero	4
	.hidden	DMCBitCount
	.globl	DMCBitCount
	.section	.sbss.DMCBitCount,"aw",@nobits
	.type	DMCBitCount, @object
	.size	DMCBitCount, 1
DMCBitCount:
	.zero	1
	.hidden	DMCPeriod
	.globl	DMCPeriod
	.section	.sbss.DMCPeriod,"aw",@nobits
	.align	2
	.type	DMCPeriod, @object
	.size	DMCPeriod, 4
DMCPeriod:
	.zero	4
	.hidden	DMCacc
	.globl	DMCacc
	.section	.sdata.DMCacc,"aw"
	.align	2
	.type	DMCacc, @object
	.size	DMCacc, 4
DMCacc:
	.word	1
	.section	.rodata._ZL11PALDMCTable,"a"
	.align	2
	.type	_ZL11PALDMCTable, @object
	.size	_ZL11PALDMCTable, 64
_ZL11PALDMCTable:
	.word	398
	.word	354
	.word	316
	.word	298
	.word	276
	.word	236
	.word	210
	.word	198
	.word	176
	.word	148
	.word	132
	.word	118
	.word	98
	.word	78
	.word	66
	.word	50
	.section	.rodata._ZL12NTSCDMCTable,"a"
	.align	2
	.type	_ZL12NTSCDMCTable, @object
	.size	_ZL12NTSCDMCTable, 64
_ZL12NTSCDMCTable:
	.word	428
	.word	380
	.word	340
	.word	320
	.word	286
	.word	254
	.word	226
	.word	214
	.word	190
	.word	160
	.word	142
	.word	128
	.word	106
	.word	84
	.word	72
	.word	54
	.hidden	NoiseFreqTablePAL
	.globl	NoiseFreqTablePAL
	.section	.rodata.NoiseFreqTablePAL,"a"
	.align	2
	.type	NoiseFreqTablePAL, @object
	.size	NoiseFreqTablePAL, 64
NoiseFreqTablePAL:
	.word	4
	.word	7
	.word	14
	.word	30
	.word	60
	.word	88
	.word	118
	.word	148
	.word	188
	.word	236
	.word	354
	.word	472
	.word	708
	.word	944
	.word	1890
	.word	3778
	.hidden	NoiseFreqTableNTSC
	.globl	NoiseFreqTableNTSC
	.section	.rodata.NoiseFreqTableNTSC,"a"
	.align	2
	.type	NoiseFreqTableNTSC, @object
	.size	NoiseFreqTableNTSC, 64
NoiseFreqTableNTSC:
	.word	4
	.word	8
	.word	16
	.word	32
	.word	64
	.word	96
	.word	128
	.word	160
	.word	202
	.word	254
	.word	380
	.word	508
	.word	762
	.word	1016
	.word	2034
	.word	4068
	.section	.rodata._ZL11lengthtable,"a"
	.align	2
	.type	_ZL11lengthtable, @object
	.size	_ZL11lengthtable, 32
_ZL11lengthtable:
	.ascii	"\n\376\024\002(\004P\006\240\b<\n\016\f\032\016\f\020\030\022"
	.ascii	"0\024`\026\300\030H\032\020\034 \036"
	.hidden	lengthcount
	.globl	lengthcount
	.section	.bss.lengthcount,"aw",@nobits
	.align	2
	.type	lengthcount, @object
	.size	lengthcount, 16
lengthcount:
	.zero	16
	.section	.sbss._ZL5sqacc,"aw",@nobits
	.align	2
	.type	_ZL5sqacc, @object
	.size	_ZL5sqacc, 8
_ZL5sqacc:
	.zero	8
	.section	.sbss._ZL5fhinc,"aw",@nobits
	.align	2
	.type	_ZL5fhinc, @object
	.size	_ZL5fhinc, 4
_ZL5fhinc:
	.zero	4
	.section	.sbss._ZL5fhcnt,"aw",@nobits
	.align	2
	.type	_ZL5fhcnt, @object
	.size	_ZL5fhcnt, 4
_ZL5fhcnt:
	.zero	4
	.section	.sbss._ZL4fcnt,"aw",@nobits
	.type	_ZL4fcnt, @object
	.size	_ZL4fcnt, 1
_ZL4fcnt:
	.zero	1
	.section	.sbss._ZL4nreg,"aw",@nobits
	.align	1
	.type	_ZL4nreg, @object
	.size	_ZL4nreg, 2
_ZL4nreg:
	.zero	2
	.section	.sbss._ZL11SweepReload,"aw",@nobits
	.align	2
	.type	_ZL11SweepReload, @object
	.size	_ZL11SweepReload, 2
_ZL11SweepReload:
	.zero	2
	.section	.sbss._ZL10SweepCount,"aw",@nobits
	.align	2
	.type	_ZL10SweepCount, @object
	.size	_ZL10SweepCount, 2
_ZL10SweepCount:
	.zero	2
	.hidden	curfreq
	.globl	curfreq
	.section	.sbss.curfreq,"aw",@nobits
	.align	2
	.type	curfreq, @object
	.size	curfreq, 8
curfreq:
	.zero	8
	.section	.sbss._ZL7sweepon,"aw",@nobits
	.align	2
	.type	_ZL7sweepon, @object
	.size	_ZL7sweepon, 2
_ZL7sweepon:
	.zero	2
	.section	.sbss._ZL13RectDutyCount,"aw",@nobits
	.align	2
	.type	_ZL13RectDutyCount, @object
	.size	_ZL13RectDutyCount, 8
_ZL13RectDutyCount:
	.zero	8
	.section	.rodata._ZL10RectDuties,"a"
	.align	2
	.type	_ZL10RectDuties, @object
	.size	_ZL10RectDuties, 16
_ZL10RectDuties:
	.word	1
	.word	2
	.word	4
	.word	6
	.section	.bss._ZL8wlookup2,"aw",@nobits
	.align	2
	.type	_ZL8wlookup2, @object
	.size	_ZL8wlookup2, 812
_ZL8wlookup2:
	.zero	812
	.section	.bss._ZL8wlookup1,"aw",@nobits
	.align	2
	.type	_ZL8wlookup1, @object
	.size	_ZL8wlookup1, 128
_ZL8wlookup1:
	.zero	128
	.section	.bss._ZL7wlcount,"aw",@nobits
	.align	2
	.type	_ZL7wlcount, @object
	.size	_ZL7wlcount, 16
_ZL7wlcount:
	.zero	16
	.section	.sbss._ZL7tristep,"aw",@nobits
	.align	2
	.type	_ZL7tristep, @object
	.size	_ZL7tristep, 4
_ZL7tristep:
	.zero	4
	.section	.sbss._ZL7TriMode,"aw",@nobits
	.type	_ZL7TriMode, @object
	.size	_ZL7TriMode, 1
_ZL7TriMode:
	.zero	1
	.hidden	TriCount
	.globl	TriCount
	.section	.sbss.TriCount,"aw",@nobits
	.type	TriCount, @object
	.size	TriCount, 1
TriCount:
	.zero	1
	.hidden	WaveFinal
	.globl	WaveFinal
	.section	.bss.WaveFinal,"aw",@nobits
	.align	2
	.type	WaveFinal, @object
	.size	WaveFinal, 10240
WaveFinal:
	.zero	10240
	.hidden	WaveHi
	.globl	WaveHi
	.section	.bss.WaveHi,"aw",@nobits
	.align	2
	.type	WaveHi, @object
	.size	WaveHi, 160000
WaveHi:
	.zero	160000
	.hidden	Wave
	.globl	Wave
	.section	.bss.Wave,"aw",@nobits
	.align	2
	.type	Wave, @object
	.size	Wave, 10240
Wave:
	.zero	10240
	.hidden	soundtsi
	.globl	soundtsi
	.section	.sbss.soundtsi,"aw",@nobits
	.align	2
	.type	soundtsi, @object
	.size	soundtsi, 4
soundtsi:
	.zero	4
	.hidden	soundtsinc
	.globl	soundtsinc
	.section	.sbss.soundtsinc,"aw",@nobits
	.align	2
	.type	soundtsinc, @object
	.size	soundtsinc, 4
soundtsinc:
	.zero	4
	.hidden	nesincsize
	.globl	nesincsize
	.section	.sbss.nesincsize,"aw",@nobits
	.align	2
	.type	nesincsize, @object
	.size	nesincsize, 4
nesincsize:
	.zero	4
	.hidden	soundtsoffs
	.globl	soundtsoffs
	.section	.sbss.soundtsoffs,"aw",@nobits
	.align	2
	.type	soundtsoffs, @object
	.size	soundtsoffs, 4
soundtsoffs:
	.zero	4
	.hidden	EnvUnits
	.globl	EnvUnits
	.section	.bss.EnvUnits,"aw",@nobits
	.align	2
	.type	EnvUnits, @object
	.size	EnvUnits, 24
EnvUnits:
	.zero	24
	.hidden	DMC_7bit
	.globl	DMC_7bit
	.section	.sbss.DMC_7bit,"aw",@nobits
	.type	DMC_7bit, @object
	.size	DMC_7bit, 1
DMC_7bit:
	.zero	1
	.hidden	InitialRawDALatch
	.globl	InitialRawDALatch
	.section	.sbss.InitialRawDALatch,"aw",@nobits
	.type	InitialRawDALatch, @object
	.size	InitialRawDALatch, 1
InitialRawDALatch:
	.zero	1
	.hidden	IRQFrameMode
	.globl	IRQFrameMode
	.section	.sbss.IRQFrameMode,"aw",@nobits
	.type	IRQFrameMode, @object
	.size	IRQFrameMode, 1
IRQFrameMode:
	.zero	1
	.hidden	EnabledChannels
	.globl	EnabledChannels
	.section	.sbss.EnabledChannels,"aw",@nobits
	.type	EnabledChannels, @object
	.size	EnabledChannels, 1
EnabledChannels:
	.zero	1
	.hidden	DMCSizeLatch
	.globl	DMCSizeLatch
	.section	.sbss.DMCSizeLatch,"aw",@nobits
	.type	DMCSizeLatch, @object
	.size	DMCSizeLatch, 1
DMCSizeLatch:
	.zero	1
	.hidden	DMCAddressLatch
	.globl	DMCAddressLatch
	.section	.sbss.DMCAddressLatch,"aw",@nobits
	.type	DMCAddressLatch, @object
	.size	DMCAddressLatch, 1
DMCAddressLatch:
	.zero	1
	.hidden	RawDALatch
	.globl	RawDALatch
	.section	.sbss.RawDALatch,"aw",@nobits
	.type	RawDALatch, @object
	.size	RawDALatch, 1
RawDALatch:
	.zero	1
	.hidden	DMCFormat
	.globl	DMCFormat
	.section	.sbss.DMCFormat,"aw",@nobits
	.type	DMCFormat, @object
	.size	DMCFormat, 1
DMCFormat:
	.zero	1
	.hidden	PSG
	.globl	PSG
	.section	.bss.PSG,"aw",@nobits
	.align	2
	.type	PSG, @object
	.size	PSG, 16
PSG:
	.zero	16
	.hidden	GameExpSound
	.globl	GameExpSound
	.section	.bss.GameExpSound,"aw",@nobits
	.align	2
	.type	GameExpSound, @object
	.size	GameExpSound, 24
GameExpSound:
	.zero	24
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
