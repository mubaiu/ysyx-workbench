#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-video.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z9KillVideov,"ax",@progbits
	.align	2
	.globl	_Z9KillVideov
	.hidden	_Z9KillVideov
	.type	_Z9KillVideov, @function
_Z9KillVideov:
.LFB46:
	.cfi_startproc
	la a5, _ZL8s_inited; lw a5, 0(a5);
	beq	a5,zero,.L3
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14KillBlitToHighv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL8s_inited; sw zero, 0(a5);
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L3:
	li	a0,-1
	ret
	.cfi_endproc
.LFE46:
	.size	_Z9KillVideov, .-_Z9KillVideov
	.section	.text._Z18FCEUD_VideoChangedv,"ax",@progbits
	.align	2
	.globl	_Z18FCEUD_VideoChangedv
	.hidden	_Z18FCEUD_VideoChangedv
	.type	_Z18FCEUD_VideoChangedv, @function
_Z18FCEUD_VideoChangedv:
.LFB47:
	.cfi_startproc
	la a5, PAL; sb zero, 0(a5);
	ret
	.cfi_endproc
.LFE47:
	.size	_Z18FCEUD_VideoChangedv, .-_Z18FCEUD_VideoChangedv
	.section	.rodata._Z9InitVideoP6FCEUGI.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Initializing video...\n"
	.section	.text._Z9InitVideoP6FCEUGI,"ax",@progbits
	.align	2
	.globl	_Z9InitVideoP6FCEUGI
	.hidden	_Z9InitVideoP6FCEUGI
	.type	_Z9InitVideoP6FCEUGI, @function
_Z9InitVideoP6FCEUGI:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a0,.LC0
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	printf
	li	s0,1
	li	a0,1
	la a5, _ZL8s_inited; sw s0, 0(a5);
	call	_Z16FCEUI_SetShowFPSb
	li	a2,65536
	sw	zero,0(sp)
	li	a5,0
	li	a4,0
	li	a3,255
	addi	a2,a2,-256
	li	a1,16711680
	li	a0,4
	la t1, _ZL16s_paletterefresh; sw s0, 0(t1);
	call	_Z14InitBlitToHighijjjiii
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	_Z9InitVideoP6FCEUGI, .-_Z9InitVideoP6FCEUGI
	.section	.text._Z16FCEUD_SetPalettehhhh,"ax",@progbits
	.align	2
	.globl	_Z16FCEUD_SetPalettehhhh
	.hidden	_Z16FCEUD_SetPalettehhhh
	.type	_Z16FCEUD_SetPalettehhhh, @function
_Z16FCEUD_SetPalettehhhh:
.LFB49:
	.cfi_startproc
	lla	a5,_ZL6s_psdl
	slli	a0,a0,2
	slli	a2,a2,8
	add	a0,a0,a5
	or	a1,a1,a2
	li	a5,1
	sh	a1,0(a0)
	sb	a3,2(a0)
	la a4, _ZL16s_paletterefresh; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE49:
	.size	_Z16FCEUD_SetPalettehhhh, .-_Z16FCEUD_SetPalettehhhh
	.section	.rodata._Z10BlitScreenPh.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"\033[0;0H"
	.align	2
.LC2:
	.string	"o. *O0@#"
	.globl	__udivsi3
	.section	.text._Z10BlitScreenPh,"ax",@progbits
	.align	2
	.globl	_Z10BlitScreenPh
	.hidden	_Z10BlitScreenPh
	.type	_Z10BlitScreenPh, @function
_Z10BlitScreenPh:
.LFB50:
	.cfi_startproc
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	la a5, _ZL16s_paletterefresh; lw a5, 0(a5);
	sw	a0,8(sp)
	bne	a5,zero,.L23
.L14:
	lla	a0,.LC1
	call	printf
	lw	a4,8(sp)
	li	a5,61440
	lla	s1,_ZZ10BlitScreenPhE11canvas_line+1024
	add	a5,a4,a5
	sw	a5,12(sp)
.L16:
	lw	a0,8(sp)
	li	a5,1
	sw	a5,0(sp)
	li	a4,1024
	li	a3,1
	li	a2,256
	lla	a1,_ZZ10BlitScreenPhE11canvas_line
	call	_Z11Blit8ToHighPhS_iiiii
	li	a5,2236416
	addi	a5,a5,546
	lla	s0,_ZZ10BlitScreenPhE11canvas_line
	sw	a5,4(sp)
.L15:
	lw	a0,0(s0)
	lw	a1,4(sp)
	addi	s0,s0,8
	call	__udivsi3
	lla	a5,.LC2
	add	a0,a5,a0
	lbu	a0,0(a0)
	call	putch
	bne	s1,s0,.L15
	li	a0,10
	call	putch
	lw	a5,8(sp)
	lw	a4,12(sp)
	addi	a5,a5,1024
	sw	a5,8(sp)
	bne	a4,a5,.L16
	lw	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,20(sp)
	.cfi_restore 8
	lw	s1,16(sp)
	.cfi_restore 9
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
.L23:
	.cfi_restore_state
	lla	a0,_ZL6s_psdl
	call	_Z20SetPaletteBlitToHighPh
	la a5, _ZL16s_paletterefresh; sw zero, 0(a5);
	j	.L14
	.cfi_endproc
.LFE50:
	.size	_Z10BlitScreenPh, .-_Z10BlitScreenPh
	.section	.bss._ZZ10BlitScreenPhE11canvas_line,"aw",@nobits
	.align	2
	.type	_ZZ10BlitScreenPhE11canvas_line, @object
	.size	_ZZ10BlitScreenPhE11canvas_line, 1024
_ZZ10BlitScreenPhE11canvas_line:
	.zero	1024
	.section	.bss._ZL6s_psdl,"aw",@nobits
	.align	2
	.type	_ZL6s_psdl, @object
	.size	_ZL6s_psdl, 1024
_ZL6s_psdl:
	.zero	1024
	.section	.sbss._ZL16s_paletterefresh,"aw",@nobits
	.align	2
	.type	_ZL16s_paletterefresh, @object
	.size	_ZL16s_paletterefresh, 4
_ZL16s_paletterefresh:
	.zero	4
	.section	.sbss._ZL8s_inited,"aw",@nobits
	.align	2
	.type	_ZL8s_inited, @object
	.size	_ZL8s_inited, 4
_ZL8s_inited:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
