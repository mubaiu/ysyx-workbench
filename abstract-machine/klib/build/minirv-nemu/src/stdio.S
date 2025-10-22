#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stdio.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
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
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sw	s10,112(sp)
	sw	ra,156(sp)
	sw	s4,136(sp)
	lbu	a5,0(a1)
	.cfi_offset 26, -48
	.cfi_offset 1, -4
	.cfi_offset 20, -24
	mv	s10,a0
	beq	a5,zero,.L189
	sw	s1,148(sp)
	sw	s2,144(sp)
	sw	s5,132(sp)
	sw	s7,124(sp)
	sw	s8,120(sp)
	sw	s9,116(sp)
	sw	s0,152(sp)
	sw	s3,140(sp)
	sw	s6,128(sp)
	sw	s11,108(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 22, -32
	.cfi_offset 27, -52
	mv	s5,a1
	mv	s7,a2
	li	s1,0
	li	s4,0
	mv	s2,a0
	li	a4,37
	li	t1,16
	lla	s8,.L10
	lla	s9,.L29
	j	.L180
.L3:
	mv	s1,a3
	sb	a5,0(s2)
	add	a5,s5,s1
	lbu	a5,0(a5)
	addi	s4,s4,1
	add	s2,s10,s4
	beq	a5,zero,.L328
.L180:
	addi	a3,s1,1
	bne	a5,a4,.L3
	add	a5,s5,a3
	addi	s1,s1,2
	li	a6,0
	li	a0,0
	li	t6,0
	li	a7,0
	li	s6,0
.L4:
	lbu	a3,0(a5)
	mv	t3,a5
	addi	a2,a3,-32
	andi	a2,a2,0xff
	bgtu	a2,t1,.L9
	slli	a2,a2,2
	add	a2,a2,s8
	lw	a2,0(a2)
	add	a2,a2,s8
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
	li	a5,42
	bne	a3,a5,.L329
	lw	s0,0(s7)
	addi	s7,s7,4
	bge	s0,zero,.L16
	neg	s0,s0
	li	s6,1
.L16:
	add	t3,s5,s1
	lbu	a3,0(t3)
	mv	a1,s1
.L15:
	li	a5,46
	li	s3,-1
	beq	a3,a5,.L330
.L18:
	addi	s1,a1,1
	li	a5,104
	add	a2,s5,s1
	beq	a3,a5,.L331
.L23:
	li	a5,108
	beq	a3,a5,.L332
	li	a5,122
	beq	a3,a5,.L333
	mv	a2,t3
	mv	s1,a1
	li	t3,0
.L24:
	beq	a3,a4,.L26
.L335:
	addi	a5,a3,-88
	andi	a5,a5,0xff
	li	a1,32
	bgtu	a5,a1,.L27
	slli	a5,a5,2
	add	a5,a5,s9
	lw	a5,0(a5)
	add	a5,a5,s9
	jr	a5
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
.L329:
	addi	a2,a3,-48
	andi	a5,a2,0xff
	li	t5,9
	addi	a1,s1,-1
	li	s0,0
	add	s1,s5,s1
	li	t4,9
	bgtu	a5,t5,.L15
	mv	a5,s0
.L17:
	lbu	a3,0(s1)
	slli	s0,a5,2
	add	s0,s0,a5
	slli	s0,s0,1
	add	a5,a2,s0
	addi	a2,a3,-48
	andi	t5,a2,0xff
	mv	t3,s1
	addi	a1,a1,1
	addi	s1,s1,1
	bleu	t5,t4,.L17
	mv	s0,a5
	li	a5,46
	li	s3,-1
	bne	a3,a5,.L18
.L330:
	addi	a5,a1,1
	add	t3,s5,a5
	lbu	a3,0(t3)
	li	a2,42
	bne	a3,a2,.L334
	lw	s3,0(s7)
	addi	s7,s7,4
	bge	s3,zero,.L21
	li	s3,-1
.L21:
	addi	a1,a1,2
	add	t3,s5,a1
	lbu	a3,0(t3)
	addi	s1,a1,1
	li	a5,104
	add	a2,s5,s1
	bne	a3,a5,.L23
.L331:
	lbu	a3,0(a2)
	li	t3,1
	bne	a3,a5,.L24
	addi	s1,a1,2
	add	a2,s5,s1
	lbu	a3,0(a2)
	li	t3,2
	bne	a3,a4,.L335
.L26:
	addi	s4,s4,1
	sb	a4,0(s2)
	add	s2,s10,s4
.L77:
	addi	s1,s1,1
.L336:
	add	a5,s5,s1
	lbu	a5,0(a5)
	bne	a5,zero,.L180
.L328:
	mv	s10,s2
	lw	s0,152(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,148(sp)
	.cfi_restore 9
	lw	s2,144(sp)
	.cfi_restore 18
	lw	s3,140(sp)
	.cfi_restore 19
	lw	s5,132(sp)
	.cfi_restore 21
	lw	s6,128(sp)
	.cfi_restore 22
	lw	s7,124(sp)
	.cfi_restore 23
	lw	s8,120(sp)
	.cfi_restore 24
	lw	s9,116(sp)
	.cfi_restore 25
	lw	s11,108(sp)
	.cfi_restore 27
	sb	zero,0(s10)
	lw	ra,156(sp)
	.cfi_restore 1
	lw	s10,112(sp)
	.cfi_restore 26
	mv	a0,s4
	lw	s4,136(sp)
	.cfi_restore 20
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L332:
	.cfi_restore_state
	lbu	a3,0(a2)
	li	t3,3
	bne	a3,a5,.L24
	addi	s1,a1,2
	add	a2,s5,s1
	lbu	a3,0(a2)
	li	t3,4
	j	.L24
.L27:
	li	a5,37
	sb	a5,0(s2)
	lbu	a3,0(a2)
	addi	a5,s4,1
	add	a5,s10,a5
	addi	s4,s4,2
	sb	a3,0(a5)
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L334:
	addi	a2,a3,-48
	andi	t5,a2,0xff
	li	t4,9
	bgtu	t5,t4,.L337
	addi	t4,a1,2
	li	s3,0
	mv	a1,a5
	add	t4,s5,t4
	li	t5,9
	mv	a5,s3
.L22:
	lbu	a3,0(t4)
	slli	s3,a5,2
	add	s3,s3,a5
	slli	s3,s3,1
	add	a5,a2,s3
	addi	a2,a3,-48
	andi	t0,a2,0xff
	mv	t3,t4
	addi	a1,a1,1
	addi	t4,t4,1
	bleu	t0,t5,.L22
	mv	s3,a5
	j	.L18
.L8:
	li	a6,1
.L7:
	addi	a5,a5,1
	addi	s1,s1,1
	j	.L4
.L6:
	li	a0,1
	j	.L7
.L190:
	li	t6,1
	j	.L7
.L11:
	li	s6,1
	j	.L7
.L12:
	li	a7,1
	j	.L7
.L33:
	li	a5,1
	beq	t3,a5,.L338
	li	a5,2
	beq	t3,a5,.L339
	li	a5,3
	beq	t3,a5,.L40
	li	a5,4
	beq	t3,a5,.L340
.L40:
	lw	t4,0(s7)
	addi	s7,s7,4
	srai	t3,t4,31
.L36:
	blt	t3,zero,.L341
.L38:
	or	a5,t4,t3
	bne	a5,zero,.L195
	beq	s3,zero,.L196
	li	a5,48
	sb	a5,32(sp)
	li	t5,1
	li	a1,0
	addi	s11,sp,32
	ble	s3,t5,.L43
.L44:
	mv	a3,t5
	li	a0,48
.L62:
	addi	a3,a3,1
	add	a5,s11,a3
	sb	a0,-1(a5)
	bgt	s3,a3,.L62
	addi	a3,t5,1
	li	a5,0
	ble	s3,t5,.L64
	addi	a5,s3,-1
	sub	a5,a5,t5
.L64:
	add	t5,a5,a3
.L45:
	beq	a1,zero,.L43
	addi	a5,t5,64
	addi	a3,sp,32
	add	a5,a5,a3
	li	a3,45
	addi	t5,t5,1
	sb	a3,-64(a5)
.L65:
	sub	s0,s0,t5
	beq	s6,zero,.L182
.L75:
	addi	s11,sp,32
	add	a3,s11,t5
.L73:
	lbu	a5,-1(a3)
	addi	a3,a3,-1
	addi	s2,s2,1
	sb	a5,-1(s2)
	bne	s11,a3,.L73
	add	s4,t5,s4
	add	s2,s10,s4
	beq	s6,zero,.L77
.L76:
	addi	a2,s0,-1
	ble	s0,zero,.L77
	add	s0,s0,s4
	add	a5,s10,s0
	li	a3,32
.L78:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a5,.L78
.L324:
	addi	s4,s4,1
	add	s4,a2,s4
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L28:
	li	a5,1
	beq	t3,a5,.L342
	li	a5,2
	beq	t3,a5,.L343
	li	a5,3
	beq	t3,a5,.L121
	li	a5,4
	beq	t3,a5,.L344
.L121:
	lw	a1,0(s7)
	li	a7,0
	addi	s7,s7,4
.L118:
	li	a5,120
	lla	t6,.LC1
	bne	a3,a5,.L122
	lla	t6,.LC0
.L122:
	or	t4,a1,a7
	bne	t4,zero,.L207
	beq	s3,zero,.L345
	li	a5,48
	sb	a5,32(sp)
	li	t3,1
.L131:
	addi	s11,sp,32
	add	a2,s11,t3
	add	a7,s11,s3
	li	a1,48
	bge	t3,s3,.L346
.L132:
	sb	a1,0(a2)
	addi	a2,a2,1
	bne	a7,a2,.L132
	sub	s0,s0,s3
	bne	s6,zero,.L133
	addi	a7,s0,-1
	beq	a6,zero,.L135
.L134:
	beq	a0,zero,.L143
	addi	s11,sp,32
.L186:
	beq	t4,zero,.L314
	li	a2,120
	beq	a3,a2,.L146
	li	a3,88
.L146:
	addi	a5,s3,64
	addi	a1,sp,32
	add	a1,a5,a1
	sb	a3,-64(a1)
	addi	a5,s3,65
	addi	a3,sp,32
	add	a3,a5,a3
	li	a2,48
	sb	a2,-64(a3)
	addi	s3,s3,2
	addi	t3,s0,-1
	bgt	s0,zero,.L147
	mv	s0,a7
.L133:
	add	a3,s11,s3
.L150:
	lbu	a5,-1(a3)
	addi	a3,a3,-1
	addi	s2,s2,1
	sb	a5,-1(s2)
	bne	s11,a3,.L150
	add	s4,s3,s4
	add	s2,s10,s4
	beq	s6,zero,.L77
.L125:
	addi	a2,s0,-1
	ble	s0,zero,.L77
	add	a5,s0,s4
	add	a5,s10,a5
	li	a3,32
.L152:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a5,.L152
	j	.L324
.L34:
	lbu	a2,0(s7)
	addi	a1,s0,-1
	addi	s7,s7,4
	addi	a6,s0,-2
	beq	s6,zero,.L347
	addi	a0,s4,1
	sb	a2,0(s2)
	add	a5,s10,a0
	add	s0,s2,s0
	li	a3,32
	ble	a1,zero,.L348
.L179:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	s0,a5,.L179
	addi	s4,s4,2
	add	s4,s4,a6
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L32:
	lw	a2,0(s7)
	addi	a6,s7,4
	beq	a2,zero,.L349
	li	a1,0
	addi	s11,sp,32
	lla	a7,.LC0
.L156:
	andi	a5,a2,15
	add	a5,a7,a5
	lbu	a0,0(a5)
	mv	a3,a1
	addi	a1,a1,1
	add	a5,s11,a1
	sb	a0,-1(a5)
	srli	a2,a2,4
	bne	a2,zero,.L156
	addi	a5,a1,64
	addi	a2,sp,32
	add	a1,a5,a2
	addi	a0,a3,2
	li	a2,120
	sb	a2,-64(a1)
	addi	a5,a0,64
	addi	a2,sp,32
	add	a1,a5,a2
	li	a7,48
	addi	a2,a3,3
	sb	a7,-64(a1)
	sub	a2,s0,a2
	beq	s6,zero,.L350
.L157:
	add	a5,s11,a3
	addi	a1,sp,29
.L159:
	lbu	a3,2(a5)
	addi	a5,a5,-1
	addi	s2,s2,1
	sb	a3,-1(s2)
	bne	a1,a5,.L159
	addi	s4,s4,1
	add	s4,a0,s4
	mv	s7,a6
	add	s2,s10,s4
	beq	s6,zero,.L77
	addi	a1,a2,-1
	ble	a2,zero,.L77
	add	a5,s10,a2
	add	a5,a5,s4
	li	a3,32
.L160:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a5,.L160
	addi	s4,s4,1
	add	s4,s4,a1
	mv	s7,a6
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L30:
	li	a5,1
	beq	t3,a5,.L351
	li	a5,2
	beq	t3,a5,.L352
	li	a5,3
	beq	t3,a5,.L83
	li	a5,4
	beq	t3,a5,.L353
.L83:
	lw	t3,0(s7)
	li	a7,0
	addi	s7,s7,4
.L80:
	or	a5,t3,a7
	bne	a5,zero,.L202
	beq	s3,zero,.L354
	li	a5,48
	sb	a5,32(sp)
	li	t4,1
.L105:
	addi	s11,sp,32
	add	a3,s11,t4
	add	a1,s11,s3
	li	a2,48
	ble	s3,t4,.L355
.L106:
	sb	a2,0(a3)
	addi	a3,a3,1
	bne	a3,a1,.L106
	sub	s0,s0,s3
	beq	s6,zero,.L356
.L108:
	add	a3,s11,s3
.L114:
	lbu	a5,-1(a3)
	addi	a3,a3,-1
	addi	s2,s2,1
	sb	a5,-1(s2)
	bne	s11,a3,.L114
	add	s4,s3,s4
	add	s2,s10,s4
	beq	s6,zero,.L77
.L86:
	addi	a2,s0,-1
	ble	s0,zero,.L77
	add	a5,s0,s4
	add	a5,s10,a5
	li	a3,32
.L116:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a5,.L116
	j	.L324
.L31:
	lw	a1,0(s7)
	addi	a0,s7,4
	beq	a1,zero,.L219
	lbu	a5,0(a1)
	beq	a5,zero,.L357
	li	a5,0
.L163:
	beq	s3,a5,.L358
	addi	a5,a5,1
	add	a3,a1,a5
	lbu	a3,0(a3)
	bne	a3,zero,.L163
	sub	s0,s0,a5
	beq	s6,zero,.L188
.L170:
	li	a3,0
.L172:
	add	a2,a1,a3
	lbu	a6,0(a2)
	add	a2,s4,a3
	add	a2,s10,a2
	sb	a6,0(a2)
	addi	a3,a3,1
	blt	a3,a5,.L172
	add	s4,a5,s4
	mv	s7,a0
	add	s2,s10,s4
	beq	s6,zero,.L77
.L171:
	addi	a2,s0,-1
	ble	s0,zero,.L224
	add	a5,s0,s4
	add	a5,s10,a5
	li	a3,32
.L173:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	a5,s2,.L173
	addi	s4,s4,1
	add	s4,s4,a2
	mv	s7,a0
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L333:
	lbu	a3,0(a2)
	li	t3,5
	j	.L24
.L342:
	lhu	a1,0(s7)
	li	a7,0
	addi	s7,s7,4
	j	.L118
.L351:
	lhu	t3,0(s7)
	li	a7,0
	addi	s7,s7,4
	j	.L80
.L338:
	lh	t4,0(s7)
	addi	s7,s7,4
	srai	t3,t4,31
	j	.L36
.L219:
	lla	a1,.LC2
	li	a5,0
	j	.L163
.L349:
	lla	a1,.LC3+1
	mv	a5,a1
.L154:
	lbu	a3,0(a5)
	mv	a2,a5
	addi	a5,a5,1
	bne	a3,zero,.L154
	lla	a5,.LC3
	sub	a2,a2,a5
	addi	a2,a2,-1
	add	a1,a1,a2
.L155:
	lbu	a3,0(a5)
	addi	a5,a5,1
	addi	s2,s2,1
	sb	a3,-1(s2)
	bne	a5,a1,.L155
	addi	s4,s4,1
	add	s4,a2,s4
	mv	s7,a6
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L356:
	addi	a2,s0,-1
	li	a3,32
	ble	s0,zero,.L322
.L87:
	add	a5,s2,s0
.L112:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a5,.L112
	addi	s4,s4,1
	add	s4,s4,a2
	sub	s0,a2,s0
	add	s2,s10,s4
	addi	s11,sp,32
	bne	s3,zero,.L108
	addi	s1,s1,1
	j	.L336
.L188:
	addi	a6,s0,-1
	ble	s0,zero,.L220
.L184:
	add	a2,s2,s0
	li	a3,32
.L168:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	s2,a2,.L168
	addi	s4,s4,1
	add	s4,a6,s4
	sub	s0,a6,s0
	bne	a5,zero,.L170
.L222:
	mv	s7,a0
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L196:
	li	t5,0
.L43:
	beq	a7,zero,.L66
	addi	a5,t5,64
	addi	a3,sp,32
	add	a5,a5,a3
	li	a3,43
	addi	t5,t5,1
	sb	a3,-64(a5)
	j	.L65
.L189:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 27
	sb	zero,0(s10)
	lw	ra,156(sp)
	.cfi_restore 1
	li	s4,0
	lw	s10,112(sp)
	.cfi_restore 26
	mv	a0,s4
	lw	s4,136(sp)
	.cfi_restore 20
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L358:
	.cfi_def_cfa_offset 160
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
	sub	s0,s0,a5
	beq	s6,zero,.L188
	bne	a5,zero,.L170
	j	.L171
.L341:
	snez	a5,t4
	neg	t3,t3
	sub	t3,t3,a5
	neg	t4,t4
	li	a1,1
.L42:
	li	t5,0
	sw	s6,0(sp)
	sw	s1,16(sp)
	sw	s0,20(sp)
	sw	s2,28(sp)
	addi	s11,sp,32
	sw	a7,4(sp)
	sw	t6,8(sp)
	sw	a6,12(sp)
	mv	s6,a1
	sw	s3,24(sp)
	mv	s0,t5
	mv	s1,t4
	mv	s2,t3
.L60:
	li	a2,10
	li	a3,0
	mv	a0,s1
	mv	a1,s2
	call	__moddi3
	addi	s0,s0,1
	addi	a5,a0,48
	add	s3,s11,s0
	mv	a0,s1
	mv	a1,s2
	sb	a5,-1(s3)
	li	a2,10
	li	a3,0
	call	__divdi3
	or	a5,a1,a0
	mv	s1,a0
	mv	s2,a1
	li	a4,37
	li	t1,16
	bne	a5,zero,.L60
	lw	s3,24(sp)
	mv	t5,s0
	mv	a1,s6
	lw	a7,4(sp)
	lw	t6,8(sp)
	lw	a6,12(sp)
	lw	s6,0(sp)
	lw	s1,16(sp)
	lw	s0,20(sp)
	lw	s2,28(sp)
	bgt	s3,t5,.L44
	j	.L45
.L347:
	mv	a5,s4
	ble	a1,zero,.L176
	addi	a5,s10,-1
	add	a5,a5,s4
	add	a5,a5,s0
	li	a3,32
.L178:
	sb	a3,0(s2)
	addi	s2,s2,1
	bne	a5,s2,.L178
	addi	a5,s4,1
	add	a5,a5,a6
.L176:
	addi	s4,a5,1
	add	a5,s10,a5
	sb	a2,0(a5)
	add	s2,s10,s4
	addi	s1,s1,1
	j	.L336
.L202:
	addi	s11,sp,32
	li	t4,0
	sw	s1,4(sp)
	sw	s3,12(sp)
	sw	s4,16(sp)
	sw	a6,0(sp)
	mv	s4,s11
	sw	s0,8(sp)
	mv	s11,s2
	mv	s1,t4
	sw	s5,20(sp)
	mv	s3,a7
	mv	s2,t3
.L287:
	li	a2,10
	li	a3,0
	mv	a0,s2
	mv	a1,s3
	call	__umoddi3
	addi	s1,s1,1
	addi	a5,a0,48
	add	s0,s4,s1
	mv	a0,s2
	mv	a1,s3
	sb	a5,-1(s0)
	li	a2,10
	li	a3,0
	call	__udivdi3
	mv	s5,s3
	mv	s0,s2
	mv	s3,a1
	mv	s2,a0
	li	a4,37
	li	t1,16
	bne	s5,zero,.L287
	li	a5,9
	bgtu	s0,a5,.L287
	mv	t4,s1
	lw	a6,0(sp)
	lw	s0,8(sp)
	lw	s3,12(sp)
	lw	s1,4(sp)
	lw	s4,16(sp)
	lw	s5,20(sp)
	mv	s2,s11
	j	.L105
.L207:
	li	t3,0
	addi	s11,sp,32
.L123:
	andi	a5,a1,15
	add	a5,t6,a5
	lbu	a2,0(a5)
	slli	t5,a7,28
	addi	t3,t3,1
	srli	a1,a1,4
	add	a5,s11,t3
	or	a1,t5,a1
	srli	a7,a7,4
	sb	a2,-1(a5)
	or	a5,a1,a7
	bne	a5,zero,.L123
	j	.L131
.L182:
	li	a5,32
	bne	a6,zero,.L359
.L69:
	addi	a3,s0,-1
	ble	s0,zero,.L200
	add	s0,s2,s0
.L71:
	sb	a5,0(s2)
	addi	s2,s2,1
	bne	s0,s2,.L71
	addi	s4,s4,1
	add	s4,a3,s4
	li	s0,-1
	add	s2,s10,s4
	bne	t5,zero,.L75
.L365:
	addi	s1,s1,1
	j	.L336
.L66:
	bne	t6,zero,.L360
	sub	s0,s0,t5
	beq	s6,zero,.L182
	beq	t5,zero,.L76
	j	.L75
.L352:
	lbu	t3,0(s7)
	li	a7,0
	addi	s7,s7,4
	j	.L80
.L343:
	lbu	a1,0(s7)
	li	a7,0
	addi	s7,s7,4
	j	.L118
.L339:
	lbu	t4,0(s7)
	li	t3,0
	addi	s7,s7,4
	j	.L38
.L354:
	bne	s6,zero,.L86
	addi	a2,s0,-1
	li	a3,32
	bgt	s0,zero,.L87
	addi	s1,s1,1
	j	.L336
.L345:
	bne	s6,zero,.L125
	addi	t3,s0,-1
	mv	a7,t3
	beq	a6,zero,.L361
	beq	a0,zero,.L143
.L127:
	li	s3,0
	addi	s11,sp,32
	ble	s0,zero,.L77
.L147:
	add	a1,s11,s0
	add	a3,s11,s3
	li	a0,32
	add	a1,a1,s3
.L148:
	sb	a0,0(a3)
	addi	a3,a3,1
	sub	a5,a1,a3
	bgt	a5,zero,.L148
	addi	s3,s3,1
	add	s3,t3,s3
	sub	s0,a7,s0
	j	.L133
.L350:
	addi	a7,a2,-1
	ble	a2,zero,.L216
	add	a2,s2,a2
	li	a1,32
.L158:
	sb	a1,0(s2)
	addi	s2,s2,1
	bne	a2,s2,.L158
	addi	s4,s4,1
	add	s4,s4,a7
	li	a2,-1
	add	s2,s10,s4
	j	.L157
.L359:
	srai	a5,s3,31
	andi	a5,a5,16
	addi	a5,a5,32
	j	.L69
.L360:
	addi	a5,t5,64
	addi	a3,sp,32
	add	a5,a5,a3
	li	a3,32
	addi	t5,t5,1
	sb	a3,-64(a5)
	j	.L65
.L208:
	mv	s3,t3
	mv	s0,t5
.L135:
	bne	a0,zero,.L186
.L314:
	addi	t3,s0,-1
	bgt	s0,zero,.L147
	mv	s0,a7
	j	.L133
.L348:
	mv	s4,a0
	mv	s2,a5
	addi	s1,s1,1
	j	.L336
.L357:
	bne	s6,zero,.L171
	addi	a6,s0,-1
	li	a5,0
	bgt	s0,zero,.L184
.L224:
	mv	s7,a0
	addi	s1,s1,1
	j	.L336
.L109:
	bge	s3,zero,.L305
	addi	a2,s0,-1
	mv	s3,t4
	li	a3,48
	bgt	s0,zero,.L87
.L322:
	mv	s0,a2
	j	.L108
.L216:
	mv	a2,a7
	j	.L157
.L337:
	mv	a1,a5
	li	s3,0
	j	.L18
.L143:
	ble	s0,zero,.L215
	addi	s11,sp,32
	addi	t3,s0,-1
	j	.L147
.L340:
	addi	s7,s7,7
	andi	s7,s7,-8
	lw	t4,0(s7)
	lw	t3,4(s7)
	addi	s7,s7,8
	j	.L36
.L344:
	addi	s7,s7,7
	andi	s7,s7,-8
	lw	a1,0(s7)
	lw	a7,4(s7)
	addi	s7,s7,8
	j	.L118
.L353:
	addi	s7,s7,7
	andi	s7,s7,-8
	lw	t3,0(s7)
	lw	a7,4(s7)
	addi	s7,s7,8
	j	.L80
.L355:
	sub	s0,s0,t4
	beq	s6,zero,.L185
	mv	s3,t4
	j	.L108
.L346:
	sub	t5,s0,t3
	bne	s6,zero,.L362
	addi	a7,t5,-1
	beq	a6,zero,.L208
	blt	s3,zero,.L363
	mv	s3,t3
	mv	s0,t5
	j	.L134
.L363:
	add	s0,s11,s0
	li	a1,48
	ble	t5,zero,.L364
.L138:
	sb	a1,0(a2)
	addi	a2,a2,1
	bne	s0,a2,.L138
	addi	t3,t3,1
	add	s3,t3,a7
	beq	a0,zero,.L211
	beq	s3,zero,.L77
	li	s0,-1
.L137:
	beq	t4,zero,.L133
	li	a2,120
	beq	a3,a2,.L142
	li	a3,88
.L142:
	addi	a5,s3,64
	addi	a1,sp,32
	add	a1,a5,a1
	sb	a3,-64(a1)
	addi	a5,s3,65
	addi	a3,sp,32
	add	a3,a5,a3
	li	a2,48
	addi	s3,s3,2
	sb	a2,-64(a3)
	j	.L133
.L211:
	li	s0,-1
.L139:
	addi	s11,sp,32
	bne	s3,zero,.L133
	addi	s1,s1,1
	j	.L336
.L195:
	li	a1,0
	j	.L42
.L362:
	mv	s0,t5
	mv	s3,t3
	j	.L133
.L220:
	mv	s0,a6
	bne	a5,zero,.L170
	j	.L222
.L200:
	mv	s0,a3
	bne	t5,zero,.L75
	j	.L365
.L361:
	bne	a0,zero,.L127
	addi	s11,sp,32
	bgt	s0,zero,.L147
	addi	s1,s1,1
	j	.L336
.L364:
	mv	s0,a7
	mv	s3,t3
	bne	a0,zero,.L137
	j	.L133
.L215:
	mv	s0,a7
	j	.L139
.L185:
	bne	a6,zero,.L109
.L305:
	addi	a2,s0,-1
	mv	s3,t4
	li	a3,32
	bgt	s0,zero,.L87
	mv	s0,a2
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
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	addi	t1,sp,40
	sw	a2,40(sp)
	mv	a2,t1
	sw	ra,28(sp)
	.cfi_offset 1, -36
	sw	a3,44(sp)
	sw	a4,48(sp)
	sw	a5,52(sp)
	sw	a6,56(sp)
	sw	a7,60(sp)
	sw	t1,12(sp)
	call	vsprintf
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,64
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
	beq	a1,zero,.L700
	addi	sp,sp,-176
	.cfi_def_cfa_offset 176
	sw	s10,128(sp)
	sw	ra,172(sp)
	li	a5,1
	.cfi_offset 26, -48
	.cfi_offset 1, -4
	mv	s10,a0
	beq	a1,a5,.L370
	sw	s0,168(sp)
	sw	s3,156(sp)
	sw	s5,148(sp)
	sw	s7,140(sp)
	sw	s8,136(sp)
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	mv	s8,a3
	lbu	a3,0(a2)
	mv	s7,a2
	addi	s5,a1,-1
	li	a4,0
	li	s3,0
	li	s0,0
	beq	a3,zero,.L372
	sw	s6,144(sp)
	sw	s9,132(sp)
	sw	s1,164(sp)
	sw	s2,160(sp)
	sw	s4,152(sp)
	sw	s11,124(sp)
	.cfi_offset 22, -32
	.cfi_offset 25, -44
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 27, -52
	li	a6,37
	li	t4,16
	lla	s9,.L382
	mv	s6,a4
.L371:
	mv	s2,s0
	addi	a5,s3,1
	beq	a3,a6,.L708
	addi	s6,s6,1
	bgeu	s0,s5,.L376
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L376:
	mv	s3,a5
.L377:
	add	a5,s7,s3
	lbu	a3,0(a5)
	bne	a3,zero,.L371
	mv	a4,s6
	bleu	s2,s5,.L573
	mv	s2,s5
.L573:
	add	s10,s10,s2
	lw	s1,164(sp)
	.cfi_restore 9
	lw	s2,160(sp)
	.cfi_restore 18
	lw	s4,152(sp)
	.cfi_restore 20
	lw	s6,144(sp)
	.cfi_restore 22
	lw	s9,132(sp)
	.cfi_restore 25
	lw	s11,124(sp)
	.cfi_restore 27
.L372:
	sb	zero,0(s10)
	lw	s0,168(sp)
	.cfi_restore 8
	lw	ra,172(sp)
	.cfi_restore 1
	lw	s3,156(sp)
	.cfi_restore 19
	lw	s5,148(sp)
	.cfi_restore 21
	lw	s7,140(sp)
	.cfi_restore 23
	lw	s8,136(sp)
	.cfi_restore 24
	lw	s10,128(sp)
	.cfi_restore 26
	mv	a0,a4
	addi	sp,sp,176
	.cfi_def_cfa_offset 0
	jr	ra
.L708:
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
	add	a5,s7,a5
	addi	a2,s3,2
	li	a4,0
	li	a0,0
	li	a7,0
	li	t1,0
	li	s11,0
.L375:
	lbu	a3,0(a5)
	mv	t3,a5
	addi	a1,a3,-32
	andi	a1,a1,0xff
	bgtu	a1,t4,.L381
	slli	a1,a1,2
	add	a1,a1,s9
	lw	a1,0(a1)
	add	a1,a1,s9
	jr	a1
	.section	.rodata.vsnprintf,"a",@progbits
	.align	2
	.align	2
.L382:
	.word	.L582-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L378-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L384-.L382
	.word	.L381-.L382
	.word	.L383-.L382
	.word	.L381-.L382
	.word	.L381-.L382
	.word	.L380-.L382
	.section	.text.vsnprintf
.L381:
	li	a5,42
	bne	a3,a5,.L709
	lw	s1,0(s8)
	addi	s8,s8,4
	bge	s1,zero,.L388
	neg	s1,s1
	li	s11,1
.L388:
	add	t3,s7,a2
	lbu	a3,0(t3)
	mv	s3,a2
.L387:
	li	a5,46
	li	s4,-1
	beq	a3,a5,.L710
.L390:
	addi	a5,s3,1
	li	a1,104
	add	a2,s7,a5
	beq	a3,a1,.L711
.L395:
	li	a1,108
	beq	a3,a1,.L712
	li	a1,122
	beq	a3,a1,.L713
.L412:
	beq	a3,a6,.L397
	addi	a5,a3,-88
	andi	a5,a5,0xff
	li	a2,32
	bgtu	a5,a2,.L398
	lla	a2,.L576
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	add	a5,a5,a2
	jr	a5
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L576:
	.word	.L500-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L405-.L576
	.word	.L417-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L417-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L403-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L402-.L576
	.word	.L398-.L576
	.word	.L460-.L576
	.word	.L398-.L576
	.word	.L398-.L576
	.word	.L500-.L576
	.section	.text.vsnprintf
.L709:
	addi	a1,a3,-48
	andi	a5,a1,0xff
	li	t6,9
	addi	s3,a2,-1
	li	s1,0
	add	a2,s7,a2
	li	t5,9
	bgtu	a5,t6,.L387
	mv	a5,s1
.L389:
	lbu	a3,0(a2)
	slli	s1,a5,2
	add	s1,s1,a5
	slli	s1,s1,1
	add	a5,a1,s1
	addi	a1,a3,-48
	andi	t6,a1,0xff
	mv	t3,a2
	addi	s3,s3,1
	addi	a2,a2,1
	bleu	t6,t5,.L389
	mv	s1,a5
	li	a5,46
	li	s4,-1
	bne	a3,a5,.L390
.L710:
	addi	a5,s3,1
	add	t3,s7,a5
	lbu	a3,0(t3)
	li	a2,42
	bne	a3,a2,.L714
	lw	s4,0(s8)
	addi	s8,s8,4
	blt	s4,zero,.L715
.L393:
	addi	s3,s3,2
	add	t3,s7,s3
	lbu	a3,0(t3)
	addi	a5,s3,1
	li	a1,104
	add	a2,s7,a5
	bne	a3,a1,.L395
.L711:
	lbu	a3,0(a2)
	beq	a3,a1,.L716
	li	a1,37
	beq	a3,a1,.L619
	addi	a1,a3,-88
	andi	a1,a1,0xff
	li	t3,32
	bgtu	a1,t3,.L621
	lla	t3,.L574
	slli	a1,a1,2
	add	a1,a1,t3
	lw	a1,0(a1)
	add	a1,a1,t3
	jr	a1
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L574:
	.word	.L497-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L622-.L574
	.word	.L416-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L416-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L623-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L624-.L574
	.word	.L621-.L574
	.word	.L458-.L574
	.word	.L621-.L574
	.word	.L621-.L574
	.word	.L497-.L574
	.section	.text.vsnprintf
.L621:
	mv	s3,a5
	mv	t3,a2
.L398:
	addi	s6,s6,2
	bgeu	s0,s5,.L453
	add	a5,s10,s0
	li	a4,37
	sb	a4,0(a5)
	addi	s2,s0,1
	bgeu	s2,s5,.L612
	lbu	a5,0(t3)
	add	s2,s10,s2
	addi	s0,s0,2
	sb	a5,0(s2)
	mv	s2,s0
.L453:
	addi	s3,s3,1
	j	.L377
.L712:
	lbu	a3,0(a2)
	beq	a3,a1,.L717
	li	a1,37
	beq	a3,a1,.L619
	addi	a1,a3,-88
	andi	a1,a1,0xff
	li	t3,32
	bgtu	a1,t3,.L621
	lla	t3,.L575
	slli	a1,a1,2
	add	a1,a1,t3
	lw	a1,0(a1)
	add	a1,a1,t3
	jr	a1
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L575:
	.word	.L499-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L622-.L575
	.word	.L413-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L413-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L623-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L624-.L575
	.word	.L621-.L575
	.word	.L459-.L575
	.word	.L621-.L575
	.word	.L621-.L575
	.word	.L499-.L575
	.section	.text.vsnprintf
.L713:
	lbu	a3,0(a2)
	mv	t3,a2
	mv	s3,a5
	j	.L412
.L380:
	li	a4,1
.L379:
	addi	a5,a5,1
	addi	a2,a2,1
	j	.L375
.L378:
	li	a0,1
	j	.L379
.L582:
	li	a7,1
	j	.L379
.L383:
	li	s11,1
	j	.L379
.L384:
	li	t1,1
	j	.L379
.L715:
	li	s4,-1
	j	.L393
.L717:
	addi	s3,s3,2
	add	t3,s7,s3
	lbu	a3,0(t3)
	li	a5,37
	beq	a3,a5,.L397
	addi	a5,a3,-88
	andi	a5,a5,0xff
	li	a2,32
	bgtu	a5,a2,.L398
	lla	a2,.L409
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	add	a5,a5,a2
	jr	a5
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L409:
	.word	.L408-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L405-.L409
	.word	.L411-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L411-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L403-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L402-.L409
	.word	.L398-.L409
	.word	.L410-.L409
	.word	.L398-.L409
	.word	.L398-.L409
	.word	.L408-.L409
	.section	.text.vsnprintf
.L417:
	lw	t3,0(s8)
	addi	a2,s8,4
	srai	s8,t3,31
.L414:
	blt	s8,zero,.L718
.L415:
	or	a5,t3,s8
	bne	a5,zero,.L584
	beq	s4,zero,.L585
	li	a5,48
	sb	a5,48(sp)
	li	t5,1
	li	a1,0
	addi	a5,sp,48
	ble	s4,t5,.L587
.L421:
	mv	a3,t5
	li	t3,48
.L439:
	addi	a3,a3,1
	add	a0,a5,a3
	sb	t3,-1(a0)
	bgt	s4,a3,.L439
	addi	a3,t5,1
	li	a5,0
	ble	s4,t5,.L441
	addi	a5,s4,-1
	sub	a5,a5,t5
.L441:
	add	t5,a5,a3
.L422:
	beq	a1,zero,.L587
	addi	a3,sp,48
	addi	a5,t5,64
	add	a5,a5,a3
	li	a1,45
	addi	a3,t5,1
	sb	a1,-64(a5)
	mv	s8,a2
.L442:
	sub	a2,s1,a3
	bgt	a2,zero,.L444
	mv	s1,a3
.L444:
	add	s6,s6,s1
	beq	s11,zero,.L719
	beq	a3,zero,.L452
.L451:
	addi	a5,sp,48
	add	a4,a5,a3
.L454:
	mv	s2,s0
	bgeu	s0,s5,.L450
	lbu	a3,-1(a4)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L450:
	addi	a4,a4,-1
	bne	a5,a4,.L454
	beq	s11,zero,.L453
.L452:
	addi	a5,a2,-1
	ble	a2,zero,.L453
	li	a3,32
	li	a4,-1
.L456:
	mv	s2,s0
	bgeu	s0,s5,.L455
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L455:
	addi	a5,a5,-1
	bne	a5,a4,.L456
	addi	s3,s3,1
	j	.L377
.L416:
	lh	t3,0(s8)
	addi	a2,s8,4
	mv	s3,a5
	srai	s8,t3,31
	j	.L414
.L497:
	lhu	a2,0(s8)
	li	a1,0
	mv	s3,a5
	addi	s8,s8,4
.L498:
	li	a5,120
	lla	t5,.LC1
	bne	a3,a5,.L501
	lla	t5,.LC0
.L501:
	or	t3,a2,a1
	bne	t3,zero,.L596
	beq	s4,zero,.L720
	li	a5,48
	sb	a5,48(sp)
	li	t1,1
.L510:
	addi	a5,sp,48
	add	a2,a5,t1
	add	a7,a5,s4
	li	a1,48
	bge	t1,s4,.L721
.L511:
	sb	a1,0(a2)
	addi	a2,a2,1
	bne	a7,a2,.L511
	sub	s1,s1,s4
	addi	a1,s1,-1
	beq	s11,zero,.L512
	ble	s1,zero,.L703
.L738:
	add	a4,s4,s1
	add	s6,s6,a4
.L517:
	add	s4,a5,s4
.L529:
	mv	s2,s0
	bgeu	s0,s5,.L528
	lbu	a4,-1(s4)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a4,0(s2)
	mv	s2,s0
.L528:
	addi	s4,s4,-1
	bne	a5,s4,.L529
.L527:
	beq	s11,zero,.L453
	addi	a5,s1,-1
	ble	s1,zero,.L453
	li	a3,32
	li	a4,-1
.L532:
	mv	s2,s0
	bgeu	s0,s5,.L531
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L531:
	addi	a5,a5,-1
	bne	a5,a4,.L532
	addi	s3,s3,1
	j	.L377
.L623:
	mv	s3,a5
.L403:
	lw	a3,0(s8)
	addi	a0,s8,4
	beq	a3,zero,.L722
	li	a2,0
	addi	a5,sp,48
	lla	a7,.LC0
.L537:
	andi	a4,a3,15
	add	a4,a7,a4
	lbu	t1,0(a4)
	mv	a4,a2
	addi	a2,a2,1
	add	a1,a5,a2
	sb	t1,-1(a1)
	srli	a3,a3,4
	bne	a3,zero,.L537
	addi	a3,a2,64
	addi	a2,sp,48
	add	a2,a3,a2
	li	a3,120
	sb	a3,-64(a2)
	addi	a7,sp,48
	addi	a3,a4,64
	add	a3,a3,a7
	addi	a2,a4,3
	li	a1,48
	sb	a1,-62(a3)
	sub	a3,s1,a2
	ble	a3,zero,.L723
	add	s6,s6,s1
	beq	s11,zero,.L724
.L540:
	add	a5,a5,a4
	addi	a4,sp,45
.L544:
	mv	s2,s0
	bgeu	s0,s5,.L543
	lbu	a2,2(a5)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a2,0(s2)
	mv	s2,s0
.L543:
	addi	a5,a5,-1
	bne	a4,a5,.L544
	mv	s8,a0
	beq	s11,zero,.L453
	addi	a5,a3,-1
	ble	a3,zero,.L453
	li	a3,32
	li	a4,-1
.L546:
	mv	s2,s0
	bgeu	s0,s5,.L545
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L545:
	addi	a5,a5,-1
	bne	a5,a4,.L546
	mv	s8,a0
.L736:
	addi	s3,s3,1
	j	.L377
.L622:
	mv	s3,a5
.L405:
	neg	a5,s1
	addi	a4,s1,-1
	srai	a5,a5,31
	and	a5,a4,a5
	addi	a5,a5,1
	lw	a2,0(s8)
	add	s6,s6,a5
	addi	s8,s8,4
	beq	s11,zero,.L725
	bgeu	s0,s5,.L568
	add	s2,s10,s2
	addi	s0,s0,1
	sb	a2,0(s2)
	mv	s2,s0
.L568:
	addi	s1,s1,-2
	ble	a4,zero,.L453
	li	a4,32
	li	a5,-1
.L572:
	mv	s2,s0
	bgeu	s0,s5,.L571
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a4,0(s2)
	mv	s2,s0
.L571:
	addi	s1,s1,-1
	bne	s1,a5,.L572
	addi	s3,s3,1
	j	.L377
.L624:
	mv	s3,a5
.L402:
	lw	a3,0(s8)
	addi	a1,s8,4
	beq	a3,zero,.L605
	lbu	a5,0(a3)
	beq	a5,zero,.L726
	li	a5,0
.L550:
	beq	s4,a5,.L727
	addi	a5,a5,1
	add	a4,a3,a5
	lbu	a4,0(a4)
	bne	a4,zero,.L550
	sub	a2,s1,a5
	ble	a2,zero,.L551
	add	s6,s6,s1
	beq	s11,zero,.L548
.L552:
	li	a4,0
.L560:
	mv	s2,s0
	bgeu	s0,s5,.L559
	add	a0,a3,a4
	lbu	a0,0(a0)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a0,0(s2)
	mv	s2,s0
.L559:
	addi	a4,a4,1
	blt	a4,a5,.L560
	mv	s8,a1
	beq	s11,zero,.L453
	addi	s1,a2,-1
	ble	a2,zero,.L453
.L549:
	li	a4,32
	li	a5,-1
.L562:
	mv	s2,s0
	bgeu	s0,s5,.L561
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a4,0(s2)
	mv	s2,s0
.L561:
	addi	s1,s1,-1
	bne	s1,a5,.L562
	mv	s8,a1
.L735:
	addi	s3,s3,1
	j	.L377
.L460:
	lw	t1,0(s8)
	li	t3,0
	addi	s8,s8,4
.L457:
	or	a5,t1,t3
	bne	a5,zero,.L593
	beq	s4,zero,.L728
	li	a5,48
	sb	a5,48(sp)
	li	a7,1
.L483:
	addi	a5,sp,48
	add	a3,a5,a7
	li	a2,48
	add	a5,a5,s4
	ble	s4,a7,.L729
.L484:
	sb	a2,0(a3)
	addi	a3,a3,1
	bne	a5,a3,.L484
	sub	a3,s1,s4
	mv	a7,s4
.L467:
	bgt	a3,zero,.L485
	mv	s1,a7
.L485:
	add	s6,s6,s1
	beq	s11,zero,.L730
.L486:
	addi	a5,sp,48
	add	a4,a5,a7
.L494:
	mv	s2,s0
	bgeu	s0,s5,.L493
	lbu	a2,-1(a4)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a2,0(s2)
	mv	s2,s0
.L493:
	addi	a4,a4,-1
	bne	a5,a4,.L494
	beq	s11,zero,.L453
	addi	s1,a3,-1
	ble	a3,zero,.L453
.L580:
	li	a4,32
	li	a5,-1
.L496:
	mv	s2,s0
	bgeu	s0,s5,.L495
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a4,0(s2)
	mv	s2,s0
.L495:
	addi	s1,s1,-1
	bne	s1,a5,.L496
	addi	s3,s3,1
	j	.L377
.L458:
	lhu	t1,0(s8)
	li	t3,0
	mv	s3,a5
	addi	s8,s8,4
	j	.L457
.L714:
	addi	a1,a3,-48
	andi	t5,a1,0xff
	li	a2,9
	bgtu	t5,a2,.L731
	addi	a2,s3,2
	li	s4,0
	mv	s3,a5
	add	a2,s7,a2
	li	t5,9
	mv	a5,s4
.L394:
	lbu	a3,0(a2)
	slli	s4,a5,2
	add	s4,s4,a5
	slli	s4,s4,1
	add	a5,a1,s4
	addi	a1,a3,-48
	andi	t6,a1,0xff
	mv	t3,a2
	addi	s3,s3,1
	addi	a2,a2,1
	bleu	t6,t5,.L394
	mv	s4,a5
	j	.L390
.L619:
	mv	s3,a5
.L397:
	addi	s6,s6,1
	bgeu	s0,s5,.L453
	add	s2,s10,s2
	addi	s0,s0,1
	li	a5,37
	sb	a5,0(s2)
	addi	s3,s3,1
	mv	s2,s0
	j	.L377
.L370:
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
	.cfi_restore 27
	sb	zero,0(a0)
	lw	ra,172(sp)
	.cfi_restore 1
	li	a4,0
	lw	s10,128(sp)
	.cfi_restore 26
	mv	a0,a4
	addi	sp,sp,176
	.cfi_def_cfa_offset 0
	jr	ra
.L716:
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
	addi	s3,s3,2
	add	t3,s7,s3
	lbu	a3,0(t3)
	li	a5,37
	beq	a3,a5,.L397
	addi	a5,a3,-88
	andi	a5,a5,0xff
	li	a2,32
	bgtu	a5,a2,.L398
	lla	a2,.L400
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	add	a5,a5,a2
	jr	a5
	.section	.rodata.vsnprintf
	.align	2
	.align	2
.L400:
	.word	.L399-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L405-.L400
	.word	.L404-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L404-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L403-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L402-.L400
	.word	.L398-.L400
	.word	.L401-.L400
	.word	.L398-.L400
	.word	.L398-.L400
	.word	.L399-.L400
	.section	.text.vsnprintf
.L727:
	sub	a2,s1,s4
	ble	a2,zero,.L554
	add	s6,s6,s1
	beq	s11,zero,.L548
	bne	s4,zero,.L552
	addi	s1,a2,-1
	j	.L549
.L598:
	mv	s1,a7
	mv	s4,t1
.L512:
	bne	a0,zero,.L732
.L506:
	ble	s1,zero,.L733
.L519:
	addi	a5,sp,48
	add	a4,a5,s1
	add	a4,a4,s4
	add	a5,a5,s4
	li	a3,32
.L525:
	sb	a3,0(a5)
	addi	a5,a5,1
	bne	a5,a4,.L525
	addi	s4,s4,1
	add	s4,s4,a1
	sub	s1,a1,s1
.L520:
	mv	a5,s4
	ble	s1,zero,.L526
	add	a5,s4,s1
.L526:
	add	s6,s6,a5
	beq	s4,zero,.L453
	addi	a5,sp,48
	j	.L517
.L500:
	lw	a2,0(s8)
	li	a1,0
	addi	s8,s8,4
	j	.L498
.L721:
	sub	a7,s1,t1
	bne	s11,zero,.L734
	addi	a1,a7,-1
	beq	a4,zero,.L598
	bge	s4,zero,.L598
	ble	a7,zero,.L599
	add	s1,a5,s1
	li	a4,48
.L514:
	sb	a4,0(a2)
	addi	a2,a2,1
	bne	s1,a2,.L514
	addi	t1,t1,1
	add	s4,t1,a1
	li	s1,-1
.L513:
	beq	a0,zero,.L703
	beq	t3,zero,.L703
	li	a4,120
	beq	a3,a4,.L518
	li	a3,88
.L518:
	addi	a4,s4,1
	addi	a2,s4,64
	addi	a1,sp,48
	add	a2,a2,a1
	addi	a4,a4,64
	sb	a3,-64(a2)
	add	a4,a4,a1
	li	a3,48
	addi	s4,s4,2
	sb	a3,-64(a4)
.L703:
	add	s6,s6,s4
	j	.L517
.L724:
	addi	a3,a3,-1
	li	a7,32
	li	a1,-1
.L542:
	bgeu	s0,s5,.L541
	add	a2,s10,s0
	sb	a7,0(a2)
	addi	s0,s0,1
.L541:
	addi	a3,a3,-1
	bne	a3,a1,.L542
	j	.L540
.L607:
	mv	a2,s1
	li	a5,0
.L548:
	addi	a2,a2,-1
	li	a0,32
	li	a4,-1
.L556:
	mv	s2,s0
	bgeu	s0,s5,.L558
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a0,0(s2)
	mv	s2,s0
.L558:
	addi	a2,a2,-1
	bne	a2,a4,.L556
	bne	a5,zero,.L552
	mv	s8,a1
	j	.L735
.L413:
	lw	t3,0(s8)
	addi	a2,s8,4
	mv	s3,a5
	srai	s8,t3,31
	j	.L414
.L499:
	lw	a2,0(s8)
	li	a1,0
	mv	s3,a5
	addi	s8,s8,4
	j	.L498
.L732:
	beq	t3,zero,.L506
	li	a5,120
	beq	a3,a5,.L522
	li	a3,88
.L522:
	addi	a4,s4,64
	addi	a2,sp,48
	add	a4,a4,a2
	addi	a5,s4,65
	sb	a3,-64(a4)
	add	a5,a5,a2
	li	a4,48
	sb	a4,-64(a5)
	addi	s4,s4,2
	bgt	s1,zero,.L519
	ble	a1,zero,.L523
	add	a5,s4,a1
	add	s6,s6,a5
	mv	s1,a1
	mv	a5,a2
	j	.L517
.L404:
	lbu	t3,0(s8)
	addi	a2,s8,4
	li	s8,0
	j	.L415
.L399:
	lbu	a2,0(s8)
	li	a1,0
	addi	s8,s8,4
	j	.L498
.L726:
	mv	s8,a1
	ble	s1,zero,.L453
	add	s6,s6,s1
	beq	s11,zero,.L607
	addi	s1,s1,-1
	j	.L549
.L408:
	addi	s8,s8,7
	andi	s8,s8,-8
	lw	a2,0(s8)
	lw	a1,4(s8)
	addi	s8,s8,8
	j	.L498
.L411:
	addi	a2,s8,7
	andi	a2,a2,-8
	lw	t3,0(a2)
	lw	s8,4(a2)
	addi	a2,a2,8
	j	.L414
.L459:
	lw	t1,0(s8)
	li	t3,0
	mv	s3,a5
	addi	s8,s8,4
	j	.L457
.L401:
	lbu	t1,0(s8)
	li	t3,0
	addi	s8,s8,4
	j	.L457
.L410:
	addi	s8,s8,7
	andi	s8,s8,-8
	lw	t1,0(s8)
	lw	t3,4(s8)
	addi	s8,s8,8
	j	.L457
.L700:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
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
	.cfi_restore 27
	li	a4,0
	mv	a0,a4
	ret
.L718:
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
	snez	a5,t3
	neg	s8,s8
	sub	s8,s8,a5
	neg	t3,t3
	li	a1,1
.L419:
	li	t5,0
	addi	a5,sp,48
	sw	s0,12(sp)
	sw	s11,20(sp)
	sw	s3,28(sp)
	sw	s1,32(sp)
	sw	s2,44(sp)
	mv	s3,s8
	sw	t1,16(sp)
	sw	a7,24(sp)
	mv	s11,a2
	sw	s4,36(sp)
	sw	a4,40(sp)
	mv	s1,t5
	mv	s2,t3
	mv	s8,a1
	mv	s0,a5
.L437:
	li	a2,10
	li	a3,0
	mv	a0,s2
	mv	a1,s3
	call	__moddi3
	addi	s1,s1,1
	addi	a4,a0,48
	add	s4,s0,s1
	mv	a0,s2
	mv	a1,s3
	sb	a4,-1(s4)
	li	a2,10
	li	a3,0
	call	__divdi3
	or	a4,a1,a0
	mv	s2,a0
	mv	s3,a1
	li	a6,37
	li	t4,16
	bne	a4,zero,.L437
	lw	s4,36(sp)
	mv	t5,s1
	mv	a2,s11
	mv	a5,s0
	lw	t1,16(sp)
	lw	a7,24(sp)
	lw	s3,28(sp)
	lw	s11,20(sp)
	lw	a4,40(sp)
	lw	s1,32(sp)
	lw	s2,44(sp)
	lw	s0,12(sp)
	mv	a1,s8
	bgt	s4,t5,.L421
	j	.L422
.L722:
	lla	a2,.LC3+1
	mv	a4,a2
	li	a5,0
.L534:
	lbu	a3,0(a4)
	mv	a1,a5
	addi	a4,a4,1
	addi	a5,a5,1
	bne	a3,zero,.L534
	add	s6,s6,a5
	add	a4,a2,a1
	lla	a5,.LC3
.L536:
	mv	s2,s0
	bgeu	s0,s5,.L535
	lbu	a3,0(a5)
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L535:
	addi	a5,a5,1
	bne	a4,a5,.L536
	mv	s8,a0
	j	.L736
.L605:
	lla	a3,.LC2
	li	a5,0
	j	.L550
.L723:
	seqz	a1,s11
	add	s6,s6,a2
	sub	a3,a3,a1
	j	.L540
.L725:
	addi	s1,s1,-2
	li	a3,32
	li	a5,-1
	ble	a4,zero,.L566
.L565:
	mv	s2,s0
	bgeu	s0,s5,.L569
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a3,0(s2)
	mv	s2,s0
.L569:
	addi	s1,s1,-1
	bne	s1,a5,.L565
.L566:
	bgeu	s0,s5,.L453
	add	s2,s10,s2
	addi	s0,s0,1
	sb	a2,0(s2)
	addi	s3,s3,1
	mv	s2,s0
	j	.L377
.L593:
	li	a7,0
	addi	a5,sp,48
	sw	s0,12(sp)
	sw	s3,16(sp)
	sw	s1,20(sp)
	sw	s2,32(sp)
	sw	s4,24(sp)
	sw	a4,28(sp)
	mv	s0,a7
	sw	s5,36(sp)
	mv	s1,t1
	mv	s2,t3
	mv	s3,a5
.L677:
	li	a2,10
	li	a3,0
	mv	a0,s1
	mv	a1,s2
	call	__umoddi3
	addi	s0,s0,1
	addi	a4,a0,48
	add	s4,s3,s0
	mv	a0,s1
	mv	a1,s2
	sb	a4,-1(s4)
	li	a2,10
	li	a3,0
	call	__udivdi3
	mv	s5,s2
	mv	s4,s1
	mv	s2,a1
	mv	s1,a0
	li	a6,37
	li	t4,16
	bne	s5,zero,.L677
	li	a5,9
	bgtu	s4,a5,.L677
	mv	a7,s0
	lw	s3,16(sp)
	lw	s1,20(sp)
	lw	s4,24(sp)
	lw	a4,28(sp)
	lw	s0,12(sp)
	lw	s2,32(sp)
	lw	s5,36(sp)
	j	.L483
.L596:
	li	t1,0
	addi	a5,sp,48
.L502:
	andi	a7,a2,15
	add	a7,t5,a7
	lbu	t6,0(a7)
	slli	t0,a1,28
	addi	t1,t1,1
	srli	a2,a2,4
	add	a7,a5,t1
	or	a2,t0,a2
	srli	a1,a1,4
	sb	t6,-1(a7)
	or	a7,a2,a1
	bne	a7,zero,.L502
	j	.L510
.L719:
	li	a1,32
	beq	a4,zero,.L446
	srai	a1,s4,31
	andi	a1,a1,16
	addi	a1,a1,32
.L446:
	addi	a5,a2,-1
	ble	a2,zero,.L592
	mv	a2,a5
	li	a5,-1
.L449:
	mv	s2,s0
	bgeu	s0,s5,.L448
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a1,0(s2)
	mv	s2,s0
.L448:
	addi	a2,a2,-1
	bne	a2,a5,.L449
	bne	a3,zero,.L451
.L739:
	addi	s3,s3,1
	j	.L377
.L587:
	mv	s8,a2
.L420:
	beq	t1,zero,.L443
	addi	a3,sp,48
	addi	a5,t5,64
	add	a5,a5,a3
	li	a2,43
	addi	a3,t5,1
	sb	a2,-64(a5)
	j	.L442
.L443:
	mv	a3,t5
	beq	a7,zero,.L442
	addi	a5,t5,64
	addi	a2,sp,48
	add	t5,a5,a2
	li	a5,32
	addi	a3,a3,1
	sb	a5,-64(t5)
	j	.L442
.L551:
	seqz	a4,s11
	add	s6,s6,a5
	sub	a2,a2,a4
	j	.L552
.L730:
	bne	a4,zero,.L487
.L489:
	mv	s1,a3
	li	a4,32
.L488:
	addi	a3,s1,-1
	ble	s1,zero,.L490
	li	a5,-1
.L492:
	mv	s2,s0
	bgeu	s0,s5,.L491
	add	s2,s10,s0
	addi	s0,s0,1
	sb	a4,0(s2)
	mv	s2,s0
.L491:
	addi	a3,a3,-1
	bne	a3,a5,.L492
.L490:
	bne	a7,zero,.L486
	addi	s3,s3,1
	j	.L377
.L728:
	ble	s1,zero,.L463
	add	s6,s6,s1
	beq	s11,zero,.L464
	addi	s1,s1,-1
	j	.L580
.L720:
	bne	s11,zero,.L504
	addi	a1,s1,-1
	beq	a0,zero,.L506
	bgt	s1,zero,.L519
	addi	s3,s3,1
	j	.L377
.L585:
	li	t5,0
	mv	s8,a2
	j	.L420
.L554:
	add	s6,s6,s4
	beq	s11,zero,.L737
	bne	s4,zero,.L552
	mv	s8,a1
	j	.L735
.L731:
	mv	s3,a5
	li	s4,0
	j	.L390
.L487:
	bge	s4,zero,.L489
	mv	s1,a3
	li	a4,48
	j	.L488
.L504:
	ble	s1,zero,.L453
	add	s6,s6,s1
	j	.L527
.L729:
	sub	a3,s1,a7
	j	.L467
.L463:
	bne	s11,zero,.L453
.L464:
	bne	a4,zero,.L625
	mv	a3,s1
	li	a7,0
	j	.L489
.L584:
	li	a1,0
	j	.L419
.L734:
	mv	s1,a7
	mv	s4,t1
	bgt	s1,zero,.L738
	j	.L703
.L737:
	addi	a2,a2,-1
	bne	s4,zero,.L552
	mv	s8,a1
	j	.L735
.L592:
	mv	a2,a5
	bne	a3,zero,.L451
	j	.L739
.L625:
	li	a7,0
	li	a4,32
	j	.L488
.L733:
	mv	s1,a1
	j	.L520
.L599:
	mv	s1,a1
	mv	s4,t1
	j	.L513
.L523:
	add	s6,s6,s4
	mv	s1,a1
	addi	a5,sp,48
	j	.L517
.L612:
	mv	s0,s2
	addi	s3,s3,1
	j	.L377
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
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	li	t3,4096
	li	t0,-4096
	sw	s1,36(sp)
	sw	ra,44(sp)
	sw	s0,40(sp)
	li	t1,-4096
	add	sp,sp,t0
	.cfi_def_cfa_offset 4176
	.cfi_offset 9, -44
	.cfi_offset 1, -36
	.cfi_offset 8, -40
	addi	t4,t3,16
	add	t4,t4,t1
	addi	t1,sp,16
	addi	t5,sp,16
	add	t1,t4,t1
	addi	t4,t3,36
	sw	t1,12(sp)
	add	t4,t4,t5
	sw	a1,0(t4)
	addi	a1,t3,40
	add	a1,a1,t5
	sw	a2,0(a1)
	addi	a2,t3,44
	add	a2,a2,t5
	addi	t4,t3,48
	sw	a3,0(a2)
	add	t4,t4,t5
	addi	t1,t3,52
	mv	a2,a0
	lw	a0,12(sp)
	sw	a4,0(t4)
	mv	a4,t3
	addi	t3,t3,52
	add	t3,t3,t5
	sw	a5,0(t3)
	mv	a5,a4
	addi	a4,a4,56
	add	a4,a4,t5
	addi	a5,a5,60
	sw	a6,0(a4)
	add	a5,a5,t5
	sw	a7,0(a5)
	lw	a5,12(sp)
	add	t1,t1,sp
	mv	a3,t1
	li	a1,4096
	sw	t1,-4(a5)
	call	vsnprintf
	lw	a5,12(sp)
	mv	s1,a0
	lbu	a0,0(a5)
	beq	a0,zero,.L740
	addi	s0,a5,1
.L742:
	call	putch
	lbu	a0,0(s0)
	addi	s0,s0,1
	bne	a0,zero,.L742
.L740:
	li	t0,4096
	add	sp,sp,t0
	.cfi_def_cfa_offset 80
	lw	ra,44(sp)
	.cfi_restore 1
	mv	a0,s1
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	addi	sp,sp,80
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
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	addi	t1,sp,44
	sw	a3,44(sp)
	mv	a3,t1
	sw	ra,28(sp)
	.cfi_offset 1, -36
	sw	a4,48(sp)
	sw	a5,52(sp)
	sw	a6,56(sp)
	sw	a7,60(sp)
	sw	t1,12(sp)
	call	vsnprintf
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	snprintf, .-snprintf
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
