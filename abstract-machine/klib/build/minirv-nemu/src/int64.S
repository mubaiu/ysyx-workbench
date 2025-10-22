#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"int64.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__umodsi3
	.globl	__udivsi3
	.globl	__ctzsi2
	.globl	__clzsi2
	.section	.text.__udivmoddi4,"ax",@progbits
	.align	2
	.globl	__udivmoddi4
	.hidden	__udivmoddi4
	.type	__udivmoddi4, @function
__udivmoddi4:
.LFB5:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	ra,44(sp)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	mv	s6,a3
	mv	s3,a0
	mv	s4,a2
	mv	s7,a4
	bne	a1,zero,.L2
	bne	a3,zero,.L3
	beq	a4,zero,.L4
	mv	a1,a2
	call	__umodsi3
	sw	a0,0(s7)
	sw	zero,4(s7)
.L4:
	mv	a1,s4
	mv	a0,s3
	call	__udivsi3
	li	a1,0
.L5:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s6,16(sp)
	.cfi_restore 22
	lw	s7,12(sp)
	.cfi_restore 23
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s5,20(sp)
	sw	s0,40(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	.cfi_offset 8, -8
	mv	s2,a1
	mv	s1,a1
	mv	s5,a2
	bne	a2,zero,.L7
	beq	a3,zero,.L50
	beq	a0,zero,.L51
	addi	a5,a3,-1
	and	a4,a5,a3
	beq	a4,zero,.L52
	mv	a0,a3
	call	__clzsi2
	mv	s0,a0
	mv	a0,s2
	call	__clzsi2
	sub	a4,s0,a0
	li	a5,30
	bgtu	a4,a5,.L20
	addi	a4,a4,1
	li	a5,32
	sub	a5,a5,a4
	sll	a2,s2,a5
	srl	a3,s3,a4
	srl	s0,s2,a4
	sll	a0,s3,a5
	or	s1,a2,a3
.L18:
	li	a3,0
.L22:
	srli	a5,a0,31
	slli	a6,s1,1
	or	a6,a6,a5
	srli	s1,s1,31
	slli	a5,s0,1
	or	a5,a5,s1
	sub	t1,s4,a6
	sgtu	a2,t1,s4
	sub	a7,s6,a5
	sub	a7,a7,a2
	seqz	t1,t1
	sub	a7,a7,t1
	srai	t1,a7,31
	and	s1,t1,s4
	sub	s1,a6,s1
	and	t1,t1,s6
	srli	a2,s5,31
	slli	a0,a0,1
	slli	s5,s5,1
	sgtu	a6,s1,a6
	sub	a5,a5,t1
	addi	a4,a4,-1
	or	s5,s5,a3
	or	a0,a0,a2
	srli	a3,a7,31
	sub	s0,a5,a6
	bne	a4,zero,.L22
	beq	s7,zero,.L24
	sw	s1,0(s7)
	sw	s0,4(s7)
.L24:
	srli	s2,s5,31
	slli	a5,a0,1
	slli	a0,s5,1
	or	a1,s2,a5
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	or	a0,a0,a3
	j	.L5
.L7:
	.cfi_restore_state
	beq	a3,zero,.L53
	mv	a0,a3
	call	__clzsi2
	mv	s0,a0
	mv	a0,s2
	call	__clzsi2
	sub	a4,s0,a0
	li	a5,31
	bgtu	a4,a5,.L20
	addi	a4,a4,1
	li	a5,32
	mv	a0,s3
	beq	a4,a5,.L27
	sub	a5,a5,a4
	srl	a3,s3,a4
	sll	a2,s2,a5
	srl	s0,s2,a4
	sll	a0,s3,a5
	or	s1,a2,a3
	li	s5,0
	j	.L18
.L3:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 21
	beq	a4,zero,.L6
	sw	a0,0(s7)
	sw	zero,4(a4)
.L6:
	li	a0,0
	li	a1,0
	j	.L5
.L53:
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	addi	a5,a2,-1
	and	a4,a5,a2
	bne	a4,zero,.L16
	beq	s7,zero,.L17
	and	a5,a5,a0
	sw	a5,0(s7)
	sw	zero,4(s7)
.L17:
	li	a5,1
	beq	s4,a5,.L25
	mv	a0,s4
	call	__ctzsi2
	li	a4,32
	sub	a4,a4,a0
	mv	a5,a0
	sll	a4,s2,a4
	srl	s3,s3,a0
	srl	a1,s2,a5
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	or	a0,a4,s3
	j	.L5
.L50:
	.cfi_restore_state
	ebreak
.L20:
	beq	s7,zero,.L47
	sw	s2,4(s7)
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	sw	s3,0(s7)
	j	.L6
.L16:
	.cfi_restore_state
	mv	a0,a2
	mv	s0,a3
	call	__clzsi2
	mv	s2,a0
	mv	a0,s1
	call	__clzsi2
	sub	a5,s2,a0
	addi	a4,a5,33
	li	a3,32
	mv	a0,s3
	li	s5,0
	beq	a4,a3,.L18
	li	a2,31
	bgtu	a4,a2,.L19
	sub	a3,a3,a4
	srl	s0,s1,a4
	srl	a5,s3,a4
	sll	s1,s1,a3
	or	s1,s1,a5
	sll	a0,s3,a3
	j	.L18
.L51:
	beq	a4,zero,.L10
	mv	a1,a3
	mv	a0,s2
	call	__umodsi3
	sw	a0,4(s7)
	sw	zero,0(s7)
.L10:
	mv	a1,s6
	mv	a0,s2
	call	__udivsi3
.L48:
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	li	a1,0
	j	.L5
.L25:
	.cfi_restore_state
	mv	a1,s2
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	mv	a0,s3
	j	.L5
.L47:
	.cfi_restore_state
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	j	.L6
.L52:
	.cfi_restore_state
	beq	s7,zero,.L12
	and	a5,a5,a1
	sw	a0,0(s7)
	sw	a5,4(s7)
.L12:
	mv	a0,s6
	call	__ctzsi2
	srl	a0,s2,a0
	j	.L48
.L27:
	li	s0,0
	li	s5,0
	j	.L18
.L19:
	li	s5,64
	sub	s5,s5,a4
	addi	a5,a5,1
	sll	a2,s1,s5
	srl	a3,s3,a5
	sll	s5,s3,s5
	srl	s1,s1,a5
	or	a0,a2,a3
	j	.L18
	.cfi_endproc
.LFE5:
	.size	__udivmoddi4, .-__udivmoddi4
	.section	.text.__divdi3,"ax",@progbits
	.align	2
	.globl	__divdi3
	.hidden	__divdi3
	.type	__divdi3, @function
__divdi3:
.LFB0:
	.cfi_startproc
	srai	a5,a1,31
	srai	t1,a3,31
	xor	a4,a0,a5
	xor	a6,a2,t1
	sub	a0,a4,a5
	sub	a2,a6,t1
	xor	a1,a1,a5
	xor	a3,a3,t1
	sgtu	a7,a2,a6
	sub	a1,a1,a5
	sgtu	a6,a0,a4
	sub	a3,a3,t1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	sub	a3,a3,a7
	sub	a1,a1,a6
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	xor	s0,a5,t1
	call	__udivmoddi4
	xor	a5,a0,s0
	xor	a1,a1,s0
	sub	a0,a5,s0
	lw	ra,12(sp)
	.cfi_restore 1
	sub	a1,a1,s0
	lw	s0,8(sp)
	.cfi_restore 8
	sgtu	a5,a0,a5
	sub	a1,a1,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	__divdi3, .-__divdi3
	.section	.text.__moddi3,"ax",@progbits
	.align	2
	.globl	__moddi3
	.hidden	__moddi3
	.type	__moddi3, @function
__moddi3:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	srai	a7,a3,31
	.cfi_offset 8, -8
	srai	s0,a1,31
	xor	a4,a2,a7
	xor	a5,a0,s0
	sub	a2,a4,a7
	sub	a0,a5,s0
	xor	a3,a3,a7
	xor	a1,a1,s0
	sgtu	a6,a2,a4
	sgtu	a5,a0,a5
	sub	a3,a3,a7
	sub	a1,a1,s0
	addi	a4,sp,8
	sub	a1,a1,a5
	sub	a3,a3,a6
	sw	ra,28(sp)
	.cfi_offset 1, -4
	call	__udivmoddi4
	lw	a5,8(sp)
	lw	a1,12(sp)
	lw	ra,28(sp)
	.cfi_restore 1
	xor	a5,a5,s0
	xor	a1,a1,s0
	sub	a0,a5,s0
	sub	a1,a1,s0
	lw	s0,24(sp)
	.cfi_restore 8
	sgtu	a5,a0,a5
	sub	a1,a1,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	__moddi3, .-__moddi3
	.section	.text.__udivdi3,"ax",@progbits
	.align	2
	.globl	__udivdi3
	.hidden	__udivdi3
	.type	__udivdi3, @function
__udivdi3:
.LFB3:
	.cfi_startproc
	li	a4,0
	tail	__udivmoddi4
	.cfi_endproc
.LFE3:
	.size	__udivdi3, .-__udivdi3
	.section	.text.__umoddi3,"ax",@progbits
	.align	2
	.globl	__umoddi3
	.hidden	__umoddi3
	.type	__umoddi3, @function
__umoddi3:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a4,sp,8
	sw	ra,28(sp)
	.cfi_offset 1, -4
	call	__udivmoddi4
	lw	ra,28(sp)
	.cfi_restore 1
	lw	a0,8(sp)
	lw	a1,12(sp)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	__umoddi3, .-__umoddi3
	.globl	__muldi3
	.section	.text.__divmoddi4,"ax",@progbits
	.align	2
	.globl	__divmoddi4
	.hidden	__divmoddi4
	.type	__divmoddi4, @function
__divmoddi4:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	srai	a5,a1,31
	srai	a6,a3,31
	sw	s1,20(sp)
	sw	s3,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	mv	s1,a1
	mv	s3,a3
	xor	a1,a0,a5
	xor	a3,a2,a6
	sw	s2,16(sp)
	sw	s5,4(sp)
	xor	t1,s3,a6
	xor	a7,s1,a5
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	mv	s2,a0
	mv	s5,a2
	sub	a0,a1,a5
	sub	a2,a3,a6
	sgtu	a3,a2,a3
	sub	t1,t1,a6
	sub	a7,a7,a5
	sgtu	a1,a0,a1
	sw	s4,8(sp)
	sub	a3,t1,a3
	.cfi_offset 20, -24
	mv	s4,a4
	sub	a1,a7,a1
	li	a4,0
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s6,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 22, -32
	xor	s0,a5,a6
	call	__udivmoddi4
	xor	a0,a0,s0
	sub	s6,a0,s0
	xor	a1,a1,s0
	sgtu	a0,s6,a0
	sub	s0,a1,s0
	sub	s0,s0,a0
	mv	a2,s6
	mv	a3,s0
	mv	a0,s5
	mv	a1,s3
	call	__muldi3
	sub	a0,s2,a0
	sgtu	s2,a0,s2
	lw	ra,28(sp)
	.cfi_restore 1
	sub	s1,s1,a1
	mv	a1,s0
	lw	s0,24(sp)
	.cfi_restore 8
	sub	s1,s1,s2
	sw	a0,0(s4)
	sw	s1,4(s4)
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	mv	a0,s6
	lw	s6,0(sp)
	.cfi_restore 22
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	__divmoddi4, .-__divmoddi4
	.section	.text.__clzsi2,"ax",@progbits
	.align	2
	.globl	__clzsi2
	.hidden	__clzsi2
	.type	__clzsi2, @function
__clzsi2:
.LFB6:
	.cfi_startproc
	li	a1,65536
	sltu	a1,a0,a1
	slli	a1,a1,4
	li	a5,16
	sub	a5,a5,a1
	li	a4,65536
	srl	a5,a0,a5
	addi	a4,a4,-256
	and	a4,a5,a4
	seqz	a4,a4
	slli	a4,a4,3
	li	a3,8
	sub	a3,a3,a4
	srl	a5,a5,a3
	andi	a2,a5,240
	seqz	a2,a2
	slli	a2,a2,2
	li	a3,4
	sub	a3,a3,a2
	srl	a5,a5,a3
	andi	a3,a5,12
	seqz	a3,a3
	li	a0,2
	slli	a3,a3,1
	sub	a6,a0,a3
	srl	a5,a5,a6
	srli	a6,a5,1
	add	a4,a4,a1
	andi	a1,a6,1
	add	a2,a2,a4
	sub	a0,a0,a5
	beq	a1,zero,.L65
	li	a0,0
.L65:
	add	a3,a3,a2
	add	a0,a0,a3
	ret
	.cfi_endproc
.LFE6:
	.size	__clzsi2, .-__clzsi2
	.section	.text.__ctzsi2,"ax",@progbits
	.align	2
	.globl	__ctzsi2
	.hidden	__ctzsi2
	.type	__ctzsi2, @function
__ctzsi2:
.LFB7:
	.cfi_startproc
	slli	a1,a0,16
	srli	a1,a1,16
	seqz	a1,a1
	slli	a1,a1,4
	srl	a5,a0,a1
	andi	a2,a5,255
	seqz	a2,a2
	slli	a2,a2,3
	srl	a5,a5,a2
	andi	a3,a5,15
	seqz	a3,a3
	slli	a3,a3,2
	srl	a5,a5,a3
	andi	a4,a5,3
	seqz	a4,a4
	slli	a4,a4,1
	srl	a5,a5,a4
	srli	a0,a5,1
	not	a5,a5
	add	a2,a2,a1
	andi	a5,a5,1
	andi	a1,a0,1
	li	a0,2
	add	a3,a3,a2
	sub	a0,a0,a1
	neg	a5,a5
	and	a0,a0,a5
	add	a4,a4,a3
	add	a0,a0,a4
	ret
	.cfi_endproc
.LFE7:
	.size	__ctzsi2, .-__ctzsi2
	.section	.text.__ctzdi2,"ax",@progbits
	.align	2
	.globl	__ctzdi2
	.hidden	__ctzdi2
	.type	__ctzdi2, @function
__ctzdi2:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	seqz	s0,a0
	addi	a5,s0,-1
	neg	a4,s0
	and	a0,a5,a0
	and	a1,a1,a4
	or	a0,a0,a1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	slli	s0,s0,5
	call	__ctzsi2
	lw	ra,12(sp)
	.cfi_restore 1
	add	a0,s0,a0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	__ctzdi2, .-__ctzdi2
	.section	.text.__clzdi2,"ax",@progbits
	.align	2
	.globl	__clzdi2
	.hidden	__clzdi2
	.type	__clzdi2, @function
__clzdi2:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	seqz	s0,a1
	neg	a4,s0
	addi	a5,s0,-1
	and	a5,a5,a1
	and	a0,a0,a4
	or	a0,a5,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	slli	s0,s0,5
	call	__clzsi2
	lw	ra,12(sp)
	.cfi_restore 1
	add	a0,s0,a0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	__clzdi2, .-__clzdi2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
