#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"multi3.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__muldi3,"ax",@progbits
	.align	2
	.globl	__muldi3
	.type	__muldi3, @function
__muldi3:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	mv	a0,a2
	mv	t2,a3
	mv	a4,s0
	mv	a6,a2
	li	a5,0
	li	t1,0
	li	t5,0
.L5:
	add	a7,a4,t5
	andi	t4,a6,1
	add	t6,t1,a5
	srli	t3,a4,31
	srli	a6,a6,1
	sltu	t0,a7,a4
	slli	a5,a5,1
	beq	t4,zero,.L2
	mv	t5,a7
	add	t1,t0,t6
.L2:
	slli	a4,a4,1
	or	a5,a5,t3
	bne	a6,zero,.L5
	beq	a1,zero,.L6
#APP
# 80 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/libgcc/multi3.c" 1
	call __mulsi3
# 0 "" 2
#NO_APP
	add	t1,a0,t1
.L6:
	beq	t2,zero,.L7
	mv	a0,s0
	mv	a1,t2
#APP
# 83 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/libgcc/multi3.c" 1
	call __mulsi3
# 0 "" 2
#NO_APP
	add	t1,a0,t1
.L7:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	mv	a0,t5
	mv	a1,t1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	__muldi3, .-__muldi3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
