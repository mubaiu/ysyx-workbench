#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-sound.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata._Z9InitSoundv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"minirv-nemu"
	.align	2
.LC1:
	.string	"WARNING: %s does not support audio\n"
	.section	.text._Z9InitSoundv,"ax",@progbits
	.align	2
	.globl	_Z9InitSoundv
	.hidden	_Z9InitSoundv
	.type	_Z9InitSoundv, @function
_Z9InitSoundv:
.LFB45:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a1,sp,4
	li	a0,14
	sw	ra,28(sp)
	.cfi_offset 1, -4
	call	ioe_read
	lbu	a5,4(sp)
	beq	a5,zero,.L6
	li	a5,1411
	sw	s0,24(sp)
	.cfi_offset 8, -8
	la a4, _ZL12s_BufferSize; sw a5, 0(a4);
	li	s0,12288
	li	a5,1
	addi	a1,sp,4
	addi	s0,s0,-1263
	sw	a5,8(sp)
	li	a0,15
	li	a5,512
	sw	a5,12(sp)
	sw	s0,4(sp)
	call	ioe_write
	li	a0,150
	call	_Z20FCEUI_SetSoundVolumej
	li	a0,0
	call	_Z21FCEUI_SetSoundQualityi
	mv	a0,s0
	call	_Z11FCEUI_Soundi
	li	a0,256
	call	_Z23FCEUI_SetTriangleVolumej
	li	a0,256
	call	_Z22FCEUI_SetSquare1Volumej
	li	a0,256
	call	_Z22FCEUI_SetSquare2Volumej
	li	a0,256
	call	_Z20FCEUI_SetNoiseVolumej
	li	a0,256
	call	_Z18FCEUI_SetPCMVolumej
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	li	a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L6:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	lw	ra,28(sp)
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE45:
	.size	_Z9InitSoundv, .-_Z9InitSoundv
	.section	.text._Z11GetMaxSoundv,"ax",@progbits
	.align	2
	.globl	_Z11GetMaxSoundv
	.hidden	_Z11GetMaxSoundv
	.type	_Z11GetMaxSoundv, @function
_Z11GetMaxSoundv:
.LFB46:
	.cfi_startproc
	la a0, _ZL12s_BufferSize; lw a0, 0(a0);
	ret
	.cfi_endproc
.LFE46:
	.size	_Z11GetMaxSoundv, .-_Z11GetMaxSoundv
	.section	.text._Z13GetWriteSoundv,"ax",@progbits
	.align	2
	.globl	_Z13GetWriteSoundv
	.hidden	_Z13GetWriteSoundv
	.type	_Z13GetWriteSoundv, @function
_Z13GetWriteSoundv:
.LFB47:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a1,sp,12
	li	a0,16
	sw	ra,28(sp)
	.cfi_offset 1, -4
	call	ioe_read
	lw	a5,12(sp)
	lw	ra,28(sp)
	.cfi_restore 1
	la a0, _ZL12s_BufferSize; lw a0, 0(a0);
	srli	a5,a5,1
	sub	a0,a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE47:
	.size	_Z13GetWriteSoundv, .-_Z13GetWriteSoundv
	.section	.rodata._Z10WriteSoundPii.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/drivers/sdl/sdl-sound.cpp"
	.align	2
.LC3:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z10WriteSoundPii,"ax",@progbits
	.align	2
	.globl	_Z10WriteSoundPii
	.hidden	_Z10WriteSoundPii
	.type	_Z10WriteSoundPii, @function
_Z10WriteSoundPii:
.LFB48:
	.cfi_startproc
	la a5, EmulationPaused; lw a5, 0(a5);
	bne	a5,zero,.L29
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	li	a5,4096
	sw	s1,36(sp)
	sw	ra,44(sp)
	addi	a5,a5,-1537
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a1
	bgt	a1,a5,.L12
	ble	a1,zero,.L32
	slli	a3,a1,2
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	lla	a5,_ZZ10WriteSoundPiiE5buf16
	add	a3,a0,a3
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
.L15:
	lw	a4,0(a0)
	addi	a0,a0,4
	addi	a5,a5,2
	sh	a4,-2(a5)
	bne	a0,a3,.L15
.L16:
	lla	s4,_ZZ10WriteSoundPiiE5buf16
	lla	s0,_ZL12s_BufferSize
.L17:
	addi	a1,sp,8
	li	a0,16
	call	ioe_read
	lw	a5,8(sp)
	lw	a4,0(s0)
	srli	a5,a5,1
	sub	a3,a4,a5
	beq	a4,a5,.L17
	mv	s3,s1
	ble	s1,a3,.L18
	mv	s3,a3
.L18:
	slli	s2,s3,1
	add	s2,s4,s2
	addi	a1,sp,8
	li	a0,17
	sub	s1,s1,s3
	sw	s4,8(sp)
	sw	s2,12(sp)
	call	ioe_write
	beq	s1,zero,.L33
	mv	s4,s2
	j	.L17
.L29:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	ret
.L33:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
.L10:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L32:
	.cfi_restore_state
	beq	a1,zero,.L10
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	.cfi_remember_state
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	j	.L16
.L12:
	.cfi_restore_state
	li	a2,120
	lla	a1,.LC2
	lla	a0,.LC3
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE48:
	.size	_Z10WriteSoundPii, .-_Z10WriteSoundPii
	.section	.text._Z12SilenceSoundi,"ax",@progbits
	.align	2
	.globl	_Z12SilenceSoundi
	.hidden	_Z12SilenceSoundi
	.type	_Z12SilenceSoundi, @function
_Z12SilenceSoundi:
.LFB54:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE54:
	.size	_Z12SilenceSoundi, .-_Z12SilenceSoundi
	.section	.text._Z9KillSoundv,"ax",@progbits
	.align	2
	.globl	_Z9KillSoundv
	.hidden	_Z9KillSoundv
	.type	_Z9KillSoundv, @function
_Z9KillSoundv:
.LFB50:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z11FCEUI_Soundi
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	_Z9KillSoundv, .-_Z9KillSoundv
	.section	.text._Z23FCEUD_SoundVolumeAdjusti,"ax",@progbits
	.align	2
	.globl	_Z23FCEUD_SoundVolumeAdjusti
	.hidden	_Z23FCEUD_SoundVolumeAdjusti
	.type	_Z23FCEUD_SoundVolumeAdjusti, @function
_Z23FCEUD_SoundVolumeAdjusti:
.LFB51:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE51:
	.size	_Z23FCEUD_SoundVolumeAdjusti, .-_Z23FCEUD_SoundVolumeAdjusti
	.section	.text._Z17FCEUD_SoundTogglev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_SoundTogglev
	.hidden	_Z17FCEUD_SoundTogglev
	.type	_Z17FCEUD_SoundTogglev, @function
_Z17FCEUD_SoundTogglev:
.LFB52:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE52:
	.size	_Z17FCEUD_SoundTogglev, .-_Z17FCEUD_SoundTogglev
	.section	.bss._ZZ10WriteSoundPiiE5buf16,"aw",@nobits
	.align	2
	.type	_ZZ10WriteSoundPiiE5buf16, @object
	.size	_ZZ10WriteSoundPiiE5buf16, 5120
_ZZ10WriteSoundPiiE5buf16:
	.zero	5120
	.section	.sbss._ZL12s_BufferSize,"aw",@nobits
	.align	2
	.type	_ZL12s_BufferSize, @object
	.size	_ZL12s_BufferSize, 4
_ZL12s_BufferSize:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
