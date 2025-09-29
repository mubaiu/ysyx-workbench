#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vidblit.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
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
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	li	a4,4
	bne	a0,a4,.L7
	mv	a5,a0
	li	a0,4096
	addi	a0,a0,-1024
	la a4, _ZL3Bpp; sw a5, 0(a4);
	mv	s2,a1
	mv	s1,a2
	mv	s0,a3
	call	_Z12FCEU_dmallocj
	la a5, _ZL16palettetranslate; sw a0, 0(a5);
	beq	a0,zero,.L4
	lla	a5,_ZL3CBM
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	s0,8(a5)
	lw	s0,8(sp)
	.cfi_restore 8
	sw	s2,0(a5)
	sw	s1,4(a5)
	lw	s2,0(sp)
	.cfi_restore 18
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
	lw	s2,0(sp)
	.cfi_restore 18
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	free
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL16palettetranslate; sw zero, 0(a5);
	addi	sp,sp,16
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
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	li	a5,-1
	sw	ra,44(sp)
	.cfi_offset 1, -4
	sw	a5,28(sp)
	sw	a5,24(sp)
	sw	a5,20(sp)
	lla	t3,_ZL3CBM
	addi	t4,sp,8
	addi	a7,sp,20
	lla	t6,_ZL3CBM+12
	li	a6,1
	li	t1,-1
	li	a1,32
	li	t5,8
.L18:
	lw	a2,0(t3)
	li	a3,0
	li	a5,0
.L21:
	sll	a4,a6,a5
	and	a4,a4,a2
	beq	a4,zero,.L19
	lw	a4,0(a7)
	beq	a4,t1,.L37
.L20:
	addi	a3,a3,1
.L19:
	addi	a5,a5,1
	bne	a5,a1,.L21
	sub	a3,t5,a3
	sw	a3,0(t4)
	addi	t3,t3,4
	addi	t4,t4,4
	addi	a7,a7,4
	bne	t6,t3,.L18
	la a4, _ZL3Bpp; lw a4, 0(a4);
	li	a5,4
	bne	a4,a5,.L38
	lw	a6,20(sp)
	lw	a7,24(sp)
	lw	t1,28(sp)
	la a1, _ZL16palettetranslate; lw a1, 0(a1);
	mv	a2,a1
	addi	t3,a0,1024
.L24:
	lbu	a5,0(a0)
	lbu	a3,1(a0)
	lbu	a4,2(a0)
	sll	a5,a5,a6
	sll	a3,a3,a7
	or	a5,a5,a3
	sll	a4,a4,t1
	or	a5,a5,a4
	sw	a5,0(a2)
	addi	a0,a0,4
	addi	a2,a2,4
	bne	t3,a0,.L24
	la a4, palo; lw a4, 0(a4);
	beq	a4,zero,.L17
	addi	a1,a1,1024
	addi	a0,a4,1536
.L26:
	lbu	a5,0(a4)
	lbu	a2,1(a4)
	lbu	a3,2(a4)
	sll	a5,a5,a6
	sll	a2,a2,a7
	or	a5,a5,a2
	sll	a3,a3,t1
	or	a5,a5,a3
	sw	a5,0(a1)
	addi	a4,a4,3
	addi	a1,a1,4
	bne	a0,a4,.L26
.L17:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L37:
	.cfi_restore_state
	sw	a5,0(a7)
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a6, _ZL3Bpp; lw a6, 0(a6);
	li	a5,4
	bne	a6,a5,.L58
	slli	a5,a2,2
	andi	a6,a2,7
	sub	a5,a4,a5
	bne	a6,zero,.L59
	andi	a4,a5,3
	bne	a4,zero,.L42
	beq	a3,zero,.L39
	srai	t3,a5,31
	addi	t1,a2,-8
	andi	t3,t3,3
	srli	t1,t1,3
	add	t3,t3,a5
	addi	t1,t1,1
	li	t4,256
	la a4, _ZL16palettetranslate; lw a4, 0(a4);
	andi	t3,t3,-4
	sub	t4,t4,a2
	slli	t1,t1,5
.L44:
	add	a7,a0,a2
	mv	a5,a1
	beq	a2,zero,.L60
.L45:
	lbu	a6,0(a0)
	addi	a5,a5,32
	addi	a0,a0,8
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-32(a5)
	lbu	a6,-7(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-28(a5)
	lbu	a6,-6(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-24(a5)
	lbu	a6,-5(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-20(a5)
	lbu	a6,-4(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-16(a5)
	lbu	a6,-3(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-12(a5)
	lbu	a6,-2(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-8(a5)
	lbu	a6,-1(a0)
	slli	a6,a6,2
	add	a6,a4,a6
	lw	a6,0(a6)
	sw	a6,-4(a5)
	bne	a0,a7,.L45
	add	a1,a1,t1
.L47:
	addi	a3,a3,-1
	add	a1,a1,t3
	add	a0,a7,t4
	bne	a3,zero,.L44
.L39:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L60:
	.cfi_restore_state
	mv	a7,a0
	j	.L47
.L58:
	li	a2,119
.L57:
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
.L42:
	li	a2,123
	j	.L57
.L59:
	li	a2,122
	j	.L57
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
