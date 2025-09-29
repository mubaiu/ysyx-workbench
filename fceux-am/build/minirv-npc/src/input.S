#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL6JPReadj,"ax",@progbits
	.align	2
	.type	_ZL6JPReadj, @function
_ZL6JPReadj:
.LFB62:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	andi	s0,a0,1
	slli	a5,s0,2
	add	a5,a5,s0
	slli	a5,a5,2
	lla	a4,joyports
	add	a5,a4,a5
	lw	a5,16(a5)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lw	a5,0(a5)
	beq	a5,zero,.L4
	mv	a0,s0
	jalr	a5
.L2:
	la a5, portFC+12; lw a5, 0(a5);
	beq	a5,zero,.L3
	lw	a5,0(a5)
	beq	a5,zero,.L3
	mv	a1,a0
	mv	a0,s0
	jalr	a5
.L3:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-64
	or	a0,a0,a5
	andi	a0,a0,0xff
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L4:
	.cfi_restore_state
	li	a0,0
	j	.L2
	.cfi_endproc
.LFE62:
	.size	_ZL6JPReadj, .-_ZL6JPReadj
	.section	.text._ZL5B4016jh,"ax",@progbits
	.align	2
	.type	_ZL5B4016jh, @function
_ZL5B4016jh:
.LFB63:
	.cfi_startproc
	lla	a5,portFC
	lw	a5,12(a5)
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	mv	s0,a1
	beq	a5,zero,.L14
	lw	a5,4(a5)
	beq	a5,zero,.L14
	andi	a0,a1,7
	jalr	a5
.L14:
	lla	a4,joyports
	lw	a5,16(a4)
	andi	s1,s0,1
	lw	a5,4(a5)
	beq	a5,zero,.L15
	mv	a0,s1
	jalr	a5
	lla	a4,joyports
.L15:
	lw	a5,36(a4)
	lw	a5,4(a5)
	beq	a5,zero,.L16
	mv	a0,s1
	jalr	a5
	lla	a4,joyports
.L16:
	lla	a3,_ZL10LastStrobe
	lbu	a5,0(a3)
	andi	a5,a5,1
	beq	a5,zero,.L18
	bne	s1,zero,.L18
	lw	a5,16(a4)
	lw	a5,8(a5)
	beq	a5,zero,.L20
	li	a0,0
	jalr	a5
	lla	a3,_ZL10LastStrobe
	lla	a4,joyports
.L20:
	lw	a5,36(a4)
	lw	a5,8(a5)
	beq	a5,zero,.L21
	li	a0,1
	jalr	a5
	lla	a3,_ZL10LastStrobe
.L21:
	lla	a5,portFC
	lw	a5,12(a5)
	beq	a5,zero,.L18
	lw	a5,8(a5)
	beq	a5,zero,.L18
	jalr	a5
	lla	a3,_ZL10LastStrobe
.L18:
	sb	s1,0(a3)
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, RawReg4016; sb s0, 0(a5);
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE63:
	.size	_ZL5B4016jh, .-_ZL5B4016jh
	.section	.text._ZL6ReadGPi,"ax",@progbits
	.align	2
	.type	_ZL6ReadGPi, @function
_ZL6ReadGPi:
.LFB65:
	.cfi_startproc
	lla	a3,_ZL11joy_readbit
	add	a4,a3,a0
	lbu	a4,0(a4)
	li	a1,7
	mv	a5,a0
	la a2, _ZL10FSAttached; lbu a2, 0(a2);
	bleu	a4,a1,.L48
	li	a1,15
	bleu	a4,a1,.L60
	li	a0,1
	bne	a2,zero,.L61
.L52:
	la a2, fceuindbg; lw a2, 0(a2);
	bne	a2,zero,.L53
	add	a3,a3,a5
	addi	a4,a4,1
	sb	a4,0(a3)
.L53:
	ret
.L48:
	lla	a1,joy
	add	a1,a1,a0
	lbu	a0,0(a1)
	sra	a0,a0,a4
	andi	a0,a0,1
	beq	a2,zero,.L52
.L51:
	li	a2,19
	sub	a2,a2,a5
	bne	a2,a4,.L52
.L62:
	li	a0,1
	j	.L52
.L61:
	li	a2,19
	sub	a2,a2,a5
	li	a0,0
	bne	a2,a4,.L52
	j	.L62
.L60:
	li	a0,1
	beq	a2,zero,.L52
	lla	a2,joy
	add	a2,a2,a5
	lbu	a0,2(a2)
	andi	a2,a4,7
	sra	a0,a0,a2
	andi	a0,a0,1
	j	.L51
	.cfi_endproc
