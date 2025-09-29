#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"main.c"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Usage: make run mainargs=*\n"
	.align	2
.LC1:
	.string	"  %c: %s\n"
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	lbu	a5,0(a0)
	li	a4,21
	addi	a5,a5,-97
	andi	a5,a5,0xff
	.cfi_offset 1, -4
	bgtu	a5,a4,.L2
	lla	a4,.L4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.main,"a",@progbits
	.align	2
	.align	2
.L4:
	.word	.L12-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L11-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L10-.L4
	.word	.L9-.L4
	.word	.L2-.L4
	.word	.L8-.L4
	.word	.L2-.L4
	.word	.L7-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L6-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L2-.L4
	.word	.L5-.L4
	.word	.L2-.L4
	.word	.L3-.L4
	.section	.text.startup.main
.L2:
	lla	a0,.LC0
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	li	s0,0
	call	printf
	lla	s1,tests
.L15:
	lw	a2,0(s1)
	beq	a2,zero,.L14
	mv	a1,s0
	lla	a0,.LC1
	call	printf
.L14:
	addi	s0,s0,1
	li	a4,256
	addi	s1,s1,4
	bne	s0,a4,.L15
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
.L13:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L12:
	.cfi_restore_state
	lla	a5,audio_test
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	call	audio_test
	j	.L13
.L11:
	lla	a5,devscan
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	call	devscan
	j	.L13
.L10:
	lla	a5,hello
	la a4, entry; sw a5, 0(a4);
	call	hello
	j	.L13
.L9:
	lla	a5,hello_intr
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	lla	a0,simple_trap
	call	cte_init
	call	hello_intr
	j	.L13
.L8:
	lla	a5,keyboard_test
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	call	keyboard_test
	j	.L13
.L7:
	lla	a5,mp_print
	mv	a0,a5
	la a4, entry; sw a5, 0(a4);
	call	mpe_init
	call	mp_print
	j	.L13
.L6:
	lla	a5,vm_test
	lla	a0,vm_handler
	la a4, entry; sw a5, 0(a4);
	call	cte_init
	lla	a1,simple_pgfree
	lla	a0,simple_pgalloc
	call	vme_init
	call	vm_test
	j	.L13
.L5:
	lla	a5,rtc_test
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	call	rtc_test
	j	.L13
.L3:
	lla	a5,video_test
	la a4, entry; sw a5, 0(a4);
	call	ioe_init
	call	video_test
	j	.L13
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"display this help message"
	.align	2
.LC3:
	.string	"audio test"
	.align	2
.LC4:
	.string	"scan devices"
	.align	2
.LC5:
	.string	"hello"
	.align	2
.LC6:
	.string	"interrupt/yield test"
	.align	2
.LC7:
	.string	"readkey test"
	.align	2
.LC8:
	.string	"multiprocessor test"
	.align	2
.LC9:
	.string	"x86 virtual memory test"
	.align	2
.LC10:
	.string	"real-time clock test"
	.align	2
.LC11:
	.string	"display test"
	.section	.rodata.tests,"a"
	.align	2
	.type	tests, @object
	.size	tests, 1024
tests:
	.zero	288
	.word	.LC2
	.zero	96
	.word	.LC3
	.zero	8
	.word	.LC4
	.zero	12
	.word	.LC5
	.word	.LC6
	.zero	4
	.word	.LC7
	.zero	4
	.word	.LC8
	.zero	8
	.word	.LC9
	.zero	12
	.word	.LC10
	.zero	4
	.word	.LC11
	.zero	548
	.hidden	entry
	.globl	entry
	.section	.sbss.entry,"aw",@nobits
	.align	2
	.type	entry, @object
	.size	entry, 4
entry:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
