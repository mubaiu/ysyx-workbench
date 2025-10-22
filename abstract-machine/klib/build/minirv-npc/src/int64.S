#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"int64.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	addi	sp,sp,-36
	.cfi_def_cfa_offset 36
	sw	s0,28(sp)
	sw	ra,32(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a2
	mv	t0,a0
	mv	a2,a4
	bne	a1,zero,.L2
	bne	a3,zero,.L3
	sw	a4,0(sp)
	beq	a4,zero,.L4
	mv	a1,s0
	sw	a0,4(sp)
	call	__umodsi3
	lw	a2,0(sp)
	lw	t0,4(sp)
	sw	a0,0(a2)
	sw	zero,4(a2)
.L4:
	mv	a1,s0
	mv	a0,t0
	call	__udivsi3
	li	a1,0
.L5:
	lw	ra,32(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,28(sp)
	.cfi_restore 8
	addi	sp,sp,36
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	sw	s1,24(sp)
	.cfi_offset 9, -12
	mv	t1,a1
	mv	s1,s0
	bne	s0,zero,.L7
	beq	a3,zero,.L49
	beq	a0,zero,.L50
	addi	a5,a3,-1
	and	a1,a5,a3
	beq	a1,zero,.L51
	sw	a0,16(sp)
	mv	a0,a3
	sw	t1,20(sp)
	sw	a2,12(sp)
	sw	t1,0(sp)
	sw	a3,8(sp)
	call	__clzsi2
	lw	a4,0(sp)
	mv	a5,a0
	sw	a5,0(sp)
	mv	a0,a4
	sw	a4,4(sp)
	call	__clzsi2
	lw	a5,0(sp)
	lw	a4,4(sp)
	lw	a3,8(sp)
	sub	a0,a5,a0
	li	a5,30
	lw	a2,12(sp)
	lw	t0,16(sp)
	lw	t1,20(sp)
	bgtu	a0,a5,.L20
	addi	t2,a0,1
	li	a0,32
	sub	a0,a0,t2
	sll	t1,a4,a0
	srl	a1,t0,t2
	srl	a5,a4,t2
	sll	a0,t0,a0
	or	a4,t1,a1
	j	.L18
.L7:
	beq	a3,zero,.L52
	sw	a0,8(sp)
	mv	a0,a3
	sw	a2,4(sp)
	sw	a1,12(sp)
	sw	a1,0(sp)
	sw	a3,16(sp)
	call	__clzsi2
	lw	a4,0(sp)
	mv	s1,a0
	mv	a0,a4
	call	__clzsi2
	sub	a0,s1,a0
	li	a5,31
	lw	a2,4(sp)
	lw	t0,8(sp)
	lw	t1,12(sp)
	bgtu	a0,a5,.L20
	addi	t2,a0,1
	li	a5,32
	lw	a4,0(sp)
	lw	a3,16(sp)
	mv	a0,t0
	beq	t2,a5,.L27
	sub	a1,a5,t2
	srl	t1,t0,t2
	sll	t0,a4,a1
	srl	a5,a4,t2
	sll	a0,a0,a1
	or	a4,t0,t1
	li	s1,0
.L18:
	sw	a2,4(sp)
	mv	a2,a3
	sw	zero,0(sp)
	mv	a3,a5
	mv	a5,a2
.L22:
	srli	a1,a0,31
	slli	a2,a4,1
	or	a2,a2,a1
	srli	a4,a4,31
	slli	a3,a3,1
	or	a3,a3,a4
	sub	a4,s0,a2
	sub	t1,a5,a3
	sgtu	a1,a4,s0
	sub	a1,t1,a1
	seqz	a4,a4
	sub	a1,a1,a4
	srai	t1,a1,31
	and	a4,t1,s0
	and	t1,t1,a5
	sub	a3,a3,t1
	lw	t1,0(sp)
	sub	a4,a2,a4
	srli	a1,a1,31
	srli	t0,s1,31
	slli	a0,a0,1
	slli	s1,s1,1
	sgtu	a2,a4,a2
	addi	t2,t2,-1
	sw	a1,0(sp)
	or	s1,s1,t1
	or	a0,a0,t0
	sub	a3,a3,a2
	bne	t2,zero,.L22
	lw	a2,4(sp)
	beq	a2,zero,.L24
	sw	a4,0(a2)
	sw	a3,4(a2)
.L24:
	lw	a4,0(sp)
	srli	t1,s1,31
	slli	a5,a0,1
	slli	a0,s1,1
	or	a0,a0,a4
	lw	s1,24(sp)
	.cfi_restore 9
	or	a1,t1,a5
	j	.L5
.L3:
	beq	a4,zero,.L6
	sw	a0,0(a2)
	sw	zero,4(a4)
.L6:
	li	a0,0
	li	a1,0
	j	.L5
.L52:
	.cfi_offset 9, -12
	addi	a1,s0,-1
	and	a0,a1,s0
	bne	a0,zero,.L16
	beq	a2,zero,.L17
	and	a1,a1,t0
	sw	a1,0(a2)
	sw	zero,4(a2)
.L17:
	li	a5,1
	beq	s0,a5,.L25
	mv	a0,s0
	sw	t1,4(sp)
	sw	t0,0(sp)
	call	__ctzsi2
	lw	t1,4(sp)
	lw	t0,0(sp)
	li	a4,32
	sub	a4,a4,a0
	mv	a5,a0
	sll	a4,t1,a4
	srl	t0,t0,a0
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	or	a0,a4,t0
	srl	a1,t1,a5
	j	.L5
.L49:
	.cfi_restore_state
	ebreak
.L20:
	beq	a2,zero,.L47
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	sw	t0,0(a2)
	sw	t1,4(a2)
	j	.L6
.L16:
	.cfi_restore_state
	mv	a0,s0
	sw	a3,16(sp)
	sw	t0,12(sp)
	sw	a2,8(sp)
	sw	t1,0(sp)
	sw	a3,4(sp)
	call	__clzsi2
	lw	a4,0(sp)
	mv	s1,a0
	mv	a0,a4
	call	__clzsi2
	lw	t0,12(sp)
	sub	a1,s1,a0
	addi	t2,a1,33
	li	t1,32
	lw	a4,0(sp)
	lw	a5,4(sp)
	lw	a2,8(sp)
	lw	a3,16(sp)
	mv	a0,t0
	li	s1,0
	beq	t2,t1,.L18
	li	t0,31
	bgtu	t2,t0,.L19
	sub	t1,t1,t2
	srl	a1,a0,t2
	srl	a5,a4,t2
	sll	a4,a4,t1
	or	a4,a4,a1
	sll	a0,a0,t1
	j	.L18
.L50:
	sw	a2,0(sp)
	beq	a2,zero,.L10
	mv	a1,a3
	mv	a0,t1
	sw	a3,8(sp)
	sw	t1,4(sp)
	call	__umodsi3
	lw	a2,0(sp)
	lw	a3,8(sp)
	lw	t1,4(sp)
	sw	zero,0(a2)
	sw	a0,4(a2)
.L10:
	mv	a1,a3
	mv	a0,t1
	call	__udivsi3
	li	a1,0
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L5
.L25:
	.cfi_restore_state
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	mv	a0,t0
	mv	a1,t1
	j	.L5
.L47:
	.cfi_restore_state
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L6
.L51:
	.cfi_restore_state
	beq	a2,zero,.L12
	and	a5,a5,t1
	sw	a0,0(a2)
	sw	a5,4(a2)
.L12:
	mv	a0,a3
	sw	t1,0(sp)
	call	__ctzsi2
	lw	t1,0(sp)
	lw	s1,24(sp)
	.cfi_remember_state
	.cfi_restore 9
	li	a1,0
	srl	a0,t1,a0
	j	.L5
.L27:
	.cfi_restore_state
	li	a5,0
	li	s1,0
	j	.L18
.L19:
	li	s1,64
	sub	s1,s1,t2
	addi	a1,a1,1
	sll	t0,a4,s1
	srl	t1,a0,a1
	sll	s1,a0,s1
	srl	a4,a4,a1
	or	a0,t0,t1
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
	srai	t1,a1,31
	srai	a5,a3,31
	xor	t0,a0,t1
	xor	t2,a2,a5
	sub	a2,t2,a5
	sub	a0,t0,t1
	xor	a1,a1,t1
	xor	a3,a3,a5
	sgtu	t2,a2,t2
	sub	a3,a3,a5
	sgtu	t0,a0,t0
	sub	a1,a1,t1
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a4,0
	sub	a3,a3,t2
	sub	a1,a1,t0
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	xor	s0,t1,a5
	call	__udivmoddi4
	xor	a4,a0,s0
	xor	a1,a1,s0
	sub	a0,a4,s0
	lw	ra,8(sp)
	.cfi_restore 1
	sub	a1,a1,s0
	lw	s0,4(sp)
	.cfi_restore 8
	sgtu	a4,a0,a4
	sub	a1,a1,a4
	addi	sp,sp,12
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
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	s0,16(sp)
	srai	t1,a3,31
	.cfi_offset 8, -8
	srai	s0,a1,31
	xor	a4,a0,s0
	xor	a5,a2,t1
	sw	s1,12(sp)
	sub	a0,a4,s0
	sub	a2,a5,t1
	xor	a3,a3,t1
	xor	a1,a1,s0
	.cfi_offset 9, -12
	addi	s1,sp,7
	andi	s1,s1,-8
	sgtu	a5,a2,a5
	sub	a3,a3,t1
	sub	a1,a1,s0
	sgtu	t1,a0,a4
	sub	a3,a3,a5
	mv	a4,s1
	sub	a1,a1,t1
	sw	ra,20(sp)
	.cfi_offset 1, -4
	call	__udivmoddi4
	lw	a5,0(s1)
	lw	a1,4(s1)
	lw	ra,20(sp)
	.cfi_restore 1
	xor	a5,a5,s0
	xor	a1,a1,s0
	sub	a0,a5,s0
	sub	a1,a1,s0
	lw	s0,16(sp)
	.cfi_restore 8
	sgtu	a5,a0,a5
	lw	s1,12(sp)
	.cfi_restore 9
	sub	a1,a1,a5
	addi	sp,sp,24
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
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	s0,16(sp)
	.cfi_offset 8, -8
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a4,s0
	sw	ra,20(sp)
	.cfi_offset 1, -4
	call	__udivmoddi4
	lw	a0,0(s0)
	lw	a1,4(s0)
	lw	ra,20(sp)
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,24
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
	sw	s0,24(sp)
	srai	a5,a3,31
	.cfi_offset 8, -8
	mv	s0,a1
	srai	t0,s0,31
	mv	a1,a3
	xor	t2,a2,a5
	sw	ra,28(sp)
	xor	a3,a0,t0
	sw	a2,0(sp)
	.cfi_offset 1, -4
	xor	ra,a1,a5
	sub	a2,t2,a5
	sw	s1,20(sp)
	.cfi_offset 9, -12
	sub	ra,ra,a5
	sw	a4,8(sp)
	sgtu	t2,a2,t2
	mv	s1,a0
	sub	a0,a3,t0
	sgtu	t1,a0,a3
	sw	a1,4(sp)
	sub	a3,ra,t2
	xor	a1,s0,t0
	lw	t2,8(sp)
	sub	a1,a1,t0
	xor	a5,t0,a5
	li	a4,0
	sub	a1,a1,t1
	sw	t2,16(sp)
	sw	a5,8(sp)
	call	__udivmoddi4
	lw	a5,8(sp)
	xor	a0,a0,a5
	sub	a2,a0,a5
	xor	a3,a1,a5
	sgtu	a0,a2,a0
	sub	a3,a3,a5
	sub	a3,a3,a0
	lw	a1,4(sp)
	lw	a0,0(sp)
	sw	a2,12(sp)
	sw	a3,8(sp)
	call	__muldi3
	lw	t2,16(sp)
	sub	a0,s1,a0
	sgtu	s1,a0,s1
	sub	s0,s0,a1
	sub	s0,s0,s1
	lw	a2,12(sp)
	lw	a3,8(sp)
	lw	ra,28(sp)
	.cfi_restore 1
	sw	s0,4(t2)
	lw	s0,24(sp)
	.cfi_restore 8
	sw	a0,0(t2)
	lw	s1,20(sp)
	.cfi_restore 9
	mv	a0,a2
	mv	a1,a3
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
	andi	a3,a5,240
	seqz	a3,a3
	slli	a3,a3,2
	li	a2,4
	sub	a2,a2,a3
	srl	a5,a5,a2
	andi	a2,a5,12
	seqz	a2,a2
	li	a0,2
	slli	a2,a2,1
	sub	t1,a0,a2
	srl	a5,a5,t1
	srli	t1,a5,1
	add	a4,a4,a1
	andi	a1,t1,1
	add	a3,a3,a4
	sub	a0,a0,a5
	beq	a1,zero,.L64
	li	a0,0
.L64:
	add	a3,a2,a3
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
	sub	a0,a0,a1
	add	a3,a3,a2
	neg	a5,a5
	and	a5,a0,a5
	add	a0,a4,a3
	add	a0,a5,a0
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	seqz	s0,a0
	addi	a5,s0,-1
	neg	a4,s0
	and	a0,a5,a0
	and	a1,a1,a4
	or	a0,a0,a1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	slli	s0,s0,5
	call	__ctzsi2
	lw	ra,8(sp)
	.cfi_restore 1
	add	a0,s0,a0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	seqz	s0,a1
	neg	a4,s0
	addi	a5,s0,-1
	and	a5,a5,a1
	and	a0,a0,a4
	or	a0,a5,a0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	slli	s0,s0,5
	call	__clzsi2
	lw	ra,8(sp)
	.cfi_restore 1
	add	a0,s0,a0
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	__clzdi2, .-__clzdi2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
