#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vidblit.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata._Z14InitBlitToHighijjjiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/drivers/common/vidblit.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z14InitBlitToHighijjjiii,"ax",@progbits
	.align	2
	.globl	_Z14InitBlitToHighijjjiii
	.hidden	_Z14InitBlitToHighijjjiii
	.type	_Z14InitBlitToHighijjjiii, @function
_Z14InitBlitToHighijjjiii:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	a4,4
	sw	a3,0(sp)
	bne	a0,a4,.L7
	mv	a5,a0
	li	a0,4096
	addi	a0,a0,-1024
	la a4, _ZL3Bpp; sw a5, 0(a4);
	mv	s1,a1
	mv	s0,a2
	call	_Z12FCEU_dmallocj
	la a5, _ZL16palettetranslate; sw a0, 0(a5);
	beq	a0,zero,.L4
	lw	a4,0(sp)
	lla	a5,_ZL3CBM
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	s0,4(a5)
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s1,0(a5)
	sw	a4,8(a5)
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L4:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	.cfi_restore_state
	li	a2,56
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE7:
	.size	_Z14InitBlitToHighijjjiii, .-_Z14InitBlitToHighijjjiii
	.section	.text._Z14KillBlitToHighv,"ax",@progbits
	.align	2
	.globl	_Z14KillBlitToHighv
	.hidden	_Z14KillBlitToHighv
	.type	_Z14KillBlitToHighv, @function
_Z14KillBlitToHighv:
.LFB8:
	.cfi_startproc
	la a0, _ZL16palettetranslate; lw a0, 0(a0);
	beq	a0,zero,.L14
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	free
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL16palettetranslate; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	ret
	.cfi_endproc
.LFE8:
	.size	_Z14KillBlitToHighv, .-_Z14KillBlitToHighv
	.section	.text._Z20SetPaletteBlitToHighPh,"ax",@progbits
	.align	2
	.globl	_Z20SetPaletteBlitToHighPh
	.hidden	_Z20SetPaletteBlitToHighPh
	.type	_Z20SetPaletteBlitToHighPh, @function
