#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vm.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.globl	__umodsi3
	.section	.text.simple_pgalloc,"ax",@progbits
	.align	2
	.globl	simple_pgalloc
	.hidden	simple_pgalloc
	.type	simple_pgalloc, @function
simple_pgalloc:
.LFB0:
	.cfi_startproc
	lla	a5,st
	lw	a4,0(a5)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	bne	a4,zero,.L2
	la a4, heap; lw a4, 0(a4);
.L2:
	mv	a0,a4
	mv	a1,s0
	sw	a4,0(sp)
	call	__umodsi3
	lw	a4,0(sp)
	beq	a0,zero,.L3
	sw	s1,4(sp)
	.cfi_offset 9, -12
	addi	s1,a4,1
.L4:
	mv	a0,s1
	mv	a1,s0
	call	__umodsi3
	mv	a4,s1
	addi	s1,s1,1
	bne	a0,zero,.L4
	lw	s1,4(sp)
	.cfi_restore 9
.L3:
	add	s0,s0,a4
	lla	a5,st
	lw	ra,12(sp)
	.cfi_restore 1
	sw	s0,0(a5)
	lw	s0,8(sp)
	.cfi_restore 8
	mv	a0,a4
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	simple_pgalloc, .-simple_pgalloc
	.section	.text.simple_pgfree,"ax",@progbits
	.align	2
	.globl	simple_pgfree
	.hidden	simple_pgfree
	.type	simple_pgfree, @function
simple_pgfree:
.LFB1:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE1:
	.size	simple_pgfree, .-simple_pgfree
	.section	.rodata.vm_handler.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"[read fail]"
	.align	2
.LC1:
	.string	""
	.align	2
.LC2:
	.string	"[write fail]"
	.align	2
.LC3:
	.string	"==== interrupt (%s)  ====\n"
	.align	2
.LC4:
	.string	"PF: %x %s%s%s\n"
	.align	2
.LC5:
	.string	"%d "
	.align	2
.LC6:
	.string	"/home/mubai/ysyx-workbench/am-kernels/tests/am-tests/src/tests/vm.c"
	.align	2
.LC7:
	.string	"Assertion fail at %s:%d\n"
	.section	.text.vm_handler,"ax",@progbits
	.align	2
	.globl	vm_handler
	.hidden	vm_handler
	.type	vm_handler, @function
