#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"vme.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.vme_init,"ax",@progbits
	.align	2
	.globl	vme_init
	.hidden	vme_init
	.type	vme_init, @function
vme_init:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	mv	a5,a0
	li	a0,4096
	la a4, pgalloc_usr; sw a5, 0(a4);
	jalr	a5
	la a4, kas+12; sw a0, 0(a4);
	srli	a5,a0,12
	li	a4,-2147483648
	or	a5,a5,a4
#APP
# 18 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/nemu/vme.c" 1
	csrw satp, a5
# 0 "" 2
#NO_APP
	lw	ra,12(sp)
	.cfi_restore 1
	li	a5,1
	la a4, vme_enable; sw a5, 0(a4);
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	vme_init, .-vme_init
	.section	.text.protect,"ax",@progbits
	.align	2
	.globl	protect
	.hidden	protect
	.type	protect, @function
protect:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	la a5, pgalloc_usr; lw a5, 0(a5);
	li	a0,4096
	jalr	a5
	li	a5,1073741824
	sw	a5,4(s0)
	li	a5,-2147483648
	sw	a5,8(s0)
	li	a5,4096
	sw	a0,12(s0)
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a1, kas+12; lw a1, 0(a1);
	li	a2,4096
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	memcpy
	.cfi_endproc
.LFE9:
	.size	protect, .-protect
	.section	.text.unprotect,"ax",@progbits
	.align	2
	.globl	unprotect
	.hidden	unprotect
	.type	unprotect, @function
unprotect:
.LFB10:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE10:
	.size	unprotect, .-unprotect
	.section	.text.__am_get_cur_as,"ax",@progbits
	.align	2
	.globl	__am_get_cur_as
	.hidden	__am_get_cur_as
	.type	__am_get_cur_as, @function
__am_get_cur_as:
.LFB11:
	.cfi_startproc
	la a4, vme_enable; lw a4, 0(a4);
	li	a5,0
	beq	a4,zero,.L8
#APP
# 23 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/nemu/vme.c" 1
	csrr a5, satp
# 0 "" 2
#NO_APP
	slli	a5,a5,12
.L8:
	sw	a5,140(a0)
	ret
	.cfi_endproc
.LFE11:
	.size	__am_get_cur_as, .-__am_get_cur_as
	.section	.text.__am_switch,"ax",@progbits
	.align	2
	.globl	__am_switch
	.hidden	__am_switch
	.type	__am_switch, @function
__am_switch:
.LFB12:
	.cfi_startproc
	la a5, vme_enable; lw a5, 0(a5);
	beq	a5,zero,.L11
	lw	a5,140(a0)
	beq	a5,zero,.L11
	li	a4,-2147483648
	srli	a5,a5,12
	or	a5,a5,a4
#APP
# 18 "/home/mubai/ysyx-workbench/abstract-machine/am/src/riscv/nemu/vme.c" 1
	csrw satp, a5
# 0 "" 2
#NO_APP
.L11:
	ret
	.cfi_endproc
.LFE12:
	.size	__am_switch, .-__am_switch
	.section	.text.map,"ax",@progbits
	.align	2
	.globl	map
	.hidden	map
	.type	map, @function
map:
.LFB13:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE13:
	.size	map, .-map
	.section	.text.ucontext,"ax",@progbits
	.align	2
	.globl	ucontext
	.hidden	ucontext
	.type	ucontext, @function
ucontext:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	ucontext, .-ucontext
	.section	.sbss.vme_enable,"aw",@nobits
	.align	2
	.type	vme_enable, @object
	.size	vme_enable, 4
vme_enable:
	.zero	4
	.section	.sbss.pgalloc_usr,"aw",@nobits
	.align	2
	.type	pgalloc_usr, @object
	.size	pgalloc_usr, 4
pgalloc_usr:
	.zero	4
	.section	.bss.kas,"aw",@nobits
	.align	2
	.type	kas, @object
	.size	kas, 16
kas:
	.zero	16
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
