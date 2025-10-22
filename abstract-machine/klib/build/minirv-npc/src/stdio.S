#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stdio.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.vsprintf.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"0123456789abcdef"
	.align	2
.LC1:
	.string	"0123456789ABCDEF"
	.align	2
.LC2:
	.string	"(null)"
	.globl	__umoddi3
	.globl	__moddi3
	.globl	__udivdi3
	.globl	__divdi3
	.align	2
.LC3:
	.string	"NULL"
	.section	.text.vsprintf,"ax",@progbits
	.align	2
	.globl	vsprintf
	.hidden	vsprintf
	.type	vsprintf, @function
vsprintf:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-140
	.cfi_def_cfa_offset 140
	sw	ra,136(sp)
	lbu	a4,0(a1)
	sw	a0,8(sp)
	sw	a2,12(sp)
	.cfi_offset 1, -4
	beq	a4,zero,.L189
	sw	s1,128(sp)
	sw	s0,132(sp)
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	li	s1,0
	sw	zero,0(sp)
	sw	a0,4(sp)
	mv	t2,a1
	j	.L180
.L3:
	lw	a2,4(sp)
	lw	a5,0(sp)
	mv	s1,a3
	sb	a4,0(a2)
	lw	a4,8(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
.L5:
	add	a5,t2,s1
	lbu	a4,0(a5)
	beq	a4,zero,.L329
.L180:
	li	a5,37
	addi	a3,s1,1
	bne	a4,a5,.L3
	add	a3,t2,a3
	addi	a4,s1,2
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,16(sp)
.L4:
	lbu	a5,0(a3)
	li	a1,16
	mv	t1,a3
	addi	a2,a5,-32
	andi	a2,a2,0xff
	bgtu	a2,a1,.L9
	lla	a1,.L10
	slli	a2,a2,2
	add	a2,a2,a1
	lw	a2,0(a2)
	add	a2,a2,a1
	jr	a2
	.section	.rodata.vsprintf,"a",@progbits
	.align	2
	.align	2
.L10:
	.word	.L190-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L6-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L12-.L10
	.word	.L9-.L10
	.word	.L11-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.word	.L8-.L10
	.section	.text.vsprintf
.L9:
	li	a3,42
	bne	a5,a3,.L330
	lw	a5,12(sp)
	lw	s0,0(a5)
	addi	a3,a5,4
	bge	s0,zero,.L16
	li	a5,1
	neg	s0,s0
	sw	a5,16(sp)
.L16:
	add	t1,t2,a4
	lbu	a5,0(t1)
	mv	a2,a4
	sw	a3,12(sp)
.L15:
	li	a4,46
	li	s1,-1
	beq	a5,a4,.L331
.L18:
	addi	a4,a2,1
	sw	a4,20(sp)
	li	a3,104
	add	a4,t2,a4
	beq	a5,a3,.L332
.L23:
	li	a3,108
	beq	a5,a3,.L333
	li	a3,122
	beq	a5,a3,.L334
	mv	a4,t1
	sw	a2,20(sp)
	li	t1,0
.L24:
	li	a3,37
	beq	a5,a3,.L26
.L336:
	addi	a3,a5,-88
	andi	a3,a3,0xff
	li	a2,32
	bgtu	a3,a2,.L27
	lla	a2,.L29
	slli	a3,a3,2
	add	a3,a3,a2
	lw	a3,0(a3)
	add	a3,a3,a2
	jr	a3
	.section	.rodata.vsprintf
	.align	2
	.align	2
.L29:
	.word	.L28-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L34-.L29
	.word	.L33-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L33-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L32-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L31-.L29
	.word	.L27-.L29
	.word	.L30-.L29
	.word	.L27-.L29
	.word	.L27-.L29
	.word	.L28-.L29
	.section	.text.vsprintf
.L330:
	addi	a3,a5,-48
	andi	s1,a3,0xff
	li	a1,9
	addi	a2,a4,-1
	li	s0,0
	add	a4,t2,a4
	li	t0,9
	bgtu	s1,a1,.L15
	mv	a1,s0
.L17:
	lbu	a5,0(a4)
	slli	s0,a1,2
	add	s0,s0,a1
	slli	s0,s0,1
	add	a1,a3,s0
	addi	a3,a5,-48
	andi	a0,a3,0xff
	mv	t1,a4
	addi	a2,a2,1
	addi	a4,a4,1
	bleu	a0,t0,.L17
	li	a4,46
	mv	s0,a1
	li	s1,-1
	bne	a5,a4,.L18
.L331:
	addi	t0,a2,1
	add	t1,t2,t0
	lbu	a5,0(t1)
	li	a4,42
	bne	a5,a4,.L335
	lw	a5,12(sp)
	lw	s1,0(a5)
	addi	a4,a5,4
	bge	s1,zero,.L21
	li	s1,-1
.L21:
	addi	a2,a2,2
	add	t1,t2,a2
	lbu	a5,0(t1)
	sw	a4,12(sp)
	addi	a4,a2,1
	sw	a4,20(sp)
	li	a3,104
	add	a4,t2,a4
	bne	a5,a3,.L23
.L332:
	lbu	a5,0(a4)
	li	t1,1
	bne	a5,a3,.L24
	addi	a5,a2,2
	add	a4,t2,a5
	sw	a5,20(sp)
	lbu	a5,0(a4)
	li	a3,37
	li	t1,2
	bne	a5,a3,.L336
.L26:
	lw	a4,4(sp)
	lw	a5,0(sp)
	li	a3,37
	sb	a3,0(a4)
	lw	a4,8(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L77
.L329:
	lw	t2,4(sp)
	lw	s0,132(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,128(sp)
	.cfi_restore 9
	sw	t2,8(sp)
	lw	a5,8(sp)
	lw	a0,0(sp)
	sb	zero,0(a5)
	lw	ra,136(sp)
	.cfi_restore 1
	addi	sp,sp,140
	.cfi_def_cfa_offset 0
	jr	ra
.L333:
	.cfi_restore_state
	lbu	a5,0(a4)
	li	t1,3
	bne	a5,a3,.L24
	addi	a5,a2,2
	add	a4,t2,a5
	sw	a5,20(sp)
	li	t1,4
	lbu	a5,0(a4)
	j	.L24
.L27:
	lw	a3,4(sp)
	li	a5,37
	lw	a2,8(sp)
	sb	a5,0(a3)
	lw	a3,0(sp)
	lbu	a4,0(a4)
	addi	a5,a3,1
	add	a5,a2,a5
	addi	a3,a3,2
	sb	a4,0(a5)
	add	a5,a2,a3
	sw	a3,0(sp)
	sw	a5,4(sp)
.L77:
	lw	a5,20(sp)
	addi	s1,a5,1
	j	.L5
.L335:
	addi	a3,a5,-48
	andi	a1,a3,0xff
	li	a4,9
	bgtu	a1,a4,.L337
	addi	a4,a2,2
	li	s1,0
	add	a4,t2,a4
	mv	a2,t0
	li	a1,9
	mv	a0,s1
.L22:
	lbu	a5,0(a4)
	slli	s1,a0,2
	add	s1,s1,a0
	slli	s1,s1,1
	add	a0,a3,s1
	addi	a3,a5,-48
	andi	t0,a3,0xff
	mv	t1,a4
	addi	a2,a2,1
	addi	a4,a4,1
	bleu	t0,a1,.L22
	mv	s1,a0
	j	.L18
.L8:
	li	a5,1
	sw	a5,24(sp)
.L7:
	addi	a3,a3,1
	addi	a4,a4,1
	j	.L4
.L6:
	li	a5,1
	sw	a5,28(sp)
	j	.L7
.L190:
	li	a5,1
	sw	a5,32(sp)
	j	.L7
.L11:
	li	a5,1
	sw	a5,16(sp)
	j	.L7
.L12:
	li	a5,1
	sw	a5,36(sp)
	j	.L7
.L33:
	li	a5,1
	beq	t1,a5,.L338
	li	a5,2
	beq	t1,a5,.L339
	li	a5,3
	beq	t1,a5,.L40
	li	a5,4
	beq	t1,a5,.L340
.L40:
	lw	a5,12(sp)
	lw	a4,0(a5)
	addi	a5,a5,4
	sw	a5,12(sp)
	srai	a5,a4,31
.L36:
	blt	a5,zero,.L341
.L38:
	or	a3,a4,a5
	bne	a3,zero,.L195
	beq	s1,zero,.L196
	li	a5,48
	sb	a5,64(sp)
	li	t1,1
	li	a2,0
	addi	t0,sp,64
	ble	s1,t1,.L43
.L44:
	mv	a5,t1
	li	a3,48
.L62:
	addi	a5,a5,1
	add	a4,t0,a5
	sb	a3,-1(a4)
	bgt	s1,a5,.L62
	addi	a4,t1,1
	li	a5,0
	ble	s1,t1,.L64
	addi	a5,s1,-1
	sub	a5,a5,t1
.L64:
	add	t1,a5,a4
.L45:
	beq	a2,zero,.L43
	addi	a5,t1,64
	addi	a4,sp,64
	add	a5,a5,a4
	li	a4,45
	addi	t1,t1,1
	sb	a4,-64(a5)
.L65:
	lw	a5,16(sp)
	sub	s0,s0,t1
	beq	a5,zero,.L182
.L75:
	lw	a4,4(sp)
	addi	t0,sp,64
	add	a5,t0,t1
.L73:
	lbu	a3,-1(a5)
	addi	a5,a5,-1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	t0,a5,.L73
	lw	a5,0(sp)
	lw	a4,8(sp)
	add	a5,t1,a5
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	lw	a5,16(sp)
	beq	a5,zero,.L77
.L76:
	addi	a3,s0,-1
	ble	s0,zero,.L77
	lw	a5,0(sp)
	lw	a4,8(sp)
	li	a2,32
	add	s0,s0,a5
	lw	a5,4(sp)
	add	a4,a4,s0
.L78:
	sb	a2,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L78
.L325:
	lw	a5,0(sp)
	lw	a4,8(sp)
	addi	a5,a5,1
	add	a5,a3,a5
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L77
.L28:
	li	a4,1
	beq	t1,a4,.L342
	li	a4,2
	beq	t1,a4,.L343
	li	a4,3
	beq	t1,a4,.L344
	li	a4,4
	lw	a2,12(sp)
	beq	t1,a4,.L345
	lw	a4,0(a2)
	addi	a2,a2,4
	li	a3,0
	sw	a2,12(sp)
.L118:
	li	a2,120
	lla	a1,.LC1
	bne	a5,a2,.L122
	lla	a2,.LC0
	mv	a1,a2
.L122:
	or	a2,a4,a3
	sw	a2,32(sp)
	bne	a2,zero,.L207
	beq	s1,zero,.L346
	li	a4,48
	sb	a4,64(sp)
	li	a2,1
.L131:
	addi	t0,sp,64
	add	a4,t0,a2
	add	t1,t0,s1
	li	a3,48
	bge	a2,s1,.L347
.L132:
	sb	a3,0(a4)
	addi	a4,a4,1
	bne	t1,a4,.L132
	lw	a4,16(sp)
	sub	s0,s0,s1
	bne	a4,zero,.L133
	lw	a4,24(sp)
	addi	t1,s0,-1
	beq	a4,zero,.L135
.L134:
	lw	a4,28(sp)
	beq	a4,zero,.L143
	addi	t0,sp,64
.L186:
	lw	a4,32(sp)
	beq	a4,zero,.L314
	li	a4,120
	beq	a5,a4,.L146
	li	a5,88
.L146:
	addi	a3,s1,64
	addi	a2,sp,64
	add	a3,a3,a2
	sb	a5,-64(a3)
	addi	a5,s1,65
	add	a4,a5,a2
	li	a5,48
	sb	a5,-64(a4)
	addi	s1,s1,2
	addi	a1,s0,-1
	bgt	s0,zero,.L147
	mv	s0,t1
.L133:
	lw	a4,4(sp)
	add	a5,t0,s1
.L150:
	lbu	a3,-1(a5)
	addi	a5,a5,-1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	t0,a5,.L150
	lw	a5,0(sp)
	lw	a4,8(sp)
	add	a5,s1,a5
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	lw	a5,16(sp)
	beq	a5,zero,.L77
.L125:
	addi	a3,s0,-1
	ble	s0,zero,.L77
	lw	a5,0(sp)
	lw	a2,8(sp)
	add	a4,s0,a5
	lw	a5,4(sp)
	add	a4,a2,a4
	li	a2,32
.L152:
	sb	a2,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L152
	j	.L325
.L34:
	lw	a4,12(sp)
	lw	a2,16(sp)
	addi	t1,s0,-2
	lbu	a5,0(a4)
	addi	a3,a4,4
	addi	a4,s0,-1
	beq	a2,zero,.L348
	lw	a1,4(sp)
	lw	a2,0(sp)
	li	a0,32
	sb	a5,0(a1)
	lw	a5,8(sp)
	addi	a2,a2,1
	add	s0,a1,s0
	add	a5,a5,a2
	ble	a4,zero,.L349
.L179:
	sb	a0,0(a5)
	addi	a5,a5,1
	bne	s0,a5,.L179
	lw	a5,0(sp)
	lw	a4,8(sp)
	sw	a3,12(sp)
	addi	a5,a5,2
	add	a5,a5,t1
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L77
.L32:
	lw	a5,12(sp)
	lw	a4,0(a5)
	addi	a1,a5,4
	beq	a4,zero,.L350
	li	a3,0
	addi	t0,sp,64
	lla	a0,.LC0
.L156:
	andi	a5,a4,15
	add	a5,a0,a5
	lbu	t1,0(a5)
	mv	a5,a3
	addi	a3,a3,1
	add	a2,t0,a3
	sb	t1,-1(a2)
	srli	a4,a4,4
	bne	a4,zero,.L156
	addi	a4,a3,64
	addi	a3,sp,64
	add	a3,a4,a3
	addi	a2,a5,2
	li	a4,120
	sb	a4,-64(a3)
	addi	a4,a2,64
	addi	a3,sp,64
	add	a3,a4,a3
	li	t1,48
	sb	t1,-64(a3)
	lw	a3,16(sp)
	addi	a4,a5,3
	sub	a4,s0,a4
	beq	a3,zero,.L351
.L157:
	lw	a3,4(sp)
	add	a5,t0,a5
	addi	t1,sp,61
.L159:
	lbu	a0,2(a5)
	addi	a5,a5,-1
	addi	a3,a3,1
	sb	a0,-1(a3)
	bne	t1,a5,.L159
	lw	a5,0(sp)
	lw	a3,8(sp)
	sw	a1,12(sp)
	addi	a5,a5,1
	add	a5,a2,a5
	sw	a5,0(sp)
	add	a5,a3,a5
	sw	a5,4(sp)
	lw	a5,16(sp)
	beq	a5,zero,.L77
	addi	a3,a4,-1
	ble	a4,zero,.L77
	lw	a5,8(sp)
	lw	a2,0(sp)
	add	a4,a5,a4
	lw	a5,4(sp)
	add	a4,a4,a2
	li	a2,32
.L160:
	sb	a2,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L160
	lw	a5,0(sp)
	addi	a5,a5,1
	add	a5,a5,a3
	j	.L324
.L30:
	li	a5,1
	beq	t1,a5,.L352
	li	a5,2
	beq	t1,a5,.L353
	li	a5,3
	beq	t1,a5,.L354
	li	a5,4
	lw	a3,12(sp)
	beq	t1,a5,.L355
	lw	a5,0(a3)
	addi	a3,a3,4
	li	a4,0
	sw	a3,12(sp)
.L80:
	or	a3,a5,a4
	bne	a3,zero,.L202
	beq	s1,zero,.L356
	li	a5,48
	sb	a5,64(sp)
	li	t1,1
.L105:
	addi	t0,sp,64
	add	a5,t0,t1
	add	a3,t0,s1
	li	a4,48
	ble	s1,t1,.L357
.L106:
	sb	a4,0(a5)
	addi	a5,a5,1
	bne	a5,a3,.L106
	lw	a5,16(sp)
	sub	s0,s0,s1
	beq	a5,zero,.L358
.L108:
	lw	a4,4(sp)
	add	a5,t0,s1
.L114:
	lbu	a3,-1(a5)
	addi	a5,a5,-1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	t0,a5,.L114
	lw	a5,0(sp)
	lw	a4,8(sp)
	add	a5,s1,a5
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	lw	a5,16(sp)
	beq	a5,zero,.L77
.L86:
	addi	a3,s0,-1
	ble	s0,zero,.L77
	lw	a5,0(sp)
	lw	a2,8(sp)
	add	a4,s0,a5
	lw	a5,4(sp)
	add	a4,a2,a4
	li	a2,32
.L116:
	sb	a2,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L116
	j	.L325
.L31:
	lw	a5,12(sp)
	lw	a4,0(a5)
	addi	t0,a5,4
	beq	a4,zero,.L219
	lbu	a5,0(a4)
	beq	a5,zero,.L359
	li	a5,0
.L163:
	beq	s1,a5,.L360
	addi	a5,a5,1
	add	a3,a4,a5
	lbu	a3,0(a3)
	bne	a3,zero,.L163
	lw	a3,16(sp)
	sub	s0,s0,a5
	beq	a3,zero,.L188
.L170:
	lw	a0,0(sp)
	lw	t1,8(sp)
	li	a3,0
.L172:
	add	a2,a4,a3
	lbu	a1,0(a2)
	add	a2,a0,a3
	add	a2,t1,a2
	sb	a1,0(a2)
	addi	a3,a3,1
	blt	a3,a5,.L172
	lw	a4,0(sp)
	sw	t0,12(sp)
	add	a5,a5,a4
	lw	a4,8(sp)
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	lw	a5,16(sp)
	beq	a5,zero,.L77
.L171:
	addi	a3,s0,-1
	ble	s0,zero,.L224
	lw	a5,0(sp)
	lw	a2,8(sp)
	add	a4,s0,a5
	lw	a5,4(sp)
	add	a4,a2,a4
	li	a2,32
.L173:
	sb	a2,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L173
	lw	a5,0(sp)
	lw	a4,8(sp)
	sw	t0,12(sp)
	addi	a5,a5,1
	add	a5,a5,a3
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L77
.L334:
	lbu	a5,0(a4)
	li	t1,5
	j	.L24
.L352:
	lw	a3,12(sp)
	li	a4,0
	lhu	a5,0(a3)
	addi	a3,a3,4
	sw	a3,12(sp)
	j	.L80
.L342:
	lw	a2,12(sp)
	li	a3,0
	lhu	a4,0(a2)
	addi	a2,a2,4
	sw	a2,12(sp)
	j	.L118
.L338:
	lw	a5,12(sp)
	lh	a4,0(a5)
	addi	a5,a5,4
	sw	a5,12(sp)
	srai	a5,a4,31
	j	.L36
.L219:
	lla	a4,.LC2
	li	a5,0
	j	.L163
.L350:
	lla	a3,.LC3+1
	mv	a5,a3
.L154:
	lbu	a4,0(a5)
	mv	a2,a5
	addi	a5,a5,1
	bne	a4,zero,.L154
	lla	a5,.LC3
	sub	a2,a2,a5
	lw	a4,4(sp)
	addi	a2,a2,-1
	add	a0,a3,a2
.L155:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a3,-1(a4)
	bne	a5,a0,.L155
	lw	a5,0(sp)
	addi	a5,a5,1
	add	a5,a2,a5
.L324:
	lw	a4,8(sp)
	sw	a5,0(sp)
	sw	a1,12(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	j	.L77
.L196:
	li	t1,0
.L43:
	lw	a5,36(sp)
	beq	a5,zero,.L66
	addi	a5,t1,64
	addi	a4,sp,64
	add	a5,a5,a4
	li	a4,43
	addi	t1,t1,1
	sb	a4,-64(a5)
	j	.L65
.L189:
	.cfi_restore 8
	.cfi_restore 9
	lw	a5,8(sp)
	sw	zero,0(sp)
	lw	a0,0(sp)
	sb	zero,0(a5)
	lw	ra,136(sp)
	.cfi_restore 1
	addi	sp,sp,140
	.cfi_def_cfa_offset 0
	jr	ra
.L360:
	.cfi_def_cfa_offset 140
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	a3,16(sp)
	sub	s0,s0,a5
	beq	a3,zero,.L188
	bne	a5,zero,.L170
	j	.L171
.L341:
	snez	a3,a4
	neg	a5,a5
	sub	a5,a5,a3
	neg	a4,a4
	li	a2,1
.L42:
	li	t1,0
	addi	t0,sp,64
	sw	s0,52(sp)
	sw	s1,56(sp)
	sw	a2,48(sp)
	mv	s1,t1
	sw	t2,60(sp)
	mv	s0,a4
	sw	t0,44(sp)
.L60:
	mv	a1,a5
	sw	a5,40(sp)
	lw	a5,44(sp)
	addi	s1,s1,1
	li	a2,10
	add	t2,a5,s1
	li	a3,0
	mv	a0,s0
	sw	t2,28(sp)
	call	__moddi3
	lw	a5,40(sp)
	lw	t2,28(sp)
	addi	t0,a0,48
	li	a3,0
	mv	a0,s0
	mv	a1,a5
	li	a2,10
	sb	t0,-1(t2)
	call	__divdi3
	or	a3,a1,a0
	mv	a5,a1
	mv	s0,a0
	bne	a3,zero,.L60
	mv	t1,s1
	lw	s1,56(sp)
	lw	a2,48(sp)
	lw	s0,52(sp)
	lw	t2,60(sp)
	lw	t0,44(sp)
	bgt	s1,t1,.L44
	j	.L45
.L348:
	ble	a4,zero,.L361
	lw	a4,8(sp)
	li	a0,32
	addi	a2,a4,-1
	lw	a4,0(sp)
	add	a2,a2,a4
	lw	a4,4(sp)
	add	a2,a2,s0
.L178:
	sb	a0,0(a4)
	addi	a4,a4,1
	bne	a2,a4,.L178
	lw	a4,0(sp)
	addi	a4,a4,1
	add	a4,a4,t1
.L176:
	lw	a1,8(sp)
	addi	a2,a4,1
	sw	a2,0(sp)
	add	a4,a1,a4
	sb	a5,0(a4)
	add	a5,a1,a2
	sw	a3,12(sp)
	sw	a5,4(sp)
	j	.L77
.L182:
	lw	a4,24(sp)
	li	a5,32
	bne	a4,zero,.L362
.L69:
	addi	a4,s0,-1
	ble	s0,zero,.L200
	lw	a3,4(sp)
	add	s0,a3,s0
.L71:
	sb	a5,0(a3)
	addi	a3,a3,1
	bne	s0,a3,.L71
	lw	a5,0(sp)
	li	s0,-1
	addi	a5,a5,1
	add	a5,a4,a5
	lw	a4,8(sp)
	sw	a5,0(sp)
	add	a5,a4,a5
	sw	a5,4(sp)
	bne	t1,zero,.L75
	j	.L77
.L207:
	li	a2,0
	addi	t0,sp,64
	sw	a5,36(sp)
	mv	t1,a1
.L123:
	andi	a5,a4,15
	add	a5,t1,a5
	lbu	a1,0(a5)
	slli	a0,a3,28
	addi	a2,a2,1
	srli	a4,a4,4
	add	a5,t0,a2
	or	a4,a0,a4
	srli	a3,a3,4
	sb	a1,-1(a5)
	or	a5,a4,a3
	bne	a5,zero,.L123
	lw	a5,36(sp)
	j	.L131
.L202:
	li	t1,0
	sw	s1,44(sp)
	addi	t0,sp,64
	sw	s0,40(sp)
	mv	s1,t1
	sw	t2,48(sp)
.L287:
	li	a2,10
	li	a3,0
	mv	a0,a5
	mv	a1,a4
	addi	s1,s1,1
	add	s0,t0,s1
	sw	t0,28(sp)
	sw	a5,36(sp)
	sw	a4,32(sp)
	call	__umoddi3
	lw	a4,32(sp)
	lw	a5,36(sp)
	addi	t2,a0,48
	mv	a1,a4
	mv	a0,a5
	sb	t2,-1(s0)
	li	a2,10
	li	a3,0
	sw	a5,32(sp)
	mv	s0,a4
	call	__udivdi3
	lw	t0,28(sp)
	mv	a5,a0
	mv	a4,a1
	bne	s0,zero,.L287
	lw	a3,32(sp)
	li	a2,9
	bgtu	a3,a2,.L287
	mv	t1,s1
	lw	s0,40(sp)
	lw	s1,44(sp)
	lw	t2,48(sp)
	j	.L105
.L188:
	addi	t1,s0,-1
	ble	s0,zero,.L220
.L184:
	lw	a3,4(sp)
	li	a2,32
	add	a0,a3,s0
.L168:
	sb	a2,0(a3)
	addi	a3,a3,1
	bne	a3,a0,.L168
	lw	a3,0(sp)
	sub	s0,t1,s0
	addi	a3,a3,1
	add	a3,t1,a3
	sw	a3,0(sp)
	bne	a5,zero,.L170
.L222:
	lw	a5,8(sp)
	lw	a4,0(sp)
	sw	t0,12(sp)
	add	a5,a5,a4
	sw	a5,4(sp)
	j	.L77
.L66:
	lw	a5,32(sp)
	bne	a5,zero,.L363
	lw	a5,16(sp)
	sub	s0,s0,t1
	beq	a5,zero,.L182
	beq	t1,zero,.L76
	j	.L75
.L343:
	lw	a2,12(sp)
	li	a3,0
	lbu	a4,0(a2)
	addi	a2,a2,4
	sw	a2,12(sp)
	j	.L118
.L339:
	lw	a3,12(sp)
	li	a5,0
	lbu	a4,0(a3)
	addi	a3,a3,4
	sw	a3,12(sp)
	j	.L38
.L353:
	lw	a3,12(sp)
	li	a4,0
	lbu	a5,0(a3)
	addi	a3,a3,4
	sw	a3,12(sp)
	j	.L80
.L358:
	addi	a5,s0,-1
	li	a4,32
	ble	s0,zero,.L322
.L87:
	lw	a3,4(sp)
	add	a2,a3,s0
.L112:
	sb	a4,0(a3)
	addi	a3,a3,1
	bne	a3,a2,.L112
	lw	a4,0(sp)
	sub	s0,a5,s0
	addi	t0,sp,64
	addi	a4,a4,1
	add	a4,a4,a5
	lw	a5,8(sp)
	sw	a4,0(sp)
	add	a5,a5,a4
	sw	a5,4(sp)
	bne	s1,zero,.L108
	j	.L77
.L346:
	lw	a5,16(sp)
	bne	a5,zero,.L125
	lw	a5,24(sp)
	addi	a1,s0,-1
	mv	t1,a1
	beq	a5,zero,.L364
	lw	a5,28(sp)
	beq	a5,zero,.L143
.L127:
	li	s1,0
	addi	t0,sp,64
	ble	s0,zero,.L77
.L147:
	add	a3,t0,s0
	add	a5,t0,s1
	li	a2,32
	add	a3,a3,s1
.L148:
	sb	a2,0(a5)
	addi	a5,a5,1
	sub	a4,a3,a5
	bgt	a4,zero,.L148
	addi	s1,s1,1
	add	s1,a1,s1
	sub	s0,t1,s0
	j	.L133
.L356:
	lw	a5,16(sp)
	bne	a5,zero,.L86
	addi	a5,s0,-1
	li	a4,32
	bgt	s0,zero,.L87
	j	.L77
.L351:
	addi	t1,a4,-1
	ble	a4,zero,.L216
	lw	a3,4(sp)
	li	a0,32
	add	a4,a3,a4
.L158:
	sb	a0,0(a3)
	addi	a3,a3,1
	bne	a4,a3,.L158
	lw	a4,0(sp)
	lw	a0,8(sp)
	addi	a4,a4,1
	add	a4,a4,t1
	mv	a3,a4
	add	a3,a0,a3
	sw	a4,0(sp)
	sw	a3,4(sp)
	li	a4,-1
	j	.L157
.L362:
	srai	a5,s1,31
	andi	a5,a5,16
	addi	a5,a5,32
	j	.L69
.L363:
	addi	a5,t1,64
	addi	a4,sp,64
	add	a5,a5,a4
	li	a4,32
	addi	t1,t1,1
	sb	a4,-64(a5)
	j	.L65
.L349:
	sw	a3,12(sp)
	sw	a2,0(sp)
	sw	a5,4(sp)
	j	.L77
.L143:
	ble	s0,zero,.L215
	addi	t0,sp,64
	addi	a1,s0,-1
	j	.L147
.L359:
	lw	a5,16(sp)
	bne	a5,zero,.L171
	addi	t1,s0,-1
	bgt	s0,zero,.L184
.L224:
	sw	t0,12(sp)
	j	.L77
.L216:
	mv	a4,t1
	j	.L157
.L354:
	lw	a3,12(sp)
	li	a4,0
	lw	a5,0(a3)
	addi	a3,a3,4
	sw	a3,12(sp)
	j	.L80
.L344:
	lw	a2,12(sp)
	li	a3,0
	lw	a4,0(a2)
	addi	a2,a2,4
	sw	a2,12(sp)
	j	.L118
.L337:
	mv	a2,t0
	li	s1,0
	j	.L18
.L208:
	mv	s1,a2
	mv	s0,a1
.L135:
	lw	a4,28(sp)
	bne	a4,zero,.L186
.L314:
	addi	a1,s0,-1
	bgt	s0,zero,.L147
	mv	s0,t1
	j	.L133
.L340:
	lw	a3,12(sp)
	lw	a4,0(a3)
	lw	a5,4(a3)
	addi	a3,a3,8
	sw	a3,12(sp)
	j	.L36
.L355:
	lw	a5,0(a3)
	lw	a4,4(a3)
	addi	a3,a3,8
	sw	a3,12(sp)
	j	.L80
.L345:
	lw	a4,0(a2)
	lw	a3,4(a2)
	addi	a2,a2,8
	sw	a2,12(sp)
	j	.L118
.L357:
	lw	a5,16(sp)
	sub	s0,s0,t1
	beq	a5,zero,.L185
	mv	s1,t1
	j	.L108
.L347:
	lw	a3,16(sp)
	sub	a1,s0,a2
	bne	a3,zero,.L365
	lw	a3,24(sp)
	addi	t1,a1,-1
	beq	a3,zero,.L208
	blt	s1,zero,.L366
	mv	s1,a2
	mv	s0,a1
	j	.L134
.L366:
	add	s0,t0,s0
	li	a3,48
	ble	a1,zero,.L367
.L138:
	sb	a3,0(a4)
	addi	a4,a4,1
	bne	s0,a4,.L138
	lw	a4,28(sp)
	addi	a2,a2,1
	add	s1,a2,t1
	beq	a4,zero,.L211
	beq	s1,zero,.L77
	li	s0,-1
.L137:
	lw	a4,32(sp)
	beq	a4,zero,.L133
	li	a4,120
	beq	a5,a4,.L142
	li	a5,88
.L142:
	addi	a3,s1,64
	addi	a2,sp,64
	add	a3,a3,a2
	sb	a5,-64(a3)
	addi	a5,s1,65
	add	a4,a5,a2
	li	a5,48
	addi	s1,s1,2
	sb	a5,-64(a4)
	j	.L133
.L211:
	li	s0,-1
.L139:
	addi	t0,sp,64
	bne	s1,zero,.L133
	j	.L77
.L195:
	li	a2,0
	j	.L42
.L365:
	mv	s0,a1
	mv	s1,a2
	j	.L133
.L200:
	mv	s0,a4
	bne	t1,zero,.L75
	j	.L77
.L109:
	bge	s1,zero,.L305
	addi	a5,s0,-1
	mv	s1,t1
	li	a4,48
	bgt	s0,zero,.L87
.L322:
	mv	s0,a5
	j	.L108
.L220:
	mv	s0,t1
	bne	a5,zero,.L170
	j	.L222
.L361:
	lw	a4,0(sp)
	j	.L176
.L364:
	lw	a5,28(sp)
	bne	a5,zero,.L127
	addi	t0,sp,64
	bgt	s0,zero,.L147
	j	.L77
.L367:
	lw	a4,28(sp)
	mv	s0,t1
	mv	s1,a2
	bne	a4,zero,.L137
	j	.L133
.L215:
	mv	s0,t1
	j	.L139
.L185:
	lw	a5,24(sp)
	bne	a5,zero,.L109
.L305:
	addi	a5,s0,-1
	mv	s1,t1
	li	a4,32
	bgt	s0,zero,.L87
	mv	s0,a5
	j	.L108
	.cfi_endproc
.LFE1:
	.size	vsprintf, .-vsprintf
	.section	.text.sprintf,"ax",@progbits
	.align	2
	.globl	sprintf
	.hidden	sprintf
	.type	sprintf, @function
sprintf:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	t1,sp,16
	sw	a2,16(sp)
	mv	a2,t1
	sw	ra,12(sp)
	.cfi_offset 1, -20
	sw	a3,20(sp)
	sw	a4,24(sp)
	sw	a5,28(sp)
	sw	t1,0(sp)
	call	vsprintf
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	sprintf, .-sprintf
	.section	.text.vsnprintf,"ax",@progbits
	.align	2
	.globl	vsnprintf
	.hidden	vsnprintf
	.type	vsnprintf, @function
vsnprintf:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-152
	.cfi_def_cfa_offset 152
	sw	ra,148(sp)
	sw	a0,12(sp)
	sw	a2,4(sp)
	sw	a3,16(sp)
	.cfi_offset 1, -4
	beq	a1,zero,.L371
	li	a5,1
	beq	a1,a5,.L372
	lbu	a4,0(a2)
	addi	t2,a1,-1
	sw	t2,44(sp)
	sw	zero,0(sp)
	li	t1,0
	li	t0,0
	beq	a4,zero,.L374
	sw	s0,144(sp)
	sw	s1,140(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,t0
.L373:
	li	a5,37
	mv	s1,s0
	addi	a3,t1,1
	beq	a4,a5,.L707
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	bgeu	s0,t2,.L378
	lw	a5,12(sp)
	add	s1,a5,s0
	addi	s0,s0,1
	sb	a4,0(s1)
	mv	s1,s0
.L378:
	mv	t1,a3
.L379:
	lw	a5,4(sp)
	add	a5,a5,t1
	lbu	a4,0(a5)
	bne	a4,zero,.L373
	lw	a4,44(sp)
	mv	a5,s1
	bleu	s1,a4,.L575
	mv	a5,a4
.L575:
	lw	a4,12(sp)
	lw	s0,144(sp)
	.cfi_restore 8
	lw	s1,140(sp)
	.cfi_restore 9
	add	a5,a4,a5
	sw	a5,12(sp)
.L374:
	lw	a5,12(sp)
	lw	a0,0(sp)
	sb	zero,0(a5)
	lw	ra,148(sp)
	.cfi_restore 1
	addi	sp,sp,152
	.cfi_def_cfa_offset 0
	jr	ra
.L707:
	.cfi_def_cfa_offset 152
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	a5,4(sp)
	addi	a4,t1,2
	sw	zero,32(sp)
	add	a3,a5,a3
	sw	zero,36(sp)
	li	a0,0
	sw	zero,40(sp)
	sw	zero,28(sp)
.L377:
	lbu	a1,0(a3)
	li	t1,16
	mv	a2,a3
	addi	a5,a1,-32
	andi	a5,a5,0xff
	bgtu	a5,t1,.L383
	lla	t1,.L384
	slli	a5,a5,2
	add	a5,a5,t1
	lw	a5,0(a5)
	add	a5,a5,t1
	jr	a5
	.section	.rodata.vsnprintf,"a",@progbits
	.align	2
	.align	2
.L384:
	.word	.L584-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L380-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L386-.L384
	.word	.L383-.L384
	.word	.L385-.L384
	.word	.L383-.L384
	.word	.L383-.L384
	.word	.L382-.L384
	.section	.text.vsnprintf
.L383:
	sw	a1,8(sp)
	li	a3,42
	bne	a1,a3,.L708
	lw	a3,16(sp)
	lw	a5,0(a3)
	addi	a3,a3,4
	sw	a5,20(sp)
	bge	a5,zero,.L390
	neg	a5,a5
	sw	a5,20(sp)
	li	a5,1
	sw	a5,28(sp)
.L390:
	lw	a5,4(sp)
	mv	t0,a4
	sw	a3,16(sp)
	add	a2,a5,a4
	lbu	a5,0(a2)
	sw	a5,8(sp)
.L389:
	li	a5,-1
	sw	a5,24(sp)
	lw	a5,8(sp)
	li	a4,46
	beq	a5,a4,.L709
.L392:
	lw	a5,4(sp)
	addi	a4,t0,1
	li	a3,104
	add	a1,a5,a4
	lw	a5,8(sp)
	beq	a5,a3,.L710
.L397:
	lw	a5,8(sp)
	li	a3,108
	beq	a5,a3,.L711
	lw	a5,8(sp)
	li	a3,122
	bne	a5,a3,.L414
	lbu	a5,0(a1)
	mv	a2,a1
	mv	t0,a4
	sw	a5,8(sp)
.L414:
	lw	a5,8(sp)
	li	a4,37
	beq	a5,a4,.L399
	addi	a4,a5,-88
	andi	a4,a4,0xff
	li	a3,32
	bgtu	a4,a3,.L400
	lla	a3,.L578
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L578:
	.word	.L502-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L407-.L578
	.word	.L419-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L419-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L405-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L404-.L578
	.word	.L400-.L578
	.word	.L462-.L578
	.word	.L400-.L578
	.word	.L400-.L578
	.word	.L502-.L578
	.section	.text.vsnprintf
.L708:
	addi	a3,a1,-48
	lw	a1,4(sp)
	andi	a5,a3,0xff
	li	t1,9
	sw	zero,20(sp)
	addi	t0,a4,-1
	add	a4,a1,a4
	li	a1,9
	bgtu	a5,t1,.L389
	sw	s0,8(sp)
	li	a5,0
.L391:
	lbu	t1,0(a4)
	slli	a2,a5,2
	add	a5,a2,a5
	slli	a5,a5,1
	add	a5,a3,a5
	addi	a3,t1,-48
	andi	s0,a3,0xff
	mv	a2,a4
	addi	t0,t0,1
	addi	a4,a4,1
	bleu	s0,a1,.L391
	lw	s0,8(sp)
	sw	a5,20(sp)
	sw	t1,8(sp)
	li	a5,-1
	sw	a5,24(sp)
	lw	a5,8(sp)
	li	a4,46
	bne	a5,a4,.L392
.L709:
	lw	a5,4(sp)
	addi	a1,t0,1
	li	a4,42
	add	a2,a5,a1
	lbu	a5,0(a2)
	sw	a5,8(sp)
	bne	a5,a4,.L712
	lw	a5,16(sp)
	lw	a3,0(a5)
	addi	a4,a5,4
	sw	a3,24(sp)
	blt	a3,zero,.L713
.L395:
	lw	a5,4(sp)
	addi	t0,t0,2
	sw	a4,16(sp)
	add	a2,a5,t0
	lbu	a5,0(a2)
	addi	a4,t0,1
	li	a3,104
	sw	a5,8(sp)
	lw	a5,4(sp)
	add	a1,a5,a4
	lw	a5,8(sp)
	bne	a5,a3,.L397
.L710:
	lbu	a5,0(a1)
	sw	a5,8(sp)
	beq	a5,a3,.L714
	lw	a5,8(sp)
	li	a3,37
	beq	a5,a3,.L621
	addi	a3,a5,-88
	andi	a3,a3,0xff
	li	a2,32
	bgtu	a3,a2,.L623
	lla	a2,.L576
	slli	a3,a3,2
	add	a3,a3,a2
	lw	a3,0(a3)
	add	a3,a3,a2
	jr	a3
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L576:
	.word	.L499-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L624-.L576
	.word	.L418-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L418-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L625-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L626-.L576
	.word	.L623-.L576
	.word	.L460-.L576
	.word	.L623-.L576
	.word	.L623-.L576
	.word	.L499-.L576
	.section	.text.vsnprintf
.L623:
	mv	t0,a4
	mv	a2,a1
.L400:
	lw	a5,0(sp)
	addi	a5,a5,2
	sw	a5,0(sp)
	bgeu	s0,t2,.L455
	lw	a3,12(sp)
	li	a4,37
	addi	s1,s0,1
	add	a5,a3,s0
	sb	a4,0(a5)
	bgeu	s1,t2,.L614
	lbu	a5,0(a2)
	add	s1,a3,s1
	addi	s0,s0,2
	sb	a5,0(s1)
	mv	s1,s0
.L455:
	addi	t1,t0,1
	j	.L379
.L711:
	lbu	a5,0(a1)
	sw	a5,8(sp)
	beq	a5,a3,.L715
	lw	a5,8(sp)
	li	a3,37
	beq	a5,a3,.L621
	addi	a3,a5,-88
	andi	a3,a3,0xff
	li	a2,32
	bgtu	a3,a2,.L623
	lla	a2,.L577
	slli	a3,a3,2
	add	a3,a3,a2
	lw	a3,0(a3)
	add	a3,a3,a2
	jr	a3
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L577:
	.word	.L501-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L624-.L577
	.word	.L415-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L415-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L625-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L626-.L577
	.word	.L623-.L577
	.word	.L461-.L577
	.word	.L623-.L577
	.word	.L623-.L577
	.word	.L501-.L577
	.section	.text.vsnprintf
.L380:
	li	a5,1
	sw	a5,36(sp)
.L381:
	addi	a3,a3,1
	addi	a4,a4,1
	j	.L377
.L584:
	li	a0,1
	j	.L381
.L382:
	li	a5,1
	sw	a5,32(sp)
	j	.L381
.L385:
	li	a5,1
	sw	a5,28(sp)
	j	.L381
.L386:
	li	a5,1
	sw	a5,40(sp)
	j	.L381
.L713:
	li	a5,-1
	sw	a5,24(sp)
	j	.L395
.L715:
	lw	a5,4(sp)
	addi	t0,t0,2
	li	a4,37
	add	a2,a5,t0
	lbu	a5,0(a2)
	sw	a5,8(sp)
	beq	a5,a4,.L399
	addi	a4,a5,-88
	andi	a4,a4,0xff
	li	a3,32
	bgtu	a4,a3,.L400
	lla	a3,.L411
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L411:
	.word	.L410-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L407-.L411
	.word	.L413-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L413-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L405-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L404-.L411
	.word	.L400-.L411
	.word	.L412-.L411
	.word	.L400-.L411
	.word	.L400-.L411
	.word	.L410-.L411
	.section	.text.vsnprintf
.L419:
	lw	a4,16(sp)
	lw	a5,0(a4)
	addi	a1,a4,4
	srai	t1,a5,31
.L416:
	blt	t1,zero,.L716
.L417:
	or	a4,a5,t1
	bne	a4,zero,.L586
	lw	a3,24(sp)
	beq	a3,zero,.L587
	li	a5,48
	sb	a5,76(sp)
	li	a5,1
	sw	a5,8(sp)
	sw	zero,48(sp)
	addi	a4,sp,76
	ble	a3,a5,.L589
.L423:
	lw	a5,8(sp)
	lw	t1,24(sp)
	li	a2,48
.L441:
	addi	a5,a5,1
	add	a3,a4,a5
	sb	a2,-1(a3)
	bgt	t1,a5,.L441
	lw	a3,8(sp)
	lw	a2,24(sp)
	li	a5,0
	addi	a4,a3,1
	ble	a2,a3,.L443
	addi	a5,a2,-1
	sub	a5,a5,a3
.L443:
	add	a5,a5,a4
	sw	a5,8(sp)
.L424:
	lw	a5,48(sp)
	beq	a5,zero,.L589
	lw	a5,8(sp)
	addi	a3,sp,76
	sw	a1,16(sp)
	addi	a4,a5,64
	add	a4,a4,a3
	li	a3,45
	addi	a5,a5,1
	sb	a3,-64(a4)
.L444:
	lw	a4,20(sp)
	sub	a3,a4,a5
	bgt	a3,zero,.L446
	sw	a5,20(sp)
.L446:
	lw	a4,0(sp)
	lw	a2,20(sp)
	add	a4,a4,a2
	sw	a4,0(sp)
	lw	a4,28(sp)
	beq	a4,zero,.L717
	beq	a5,zero,.L454
.L453:
	lw	a1,12(sp)
	addi	a4,sp,76
	add	a5,a4,a5
.L456:
	mv	s1,s0
	bgeu	s0,t2,.L452
	lbu	a2,-1(a5)
	add	s1,a1,s0
	addi	s0,s0,1
	sb	a2,0(s1)
	mv	s1,s0
.L452:
	addi	a5,a5,-1
	bne	a4,a5,.L456
	lw	a5,28(sp)
	beq	a5,zero,.L455
.L454:
	addi	a5,a3,-1
	ble	a3,zero,.L455
	lw	a2,12(sp)
	li	a3,32
	li	a4,-1
.L458:
	mv	s1,s0
	bgeu	s0,t2,.L457
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L457:
	addi	a5,a5,-1
	bne	a5,a4,.L458
	addi	t1,t0,1
	j	.L379
.L418:
	lw	a3,16(sp)
	mv	t0,a4
	lh	a5,0(a3)
	addi	a1,a3,4
	srai	t1,a5,31
	j	.L416
.L499:
	lw	a5,16(sp)
	li	a2,0
	mv	t0,a4
	lhu	a3,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
.L500:
	lla	a5,.LC1
	mv	a0,a5
	lw	a5,8(sp)
	li	a4,120
	bne	a5,a4,.L503
	lla	a5,.LC0
	mv	a0,a5
.L503:
	or	a5,a3,a2
	bne	a5,zero,.L598
	lw	a4,24(sp)
	beq	a4,zero,.L718
	li	a4,48
	sb	a4,76(sp)
	li	a1,1
.L512:
	lw	t1,24(sp)
	addi	a4,sp,76
	add	a3,a4,a1
	add	a0,a4,t1
	li	a2,48
	bge	a1,t1,.L719
.L513:
	sb	a2,0(a3)
	addi	a3,a3,1
	bne	a0,a3,.L513
	lw	a3,20(sp)
	lw	a2,24(sp)
	sub	a3,a3,a2
	lw	a2,28(sp)
	sw	a3,20(sp)
	addi	t1,a3,-1
	bne	a2,zero,.L511
.L514:
	lw	a4,36(sp)
	bne	a4,zero,.L720
.L508:
	lw	a5,20(sp)
	ble	a5,zero,.L721
.L521:
	lw	a5,20(sp)
	lw	a3,24(sp)
	addi	a4,sp,76
	add	a5,a4,a5
	add	a5,a5,a3
	add	a4,a4,a3
	li	a3,32
.L527:
	sb	a3,0(a4)
	addi	a4,a4,1
	bne	a4,a5,.L527
	lw	a5,24(sp)
	addi	a5,a5,1
	add	a5,a5,t1
	sw	a5,24(sp)
	lw	a5,20(sp)
	sub	a5,t1,a5
	sw	a5,20(sp)
.L522:
	lw	a3,24(sp)
	lw	a4,20(sp)
	mv	a5,a3
	ble	a4,zero,.L528
	add	a5,a3,a4
.L528:
	lw	a4,0(sp)
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,24(sp)
	beq	a5,zero,.L455
	addi	a4,sp,76
	j	.L519
.L625:
	mv	t0,a4
.L405:
	lw	a5,16(sp)
	lw	a3,0(a5)
	addi	t1,a5,4
	beq	a3,zero,.L722
	li	a2,0
	addi	a4,sp,76
	lla	a0,.LC0
.L539:
	andi	a5,a3,15
	add	a5,a0,a5
	lbu	s1,0(a5)
	mv	a5,a2
	addi	a2,a2,1
	add	a1,a4,a2
	sb	s1,-1(a1)
	srli	a3,a3,4
	bne	a3,zero,.L539
	addi	a3,a2,64
	addi	a2,sp,76
	add	a2,a3,a2
	li	a3,120
	sb	a3,-64(a2)
	addi	a0,sp,76
	addi	a3,a5,64
	add	a3,a3,a0
	li	a1,48
	sb	a1,-62(a3)
	lw	a3,20(sp)
	addi	a2,a5,3
	sub	a3,a3,a2
	ble	a3,zero,.L723
	lw	a2,0(sp)
	lw	a1,20(sp)
	add	a2,a2,a1
	sw	a2,0(sp)
	lw	a2,28(sp)
	beq	a2,zero,.L724
.L542:
	lw	a1,12(sp)
	add	a5,a4,a5
	addi	a4,sp,73
.L546:
	mv	s1,s0
	bgeu	s0,t2,.L545
	lbu	a2,2(a5)
	add	s1,a1,s0
	addi	s0,s0,1
	sb	a2,0(s1)
	mv	s1,s0
.L545:
	addi	a5,a5,-1
	bne	a4,a5,.L546
	lw	a5,28(sp)
	sw	t1,16(sp)
	beq	a5,zero,.L455
	addi	a5,a3,-1
	ble	a3,zero,.L455
	lw	a2,12(sp)
	li	a3,32
	li	a4,-1
.L548:
	mv	s1,s0
	bgeu	s0,t2,.L547
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L547:
	addi	a5,a5,-1
	bne	a5,a4,.L548
.L704:
	sw	t1,16(sp)
.L728:
	addi	t1,t0,1
	j	.L379
.L626:
	mv	t0,a4
.L404:
	lw	a4,16(sp)
	lw	a5,0(a4)
	addi	a0,a4,4
	beq	a5,zero,.L607
	lbu	a4,0(a5)
	beq	a4,zero,.L725
.L549:
	lw	a2,24(sp)
	li	a3,0
.L552:
	beq	a2,a3,.L726
	addi	a3,a3,1
	add	a4,a5,a3
	lbu	a4,0(a4)
	bne	a4,zero,.L552
	lw	a2,20(sp)
	sub	a4,a2,a3
	ble	a4,zero,.L553
	lw	a1,0(sp)
	add	a2,a1,a2
	sw	a2,0(sp)
	lw	a2,28(sp)
	beq	a2,zero,.L550
.L554:
	lw	t1,12(sp)
	li	a2,0
.L562:
	mv	s1,s0
	bgeu	s0,t2,.L561
	add	a1,a5,a2
	lbu	a1,0(a1)
	add	s1,t1,s0
	addi	s0,s0,1
	sb	a1,0(s1)
	mv	s1,s0
.L561:
	addi	a2,a2,1
	blt	a2,a3,.L562
	lw	a5,28(sp)
	sw	a0,16(sp)
	beq	a5,zero,.L455
	addi	a5,a4,-1
	ble	a4,zero,.L455
.L551:
	lw	a2,12(sp)
	li	a3,32
	li	a4,-1
.L564:
	mv	s1,s0
	bgeu	s0,t2,.L563
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L563:
	addi	a5,a5,-1
	bne	a5,a4,.L564
	sw	a0,16(sp)
.L733:
	addi	t1,t0,1
	j	.L379
.L624:
	mv	t0,a4
.L407:
	lw	a4,20(sp)
	lw	a2,16(sp)
	neg	a5,a4
	lw	a3,0(a2)
	addi	a4,a4,-1
	srai	a5,a5,31
	addi	t1,a2,4
	lw	a2,0(sp)
	and	a5,a4,a5
	addi	a5,a5,1
	add	a5,a2,a5
	sw	a5,0(sp)
	lw	a5,28(sp)
	beq	a5,zero,.L727
	bgeu	s0,t2,.L570
	lw	a5,12(sp)
	addi	s0,s0,1
	add	s1,a5,s1
	sb	a3,0(s1)
	mv	s1,s0
.L570:
	lw	a5,20(sp)
	addi	a5,a5,-2
	ble	a4,zero,.L704
	lw	a2,12(sp)
	li	a3,32
	li	a4,-1
.L574:
	mv	s1,s0
	bgeu	s0,t2,.L573
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L573:
	addi	a5,a5,-1
	bne	a5,a4,.L574
	sw	t1,16(sp)
	j	.L728
.L462:
	lw	a4,16(sp)
	li	a2,0
	lw	a5,0(a4)
	addi	a4,a4,4
	sw	a4,16(sp)
.L459:
	or	a4,a5,a2
	bne	a4,zero,.L595
	lw	a5,24(sp)
	beq	a5,zero,.L729
	li	a5,48
	sb	a5,76(sp)
	li	a5,1
	sw	a5,8(sp)
.L485:
	lw	a2,8(sp)
	lw	a1,24(sp)
	addi	a4,sp,76
	add	a5,a4,a2
	li	a3,48
	add	a4,a4,a1
	ble	a1,a2,.L730
.L486:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a4,a5,.L486
	lw	a4,24(sp)
	lw	a5,20(sp)
	sw	a4,8(sp)
	sub	a5,a5,a4
.L469:
	bgt	a5,zero,.L487
	lw	a4,8(sp)
	sw	a4,20(sp)
.L487:
	lw	a4,0(sp)
	lw	a3,20(sp)
	add	a4,a4,a3
	sw	a4,0(sp)
	lw	a4,28(sp)
	beq	a4,zero,.L731
.L488:
	lw	a3,8(sp)
	lw	a1,12(sp)
	addi	a4,sp,76
	add	a3,a4,a3
.L496:
	mv	s1,s0
	bgeu	s0,t2,.L495
	lbu	a2,-1(a3)
	add	s1,a1,s0
	addi	s0,s0,1
	sb	a2,0(s1)
	mv	s1,s0
.L495:
	addi	a3,a3,-1
	bne	a4,a3,.L496
	lw	a4,28(sp)
	beq	a4,zero,.L455
	addi	a4,a5,-1
	ble	a5,zero,.L455
.L582:
	lw	a2,12(sp)
	li	a3,32
	li	a5,-1
.L498:
	mv	s1,s0
	bgeu	s0,t2,.L497
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L497:
	addi	a4,a4,-1
	bne	a4,a5,.L498
	addi	t1,t0,1
	j	.L379
.L460:
	lw	a3,16(sp)
	mv	t0,a4
	li	a2,0
	addi	a4,a3,4
	lhu	a5,0(a3)
	sw	a4,16(sp)
	j	.L459
.L712:
	addi	a3,a5,-48
	andi	t1,a3,0xff
	li	a4,9
	bgtu	t1,a4,.L732
	lw	a5,4(sp)
	addi	a4,t0,2
	sw	s0,8(sp)
	add	a4,a5,a4
	mv	t0,a1
	li	a5,9
	li	a1,0
.L396:
	lbu	t1,0(a4)
	slli	a2,a1,2
	add	a2,a2,a1
	slli	a2,a2,1
	add	a1,a3,a2
	addi	a3,t1,-48
	andi	s0,a3,0xff
	mv	a2,a4
	addi	t0,t0,1
	addi	a4,a4,1
	bleu	s0,a5,.L396
	lw	s0,8(sp)
	sw	a1,24(sp)
	sw	t1,8(sp)
	j	.L392
.L621:
	mv	t0,a4
.L399:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	bgeu	s0,t2,.L455
	lw	a5,12(sp)
	addi	s0,s0,1
	addi	t1,t0,1
	add	s1,a5,s1
	li	a5,37
	sb	a5,0(s1)
	mv	s1,s0
	j	.L379
.L372:
	.cfi_restore 8
	.cfi_restore 9
	lw	a5,12(sp)
	sb	zero,0(a5)
.L371:
	lw	ra,148(sp)
	.cfi_restore 1
	sw	zero,0(sp)
	lw	a0,0(sp)
	addi	sp,sp,152
	.cfi_def_cfa_offset 0
	jr	ra
.L714:
	.cfi_def_cfa_offset 152
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	a5,4(sp)
	addi	t0,t0,2
	li	a4,37
	add	a2,a5,t0
	lbu	a5,0(a2)
	sw	a5,8(sp)
	beq	a5,a4,.L399
	addi	a4,a5,-88
	andi	a4,a4,0xff
	li	a3,32
	bgtu	a4,a3,.L400
	lla	a3,.L402
	slli	a4,a4,2
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a3
	jr	a4
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L402:
	.word	.L401-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L407-.L402
	.word	.L406-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L406-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L405-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L404-.L402
	.word	.L400-.L402
	.word	.L403-.L402
	.word	.L400-.L402
	.word	.L400-.L402
	.word	.L401-.L402
	.section	.text.vsnprintf
.L726:
	lw	a2,20(sp)
	lw	a4,24(sp)
	sub	a4,a2,a4
	ble	a4,zero,.L556
	lw	a1,0(sp)
	add	a2,a1,a2
	sw	a2,0(sp)
	lw	a2,28(sp)
	beq	a2,zero,.L550
	lw	a2,24(sp)
	bne	a2,zero,.L554
.L695:
	addi	a5,a4,-1
	j	.L551
.L735:
	sw	a2,20(sp)
	sw	a1,24(sp)
.L511:
	lw	a5,20(sp)
	ble	a5,zero,.L579
	lw	a3,24(sp)
	add	a5,a3,a5
	lw	a3,0(sp)
	add	a5,a3,a5
	sw	a5,0(sp)
.L519:
	lw	a5,24(sp)
	lw	a2,12(sp)
	add	a5,a4,a5
.L531:
	mv	s1,s0
	bgeu	s0,t2,.L530
	lbu	a3,-1(a5)
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L530:
	addi	a5,a5,-1
	bne	a4,a5,.L531
.L529:
	lw	a5,28(sp)
	beq	a5,zero,.L455
	lw	a4,20(sp)
	addi	a5,a4,-1
	ble	a4,zero,.L455
	lw	a2,12(sp)
	li	a3,32
	li	a4,-1
.L534:
	mv	s1,s0
	bgeu	s0,t2,.L533
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a3,0(s1)
	mv	s1,s0
.L533:
	addi	a5,a5,-1
	bne	a5,a4,.L534
	addi	t1,t0,1
	j	.L379
.L502:
	lw	a5,16(sp)
	li	a2,0
	lw	a3,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	j	.L500
.L579:
	lw	a5,0(sp)
	lw	a3,24(sp)
	add	a5,a5,a3
	sw	a5,0(sp)
	j	.L519
.L724:
	lw	s1,12(sp)
	addi	a3,a3,-1
	li	a0,32
	li	a1,-1
.L544:
	bgeu	s0,t2,.L543
	add	a2,s1,s0
	sb	a0,0(a2)
	addi	s0,s0,1
.L543:
	addi	a3,a3,-1
	bne	a3,a1,.L544
	j	.L542
.L725:
	lw	a4,20(sp)
	sw	a0,16(sp)
	ble	a4,zero,.L455
	lw	a3,0(sp)
	add	a3,a3,a4
	sw	a3,0(sp)
	lw	a3,28(sp)
	bne	a3,zero,.L695
	lw	a4,20(sp)
	li	a3,0
.L550:
	lw	t1,12(sp)
	addi	a4,a4,-1
	li	a1,32
	li	a2,-1
.L558:
	mv	s1,s0
	bgeu	s0,t2,.L560
	add	s1,t1,s0
	addi	s0,s0,1
	sb	a1,0(s1)
	mv	s1,s0
.L560:
	addi	a4,a4,-1
	bne	a4,a2,.L558
	bne	a3,zero,.L554
	sw	a0,16(sp)
	j	.L733
.L415:
	lw	a3,16(sp)
	mv	t0,a4
	lw	a5,0(a3)
	addi	a1,a3,4
	srai	t1,a5,31
	j	.L416
.L501:
	lw	a5,16(sp)
	li	a2,0
	mv	t0,a4
	lw	a3,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	j	.L500
.L720:
	beq	a5,zero,.L508
	lw	a5,8(sp)
	li	a4,120
	beq	a5,a4,.L524
	li	a5,88
	sw	a5,8(sp)
.L524:
	lw	a2,24(sp)
	addi	a3,sp,76
	addi	a4,sp,76
	addi	a5,a2,64
	add	a3,a5,a3
	lw	a5,8(sp)
	sb	a5,-64(a3)
	addi	a5,a2,65
	add	a4,a5,a4
	li	a5,48
	sb	a5,-64(a4)
	addi	a5,a2,2
	sw	a5,24(sp)
	lw	a5,20(sp)
	bgt	a5,zero,.L521
	ble	t1,zero,.L525
	lw	a5,24(sp)
	lw	a4,0(sp)
	sw	t1,20(sp)
	add	a5,a5,t1
	add	a5,a4,a5
	sw	a5,0(sp)
	addi	a4,sp,76
	j	.L519
.L406:
	lw	a4,16(sp)
	li	t1,0
	lbu	a5,0(a4)
	addi	a1,a4,4
	j	.L417
.L401:
	lw	a5,16(sp)
	li	a2,0
	lbu	a3,0(a5)
	addi	a5,a5,4
	sw	a5,16(sp)
	j	.L500
.L413:
	lw	a4,16(sp)
	lw	a5,0(a4)
	lw	t1,4(a4)
	addi	a1,a4,8
	j	.L416
.L410:
	lw	a5,16(sp)
	lw	a3,0(a5)
	lw	a2,4(a5)
	addi	a5,a5,8
	sw	a5,16(sp)
	j	.L500
.L461:
	lw	a3,16(sp)
	mv	t0,a4
	li	a2,0
	addi	a4,a3,4
	lw	a5,0(a3)
	sw	a4,16(sp)
	j	.L459
.L403:
	lw	a4,16(sp)
	li	a2,0
	lbu	a5,0(a4)
	addi	a4,a4,4
	sw	a4,16(sp)
	j	.L459
.L412:
	lw	a4,16(sp)
	lw	a3,4(a4)
	lw	a5,0(a4)
	addi	a4,a4,8
	mv	a2,a3
	sw	a4,16(sp)
	j	.L459
.L716:
	snez	a4,a5
	neg	a3,t1
	sub	t1,a3,a4
	li	a4,1
	neg	a5,a5
	sw	a4,48(sp)
.L421:
	li	a3,0
	addi	a4,sp,76
	sw	s0,52(sp)
	sw	s1,68(sp)
	sw	a0,56(sp)
	sw	t0,60(sp)
	sw	a1,64(sp)
	mv	s1,a3
	sw	t2,72(sp)
	mv	s0,a5
	sw	a4,36(sp)
.L439:
	lw	a5,36(sp)
	addi	s1,s1,1
	li	a2,10
	add	t2,a5,s1
	li	a3,0
	mv	a0,s0
	mv	a1,t1
	sw	t1,16(sp)
	sw	t2,8(sp)
	call	__moddi3
	lw	t1,16(sp)
	lw	t2,8(sp)
	addi	t0,a0,48
	li	a3,0
	mv	a0,s0
	mv	a1,t1
	li	a2,10
	sb	t0,-1(t2)
	call	__divdi3
	or	a3,a1,a0
	mv	t1,a1
	mv	s0,a0
	bne	a3,zero,.L439
	sw	s1,8(sp)
	lw	a5,24(sp)
	lw	a3,8(sp)
	lw	s0,52(sp)
	lw	a0,56(sp)
	lw	t0,60(sp)
	lw	a1,64(sp)
	lw	s1,68(sp)
	lw	t2,72(sp)
	lw	a4,36(sp)
	bgt	a5,a3,.L423
	j	.L424
.L607:
	lla	a5,.LC2
	j	.L549
.L722:
	lla	a1,.LC3+1
	mv	a4,a1
	li	a5,0
.L536:
	lbu	a2,0(a4)
	mv	a3,a5
	addi	a4,a4,1
	addi	a5,a5,1
	bne	a2,zero,.L536
	lw	a4,0(sp)
	lw	a2,12(sp)
	add	a3,a1,a3
	add	a5,a4,a5
	sw	a5,0(sp)
	lla	a5,.LC3
.L538:
	mv	s1,s0
	bgeu	s0,t2,.L537
	lbu	a4,0(a5)
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a4,0(s1)
	mv	s1,s0
.L537:
	addi	a5,a5,1
	bne	a3,a5,.L538
	sw	t1,16(sp)
	j	.L728
.L723:
	lw	a0,0(sp)
	lw	a1,28(sp)
	add	a2,a0,a2
	seqz	a1,a1
	sw	a2,0(sp)
	sub	a3,a3,a1
	j	.L542
.L717:
	lw	a2,32(sp)
	li	a4,32
	beq	a2,zero,.L448
	lw	a4,24(sp)
	srai	a4,a4,31
	andi	a4,a4,16
	addi	a4,a4,32
.L448:
	addi	a2,a3,-1
	ble	a3,zero,.L594
	lw	a1,12(sp)
	mv	a3,a2
	li	a2,-1
.L451:
	mv	s1,s0
	bgeu	s0,t2,.L450
	add	s1,a1,s0
	addi	s0,s0,1
	sb	a4,0(s1)
	mv	s1,s0
.L450:
	addi	a3,a3,-1
	bne	a3,a2,.L451
	bne	a5,zero,.L453
.L736:
	addi	t1,t0,1
	j	.L379
.L598:
	sw	s0,40(sp)
	li	a1,0
	addi	a4,sp,76
	sw	t0,48(sp)
	mv	s0,a0
.L504:
	andi	a0,a3,15
	add	a0,s0,a0
	lbu	t1,0(a0)
	slli	t0,a2,28
	addi	a1,a1,1
	srli	a3,a3,4
	add	a0,a4,a1
	or	a3,t0,a3
	srli	a2,a2,4
	sb	t1,-1(a0)
	or	a0,a3,a2
	bne	a0,zero,.L504
	lw	s0,40(sp)
	lw	t0,48(sp)
	j	.L512
.L595:
	sw	s1,56(sp)
	sw	zero,8(sp)
	addi	a4,sp,76
	sw	s0,48(sp)
	sw	t0,52(sp)
	sw	t2,60(sp)
	mv	s1,a2
.L679:
	lw	a3,8(sp)
	li	a2,10
	mv	a0,a5
	addi	t1,a3,1
	mv	a1,s1
	li	a3,0
	add	s0,a4,t1
	sw	a4,36(sp)
	sw	t1,8(sp)
	sw	a5,40(sp)
	call	__umoddi3
	lw	a5,40(sp)
	addi	t0,a0,48
	mv	a1,s1
	mv	a0,a5
	sb	t0,-1(s0)
	li	a2,10
	li	a3,0
	call	__udivdi3
	mv	s0,s1
	lw	a4,36(sp)
	mv	a5,a0
	mv	s1,a1
	bne	s0,zero,.L679
	lw	a3,40(sp)
	li	a2,9
	bgtu	a3,a2,.L679
	lw	s0,48(sp)
	lw	t0,52(sp)
	lw	s1,56(sp)
	lw	t2,60(sp)
	j	.L485
.L727:
	lw	a5,20(sp)
	li	a1,32
	li	a2,-1
	addi	a5,a5,-2
	ble	a4,zero,.L568
	lw	a4,12(sp)
.L567:
	mv	s1,s0
	bgeu	s0,t2,.L571
	add	s1,a4,s0
	addi	s0,s0,1
	sb	a1,0(s1)
	mv	s1,s0
.L571:
	addi	a5,a5,-1
	bne	a5,a2,.L567
.L568:
	bgeu	s0,t2,.L704
	lw	a5,12(sp)
	addi	s0,s0,1
	sw	t1,16(sp)
	add	s1,a5,s1
	sb	a3,0(s1)
	mv	s1,s0
	j	.L728
.L589:
	sw	a1,16(sp)
.L422:
	lw	a5,40(sp)
	beq	a5,zero,.L445
	lw	a5,8(sp)
	addi	a3,sp,76
	addi	a4,a5,64
	add	a4,a4,a3
	li	a3,43
	addi	a5,a5,1
	sb	a3,-64(a4)
	j	.L444
.L445:
	lw	a4,8(sp)
	mv	a5,a4
	beq	a0,zero,.L444
	addi	a4,a4,64
	addi	a3,sp,76
	add	a3,a4,a3
	li	a4,32
	addi	a5,a5,1
	sb	a4,-64(a3)
	j	.L444
.L553:
	lw	a1,0(sp)
	lw	a2,28(sp)
	add	a1,a1,a3
	seqz	a2,a2
	sw	a1,0(sp)
	sub	a4,a4,a2
	j	.L554
.L731:
	lw	a4,32(sp)
	bne	a4,zero,.L489
.L491:
	sw	a5,20(sp)
	li	a4,32
.L490:
	lw	a3,20(sp)
	addi	a5,a3,-1
	ble	a3,zero,.L492
	lw	a2,12(sp)
	li	a3,-1
.L494:
	mv	s1,s0
	bgeu	s0,t2,.L493
	add	s1,a2,s0
	addi	s0,s0,1
	sb	a4,0(s1)
	mv	s1,s0
.L493:
	addi	a5,a5,-1
	bne	a5,a3,.L494
.L492:
	lw	a4,8(sp)
	bne	a4,zero,.L488
	addi	t1,t0,1
	j	.L379
.L587:
	sw	zero,8(sp)
	sw	a1,16(sp)
	j	.L422
.L718:
	lw	a5,28(sp)
	bne	a5,zero,.L506
	lw	a5,20(sp)
	addi	t1,a5,-1
	lw	a5,36(sp)
	beq	a5,zero,.L508
	lw	a5,20(sp)
	bgt	a5,zero,.L521
	addi	t1,t0,1
	j	.L379
.L729:
	lw	a5,20(sp)
	ble	a5,zero,.L465
	lw	a4,0(sp)
	add	a5,a4,a5
	sw	a5,0(sp)
	lw	a5,28(sp)
	beq	a5,zero,.L466
	lw	a5,20(sp)
	addi	a4,a5,-1
	j	.L582
.L556:
	lw	a2,0(sp)
	lw	a1,24(sp)
	add	a2,a2,a1
	sw	a2,0(sp)
	lw	a2,28(sp)
	beq	a2,zero,.L734
	lw	a2,24(sp)
	bne	a2,zero,.L554
	sw	a0,16(sp)
	j	.L733
.L732:
	mv	t0,a1
	sw	zero,24(sp)
	j	.L392
.L489:
	lw	a4,24(sp)
	bge	a4,zero,.L491
	sw	a5,20(sp)
	li	a4,48
	j	.L490
.L506:
	lw	a5,20(sp)
	ble	a5,zero,.L455
	lw	a4,0(sp)
	add	a5,a4,a5
	sw	a5,0(sp)
	j	.L529
.L730:
	lw	a5,20(sp)
	sub	a5,a5,a2
	j	.L469
.L719:
	lw	a2,20(sp)
	lw	a0,28(sp)
	sub	a2,a2,a1
	bne	a0,zero,.L735
	lw	a0,32(sp)
	addi	t1,a2,-1
	beq	a0,zero,.L600
	lw	a0,24(sp)
	bge	a0,zero,.L600
	ble	a2,zero,.L601
	lw	a2,20(sp)
	add	a0,a4,a2
	li	a2,48
.L516:
	sb	a2,0(a3)
	addi	a3,a3,1
	bne	a0,a3,.L516
	addi	a1,a1,1
	add	a3,a1,t1
	sw	a3,24(sp)
	li	a3,-1
	sw	a3,20(sp)
.L515:
	lw	a3,36(sp)
	beq	a3,zero,.L579
	beq	a5,zero,.L579
	lw	a5,8(sp)
	li	a3,120
	beq	a5,a3,.L520
	li	a5,88
	sw	a5,8(sp)
.L520:
	lw	a5,24(sp)
	addi	a1,sp,76
	addi	a3,sp,76
	addi	a2,a5,64
	add	a2,a2,a1
	lw	a1,8(sp)
	sb	a1,-64(a2)
	addi	a2,a5,2
	addi	a5,a5,65
	add	a3,a5,a3
	li	a5,48
	sb	a5,-64(a3)
	lw	a5,0(sp)
	sw	a2,24(sp)
	add	a5,a5,a2
	sw	a5,0(sp)
	j	.L519
.L465:
	lw	a5,28(sp)
	bne	a5,zero,.L455
.L466:
	lw	a5,32(sp)
	bne	a5,zero,.L627
	lw	a5,20(sp)
	sw	zero,8(sp)
	j	.L491
.L586:
	sw	zero,48(sp)
	j	.L421
.L734:
	addi	a4,a4,-1
	bne	a1,zero,.L554
	sw	a0,16(sp)
	j	.L733
.L594:
	mv	a3,a2
	bne	a5,zero,.L453
	j	.L736
.L627:
	sw	zero,8(sp)
	li	a4,32
	j	.L490
.L721:
	sw	t1,20(sp)
	j	.L522
.L601:
	sw	t1,20(sp)
	sw	a1,24(sp)
	j	.L515
.L600:
	sw	a2,20(sp)
	sw	a1,24(sp)
	j	.L514
.L614:
	mv	s0,s1
	addi	t1,t0,1
	j	.L379
.L525:
	lw	a5,0(sp)
	lw	a4,24(sp)
	sw	t1,20(sp)
	add	a5,a5,a4
	sw	a5,0(sp)
	addi	a4,sp,76
	j	.L519
	.cfi_endproc
.LFE4:
	.size	vsnprintf, .-vsnprintf
	.section	.text.printf,"ax",@progbits
	.align	2
	.globl	printf
	.hidden	printf
	.type	printf, @function
printf:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-40
	.cfi_def_cfa_offset 40
	li	t0,-4096
	sw	ra,16(sp)
	sw	s1,8(sp)
	sw	s0,12(sp)
	add	sp,sp,t0
	.cfi_def_cfa_offset 4136
	.cfi_offset 1, -24
	.cfi_offset 9, -32
	.cfi_offset 8, -28
	li	t0,4096
	li	t1,-4096
	addi	t2,t0,4
	add	t2,t2,t1
	addi	t1,sp,4
	addi	ra,sp,4
	add	t1,t2,t1
	addi	t2,t0,16
	sw	t1,0(sp)
	add	t2,t2,ra
	sw	a1,0(t2)
	addi	a1,t0,20
	add	a1,a1,ra
	sw	a2,0(a1)
	addi	a2,t0,24
	add	a2,a2,ra
	addi	t2,t0,28
	sw	a3,0(a2)
	add	t2,t2,ra
	mv	a2,a0
	lw	a0,0(sp)
	sw	a4,0(t2)
	addi	a4,t0,32
	add	a4,a4,ra
	sw	a5,0(a4)
	lw	a5,0(sp)
	addi	t1,t0,20
	add	t1,t1,sp
	mv	a3,t1
	li	a1,4096
	sw	t1,-4(a5)
	call	vsnprintf
	lw	a5,0(sp)
	mv	s1,a0
	lbu	a0,0(a5)
	beq	a0,zero,.L737
	addi	s0,a5,1
.L739:
	call	putch
	lbu	a0,0(s0)
	addi	s0,s0,1
	bne	a0,zero,.L739
.L737:
	li	t0,4096
	add	sp,sp,t0
	.cfi_def_cfa_offset 40
	lw	ra,16(sp)
	.cfi_restore 1
	mv	a0,s1
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,40
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	printf, .-printf
	.section	.text.snprintf,"ax",@progbits
	.align	2
	.globl	snprintf
	.hidden	snprintf
	.type	snprintf, @function
snprintf:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	addi	t1,sp,16
	sw	a3,16(sp)
	mv	a3,t1
	sw	ra,12(sp)
	.cfi_offset 1, -16
	sw	a4,20(sp)
	sw	a5,24(sp)
	sw	t1,0(sp)
	call	vsnprintf
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	snprintf, .-snprintf
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
