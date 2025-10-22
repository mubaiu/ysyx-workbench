#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"timer.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.__am_timer_init,"ax",@progbits
	.align	2
	.globl	__am_timer_init
	.hidden	__am_timer_init
	.type	__am_timer_init, @function
__am_timer_init:
.LFB12:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE12:
	.size	__am_timer_init, .-__am_timer_init
	.globl	__udivdi3
	.section	.text.__am_timer_uptime,"ax",@progbits
	.align	2
	.globl	__am_timer_uptime
	.hidden	__am_timer_uptime
	.type	__am_timer_uptime, @function
__am_timer_uptime:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
#APP
# 20 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a1, mcycleh
# 0 "" 2
# 21 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/timer.c" 1
	csrr a0, mcycle
# 0 "" 2
#NO_APP
	li	a2,5
	li	a3,0
	call	__udivdi3
	lw	ra,8(sp)
	.cfi_restore 1
	sw	a0,0(s0)
	sw	a1,4(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	__am_timer_uptime, .-__am_timer_uptime
	.section	.text.__am_timer_rtc,"ax",@progbits
	.align	2
	.globl	__am_timer_rtc
	.hidden	__am_timer_rtc
	.type	__am_timer_rtc, @function
__am_timer_rtc:
.LFB14:
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
.LFE14:
	.size	__am_timer_rtc, .-__am_timer_rtc
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