.LFE65:
	.size	_ZL6ReadGPi, .-_ZL6ReadGPi
	.section	.text._ZL8StrobeGPi,"ax",@progbits
	.align	2
	.type	_ZL8StrobeGPi, @function
_ZL8StrobeGPi:
.LFB66:
	.cfi_startproc
	lla	a5,_ZL11joy_readbit
	add	a5,a5,a0
	sb	zero,0(a5)
	ret
	.cfi_endproc
.LFE66:
	.size	_ZL8StrobeGPi, .-_ZL8StrobeGPi
	.section	.text._ZL8UpdateGPiPvi,"ax",@progbits
	.align	2
	.type	_ZL8UpdateGPiPvi, @function
_ZL8UpdateGPiPvi:
.LFB64:
	.cfi_startproc
	bne	a0,zero,.L65
	la a5, joyports+12; lw a5, 0(a5);
	lw	a3,0(a5)
	lhu	a4,2(a5)
	lla	a5,joy
	sb	a3,0(a5)
	sb	a4,2(a5)
	ret
.L65:
	la a4, joyports+32; lw a4, 0(a4);
	lw	a5,0(a4)
	lbu	a3,3(a4)
	lla	a4,joy
	srli	a5,a5,8
	sb	a5,1(a4)
	sb	a3,3(a4)
	ret
	.cfi_endproc
.LFE64:
	.size	_ZL8UpdateGPiPvi, .-_ZL8UpdateGPiPvi
	.section	.text._Z14FCEU_GetJoyJoyv,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_GetJoyJoyv
	.hidden	_Z14FCEU_GetJoyJoyv
	.type	_Z14FCEU_GetJoyJoyv, @function
_Z14FCEU_GetJoyJoyv:
.LFB61:
	.cfi_startproc
	lla	a4,joy
	lbu	a5,0(a4)
	lbu	a2,1(a4)
	lbu	a3,2(a4)
	lbu	a0,3(a4)
	or	a5,a5,a2
	or	a5,a5,a3
	or	a0,a5,a0
	ret
	.cfi_endproc
.LFE61:
	.size	_Z14FCEU_GetJoyJoyv, .-_Z14FCEU_GetJoyJoyv
	.section	.text._Z14FCEU_DrawInputPh,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_DrawInputPh
	.hidden	_Z14FCEU_DrawInputPh
	.type	_Z14FCEU_DrawInputPh, @function
_Z14FCEU_DrawInputPh:
.LFB67:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lla	s1,joyports
	lw	a5,16(s1)
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lw	a5,20(a5)
	mv	s0,a0
	beq	a5,zero,.L69
	lw	a2,4(s1)
	mv	a1,a0
	li	a0,0
	jalr	a5
.L69:
	lw	a5,36(s1)
	lw	a5,20(a5)
	beq	a5,zero,.L70
	lw	a2,24(s1)
	mv	a1,s0
	li	a0,1
	jalr	a5
.L70:
	lla	a4,portFC
	lw	a5,12(a4)
	beq	a5,zero,.L68
	lw	a5,20(a5)
	beq	a5,zero,.L68
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lw	a1,0(a4)
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L68:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE67:
	.size	_Z14FCEU_DrawInputPh, .-_Z14FCEU_DrawInputPh
	.section	.text._Z16FCEU_UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z16FCEU_UpdateInputv
	.hidden	_Z16FCEU_UpdateInputv
	.type	_Z16FCEU_UpdateInputv, @function
_Z16FCEU_UpdateInputv:
.LFB68:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,joyports
	lw	a5,16(s0)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lw	a5,12(a5)
	beq	a5,zero,.L86
	lw	a2,4(s0)
	lw	a1,12(s0)
	li	a0,0
	jalr	a5
.L86:
	lw	a5,36(s0)
	lw	a5,12(a5)
	beq	a5,zero,.L87
	lw	a2,24(s0)
	lw	a1,32(s0)
	li	a0,1
	jalr	a5
.L87:
	lla	a5,portFC
	lw	a4,12(a5)
	lw	a4,12(a4)
	beq	a4,zero,.L85
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	a1,0(a5)
	lw	a0,8(a5)
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a4
.L85:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE68:
	.size	_Z16FCEU_UpdateInputv, .-_Z16FCEU_UpdateInputv
	.section	.text._Z17InputScanlineHookPhS_ji,"ax",@progbits
	.align	2
	.globl	_Z17InputScanlineHookPhS_ji
	.hidden	_Z17InputScanlineHookPhS_ji
	.type	_Z17InputScanlineHookPhS_ji, @function
