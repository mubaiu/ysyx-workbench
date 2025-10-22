#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"timer.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_timer_init,"ax",@progbits
	.align	2
	.globl	__am_timer_init
	.hidden	__am_timer_init
	.type	__am_timer_init, @function
__am_timer_init:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	__am_timer_init, .-__am_timer_init
	.section	.text.__am_timer_uptime,"ax",@progbits
	.align	2
	.globl	__am_timer_uptime
	.hidden	__am_timer_uptime
	.type	__am_timer_uptime, @function
__am_timer_uptime:
.LFB7:
	.cfi_startproc
	li	a5,0
	li	a6,0
	sw	a5,0(a0)
	sw	a6,4(a0)
	ret
	.cfi_endproc
.LFE7:
	.size	__am_timer_uptime, .-__am_timer_uptime
	.section	.text.__am_timer_rtc,"ax",@progbits
	.align	2
	.globl	__am_timer_rtc
	.hidden	__am_timer_rtc
	.type	__am_timer_rtc, @function
__am_timer_rtc:
.LFB8:
	.cfi_startproc
	li	a5,1900
	sw	zero,20(a0)
	sw	zero,16(a0)
	sw	zero,12(a0)
	sw	zero,8(a0)
	sw	zero,4(a0)
	sw	a5,0(a0)
	ret
	.cfi_endproc
.LFE8:
	.size	__am_timer_rtc, .-__am_timer_rtc
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
