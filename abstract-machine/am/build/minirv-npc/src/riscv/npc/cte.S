#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cte.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.__am_irq_handle.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text.__am_irq_handle,"ax",@progbits
	.align	2
	.globl	__am_irq_handle
	.hidden	__am_irq_handle
	.type	__am_irq_handle, @function
__am_irq_handle:
.LFB6:
	.cfi_startproc
	la a4, user_handler; lw a4, 0(a4);
	mv	a1,a0
	beq	a4,zero,.L5
	lw	a2,64(a0)
	addi	sp,sp,-44
	.cfi_def_cfa_offset 44
	sw	ra,40(sp)
	.cfi_offset 1, -4
	sw	zero,20(sp)
	sw	zero,24(sp)
	sw	zero,28(sp)
	li	a5,11
	li	a3,4
	beq	a2,a5,.L12
.L3:
	lw	a5,72(a1)
	mv	a0,sp
	addi	a5,a5,4
	sw	a5,72(a1)
	lw	a5,20(sp)
	sw	a3,0(sp)
	sw	a5,4(sp)
	lw	a5,24(sp)
	sw	a5,8(sp)
	lw	a5,28(sp)
	sw	a5,12(sp)
	jalr	a4
	beq	a0,zero,.L13
	lw	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,44
	.cfi_def_cfa_offset 0
	jr	ra
.L12:
	.cfi_restore_state
	li	a3,1
	j	.L3
.L5:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	ret
.L13:
	.cfi_def_cfa_offset 44
	.cfi_offset 1, -4
	li	a2,16
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE6:
	.size	__am_irq_handle, .-__am_irq_handle
	.section	.text.cte_init,"ax",@progbits
	.align	2
	.globl	cte_init
	.hidden	cte_init
	.type	cte_init, @function
cte_init:
.LFB7:
	.cfi_startproc
	mv	a5,a0
	lla	a4,__am_asm_trap
#APP
# 25 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c" 1
	csrw mtvec, a4
# 0 "" 2
#NO_APP
	li	a0,1
	la a4, user_handler; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE7:
	.size	cte_init, .-cte_init
	.section	.text.kcontext,"ax",@progbits
	.align	2
	.globl	kcontext
	.hidden	kcontext
	.type	kcontext, @function
kcontext:
.LFB8:
	.cfi_startproc
	li	a5,8192
	addi	a5,a5,-2048
	addi	sp,sp,-8
	.cfi_def_cfa_offset 8
	sw	a5,-12(a1)
	sw	zero,-16(a1)
	sw	a2,-8(a1)
	sw	a1,-72(a1)
	sw	a3,-40(a1)
	sw	zero,-4(a1)
	addi	a0,a1,-80
	addi	sp,sp,8
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	kcontext, .-kcontext
	.section	.text.yield,"ax",@progbits
	.align	2
	.globl	yield
	.hidden	yield
	.type	yield, @function
yield:
.LFB9:
	.cfi_startproc
#APP
# 46 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/npc/cte.c" 1
	li a5, -1; ecall
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE9:
	.size	yield, .-yield
	.section	.text.ienabled,"ax",@progbits
	.align	2
	.globl	ienabled
	.hidden	ienabled
	.type	ienabled, @function
ienabled:
.LFB10:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE10:
	.size	ienabled, .-ienabled
	.section	.text.iset,"ax",@progbits
	.align	2
	.globl	iset
	.hidden	iset
	.type	iset, @function
iset:
.LFB11:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE11:
	.size	iset, .-iset
	.section	.sbss.user_handler,"aw",@nobits
	.align	2
	.type	user_handler, @object
	.size	user_handler, 4
user_handler:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