_Z17InputScanlineHookPhS_ji:
.LFB69:
	.cfi_startproc
	lla	a5,joyports
	lw	a4,16(a5)
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	s0,12(sp)
	lw	t1,16(a4)
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sw	a0,0(sp)
	mv	s0,a1
	mv	s1,a2
	mv	a4,a3
	beq	t1,zero,.L97
	sw	a3,4(sp)
	mv	a3,a2
	mv	a2,a1
	mv	a1,a0
	li	a0,0
	jalr	t1
	lw	a4,4(sp)
	lla	a5,joyports
.L97:
	lw	a5,36(a5)
	lw	a5,16(a5)
	beq	a5,zero,.L98
	lw	a1,0(sp)
	mv	a3,s1
	mv	a2,s0
	li	a0,1
	sw	a4,4(sp)
	jalr	a5
	lw	a4,4(sp)
.L98:
	la a5, portFC+12; lw a5, 0(a5);
	lw	a5,16(a5)
	beq	a5,zero,.L96
	mv	a1,s0
	lw	s0,12(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a0,0(sp)
	lw	ra,16(sp)
	.cfi_restore 1
	mv	a2,s1
	lw	s1,8(sp)
	.cfi_restore 9
	mv	a3,a4
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	a5
.L96:
	.cfi_restore_state
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE69:
	.size	_Z17InputScanlineHookPhS_ji, .-_Z17InputScanlineHookPhS_ji
	.section	.text._Z14FCEUI_SetInputi3ESIPvi,"ax",@progbits
	.align	2
	.globl	_Z14FCEUI_SetInputi3ESIPvi
	.hidden	_Z14FCEUI_SetInputi3ESIPvi
	.type	_Z14FCEUI_SetInputi3ESIPvi, @function
_Z14FCEUI_SetInputi3ESIPvi:
.LFB72:
	.cfi_startproc
	slli	a5,a0,2
	add	a0,a5,a0
	slli	a5,a0,2
	lla	a0,joyports
	add	a0,a0,a5
	sw	a3,4(a0)
	sw	a1,8(a0)
	sw	a2,12(a0)
	beq	a1,zero,.L108
	li	a5,1
	beq	a1,a5,.L110
	ret
.L110:
	lla	a5,_ZL3GPC
	sw	a5,16(a0)
	ret
.L108:
	lla	a5,_ZL10DummyJPort
	sw	a5,16(a0)
	ret
	.cfi_endproc
.LFE72:
	.size	_Z14FCEUI_SetInputi3ESIPvi, .-_Z14FCEUI_SetInputi3ESIPvi
	.section	.text._Z16FCEUI_SetInputFC5ESIFCPvi,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_SetInputFC5ESIFCPvi
	.hidden	_Z16FCEUI_SetInputFC5ESIFCPvi
	.type	_Z16FCEUI_SetInputFC5ESIFCPvi, @function
_Z16FCEUI_SetInputFC5ESIFCPvi:
.LFB73:
	.cfi_startproc
	lla	a5,portFC
	sw	a2,0(a5)
	sw	a0,4(a5)
	sw	a1,8(a5)
	bne	a0,zero,.L111
	lla	a4,_ZL11DummyPortFC
	sw	a4,12(a5)
.L111:
	ret
	.cfi_endproc
.LFE73:
	.size	_Z16FCEUI_SetInputFC5ESIFCPvi, .-_Z16FCEUI_SetInputFC5ESIFCPvi
	.section	.text._Z15InitializeInputv,"ax",@progbits
	.align	2
	.globl	_Z15InitializeInputv
	.hidden	_Z15InitializeInputv
	.type	_Z15InitializeInputv, @function
_Z15InitializeInputv:
.LFB74:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,2
	li	a1,0
	lla	a0,_ZL11joy_readbit
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	memset
	li	a2,4
	li	a1,0
	lla	a0,joy
	call	memset
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL6JPReadj
	addi	a1,a1,23
	addi	a0,a0,22
	la a5, _ZL10LastStrobe; sb zero, 0(a5);
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	addi	a1,a1,22
	lla	a2,_ZL5B4016jh
	mv	a0,a1
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a5,joyports
	lw	a4,8(a5)
	beq	a4,zero,.L114
	li	a3,1
	beq	a4,a3,.L120
.L115:
	lw	a4,28(a5)
	beq	a4,zero,.L116
.L122:
	li	a3,1
	beq	a4,a3,.L121
.L117:
	lla	a5,portFC
	lw	a4,4(a5)
	bne	a4,zero,.L113
	lla	a4,_ZL11DummyPortFC
	sw	a4,12(a5)
.L113:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L121:
	.cfi_restore_state
	lla	a4,_ZL3GPC
	sw	a4,36(a5)
	j	.L117
.L120:
	lla	a4,_ZL3GPC
	sw	a4,16(a5)
	lw	a4,28(a5)
	bne	a4,zero,.L122
.L116:
	lla	a4,_ZL10DummyJPort
	sw	a4,36(a5)
	j	.L117
.L114:
	lla	a4,_ZL10DummyJPort
	sw	a4,16(a5)
	j	.L115
	.cfi_endproc
.LFE74:
	.size	_Z15InitializeInputv, .-_Z15InitializeInputv
	.section	.text._Z23FCEUI_SetInputFourscoreb,"ax",@progbits
	.align	2
	.globl	_Z23FCEUI_SetInputFourscoreb
	.hidden	_Z23FCEUI_SetInputFourscoreb
	.type	_Z23FCEUI_SetInputFourscoreb, @function
_Z23FCEUI_SetInputFourscoreb:
.LFB75:
	.cfi_startproc
	la a5, _ZL10FSAttached; sb a0, 0(a5);
	ret
	.cfi_endproc
.LFE75:
	.size	_Z23FCEUI_SetInputFourscoreb, .-_Z23FCEUI_SetInputFourscoreb
	.section	.text.startup._GLOBAL__sub_I_joy,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I_joy, @function
_GLOBAL__sub_I_joy:
.LFB77:
	.cfi_startproc
	lla	a5,joyports
	li	a4,1
	sw	zero,0(a5)
	sw	a4,20(a5)
	ret
	.cfi_endproc
.LFE77:
	.size	_GLOBAL__sub_I_joy, .-_GLOBAL__sub_I_joy
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_joy
	.section	.data._ZL3GPC,"aw"
	.align	2
	.type	_ZL3GPC, @object
	.size	_ZL3GPC, 24
_ZL3GPC:
	.word	_ZL6ReadGPi
	.word	0
	.word	_ZL8StrobeGPi
	.word	_ZL8UpdateGPiPvi
	.word	0
	.word	0
	.section	.bss._ZL11DummyPortFC,"aw",@nobits
	.align	2
	.type	_ZL11DummyPortFC, @object
	.size	_ZL11DummyPortFC, 24
_ZL11DummyPortFC:
	.zero	24
	.section	.bss._ZL10DummyJPort,"aw",@nobits
	.align	2
	.type	_ZL10DummyJPort, @object
	.size	_ZL10DummyJPort, 24
_ZL10DummyJPort:
	.zero	24
	.hidden	portFC
	.globl	portFC
	.section	.bss.portFC,"aw",@nobits
	.align	2
	.type	portFC, @object
	.size	portFC, 16
portFC:
	.zero	16
	.hidden	joyports
	.globl	joyports
	.section	.bss.joyports,"aw",@nobits
	.align	2
	.type	joyports, @object
	.size	joyports, 40
joyports:
	.zero	40
	.section	.sbss._ZL10FSAttached,"aw",@nobits
	.type	_ZL10FSAttached, @object
	.size	_ZL10FSAttached, 1
_ZL10FSAttached:
	.zero	1
	.hidden	RawReg4016
	.globl	RawReg4016
	.section	.sbss.RawReg4016,"aw",@nobits
	.type	RawReg4016, @object
	.size	RawReg4016, 1
RawReg4016:
	.zero	1
	.section	.sbss._ZL10LastStrobe,"aw",@nobits
	.type	_ZL10LastStrobe, @object
	.size	_ZL10LastStrobe, 1
_ZL10LastStrobe:
	.zero	1
	.hidden	snesjoy
	.globl	snesjoy
	.section	.sbss.snesjoy,"aw",@nobits
	.align	2
	.type	snesjoy, @object
	.size	snesjoy, 8
snesjoy:
	.zero	8
	.hidden	joy
	.globl	joy
	.section	.sbss.joy,"aw",@nobits
	.align	2
	.type	joy, @object
	.size	joy, 4
joy:
	.zero	4
	.section	.sbss._ZL11joy_readbit,"aw",@nobits
	.align	2
	.type	_ZL11joy_readbit, @object
	.size	_ZL11joy_readbit, 2
_ZL11joy_readbit:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
