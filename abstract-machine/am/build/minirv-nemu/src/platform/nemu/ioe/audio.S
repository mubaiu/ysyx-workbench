#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"audio.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_audio_init,"ax",@progbits
	.align	2
	.globl	__am_audio_init
	.hidden	__am_audio_init
	.type	__am_audio_init, @function
__am_audio_init:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	__am_audio_init, .-__am_audio_init
	.section	.text.__am_audio_config,"ax",@progbits
	.align	2
	.globl	__am_audio_config
	.hidden	__am_audio_config
	.type	__am_audio_config, @function
__am_audio_config:
.LFB7:
	.cfi_startproc
	sb	zero,0(a0)
	ret
	.cfi_endproc
.LFE7:
	.size	__am_audio_config, .-__am_audio_config
	.section	.text.__am_audio_ctrl,"ax",@progbits
	.align	2
	.globl	__am_audio_ctrl
	.hidden	__am_audio_ctrl
	.type	__am_audio_ctrl, @function
__am_audio_ctrl:
.LFB8:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE8:
	.size	__am_audio_ctrl, .-__am_audio_ctrl
	.section	.text.__am_audio_status,"ax",@progbits
	.align	2
	.globl	__am_audio_status
	.hidden	__am_audio_status
	.type	__am_audio_status, @function
__am_audio_status:
.LFB9:
	.cfi_startproc
	sw	zero,0(a0)
	ret
	.cfi_endproc
.LFE9:
	.size	__am_audio_status, .-__am_audio_status
	.section	.text.__am_audio_play,"ax",@progbits
	.align	2
	.globl	__am_audio_play
	.hidden	__am_audio_play
	.type	__am_audio_play, @function
__am_audio_play:
.LFB12:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE12:
	.size	__am_audio_play, .-__am_audio_play
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
