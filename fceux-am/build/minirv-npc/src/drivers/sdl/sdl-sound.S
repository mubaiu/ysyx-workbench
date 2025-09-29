#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl-sound.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z9InitSoundv,"ax",@progbits
	.align	2
	.globl	_Z9InitSoundv
	.hidden	_Z9InitSoundv
	.type	_Z9InitSoundv, @function
_Z9InitSoundv:
.LFB45:
	.cfi_startproc
	li	a0,1
	ret
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
	li	a0,0
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
	li	a0,0
	ret
	.cfi_endproc
.LFE47:
	.size	_Z13GetWriteSoundv, .-_Z13GetWriteSoundv
	.section	.text._Z10WriteSoundPii,"ax",@progbits
	.align	2
	.globl	_Z10WriteSoundPii
	.hidden	_Z10WriteSoundPii
	.type	_Z10WriteSoundPii, @function
_Z10WriteSoundPii:
.LFB48:
	.cfi_startproc
	ret
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z11FCEUI_Soundi
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
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
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
