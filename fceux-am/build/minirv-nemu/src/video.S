#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"video.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__mulsi3
	.globl	__udivsi3
	.section	.rodata._Z7ShowFPSv.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"(System time: %ds) FPS = %d"
	.globl	__modsi3
	.section	.text._Z7ShowFPSv.part.0,"ax",@progbits
	.align	2
	.type	_Z7ShowFPSv.part.0, @function
_Z7ShowFPSv.part.0:
.LFB66:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	lla	s3,_ZL9boopcount
	call	_Z13FCEUD_GetTimev
	lw	a3,0(s3)
	lla	a2,_ZZ7ShowFPSvE3tsc
	lw	a4,0(a2)
	la s1, PAL; lbu s1, 0(s1);
	slli	a1,a3,3
	seqz	s1,s1
	lla	a5,_ZL4boop
	add	a5,a5,a1
	neg	s1,s1
	lw	s4,0(a5)
	andi	s1,s1,10
	sw	a0,0(a5)
	sw	zero,4(a5)
	sub	a4,a0,a4
	li	a5,1000
	addi	s1,s1,50
	bleu	a4,a5,.L3
	sw	s0,24(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	sw	a0,0(a2)
	mv	s2,a0
	li	s0,40
.L4:
	li	a0,8
	addi	s0,s0,-1
	call	putch
	bne	s0,zero,.L4
	call	_Z17FCEUD_GetTimeFreqv
	mv	a1,a0
	mv	a0,s1
	call	__mulsi3
	sub	a1,s2,s4
	call	__udivsi3
	mv	s0,a0
	li	a1,1000
	mv	a0,s2
	call	__udivsi3
	mv	a1,a0
	mv	a2,s0
	lla	a0,.LC0
	call	printf
	lw	a3,0(s3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s2,16(sp)
	.cfi_restore 18
.L3:
	mv	a1,s1
	addi	a0,a3,1
	call	__modsi3
	lw	ra,28(sp)
	.cfi_restore 1
	sw	a0,0(s3)
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE66:
	.size	_Z7ShowFPSv.part.0, .-_Z7ShowFPSv.part.0
	.section	.text._Z21FCEU_KillVirtualVideov,"ax",@progbits
	.align	2
	.globl	_Z21FCEU_KillVirtualVideov
	.hidden	_Z21FCEU_KillVirtualVideov
	.type	_Z21FCEU_KillVirtualVideov, @function
_Z21FCEU_KillVirtualVideov:
.LFB61:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE61:
	.size	_Z21FCEU_KillVirtualVideov, .-_Z21FCEU_KillVirtualVideov
	.section	.text._Z21FCEU_InitVirtualVideov,"ax",@progbits
	.align	2
	.globl	_Z21FCEU_InitVirtualVideov
	.hidden	_Z21FCEU_InitVirtualVideov
	.type	_Z21FCEU_InitVirtualVideov, @function
_Z21FCEU_InitVirtualVideov:
.LFB62:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,XBuf
	lw	a5,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L15
.L11:
	li	a0,1
.L10:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L15:
	.cfi_restore_state
	li	a0,65536
	addi	a0,a0,16
	call	_Z11FCEU_mallocj
	beq	a0,zero,.L16
	neg	a5,a0
	andi	a5,a5,7
	add	a0,a0,a5
	li	a2,65536
	li	a1,128
	sw	a0,0(s0)
	call	memset
	j	.L11
.L16:
	la a5, XBuf; sw zero, 0(a5);
	j	.L10
	.cfi_endproc
.LFE62:
	.size	_Z21FCEU_InitVirtualVideov, .-_Z21FCEU_InitVirtualVideov
	.section	.text._Z18FCEU_PutImageDummyv,"ax",@progbits
	.align	2
	.globl	_Z18FCEU_PutImageDummyv
	.hidden	_Z18FCEU_PutImageDummyv
	.type	_Z18FCEU_PutImageDummyv, @function
_Z18FCEU_PutImageDummyv:
.LFB63:
	.cfi_startproc
	la a5, Show_FPS; lbu a5, 0(a5);
	bne	a5,zero,.L19
	ret
.L19:
	tail	_Z7ShowFPSv.part.0
	.cfi_endproc
.LFE63:
	.size	_Z18FCEU_PutImageDummyv, .-_Z18FCEU_PutImageDummyv
	.section	.text._Z16FCEUI_SetShowFPSb,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_SetShowFPSb
	.hidden	_Z16FCEUI_SetShowFPSb
	.type	_Z16FCEUI_SetShowFPSb, @function
_Z16FCEUI_SetShowFPSb:
.LFB64:
	.cfi_startproc
	la a5, Show_FPS; sb a0, 0(a5);
	ret
	.cfi_endproc
.LFE64:
	.size	_Z16FCEUI_SetShowFPSb, .-_Z16FCEUI_SetShowFPSb
	.section	.text._Z7ShowFPSv,"ax",@progbits
	.align	2
	.globl	_Z7ShowFPSv
	.hidden	_Z7ShowFPSv
	.type	_Z7ShowFPSv, @function
_Z7ShowFPSv:
.LFB65:
	.cfi_startproc
	la a5, Show_FPS; lbu a5, 0(a5);
	bne	a5,zero,.L23
	ret
.L23:
	tail	_Z7ShowFPSv.part.0
	.cfi_endproc
.LFE65:
	.size	_Z7ShowFPSv, .-_Z7ShowFPSv
	.section	.sbss._ZZ7ShowFPSvE3tsc,"aw",@nobits
	.align	2
	.type	_ZZ7ShowFPSvE3tsc, @object
	.size	_ZZ7ShowFPSvE3tsc, 4
_ZZ7ShowFPSvE3tsc:
	.zero	4
	.section	.sbss._ZL9boopcount,"aw",@nobits
	.align	2
	.type	_ZL9boopcount, @object
	.size	_ZL9boopcount, 4
_ZL9boopcount:
	.zero	4
	.section	.bss._ZL4boop,"aw",@nobits
	.align	3
	.type	_ZL4boop, @object
	.size	_ZL4boop, 480
_ZL4boop:
	.zero	480
	.hidden	Show_FPS
	.globl	Show_FPS
	.section	.sbss.Show_FPS,"aw",@nobits
	.type	Show_FPS, @object
	.size	Show_FPS, 1
Show_FPS:
	.zero	1
	.hidden	ClipSidesOffset
	.globl	ClipSidesOffset
	.section	.sbss.ClipSidesOffset,"aw",@nobits
	.align	2
	.type	ClipSidesOffset, @object
	.size	ClipSidesOffset, 4
ClipSidesOffset:
	.zero	4
	.hidden	XBuf
	.globl	XBuf
	.section	.sbss.XBuf,"aw",@nobits
	.align	2
	.type	XBuf, @object
	.size	XBuf, 4
XBuf:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
