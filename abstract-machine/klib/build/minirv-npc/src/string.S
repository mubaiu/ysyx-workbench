#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"string.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.strlen,"ax",@progbits
	.align	2
	.globl	strlen
	.hidden	strlen
	.type	strlen, @function
strlen:
.LFB0:
	.cfi_startproc
	lbu	a5,0(a0)
	beq	a5,zero,.L4
	mv	a5,a0
.L3:
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L3
	sub	a0,a5,a0
	ret
.L4:
	li	a0,0
	ret
	.cfi_endproc
.LFE0:
	.size	strlen, .-strlen
	.section	.text.strcpy,"ax",@progbits
	.align	2
	.globl	strcpy
	.hidden	strcpy
	.type	strcpy, @function
strcpy:
.LFB1:
	.cfi_startproc
	mv	a5,a0
.L8:
	lbu	a4,0(a1)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a5)
	bne	a4,zero,.L8
	ret
	.cfi_endproc
.LFE1:
	.size	strcpy, .-strcpy
	.section	.text.strncpy,"ax",@progbits
	.align	2
	.globl	strncpy
	.hidden	strncpy
	.type	strncpy, @function
strncpy:
.LFB2:
	.cfi_startproc
	mv	a4,a0
	li	a5,0
	mv	t1,a0
	bne	a2,zero,.L13
	j	.L12
.L14:
	sb	a3,0(a4)
	addi	a4,t1,1
	beq	a2,a5,.L17
.L13:
	add	a3,a1,a5
	lbu	a3,0(a3)
	addi	a5,a5,1
	mv	t1,a4
	bne	a3,zero,.L14
.L12:
	sb	zero,0(t1)
	ret
.L17:
	add	t1,a0,a2
	sb	zero,0(t1)
	ret
	.cfi_endproc
.LFE2:
	.size	strncpy, .-strncpy
	.section	.text.strcat,"ax",@progbits
	.align	2
	.globl	strcat
	.hidden	strcat
	.type	strcat, @function
strcat:
.LFB3:
	.cfi_startproc
	lbu	a5,0(a0)
	beq	a5,zero,.L22
	mv	a5,a0
.L20:
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L20
.L21:
	lbu	a4,0(a1)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a5)
	bne	a4,zero,.L21
	ret
.L22:
	lbu	a4,0(a1)
	mv	a5,a0
	addi	a5,a5,1
	sb	a4,-1(a5)
	addi	a1,a1,1
	bne	a4,zero,.L21
	ret
	.cfi_endproc
.LFE3:
	.size	strcat, .-strcat
	.section	.text.strcmp,"ax",@progbits
	.align	2
	.globl	strcmp
	.hidden	strcmp
	.type	strcmp, @function
strcmp:
.LFB4:
	.cfi_startproc
	lbu	a5,0(a0)
	bne	a5,zero,.L26
	j	.L31
.L28:
	lbu	a5,0(a0)
	beq	a5,zero,.L32
	mv	a1,a3
.L26:
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a3,a1,1
	beq	a4,a5,.L28
.L27:
	sub	a0,a5,a4
	ret
.L32:
	lbu	a4,1(a1)
	sub	a0,a5,a4
	ret
.L31:
	lbu	a4,0(a1)
	j	.L27
	.cfi_endproc
.LFE4:
	.size	strcmp, .-strcmp
	.section	.text.strncmp,"ax",@progbits
	.align	2
	.globl	strncmp
	.hidden	strncmp
	.type	strncmp, @function
strncmp:
.LFB5:
	.cfi_startproc
	beq	a2,zero,.L38
.L45:
	lbu	a5,0(a0)
	addi	a2,a2,-1
	beq	a5,zero,.L36
	lbu	a4,0(a1)
	bne	a4,a5,.L36
	addi	a0,a0,1
	addi	a1,a1,1
	bne	a2,zero,.L45
.L38:
	li	a0,0
	ret
.L36:
	lbu	a0,0(a0)
	lbu	a5,0(a1)
	sub	a0,a0,a5
	ret
	.cfi_endproc
.LFE5:
	.size	strncmp, .-strncmp
	.section	.text.memset,"ax",@progbits
	.align	2
	.globl	memset
	.hidden	memset
	.type	memset, @function
memset:
.LFB6:
	.cfi_startproc
	andi	a1,a1,0xff
	add	a4,a0,a2
	mv	a5,a0
	beq	a2,zero,.L52
.L48:
	addi	a5,a5,1
	sb	a1,-1(a5)
	bne	a4,a5,.L48
.L52:
	ret
	.cfi_endproc
.LFE6:
	.size	memset, .-memset
	.section	.text.memmove,"ax",@progbits
	.align	2
	.globl	memmove
	.hidden	memmove
	.type	memmove, @function
memmove:
.LFB7:
	.cfi_startproc
	beq	a0,a1,.L60
	beq	a2,zero,.L60
	bgtu	a0,a1,.L65
.L56:
	add	a2,a0,a2
	mv	a5,a0
.L58:
	lbu	a4,0(a1)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a5)
	bne	a2,a5,.L58
.L60:
	ret
.L65:
	add	a4,a1,a2
	bleu	a4,a0,.L56
	add	a5,a0,a2
.L57:
	lbu	a3,-1(a4)
	addi	a5,a5,-1
	addi	a4,a4,-1
	sb	a3,0(a5)
	bne	a0,a5,.L57
	ret
	.cfi_endproc
.LFE7:
	.size	memmove, .-memmove
	.section	.text.memcpy,"ax",@progbits
	.align	2
	.globl	memcpy
	.hidden	memcpy
	.type	memcpy, @function
memcpy:
.LFB8:
	.cfi_startproc
	li	a5,3
	bleu	a2,a5,.L71
	addi	t0,a2,-4
	andi	t0,t0,-4
	addi	t0,t0,4
	add	t1,a0,t0
	mv	a4,a1
	mv	a5,a0
.L68:
	lw	a3,0(a4)
	addi	a5,a5,4
	addi	a4,a4,4
	sw	a3,-4(a5)
	bne	a5,t1,.L68
	andi	a2,a2,3
	add	a1,a1,t0
.L67:
	beq	a2,zero,.L69
	add	a2,t1,a2
.L70:
	lbu	a5,0(a1)
	addi	t1,t1,1
	addi	a1,a1,1
	sb	a5,-1(t1)
	bne	t1,a2,.L70
.L69:
	ret
.L71:
	mv	t1,a0
	j	.L67
	.cfi_endproc
.LFE8:
	.size	memcpy, .-memcpy
	.section	.text.memcmp,"ax",@progbits
	.align	2
	.globl	memcmp
	.hidden	memcmp
	.type	memcmp, @function
memcmp:
.LFB9:
	.cfi_startproc
	beq	a2,zero,.L81
	add	a2,a0,a2
	j	.L80
.L79:
	beq	a0,a2,.L81
.L80:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	addi	a0,a0,1
	addi	a1,a1,1
	beq	a5,a4,.L79
	sub	a0,a5,a4
	ret
.L81:
	li	a0,0
	ret
	.cfi_endproc
.LFE9:
	.size	memcmp, .-memcmp
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
