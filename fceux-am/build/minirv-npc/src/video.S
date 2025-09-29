#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"video.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	s0,12(sp)
	sw	ra,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	call	_Z13FCEUD_GetTimev
	lla	a5,_ZL9boopcount
	lw	a3,0(a5)
	lla	a5,_ZL4boop
	la s0, PAL; lbu s0, 0(s0);
	slli	a1,a3,3
	add	a5,a5,a1
	lw	a1,0(a5)
	lla	a2,_ZZ7ShowFPSvE3tsc
	seqz	s0,s0
	lw	a4,0(a2)
	neg	s0,s0
	sw	a1,4(sp)
	andi	a1,s0,10
	addi	a1,a1,50
	sw	a0,0(a5)
	sw	zero,4(a5)
	sub	a4,a0,a4
	li	a5,1000
	sw	a1,0(sp)
	bleu	a4,a5,.L3
	sw	s1,8(sp)
	.cfi_offset 9, -12
	sw	a0,0(a2)
	mv	s1,a0
	li	s0,40
.L4:
	li	a0,8
	addi	s0,s0,-1
	call	putch
	bne	s0,zero,.L4
	call	_Z17FCEUD_GetTimeFreqv
	mv	a1,a0
	lw	a0,0(sp)
	call	__mulsi3
	lw	a5,4(sp)
	sub	a1,s1,a5
	call	__udivsi3
	mv	a5,a0
	li	a1,1000
	mv	a0,s1
	mv	s1,a5
	call	__udivsi3
	mv	a1,a0
	mv	a2,s1
	lla	a0,.LC0
	call	printf
	lla	a5,_ZL9boopcount
	lw	a3,0(a5)
	lw	s1,8(sp)
	.cfi_restore 9
.L3:
	lw	a1,0(sp)
	addi	a0,a3,1
	call	__modsi3
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s0,12(sp)
	.cfi_restore 8
	lla	a5,_ZL9boopcount
	sw	a0,0(a5)
	addi	sp,sp,20
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,XBuf
	lw	a5,0(s0)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L15
.L11:
	li	a0,1
.L10:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
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
