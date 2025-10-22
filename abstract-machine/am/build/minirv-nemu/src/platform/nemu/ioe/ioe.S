#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ioe.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_timer_config,"ax",@progbits
	.align	2
	.type	__am_timer_config, @function
__am_timer_config:
.LFB0:
	.cfi_startproc
	li	a5,1
	sb	a5,0(a0)
	sb	a5,1(a0)
	ret
	.cfi_endproc
.LFE0:
	.size	__am_timer_config, .-__am_timer_config
	.section	.text.__am_input_config,"ax",@progbits
	.align	2
	.type	__am_input_config, @function
__am_input_config:
.LFB1:
	.cfi_startproc
	li	a5,1
	sb	a5,0(a0)
	ret
	.cfi_endproc
.LFE1:
	.size	__am_input_config, .-__am_input_config
	.section	.text.__am_uart_config,"ax",@progbits
	.align	2
	.type	__am_uart_config, @function
__am_uart_config:
.LFB2:
	.cfi_startproc
	sb	zero,0(a0)
	ret
	.cfi_endproc
.LFE2:
	.size	__am_uart_config, .-__am_uart_config
	.section	.text.__am_net_config,"ax",@progbits
	.align	2
	.type	__am_net_config, @function
__am_net_config:
.LFB3:
	.cfi_startproc
	sb	zero,0(a0)
	ret
	.cfi_endproc
.LFE3:
	.size	__am_net_config, .-__am_net_config
	.section	.rodata.fail.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"AM Panic: "
	.align	2
.LC1:
	.string	"access nonexist register"
	.align	2
.LC2:
	.string	" @ /home/mubai/ysyx-workbench/abstract-machine/am/src/platform/nemu/ioe/ioe.c:47  \n"
	.section	.text.fail,"ax",@progbits
	.align	2
	.type	fail, @function
fail:
.LFB4:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,.LC0
	li	a0,65
.L7:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L7
	lla	s0,.LC1
	li	a0,97
.L8:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L8
	lla	s0,.LC2
	li	a0,32
.L9:
	call	putch
	lbu	a0,1(s0)
	addi	s0,s0,1
	bne	a0,zero,.L9
	li	a0,1
	call	halt
	.cfi_endproc
.LFE4:
	.size	fail, .-fail
	.section	.text.ioe_init,"ax",@progbits
	.align	2
	.globl	ioe_init
	.hidden	ioe_init
	.type	ioe_init, @function
ioe_init:
.LFB5:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,lut
	lla	a3,lut+512
	lla	a2,fail
	j	.L16
.L15:
	addi	a5,a5,4
	beq	a5,a3,.L19
.L16:
	lw	a4,0(a5)
	bne	a4,zero,.L15
	sw	a2,0(a5)
	addi	a5,a5,4
	bne	a5,a3,.L16
.L19:
	call	__am_gpu_init
	call	__am_timer_init
	call	__am_audio_init
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	ioe_init, .-ioe_init
	.section	.text.ioe_read,"ax",@progbits
	.align	2
	.globl	ioe_read
	.hidden	ioe_read
	.type	ioe_read, @function
ioe_read:
.LFB6:
	.cfi_startproc
	slli	a0,a0,2
	lla	a5,lut
	add	a5,a5,a0
	lw	a5,0(a5)
	mv	a0,a1
	jr	a5
	.cfi_endproc
.LFE6:
	.size	ioe_read, .-ioe_read
	.section	.text.ioe_write,"ax",@progbits
	.align	2
	.globl	ioe_write
	.hidden	ioe_write
	.type	ioe_write, @function
ioe_write:
.LFB9:
	.cfi_startproc
	slli	a0,a0,2
	lla	a5,lut
	add	a5,a5,a0
	lw	a5,0(a5)
	mv	a0,a1
	jr	a5
	.cfi_endproc
.LFE9:
	.size	ioe_write, .-ioe_write
	.section	.data.lut,"aw"
	.align	2
	.type	lut, @object
	.size	lut, 512
lut:
	.zero	4
	.word	__am_uart_config
	.zero	8
	.word	__am_timer_config
	.word	__am_timer_rtc
	.word	__am_timer_uptime
	.word	__am_input_config
	.word	__am_input_keybrd
	.word	__am_gpu_config
	.word	__am_gpu_status
	.word	__am_gpu_fbdraw
	.zero	8
	.word	__am_audio_config
	.word	__am_audio_ctrl
	.word	__am_audio_status
	.word	__am_audio_play
	.word	__am_disk_config
	.word	__am_disk_status
	.word	__am_disk_blkio
	.word	__am_net_config
	.zero	424
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