vm_handler:
.LFB2:
	.cfi_startproc
	lw	a5,0(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	li	a4,3
	lw	a2,4(a0)
	mv	s0,a1
	beq	a5,a4,.L13
	bgtu	a5,a4,.L14
	li	a4,1
	beq	a5,a4,.L15
	li	a4,2
	bne	a5,a4,.L17
	li	a0,1
	call	iset
	sw	zero,0(sp)
	lw	a5,0(sp)
	li	a4,999424
	addi	a4,a4,575
	bgt	a5,a4,.L20
.L21:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	lw	a5,0(sp)
	ble	a5,a4,.L21
.L20:
	lw	a1,0(s0)
	lla	a0,.LC5
	call	printf
.L15:
	la a5, first_trap; lw a5, 0(a5);
	beq	a5,zero,.L22
.L32:
	la a5, first_trap; sw zero, 0(a5);
	la s0, uctx; lw s0, 0(s0);
.L22:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_restore_state
	addi	a5,a5,-5
	li	a4,1
	bgtu	a5,a4,.L17
	lw	a1,12(a0)
	lla	a0,.LC3
	call	printf
	la a5, first_trap; lw a5, 0(a5);
	beq	a5,zero,.L22
	j	.L32
.L13:
	andi	a5,a2,1
	lw	a1,8(a0)
	lla	a3,.LC1
	beq	a5,zero,.L18
	lla	a3,.LC0
.L18:
	andi	a2,a2,2
	lla	a4,.LC1
	beq	a2,zero,.L19
	lla	a4,.LC2
.L19:
	lla	a2,.LC1
	lla	a0,.LC4
	call	printf
	la a5, first_trap; lw a5, 0(a5);
	beq	a5,zero,.L22
	j	.L32
.L17:
	li	a2,40
	lla	a1,.LC6
	lla	a0,.LC7
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE2:
	.size	vm_handler, .-vm_handler
	.section	.rodata.vm_test.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"x86"
	.align	2
.LC9:
	.string	"minirv"
	.align	2
.LC10:
	.string	"native"
	.align	2
.LC11:
	.string	"Not supported architecture.\n"
	.align	2
.LC12:
	.string	"Protected address space: [%p, %p)\n"
	.align	2
.LC13:
	.string	"Code copied to %p (physical %p) execute\n"
	.section	.text.vm_test,"ax",@progbits
	.align	2
	.globl	vm_test
	.hidden	vm_test
	.type	vm_test, @function
vm_test:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	li	a2,3
	lla	a1,.LC8
	lla	a0,.LC9
	sw	ra,20(sp)
	.cfi_offset 1, -4
	call	strncmp
	beq	a0,zero,.L34
	lla	a1,.LC10
	lla	a0,.LC9
	call	strcmp
	bne	a0,zero,.L50
.L34:
	lla	a0,prot
	sw	s0,16(sp)
	sw	s1,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,prot
	call	protect
	lw	a2,8(s0)
	lw	a1,4(s0)
	lla	a0,.LC12
	call	printf
	lw	a4,4(s0)
	lw	a5,8(s0)
	lla	a3,st
	lw	s1,0(a3)
	sub	a5,a5,a4
	srli	a5,a5,1
	add	a5,a5,a4
	sw	a5,0(sp)
	lw	s0,0(s0)
	bne	s1,zero,.L49
	la s1, heap; lw s1, 0(s1);
	mv	a1,s0
	mv	a0,s1
	call	__umodsi3
	beq	a0,zero,.L51
.L37:
	addi	s1,s1,1
.L49:
	mv	a1,s0
	mv	a0,s1
	call	__umodsi3
	bne	a0,zero,.L37
.L51:
	lla	a5,st
	add	s0,s0,s1
	li	a2,15
	lla	a1,code
	mv	a0,s1
	sw	s0,0(a5)
	call	memcpy
	lw	s0,0(sp)
	li	a3,3
	mv	a2,s1
	mv	a1,s0
	lla	a0,prot
	call	map
	mv	a2,s1
	mv	a1,s0
	lla	a0,.LC13
	call	printf
	mv	a3,s0
	lla	a1,stack.0
	lla	a2,stack.0+4096
	lla	a0,prot
	call	ucontext
	mv	a5,a0
	li	a0,1
	la a4, uctx; sw a5, 0(a4);
	call	iset
	lw	s0,16(sp)
	.cfi_restore 8
	lw	s1,12(sp)
	.cfi_restore 9
	lw	ra,20(sp)
	.cfi_restore 1
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	yield
.L50:
	.cfi_def_cfa_offset 24
	.cfi_offset 1, -4
	lw	ra,20(sp)
	.cfi_restore 1
	lla	a0,.LC11
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE3:
	.size	vm_test, .-vm_test
	.section	.bss.stack.0,"aw",@nobits
	.align	2
	.type	stack.0, @object
	.size	stack.0, 4096
stack.0:
	.zero	4096
	.hidden	code
	.globl	code
	.section	.data.code,"aw"
	.align	2
	.type	code, @object
	.size	code, 15
code:
	.string	"1\300\215\266"
	.string	""
	.string	""
	.string	""
	.ascii	"\203\300\001\315\200\353\371"
	.section	.sdata.first_trap,"aw"
	.align	2
	.type	first_trap, @object
	.size	first_trap, 4
first_trap:
	.word	1
	.section	.sbss.st,"aw",@nobits
	.align	2
	.type	st, @object
	.size	st, 4
st:
	.zero	4
	.section	.bss.prot,"aw",@nobits
	.align	2
	.type	prot, @object
	.size	prot, 16
prot:
	.zero	16
	.section	.sbss.uctx,"aw",@nobits
	.align	2
	.type	uctx, @object
	.size	uctx, 4
uctx:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