_Z20SetPaletteBlitToHighPh:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-40
	.cfi_def_cfa_offset 40
	li	a5,-1
	mv	a4,a0
	sw	s0,32(sp)
	sw	s1,28(sp)
	sw	ra,36(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sw	a5,24(sp)
	sw	a5,20(sp)
	sw	a5,16(sp)
	lla	t2,_ZL3CBM
	addi	s0,sp,4
	addi	t1,sp,16
	lla	s1,_ZL3CBM+12
	li	a0,1
	li	t0,-1
	li	a1,32
	sw	a4,0(sp)
.L18:
	lw	a2,0(t2)
	li	a3,0
	li	a5,0
.L21:
	sll	a4,a0,a5
	and	a4,a4,a2
	beq	a4,zero,.L19
	lw	a4,0(t1)
	beq	a4,t0,.L37
.L20:
	addi	a3,a3,1
.L19:
	addi	a5,a5,1
	bne	a5,a1,.L21
	li	a5,8
	sub	a3,a5,a3
	sw	a3,0(s0)
	addi	t2,t2,4
	addi	s0,s0,4
	addi	t1,t1,4
	bne	s1,t2,.L18
	la a3, _ZL3Bpp; lw a3, 0(a3);
	li	a5,4
	lw	a4,0(sp)
	bne	a3,a5,.L38
	lw	a3,16(sp)
	lw	a2,20(sp)
	lw	a1,24(sp)
	la a0, _ZL16palettetranslate; lw a0, 0(a0);
	mv	t1,a0
	addi	t0,a4,1024
.L24:
	lbu	a5,0(a4)
	lbu	s0,1(a4)
	lbu	t2,2(a4)
	sll	a5,a5,a3
	sll	s0,s0,a2
	or	a5,a5,s0
	sll	t2,t2,a1
	or	a5,a5,t2
	sw	a5,0(t1)
	addi	a4,a4,4
	addi	t1,t1,4
	bne	t0,a4,.L24
	la a4, palo; lw a4, 0(a4);
	beq	a4,zero,.L17
	addi	a0,a0,1024
	addi	t0,a4,1536
.L26:
	lbu	a5,0(a4)
	lbu	t2,1(a4)
	lbu	t1,2(a4)
	sll	a5,a5,a3
	sll	t2,t2,a2
	or	a5,a5,t2
	sll	t1,t1,a1
	or	a5,a5,t1
	sw	a5,0(a0)
	addi	a4,a4,3
	addi	a0,a0,4
	bne	t0,a4,.L26
.L17:
	lw	ra,36(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,32(sp)
	.cfi_restore 8
	lw	s1,28(sp)
	.cfi_restore 9
	addi	sp,sp,40
	.cfi_def_cfa_offset 0
	jr	ra
.L37:
	.cfi_restore_state
	sw	a5,0(t1)
	j	.L20
.L38:
	li	a2,93
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE9:
	.size	_Z20SetPaletteBlitToHighPh, .-_Z20SetPaletteBlitToHighPh
	.section	.text._Z11Blit8ToHighPhS_iiiii,"ax",@progbits
	.align	2
	.globl	_Z11Blit8ToHighPhS_iiiii
	.hidden	_Z11Blit8ToHighPhS_iiiii
	.type	_Z11Blit8ToHighPhS_iiiii, @function
_Z11Blit8ToHighPhS_iiiii:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	la t0, _ZL3Bpp; lw t0, 0(t0);
	li	t1,4
	.cfi_offset 1, -4
	bne	t0,t1,.L59
	mv	a5,a4
	slli	t1,a2,2
	andi	a4,a2,7
	sub	a5,a5,t1
	bne	a4,zero,.L60
	andi	a4,a5,3
	bne	a4,zero,.L42
	beq	a3,zero,.L39
	sw	s0,4(sp)
	addi	t2,a2,-8
	.cfi_offset 8, -8
	srai	s0,a5,31
	andi	s0,s0,3
	srli	t2,t2,3
	sw	s1,0(sp)
	add	s0,s0,a5
	addi	t2,t2,1
	.cfi_offset 9, -12
	li	s1,256
	la a4, _ZL16palettetranslate; lw a4, 0(a4);
	andi	s0,s0,-4
	sub	s1,s1,a2
	slli	t2,t2,5
.L44:
	add	t0,a0,a2
	mv	a5,a1
	beq	a2,zero,.L61
.L45:
	lbu	t1,0(a0)
	addi	a5,a5,32
	addi	a0,a0,8
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-32(a5)
	lbu	t1,-7(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-28(a5)
	lbu	t1,-6(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-24(a5)
	lbu	t1,-5(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-20(a5)
	lbu	t1,-4(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-16(a5)
	lbu	t1,-3(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-12(a5)
	lbu	t1,-2(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-8(a5)
	lbu	t1,-1(a0)
	slli	t1,t1,2
	add	t1,a4,t1
	lw	t1,0(t1)
	sw	t1,-4(a5)
	bne	a0,t0,.L45
	add	a1,a1,t2
.L47:
	addi	a3,a3,-1
	add	a1,a1,s0
	add	a0,t0,s1
	bne	a3,zero,.L44
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
.L39:
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L61:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	t0,a0
	j	.L47
.L59:
	.cfi_restore 8
	.cfi_restore 9
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a2,119
	.cfi_offset 8, -8
	.cfi_offset 9, -12
.L58:
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
.L42:
	.cfi_restore 8
	.cfi_restore 9
	sw	s0,4(sp)
	sw	s1,0(sp)
	li	a2,123
	.cfi_remember_state
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	j	.L58
.L60:
	.cfi_restore_state
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	a2,122
	j	.L58
	.cfi_endproc
.LFE10:
	.size	_Z11Blit8ToHighPhS_iiiii, .-_Z11Blit8ToHighPhS_iiiii
	.hidden	paldeemphswap
	.globl	paldeemphswap
	.section	.sbss.paldeemphswap,"aw",@nobits
	.type	paldeemphswap, @object
	.size	paldeemphswap, 1
paldeemphswap:
	.zero	1
	.section	.sbss._ZL3Bpp,"aw",@nobits
	.align	2
	.type	_ZL3Bpp, @object
	.size	_ZL3Bpp, 4
_ZL3Bpp:
	.zero	4
	.section	.sbss._ZL16palettetranslate,"aw",@nobits
	.align	2
	.type	_ZL16palettetranslate, @object
	.size	_ZL16palettetranslate, 4
_ZL16palettetranslate:
	.zero	4
	.section	.bss._ZL3CBM,"aw",@nobits
	.align	2
	.type	_ZL3CBM, @object
	.size	_ZL3CBM, 12
_ZL3CBM:
	.zero	12
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
