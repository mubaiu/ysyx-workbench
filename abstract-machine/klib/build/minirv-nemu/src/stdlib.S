#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"stdlib.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.rand,"ax",@progbits
	.align	2
	.globl	rand
	.hidden	rand
	.type	rand, @function
rand:
.LFB0:
	.cfi_startproc
	lla	a1,next
	lw	a3,0(a1)
	li	a2,12288
	addi	a2,a2,57
	slli	a4,a3,8
	sub	a4,a4,a3
	slli	a4,a4,3
	add	a4,a4,a3
	slli	a4,a4,7
	add	a4,a4,a3
	slli	a4,a4,3
	sub	a4,a4,a3
	slli	a5,a4,5
	add	a5,a4,a5
	slli	a5,a5,2
	sub	a5,a5,a3
	slli	a5,a5,2
	add	a5,a5,a3
	add	a5,a5,a2
	slli	a0,a5,1
	sw	a5,0(a1)
	srli	a0,a0,17
	ret
	.cfi_endproc
.LFE0:
	.size	rand, .-rand
	.section	.text.srand,"ax",@progbits
	.align	2
	.globl	srand
	.hidden	srand
	.type	srand, @function
srand:
.LFB1:
	.cfi_startproc
	la a5, next; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE1:
	.size	srand, .-srand
	.section	.text.abs,"ax",@progbits
	.align	2
	.globl	abs
	.hidden	abs
	.type	abs, @function
abs:
.LFB2:
	.cfi_startproc
	srai	a5,a0,31
	xor	a0,a5,a0
	sub	a0,a0,a5
	ret
	.cfi_endproc
.LFE2:
	.size	abs, .-abs
	.section	.text.atoi,"ax",@progbits
	.align	2
	.globl	atoi
	.hidden	atoi
	.type	atoi, @function
atoi:
.LFB3:
	.cfi_startproc
	lbu	a3,0(a0)
	li	a5,32
	mv	a4,a0
	bne	a3,a5,.L6
.L7:
	lbu	a3,1(a4)
	addi	a4,a4,1
	beq	a3,a5,.L7
.L6:
	addi	a5,a3,-48
	andi	a5,a5,0xff
	li	a2,9
	li	a0,0
	bgtu	a5,a2,.L10
.L9:
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a5,a5,1
	addi	a4,a4,1
	add	a5,a5,a3
	lbu	a3,0(a4)
	addi	a0,a5,-48
	addi	a5,a3,-48
	andi	a5,a5,0xff
	bleu	a5,a2,.L9
	ret
.L10:
	ret
	.cfi_endproc
.LFE3:
	.size	atoi, .-atoi
	.section	.rodata.malloc.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"Out of memory"
	.align	2
.LC2:
	.string	" @ /home/mubai/ysyx-workbench/abstract-machine/klib/src/stdlib.c:55  \n"
	.section	.text.malloc,"ax",@progbits
	.align	2
	.globl	malloc
	.hidden	malloc
	.type	malloc, @function
malloc:
.LFB4:
	.cfi_startproc
	lla	a3,addr.0
	lw	a4,0(a3)
	lla	a2,heap
	beq	a4,zero,.L26
.L14:
	addi	a5,a0,7
	andi	a5,a5,-8
	lw	a2,4(a2)
	add	a5,a4,a5
	sw	a5,0(a3)
	bgtu	a5,a2,.L27
	mv	a0,a4
	ret
.L26:
	lw	a4,0(a2)
	j	.L14
.L27:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,.LC0
	li	a0,65
.L16:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L16
	lla	s0,.LC1
	li	a0,79
.L17:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L17
	lla	s0,.LC2
	li	a0,32
.L18:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L18
	li	a0,1
	call	halt
	.cfi_endproc
.LFE4:
	.size	malloc, .-malloc
	.section	.text.free,"ax",@progbits
	.align	2
	.globl	free
	.hidden	free
	.type	free, @function
free:
.LFB5:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE5:
	.size	free, .-free
	.section	.sbss.addr.0,"aw",@nobits
	.align	2
	.type	addr.0, @object
	.size	addr.0, 4
addr.0:
	.zero	4
	.section	.sdata.next,"aw"
	.align	2
	.type	next, @object
	.size	next, 4
next:
	.word	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
