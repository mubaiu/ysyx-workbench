#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"audio.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.audio_test.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"minirv-npc"
	.align	2
.LC1:
	.string	"WARNING: %s does not support audio\n"
	.align	2
.LC2:
	.string	"Already play %d/%d bytes of data\n"
	.section	.text.audio_test,"ax",@progbits
	.align	2
	.globl	audio_test
	.hidden	audio_test
	.type	audio_test, @function
audio_test:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a1,sp,8
	li	a0,14
	sw	ra,28(sp)
	.cfi_offset 1, -4
	call	ioe_read
	lbu	a5,8(sp)
	beq	a5,zero,.L14
	li	a5,8192
	addi	a5,a5,-192
	sw	a5,8(sp)
	li	a5,1
	sw	a5,12(sp)
	addi	a1,sp,8
	li	a5,1024
	li	a0,15
	sw	s0,24(sp)
	sw	a5,16(sp)
	.cfi_offset 8, -8
	call	ioe_write
	lla	a5,audio_payload_end
	lla	a3,audio_payload
	sub	s0,a5,a3
	beq	a5,a3,.L6
	sw	s1,20(sp)
	.cfi_offset 9, -12
	li	a5,0
	li	s1,0
.L5:
	sub	a5,s0,a5
	li	a4,4096
	mv	a2,a3
	addi	a1,sp,8
	li	a0,17
	bleu	a5,a4,.L4
	li	a5,4096
.L4:
	add	a3,a3,a5
	sw	a3,12(sp)
	sw	a3,0(sp)
	sw	a5,4(sp)
	sw	a2,8(sp)
	call	ioe_write
	lw	a5,4(sp)
	mv	a2,s0
	lla	a0,.LC2
	add	s1,s1,a5
	mv	a1,s1
	call	printf
	lw	a3,0(sp)
	mv	a5,s1
	bltu	s1,s0,.L5
	lw	s1,20(sp)
	.cfi_restore 9
.L6:
	addi	a1,sp,8
	li	a0,16
	call	ioe_read
	lw	a5,8(sp)
	bgt	a5,zero,.L6
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	lw	ra,28(sp)
	.cfi_restore 1
	lla	a1,.LC0
	lla	a0,.LC1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE0:
	.size	audio_test, .-audio_test
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
