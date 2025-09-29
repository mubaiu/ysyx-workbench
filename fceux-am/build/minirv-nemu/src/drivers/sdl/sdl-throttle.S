#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-throttle.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z18RefreshThrottleFPSv,"ax",@progbits
	.align	2
	.globl	_Z18RefreshThrottleFPSv
	.hidden	_Z18RefreshThrottleFPSv
	.type	_Z18RefreshThrottleFPSv, @function
_Z18RefreshThrottleFPSv:
.LFB45:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z19FCEUI_GetDesiredFPSv
	la a5, _ZL11desired_fps; sw a0, 0(a5);
	lla	a5,_ZL8Lasttime
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	lla	a5,_ZL8Nexttime
	sw	a3,0(a5)
	sw	a4,4(a5)
	la a5, _ZL7InFrame; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE45:
	.size	_Z18RefreshThrottleFPSv, .-_Z18RefreshThrottleFPSv
	.globl	__divsi3
	.section	.text._Z13SpeedThrottlev,"ax",@progbits
	.align	2
	.globl	_Z13SpeedThrottlev
	.hidden	_Z13SpeedThrottlev
	.type	_Z13SpeedThrottlev, @function
_Z13SpeedThrottlev:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	lla	s3,_ZL8Lasttime
	sw	s2,16(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	call	_Z13FCEUD_GetTimev
	lw	a5,0(s3)
	lw	a4,4(s3)
	mv	s1,a0
	mv	s0,a1
	or	a5,a5,a4
	bne	a5,zero,.L5
	sw	a0,0(s3)
	sw	a1,4(s3)
.L5:
	lla	s5,_ZL7InFrame
	lw	a5,0(s5)
	beq	a5,zero,.L6
	lla	a5,_ZL8Nexttime
	lw	a4,0(a5)
	lw	a5,4(a5)
.L7:
	bgtu	a5,s0,.L18
	beq	a5,s0,.L23
.L15:
	li	s4,0
	li	s2,0
.L8:
	la a5, _ZL7InFrame; sw zero, 0(a5);
.L20:
	call	_Z13FCEUD_GetTimev
	sub	a4,a0,s1
	sgtu	a3,a4,a0
	sub	a5,a1,s0
	sub	a5,a5,a3
	bgtu	s2,a5,.L20
	bne	s2,a5,.L19
	bgtu	s4,a4,.L20
.L19:
	lw	a5,0(s5)
	beq	a5,zero,.L24
	li	a5,1
.L4:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L23:
	.cfi_restore_state
	bleu	a4,s1,.L15
.L18:
	sub	s4,a4,s1
	sgtu	a4,s4,a4
	sub	a5,a5,s0
	sub	s2,a5,a4
	beq	a5,a4,.L25
	li	s4,50
	li	s2,0
	j	.L20
.L6:
	li	a5,1
	sw	a5,0(s5)
	la a1, _ZL11desired_fps; lw a1, 0(a1);
	li	a0,1000
	call	__divsi3
	lw	a4,0(s3)
	lw	a2,4(s3)
	srai	a3,a0,31
	add	a4,a0,a4
	add	a3,a3,a2
	sltu	a5,a4,a0
	lla	a2,_ZL8Nexttime
	add	a5,a5,a3
	sw	a4,0(a2)
	sw	a5,4(a2)
	j	.L7
.L25:
	li	a5,50
	bleu	s4,a5,.L8
	li	s4,50
	li	s2,0
	j	.L20
.L24:
	sw	a0,0(s3)
	sw	a1,4(s3)
	j	.L4
	.cfi_endproc
.LFE46:
	.size	_Z13SpeedThrottlev, .-_Z13SpeedThrottlev
	.section	.sbss._ZL7InFrame,"aw",@nobits
	.align	2
	.type	_ZL7InFrame, @object
	.size	_ZL7InFrame, 4
_ZL7InFrame:
	.zero	4
	.section	.sbss._ZL11desired_fps,"aw",@nobits
	.align	2
	.type	_ZL11desired_fps, @object
	.size	_ZL11desired_fps, 4
_ZL11desired_fps:
	.zero	4
	.section	.sbss._ZL8Nexttime,"aw",@nobits
	.align	3
	.type	_ZL8Nexttime, @object
	.size	_ZL8Nexttime, 8
_ZL8Nexttime:
	.zero	8
	.section	.sbss._ZL8Lasttime,"aw",@nobits
	.align	3
	.type	_ZL8Lasttime, @object
	.size	_ZL8Lasttime, 8
_ZL8Lasttime:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
