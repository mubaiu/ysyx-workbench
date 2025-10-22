#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"multi3.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text.__muldi3,"ax",@progbits
	.align	2
	.globl	__muldi3
	.type	__muldi3, @function
__muldi3:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	mv	t1,a0
	mv	a0,a2
	mv	a2,a1
	mv	t0,a3
	sw	ra,20(sp)
	sw	s0,16(sp)
	sw	s1,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	a4,t1
	mv	a3,a0
	li	a5,0
	li	a1,0
	li	t2,0
	sw	t1,0(sp)
	sw	a2,4(sp)
	sw	a0,8(sp)
.L5:
	add	a2,a4,t2
	andi	t1,a3,1
	add	s0,a1,a5
	srli	a0,a4,31
	srli	a3,a3,1
	sltu	s1,a2,a4
	slli	a5,a5,1
	beq	t1,zero,.L2
	mv	t2,a2
	add	a1,s1,s0
.L2:
	slli	a4,a4,1
	or	a5,a5,a0
	bne	a3,zero,.L5
	lw	a2,4(sp)
	lw	t1,0(sp)
	lw	a0,8(sp)
	mv	a5,a1
	beq	a2,zero,.L6
	mv	a1,a2
#APP
# 80 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/libgcc/multi3.c" 1
	call __mulsi3
# 0 "" 2
#NO_APP
	add	a5,a0,a5
.L6:
	beq	t0,zero,.L7
	mv	a0,t1
	mv	a1,t0
#APP
# 83 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/libgcc/multi3.c" 1
	call __mulsi3
# 0 "" 2
#NO_APP
	add	a5,a0,a5
.L7:
	lw	ra,20(sp)
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	lw	s1,12(sp)
	.cfi_restore 9
	mv	a0,t2
	mv	a1,a5
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	__muldi3, .-__muldi3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
