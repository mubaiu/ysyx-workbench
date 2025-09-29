#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"video.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.globl	__mulsi3
	.section	.rodata.redraw.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/am-kernels/tests/am-tests/src/tests/video.c"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text.redraw,"ax",@progbits
	.align	2
	.globl	redraw
	.hidden	redraw
	.type	redraw, @function
redraw:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-60
	.cfi_def_cfa_offset 60
	addi	a1,sp,24
	li	a0,9
	sw	ra,56(sp)
	sw	s0,52(sp)
	sw	s1,48(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	ioe_read
	lw	a5,28(sp)
	addi	a1,sp,24
	li	a0,9
	srai	s0,a5,31
	andi	s0,s0,31
	add	s0,s0,a5
	call	ioe_read
	lw	a4,32(sp)
	srai	s0,s0,5
	mv	a0,s0
	srai	a5,a4,31
	andi	a5,a5,31
	add	a5,a5,a4
	srai	a5,a5,5
	mv	a1,a5
	sw	a5,12(sp)
	call	__mulsi3
	li	a5,1024
	bgtu	a0,a5,.L2
	mv	t0,a0
	slli	a3,a0,2
	lla	a5,color_buf
	lla	a1,canvas+128
	add	s1,a5,a3
	li	a0,0
	sw	t0,20(sp)
.L3:
	mv	a5,s1
	addi	a2,a1,-128
	mv	s1,s0
	li	t1,0
	sw	a0,8(sp)
	sw	a1,16(sp)
	mv	s0,a5
.L9:
	lw	a5,20(sp)
	beq	a5,zero,.L7
	lw	a4,0(a2)
	lla	a5,color_buf
.L4:
	sw	a4,0(a5)
	addi	a5,a5,4
	bne	a5,s0,.L4
.L7:
	lw	a5,8(sp)
	addi	a1,sp,24
	li	a0,11
	sw	a5,28(sp)
	lla	a5,color_buf
	sw	a5,32(sp)
	lw	a5,12(sp)
	sw	a2,4(sp)
	sw	t1,24(sp)
	sw	t1,0(sp)
	sw	a5,40(sp)
	sw	s1,36(sp)
	sb	zero,44(sp)
	call	ioe_write
	lw	a2,4(sp)
	lw	t1,0(sp)
	lw	a5,16(sp)
	addi	a2,a2,4
	add	t1,t1,s1
	bne	a2,a5,.L9
	mv	a5,s0
	lw	a0,8(sp)
	mv	s0,s1
	mv	s1,a5
	lw	a5,12(sp)
	addi	a1,a2,128
	add	a0,a0,a5
	lla	a5,canvas+4224
	bne	a1,a5,.L3
	addi	a1,sp,24
	li	a5,1
	li	a0,11
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	zero,32(sp)
	sw	zero,36(sp)
	sw	zero,40(sp)
	sb	a5,44(sp)
	call	ioe_write
	lw	ra,56(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,52(sp)
	.cfi_restore 8
	lw	s1,48(sp)
	.cfi_restore 9
	addi	sp,sp,60
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	li	a2,22
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE4:
	.size	redraw, .-redraw
	.section	.text.update,"ax",@progbits
	.align	2
	.globl	update
	.hidden	update
	.type	update, @function
update:
.LFB6:
	.cfi_startproc
	lla	a5,tsc.2
	lw	a2,0(a5)
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	s0,24(sp)
	addi	a2,a2,1
	sw	s1,20(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	lla	a4,used+128
	lla	a3,used+4224
	sw	a2,16(sp)
	sw	a2,0(a5)
.L14:
	addi	a5,a4,-128
.L15:
	sw	zero,0(a5)
	addi	a5,a5,4
	bne	a4,a5,.L15
	addi	a4,a4,128
	bne	a3,a4,.L14
	lw	a2,16(sp)
	li	t1,0
	sw	zero,8(sp)
	andi	a3,a2,0xff
	slli	a5,a3,1
	add	a5,a3,a5
	slli	a4,a3,3
	sub	a4,a4,a3
	slli	a5,a5,1
	andi	a5,a5,0xff
	andi	a4,a4,0xff
	slli	a4,a4,8
	slli	a5,a5,16
	or	a5,a5,a4
	andi	a4,a2,255
	or	a5,a5,a4
	lla	a4,canvas
	sw	a5,0(a4)
	li	a5,1
	lla	a4,used
	sw	a5,0(a4)
	li	a2,1
	li	a3,0
	sw	zero,4(sp)
	lla	s1,dx.1
	lla	s0,dy.0
.L17:
	li	a0,4
	sw	a5,12(sp)
.L22:
	lw	a4,4(sp)
	lw	t0,8(sp)
	addi	a5,t1,1
	add	a3,a4,a3
	add	a2,t0,a2
	slli	a4,a3,5
	add	a4,a4,a2
	srai	a1,a5,31
	slli	a4,a4,2
	lla	t0,used
	add	t0,t0,a4
	srli	a1,a1,30
	sw	t0,0(sp)
	add	a5,a5,a1
	or	t0,a3,a2
	li	t2,31
	andi	a5,a5,3
	addi	a0,a0,-1
	bgtu	t0,t2,.L18
	lw	t0,0(sp)
	lw	t0,0(t0)
	beq	t0,zero,.L25
.L18:
	sub	t1,a5,a1
	slli	a5,t1,2
	add	a4,s1,a5
	add	a5,s0,a5
	beq	a0,zero,.L26
	lw	a3,0(a4)
	lw	a2,0(a5)
	j	.L22
.L26:
	lw	a5,12(sp)
	li	a4,1024
	addi	a5,a5,1
	beq	a5,a4,.L13
.L27:
	slli	a4,t1,2
	add	a3,s1,a4
	add	a4,s0,a4
	lw	a3,0(a3)
	lw	a2,0(a4)
	j	.L17
.L25:
	lw	a5,12(sp)
	lw	a0,16(sp)
	lw	t2,0(sp)
	srai	a1,a5,1
	add	a1,a1,a0
	sw	a1,0(sp)
	lbu	t0,0(sp)
	sw	a2,8(sp)
	sw	a3,4(sp)
	slli	a0,t0,1
	add	a0,t0,a0
	slli	a1,t0,3
	sub	a1,a1,t0
	slli	a0,a0,1
	andi	a0,a0,0xff
	andi	a1,a1,0xff
	slli	a0,a0,16
	slli	a1,a1,8
	or	a1,a0,a1
	lw	a0,0(sp)
	lla	t0,canvas
	add	a4,t0,a4
	andi	a0,a0,255
	or	a1,a1,a0
	li	a0,1
	sw	a1,0(a4)
	sw	a0,0(t2)
	addi	a5,a5,1
	li	a4,1024
	bne	a5,a4,.L27
.L13:
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	update, .-update
	.globl	__udivdi3
	.section	.rodata.video_test.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"%d: FPS = %d\n"
	.section	.text.video_test,"ax",@progbits
	.align	2
	.globl	video_test
	.hidden	video_test
	.type	video_test, @function
video_test:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-36
	.cfi_def_cfa_offset 36
	sw	s0,28(sp)
	.cfi_offset 8, -8
	addi	s0,sp,19
	sw	s1,24(sp)
	sw	ra,32(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	andi	s0,s0,-8
	sw	zero,4(sp)
	sw	zero,0(sp)
	li	s1,0
.L29:
	mv	a1,s0
	li	a0,6
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	sub	a5,a0,s1
	li	a4,33
	mv	a1,a0
	bgtu	a5,a4,.L33
.L30:
	lw	a5,0(sp)
	li	a4,1000
	sub	a5,a1,a5
	bleu	a5,a4,.L29
	lw	a2,4(sp)
	lla	a0,.LC2
	sw	a1,0(sp)
	call	printf
	sw	zero,4(sp)
	j	.L29
.L33:
	sw	a0,8(sp)
	call	update
	call	redraw
	lw	a5,4(sp)
	lw	a1,8(sp)
	addi	a5,a5,1
	sw	a5,4(sp)
	mv	s1,a1
	j	.L30
	.cfi_endproc
.LFE7:
	.size	video_test, .-video_test
	.section	.rodata.dy.0,"a"
	.align	2
	.type	dy.0, @object
	.size	dy.0, 16
dy.0:
	.word	1
	.word	0
	.word	-1
	.word	0
	.section	.rodata.dx.1,"a"
	.align	2
	.type	dx.1, @object
	.size	dx.1, 16
dx.1:
	.word	0
	.word	1
	.word	0
	.word	-1
	.section	.sbss.tsc.2,"aw",@nobits
	.align	2
	.type	tsc.2, @object
	.size	tsc.2, 4
tsc.2:
	.zero	4
	.section	.bss.color_buf,"aw",@nobits
	.align	2
	.type	color_buf, @object
	.size	color_buf, 4096
color_buf:
	.zero	4096
	.section	.bss.used,"aw",@nobits
	.align	2
	.type	used, @object
	.size	used, 4096
used:
	.zero	4096
	.section	.bss.canvas,"aw",@nobits
	.align	2
	.type	canvas, @object
	.size	canvas, 4096
canvas:
	.zero	4096
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
