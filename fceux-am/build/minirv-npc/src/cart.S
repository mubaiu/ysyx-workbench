#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cart.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z8setchr4rijj.part.0,"ax",@progbits
	.align	2
	.type	_Z8setchr4rijj.part.0, @function
_Z8setchr4rijj.part.0:
.LFB82:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a2
	mv	s1,a0
	sw	a1,0(sp)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s1,2
	lla	a5,CHRmask4
	add	a5,a5,a4
	lw	a2,0(a5)
	lw	a1,0(sp)
	lla	a5,CHRptr
	add	a5,a5,a4
	srli	a3,a1,10
	lw	a4,0(a5)
	and	a2,s0,a2
	addi	a0,a3,3
	slli	a2,a2,12
	la a5, VPageR; lw a5, 0(a5);
	slli	a0,a0,2
	sub	a1,a2,a1
	add	a4,a4,a1
	add	a5,a5,a0
	sw	a4,0(a5)
	sw	a4,-4(a5)
	sw	a4,-8(a5)
	sw	a4,-12(a5)
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a5,0(a5)
	li	a4,15
	sll	a4,a4,a3
	lla	a3,PPUCHRRAM
	beq	a5,zero,.L2
	lbu	a5,0(a3)
	or	a5,a5,a4
	andi	a5,a5,0xff
	sb	a5,0(a3)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L2:
	.cfi_restore_state
	lbu	a5,0(a3)
	not	a4,a4
	and	a5,a5,a4
	sb	a5,0(a3)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE82:
	.size	_Z8setchr4rijj.part.0, .-_Z8setchr4rijj.part.0
	.section	.text._Z8setchr8rij.part.0,"ax",@progbits
	.align	2
	.type	_Z8setchr8rij.part.0, @function
_Z8setchr8rij.part.0:
.LFB83:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s1,2
	lla	a5,CHRmask8
	add	a5,a5,a4
	lw	a5,0(a5)
	la a0, VPageR; lw a0, 0(a0);
	lla	a1,CHRptr
	and	a2,s0,a5
	slli	a2,a2,13
	addi	a5,a0,28
	add	a1,a1,a4
.L7:
	lw	a4,0(a1)
	mv	a3,a5
	addi	a5,a5,-4
	add	a4,a4,a2
	sw	a4,4(a5)
	bne	a0,a3,.L7
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a5,0(a5)
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	snez	a5,a5
	neg	a5,a5
	la a4, PPUCHRRAM; sb a5, 0(a4);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE83:
	.size	_Z8setchr8rij.part.0, .-_Z8setchr8rij.part.0
	.section	.text._Z16ResetCartMappingv,"ax",@progbits
	.align	2
	.globl	_Z16ResetCartMappingv
	.hidden	_Z16ResetCartMappingv
	.type	_Z16ResetCartMappingv, @function
_Z16ResetCartMappingv:
.LFB47:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14PPU_ResetHooksv
	lla	t1,_ZL7nothing
	lla	a0,Page
	lla	a1,CHRptr
	lla	a2,PRGptr
	lla	a3,CHRsize
	lla	a4,PRGsize
	lla	t0,_ZL7nothing-65536
	mv	a5,t1
.L11:
	sw	a5,0(a0)
	sw	zero,0(a1)
	sw	zero,0(a2)
	sw	zero,0(a3)
	sw	zero,0(a4)
	addi	a5,a5,-2048
	addi	a0,a0,4
	addi	a1,a1,4
	addi	a2,a2,4
	addi	a3,a3,4
	addi	a4,a4,4
	bne	a5,t0,.L11
	la a3, VPageR; lw a3, 0(a3);
	lla	a4,MMC5BGVPage
	lla	a5,MMC5SPRVPage
	lla	a2,_ZL7nothing-8192
.L12:
	sw	t1,0(a3)
	sw	t1,0(a4)
	sw	t1,0(a5)
	addi	t1,t1,-1024
	addi	a3,a3,4
	addi	a4,a4,4
	addi	a5,a5,4
	bne	t1,a2,.L12
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE47:
	.size	_Z16ResetCartMappingv, .-_Z16ResetCartMappingv
	.section	.text._Z19SetupCartPRGMappingiPhji,"ax",@progbits
	.align	2
	.globl	_Z19SetupCartPRGMappingiPhji
	.hidden	_Z19SetupCartPRGMappingiPhji
	.type	_Z19SetupCartPRGMappingiPhji, @function
_Z19SetupCartPRGMappingiPhji:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-36
	.cfi_def_cfa_offset 36
	slli	a5,a0,2
	sw	a1,24(sp)
	lla	a1,PRGptr
	sw	s1,28(sp)
	.cfi_offset 9, -8
	add	s1,a1,a5
	lla	a1,PRGsize
	add	a1,a1,a5
	sw	a1,4(sp)
	srli	t0,a2,11
	lla	a1,PRGmask2
	sw	s1,0(sp)
	addi	t0,t0,-1
	add	s1,a1,a5
	lla	a1,PRGmask4
	sw	t0,12(sp)
	add	t0,a1,a5
	sw	s1,8(sp)
	sw	t0,16(sp)
	srli	a4,a2,15
	lla	t0,PRGmask8
	lla	a1,PRGmask16
	lla	s1,PRGmask32
	add	s1,s1,a5
	add	t0,t0,a5
	add	a1,a1,a5
	addi	a4,a4,-1
	lla	a5,PRGram
	sw	a4,20(sp)
	add	a5,a5,a0
	lw	a4,24(sp)
	lw	a0,0(sp)
	sw	s0,32(sp)
	.cfi_offset 8, -4
	srli	t2,a2,13
	sw	a4,0(a0)
	lw	a0,4(sp)
	srli	s0,a2,12
	srli	t1,a2,14
	sw	a2,0(a0)
	lw	a2,8(sp)
	lw	a0,12(sp)
	snez	a3,a3
	lw	a4,20(sp)
	sw	a0,0(a2)
	lw	a2,16(sp)
	sb	a3,0(a5)
	addi	s0,s0,-1
	sw	s0,0(a2)
	lw	s0,32(sp)
	.cfi_restore 8
	addi	t2,t2,-1
	addi	t1,t1,-1
	sw	a4,0(s1)
	sw	t2,0(t0)
	sw	t1,0(a1)
	lw	s1,28(sp)
	.cfi_restore 9
	addi	sp,sp,36
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	_Z19SetupCartPRGMappingiPhji, .-_Z19SetupCartPRGMappingiPhji
	.section	.text._Z19SetupCartCHRMappingiPhji,"ax",@progbits
	.align	2
	.globl	_Z19SetupCartCHRMappingiPhji
	.hidden	_Z19SetupCartCHRMappingiPhji
	.type	_Z19SetupCartCHRMappingiPhji, @function
_Z19SetupCartCHRMappingiPhji:
.LFB49:
	.cfi_startproc
	slli	a5,a0,2
	lla	t2,CHRptr
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	add	t2,t2,a5
	sw	t2,0(sp)
	lla	t2,CHRsize
	sw	s1,16(sp)
	srli	t1,a2,10
	.cfi_offset 9, -8
	add	s1,t2,a5
	lla	t2,CHRmask1
	add	t2,t2,a5
	addi	t1,t1,-1
	sw	s1,4(sp)
	sw	t2,8(sp)
	sw	t1,12(sp)
	lla	t2,CHRmask2
	lla	t1,CHRmask4
	lla	s1,CHRmask8
	add	s1,s1,a5
	add	t2,t2,a5
	add	t1,t1,a5
	lla	a5,CHRram
	add	a5,a5,a0
	lw	a0,0(sp)
	sw	s0,20(sp)
	.cfi_offset 8, -4
	srli	s0,a2,11
	sw	a1,0(a0)
	lw	a1,4(sp)
	sb	a3,0(a5)
	srli	t0,a2,12
	sw	a2,0(a1)
	srli	a4,a2,13
	lw	a1,12(sp)
	lw	a2,8(sp)
	addi	s0,s0,-1
	sw	s0,0(t2)
	lw	s0,20(sp)
	.cfi_restore 8
	addi	t0,t0,-1
	addi	a4,a4,-1
	sw	a4,0(s1)
	sw	a1,0(a2)
	sw	t0,0(t1)
	lw	s1,16(sp)
	.cfi_restore 9
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE49:
	.size	_Z19SetupCartCHRMappingiPhji, .-_Z19SetupCartCHRMappingiPhji
	.section	.text._Z6CartBRj,"ax",@progbits
	.align	2
	.globl	_Z6CartBRj
	.hidden	_Z6CartBRj
	.type	_Z6CartBRj, @function
_Z6CartBRj:
.LFB50:
	.cfi_startproc
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE50:
	.size	_Z6CartBRj, .-_Z6CartBRj
	.section	.text._Z6CartBWjh,"ax",@progbits
	.align	2
	.globl	_Z6CartBWjh
	.hidden	_Z6CartBWjh
	.type	_Z6CartBWjh, @function
_Z6CartBWjh:
.LFB51:
	.cfi_startproc
	srli	a4,a0,11
	lla	a5,_ZL8PRGIsRAM
	add	a5,a5,a4
	lbu	a5,0(a5)
	beq	a5,zero,.L21
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,zero,.L21
	add	a5,a5,a0
	sb	a1,0(a5)
.L21:
	ret
	.cfi_endproc
.LFE51:
	.size	_Z6CartBWjh, .-_Z6CartBWjh
	.section	.text._Z8CartBROBj,"ax",@progbits
	.align	2
	.globl	_Z8CartBROBj
	.hidden	_Z8CartBROBj
	.type	_Z8CartBROBj, @function
_Z8CartBROBj:
.LFB52:
	.cfi_startproc
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,zero,.L32
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L32:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE52:
	.size	_Z8CartBROBj, .-_Z8CartBROBj
	.section	.text._Z8setprg2rijj,"ax",@progbits
	.align	2
	.globl	_Z8setprg2rijj
	.hidden	_Z8setprg2rijj
	.type	_Z8setprg2rijj, @function
_Z8setprg2rijj:
.LFB53:
	.cfi_startproc
	slli	t2,a0,2
	lla	a5,PRGptr
	add	a5,a5,t2
	lw	a4,0(a5)
	srli	t1,a1,11
	li	t0,0
	beq	a4,zero,.L34
	lla	a3,PRGmask2
	add	a3,a3,t2
	lw	a5,0(a3)
	lla	a3,PRGram
	add	a3,a3,a0
	and	a5,a2,a5
	slli	a5,a5,11
	lbu	t0,0(a3)
	sub	a1,a5,a1
	add	a4,a4,a1
.L34:
	slli	a2,t1,2
	lla	a3,_ZL8PRGIsRAM
	lla	a5,Page
	add	a3,a3,t1
	add	a5,a5,a2
	sb	t0,0(a3)
	sw	a4,0(a5)
	ret
	.cfi_endproc
.LFE53:
	.size	_Z8setprg2rijj, .-_Z8setprg2rijj
	.section	.text._Z7setprg2jj,"ax",@progbits
	.align	2
	.globl	_Z7setprg2jj
	.hidden	_Z7setprg2jj
	.type	_Z7setprg2jj, @function
_Z7setprg2jj:
.LFB54:
	.cfi_startproc
	la a5, PRGptr; lw a5, 0(a5);
	srli	a4,a0,11
	li	a2,0
	beq	a5,zero,.L38
	la a3, PRGmask2; lw a3, 0(a3);
	and	a1,a1,a3
	slli	a1,a1,11
	sub	a1,a1,a0
	la a2, PRGram; lbu a2, 0(a2);
	add	a5,a5,a1
.L38:
	lla	a3,_ZL8PRGIsRAM
	slli	a1,a4,2
	add	a3,a3,a4
	lla	a4,Page
	add	a4,a4,a1
	sb	a2,0(a3)
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE54:
	.size	_Z7setprg2jj, .-_Z7setprg2jj
	.section	.text._Z8setprg4rijj,"ax",@progbits
	.align	2
	.globl	_Z8setprg4rijj
	.hidden	_Z8setprg4rijj
	.type	_Z8setprg4rijj, @function
_Z8setprg4rijj:
.LFB55:
	.cfi_startproc
	slli	a4,a0,2
	lla	a5,PRGptr
	add	a5,a5,a4
	lw	a5,0(a5)
	srli	t2,a1,11
	addi	t1,t2,1
	li	t0,0
	beq	a5,zero,.L42
	lla	a3,PRGmask4
	add	a4,a3,a4
	lw	a3,0(a4)
	lla	a4,PRGram
	add	a4,a4,a0
	and	a2,a2,a3
	slli	a2,a2,12
	lbu	t0,0(a4)
	sub	a1,a2,a1
	add	a5,a5,a1
.L42:
	lla	a3,_ZL8PRGIsRAM
	lla	a4,Page
	slli	a2,t1,2
	add	a2,a4,a2
	add	t1,a3,t1
	slli	a1,t2,2
	sb	t0,0(t1)
	sw	a5,0(a2)
	add	a3,a3,t2
	add	a4,a4,a1
	sb	t0,0(a3)
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE55:
	.size	_Z8setprg4rijj, .-_Z8setprg4rijj
	.section	.text._Z7setprg4jj,"ax",@progbits
	.align	2
	.globl	_Z7setprg4jj
	.hidden	_Z7setprg4jj
	.type	_Z7setprg4jj, @function
_Z7setprg4jj:
.LFB56:
	.cfi_startproc
	srli	t1,a0,11
	la a5, PRGptr; lw a5, 0(a5);
	addi	a2,t1,1
	li	t0,0
	beq	a5,zero,.L46
	la a4, PRGmask4; lw a4, 0(a4);
	and	a1,a1,a4
	slli	a1,a1,12
	sub	a1,a1,a0
	la t0, PRGram; lbu t0, 0(t0);
	add	a5,a5,a1
.L46:
	lla	a3,_ZL8PRGIsRAM
	lla	a4,Page
	slli	a1,a2,2
	add	a1,a4,a1
	add	a2,a3,a2
	slli	a0,t1,2
	sb	t0,0(a2)
	sw	a5,0(a1)
	add	a3,a3,t1
	add	a4,a4,a0
	sb	t0,0(a3)
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE56:
	.size	_Z7setprg4jj, .-_Z7setprg4jj
	.section	.text._Z8setprg8rijj,"ax",@progbits
	.align	2
	.globl	_Z8setprg8rijj
	.hidden	_Z8setprg8rijj
	.type	_Z8setprg8rijj, @function
_Z8setprg8rijj:
.LFB57:
	.cfi_startproc
	slli	a5,a0,2
	lla	a4,PRGsize
	add	a4,a4,a5
	lw	a3,0(a4)
	lla	a4,PRGptr
	add	a4,a4,a5
	li	t0,8192
	lw	t1,0(a4)
	bltu	a3,t0,.L50
	lla	a4,PRGmask8
	add	a5,a4,a5
	lw	a5,0(a5)
	srli	t0,a1,11
	beq	t1,zero,.L51
	and	a3,a5,a2
	lla	a4,PRGram
	add	a4,a4,a0
	slli	a3,a3,13
	sub	a3,a3,a1
	lbu	a2,0(a4)
	lla	a1,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM
	add	a4,a4,a1
	lla	a1,_ZL8PRGIsRAM-4
	add	a3,t1,a3
	add	a5,t0,a5
	add	a1,a1,t0
.L52:
	sb	a2,3(a5)
	sw	a3,12(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a1,a5,.L52
	ret
.L50:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	lla	a4,PRGram
	.cfi_offset 8, -4
	lla	s0,PRGmask2
	li	t2,4096
	add	a4,a4,a0
	add	s0,s0,a5
	sw	s1,8(sp)
	.cfi_offset 9, -8
	slli	a2,a2,2
	add	t0,a1,t0
	lla	s1,_ZL8PRGIsRAM
	sw	a4,0(sp)
	addi	t2,t2,-2048
	sw	s0,4(sp)
.L56:
	srli	a4,a1,11
	beq	t1,zero,.L57
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a5,0(a5)
	lbu	a0,0(a3)
	and	a5,a2,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,t1,a5
.L55:
	slli	a3,a4,2
	lla	s0,Page
	add	a4,s1,a4
	add	a3,s0,a3
	sb	a0,0(a4)
	sw	a5,0(a3)
	add	a1,a1,t2
	addi	a2,a2,1
	bne	a1,t0,.L56
	lw	s0,12(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L57:
	.cfi_restore_state
	li	a5,0
	li	a0,0
	j	.L55
.L51:
	.cfi_def_cfa_offset 0
	.cfi_restore 8
	.cfi_restore 9
	lla	a3,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-4
	add	a5,t0,a5
	add	a3,a3,t0
.L53:
	sb	zero,3(a5)
	sw	zero,12(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L53
	ret
	.cfi_endproc
.LFE57:
	.size	_Z8setprg8rijj, .-_Z8setprg8rijj
	.section	.text._Z7setprg8jj,"ax",@progbits
	.align	2
	.globl	_Z7setprg8jj
	.hidden	_Z7setprg8jj
	.type	_Z7setprg8jj, @function
_Z7setprg8jj:
.LFB58:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	li	a0,0
	tail	_Z8setprg8rijj
	.cfi_endproc
.LFE58:
	.size	_Z7setprg8jj, .-_Z7setprg8jj
	.section	.text._Z9setprg16rijj,"ax",@progbits
	.align	2
	.globl	_Z9setprg16rijj
	.hidden	_Z9setprg16rijj
	.type	_Z9setprg16rijj, @function
_Z9setprg16rijj:
.LFB59:
	.cfi_startproc
	slli	a5,a0,2
	lla	a4,PRGsize
	add	a4,a4,a5
	lw	a3,0(a4)
	lla	a4,PRGptr
	add	a4,a4,a5
	li	t0,16384
	lw	t1,0(a4)
	bltu	a3,t0,.L66
	lla	a4,PRGmask16
	add	a5,a4,a5
	lw	a5,0(a5)
	srli	t0,a1,11
	beq	t1,zero,.L67
	and	a3,a5,a2
	lla	a4,PRGram
	add	a4,a4,a0
	slli	a3,a3,14
	sub	a3,a3,a1
	lbu	a2,0(a4)
	lla	a1,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM+7
	add	a4,a4,a1
	lla	a1,_ZL8PRGIsRAM-1
	add	a3,t1,a3
	add	a5,t0,a5
	add	a1,a1,t0
.L68:
	sb	a2,0(a5)
	sw	a3,28(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a1,a5,.L68
	ret
.L66:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,8(sp)
	lla	a4,PRGram
	.cfi_offset 9, -8
	lla	s1,PRGmask2
	li	t2,4096
	add	a4,a4,a0
	add	s1,s1,a5
	sw	s0,12(sp)
	.cfi_offset 8, -4
	slli	a2,a2,3
	add	t0,a1,t0
	lla	s0,_ZL8PRGIsRAM
	sw	a4,0(sp)
	addi	t2,t2,-2048
	sw	s1,4(sp)
	j	.L72
.L81:
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a5,0(a5)
	lbu	a0,0(a3)
	and	a5,a2,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,t1,a5
.L71:
	slli	a3,a4,2
	lla	s1,Page
	add	a4,s0,a4
	add	a3,s1,a3
	sb	a0,0(a4)
	sw	a5,0(a3)
	add	a1,a1,t2
	addi	a2,a2,1
	beq	a1,t0,.L80
.L72:
	srli	a4,a1,11
	bne	t1,zero,.L81
	li	a5,0
	li	a0,0
	j	.L71
.L80:
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L67:
	lla	a3,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM+7
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-1
	add	a5,t0,a5
	add	a3,a3,t0
.L69:
	sb	zero,0(a5)
	sw	zero,28(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L69
	ret
	.cfi_endproc
.LFE59:
	.size	_Z9setprg16rijj, .-_Z9setprg16rijj
	.section	.text._Z8setprg16jj,"ax",@progbits
	.align	2
	.globl	_Z8setprg16jj
	.hidden	_Z8setprg16jj
	.type	_Z8setprg16jj, @function
_Z8setprg16jj:
.LFB60:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	li	a0,0
	tail	_Z9setprg16rijj
	.cfi_endproc
.LFE60:
	.size	_Z8setprg16jj, .-_Z8setprg16jj
	.section	.text._Z9setprg32rijj,"ax",@progbits
	.align	2
	.globl	_Z9setprg32rijj
	.hidden	_Z9setprg32rijj
	.type	_Z9setprg32rijj, @function
_Z9setprg32rijj:
.LFB61:
	.cfi_startproc
	slli	a5,a0,2
	lla	a4,PRGsize
	add	a4,a4,a5
	lw	t0,0(a4)
	lla	a4,PRGptr
	add	a4,a4,a5
	li	a3,32768
	lw	t1,0(a4)
	bltu	t0,a3,.L84
	lla	a4,PRGmask32
	add	a5,a4,a5
	lw	a5,0(a5)
	srli	t0,a1,11
	beq	t1,zero,.L85
	and	a3,a5,a2
	lla	a4,PRGram
	add	a4,a4,a0
	slli	a3,a3,15
	sub	a3,a3,a1
	lbu	a2,0(a4)
	lla	a1,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM+15
	add	a4,a4,a1
	lla	a1,_ZL8PRGIsRAM-1
	add	a3,t1,a3
	add	a5,t0,a5
	add	a1,a1,t0
.L86:
	sb	a2,0(a5)
	sw	a3,60(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a1,a5,.L86
	ret
.L84:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,8(sp)
	lla	a4,PRGram
	.cfi_offset 9, -8
	lla	s1,PRGmask2
	slli	a2,a2,4
	li	t0,4096
	add	a4,a4,a0
	add	s1,s1,a5
	sw	s0,12(sp)
	.cfi_offset 8, -4
	lla	t2,_ZL8PRGIsRAM
	addi	s0,a2,16
	sw	a4,0(sp)
	addi	t0,t0,-2048
	sw	s1,4(sp)
	j	.L90
.L99:
	lw	a5,4(sp)
	lw	a3,0(sp)
	lw	a5,0(a5)
	lbu	a0,0(a3)
	and	a5,a2,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,t1,a5
.L89:
	slli	a3,a4,2
	lla	s1,Page
	add	a4,t2,a4
	add	a3,s1,a3
	sb	a0,0(a4)
	sw	a5,0(a3)
	addi	a2,a2,1
	add	a1,a1,t0
	beq	a2,s0,.L98
.L90:
	srli	a4,a1,11
	bne	t1,zero,.L99
	li	a5,0
	li	a0,0
	j	.L89
.L98:
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L85:
	lla	a3,Page
	slli	a4,t0,2
	lla	a5,_ZL8PRGIsRAM+15
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-1
	add	a5,t0,a5
	add	a3,a3,t0
.L87:
	sb	zero,0(a5)
	sw	zero,60(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L87
	ret
	.cfi_endproc
.LFE61:
	.size	_Z9setprg32rijj, .-_Z9setprg32rijj
	.section	.text._Z8setprg32jj,"ax",@progbits
	.align	2
	.globl	_Z8setprg32jj
	.hidden	_Z8setprg32jj
	.type	_Z8setprg32jj, @function
_Z8setprg32jj:
.LFB62:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	li	a0,0
	tail	_Z9setprg32rijj
	.cfi_endproc
.LFE62:
	.size	_Z8setprg32jj, .-_Z8setprg32jj
	.section	.text._Z8setchr1rijj,"ax",@progbits
	.align	2
	.globl	_Z8setchr1rijj
	.hidden	_Z8setchr1rijj
	.type	_Z8setchr1rijj, @function
_Z8setchr1rijj:
.LFB63:
	.cfi_startproc
	slli	t0,a0,2
	lla	a4,CHRptr
	add	a5,a4,t0
	lw	a3,0(a5)
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	ra,16(sp)
	sw	t0,4(sp)
	sw	a2,0(sp)
	.cfi_offset 1, -4
	beq	a3,zero,.L101
	sw	s0,12(sp)
	sw	s1,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	mv	s1,a1
	call	_Z18FCEUPPU_LineUpdatev
	lw	t0,4(sp)
	lla	a0,CHRmask1
	lla	a3,CHRram
	add	a0,a0,t0
	lw	a5,0(a0)
	lw	a2,0(sp)
	add	a3,a3,s0
	lbu	a3,0(a3)
	srli	a0,s1,10
	and	a5,a2,a5
	li	a2,1
	sll	a2,a2,a0
	lla	a4,CHRptr
	lla	t1,PPUCHRRAM
	bne	a3,zero,.L109
	lbu	a3,0(t1)
	not	a2,a2
	and	a3,a3,a2
.L104:
	add	a4,a4,t0
	lw	a4,0(a4)
	slli	a5,a5,10
	sub	a1,a5,s1
	slli	a0,a0,2
	la a5, VPageR; lw a5, 0(a5);
	lw	s0,12(sp)
	.cfi_restore 8
	lw	s1,8(sp)
	.cfi_restore 9
	add	a5,a5,a0
	add	a4,a4,a1
	sb	a3,0(t1)
	sw	a4,0(a5)
.L101:
	lw	ra,16(sp)
	.cfi_restore 1
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	ra
.L109:
	.cfi_def_cfa_offset 20
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lbu	a3,0(t1)
	or	a3,a3,a2
	andi	a3,a3,0xff
	j	.L104
	.cfi_endproc
.LFE63:
	.size	_Z8setchr1rijj, .-_Z8setchr1rijj
	.section	.text._Z8setchr2rijj,"ax",@progbits
	.align	2
	.globl	_Z8setchr2rijj
	.hidden	_Z8setchr2rijj
	.type	_Z8setchr2rijj, @function
_Z8setchr2rijj:
.LFB64:
	.cfi_startproc
	slli	a3,a0,2
	lla	a5,CHRptr
	add	a5,a5,a3
	lw	a4,0(a5)
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	ra,20(sp)
	sw	a3,8(sp)
	sw	a5,4(sp)
	sw	a1,0(sp)
	.cfi_offset 1, -4
	beq	a4,zero,.L110
	sw	s0,16(sp)
	sw	s1,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a2
	mv	s1,a0
	call	_Z18FCEUPPU_LineUpdatev
	lw	a3,8(sp)
	lla	a4,CHRmask2
	lw	a5,4(sp)
	add	a4,a4,a3
	lw	a2,0(a4)
	lw	a1,0(sp)
	lw	a4,0(a5)
	and	a2,s0,a2
	srli	a3,a1,10
	addi	a0,a3,1
	slli	a2,a2,11
	la a5, VPageR; lw a5, 0(a5);
	slli	a0,a0,2
	sub	a1,a2,a1
	add	a4,a4,a1
	add	a5,a5,a0
	sw	a4,0(a5)
	sw	a4,-4(a5)
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a4,0(a5)
	li	a5,3
	sll	a5,a5,a3
	lla	a3,PPUCHRRAM
	beq	a4,zero,.L112
	lbu	a4,0(a3)
	or	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,16(sp)
	.cfi_restore 8
	lw	s1,12(sp)
	.cfi_restore 9
.L110:
	lw	ra,20(sp)
	.cfi_restore 1
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
.L112:
	.cfi_def_cfa_offset 24
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lbu	a4,0(a3)
	not	a5,a5
	and	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,16(sp)
	.cfi_restore 8
	lw	ra,20(sp)
	.cfi_restore 1
	lw	s1,12(sp)
	.cfi_restore 9
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE64:
	.size	_Z8setchr2rijj, .-_Z8setchr2rijj
	.section	.text._Z8setchr4rijj,"ax",@progbits
	.align	2
	.globl	_Z8setchr4rijj
	.hidden	_Z8setchr4rijj
	.type	_Z8setchr4rijj, @function
_Z8setchr4rijj:
.LFB65:
	.cfi_startproc
	slli	a4,a0,2
	lla	a5,CHRptr
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,zero,.L117
	tail	_Z8setchr4rijj.part.0
.L117:
	ret
	.cfi_endproc
.LFE65:
	.size	_Z8setchr4rijj, .-_Z8setchr4rijj
	.section	.text._Z8setchr8rij,"ax",@progbits
	.align	2
	.globl	_Z8setchr8rij
	.hidden	_Z8setchr8rij
	.type	_Z8setchr8rij, @function
_Z8setchr8rij:
.LFB66:
	.cfi_startproc
	slli	a4,a0,2
	lla	a5,CHRptr
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,zero,.L119
	tail	_Z8setchr8rij.part.0
.L119:
	ret
	.cfi_endproc
.LFE66:
	.size	_Z8setchr8rij, .-_Z8setchr8rij
	.section	.text._Z7setchr1jj,"ax",@progbits
	.align	2
	.globl	_Z7setchr1jj
	.hidden	_Z7setchr1jj
	.type	_Z7setchr1jj, @function
_Z7setchr1jj:
.LFB67:
	.cfi_startproc
	lla	a2,CHRptr
	lw	a5,0(a2)
	beq	a5,zero,.L129
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	la a5, CHRmask1; lw a5, 0(a5);
	srli	a3,s1,10
	and	a1,s0,a5
	la a4, CHRram; lbu a4, 0(a4);
	li	a5,1
	sll	a5,a5,a3
	lla	a2,CHRptr
	lla	t1,PPUCHRRAM
	bne	a4,zero,.L132
	lbu	a4,0(t1)
	not	a5,a5
	and	a4,a4,a5
.L124:
	lw	a2,0(a2)
	slli	a5,a1,10
	sub	a0,a5,s1
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, VPageR; lw a5, 0(a5);
	lw	s0,4(sp)
	.cfi_restore 8
	slli	a3,a3,2
	add	a5,a5,a3
	add	a3,a2,a0
	sb	a4,0(t1)
	sw	a3,0(a5)
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L132:
	.cfi_restore_state
	lbu	a4,0(t1)
	or	a4,a4,a5
	andi	a4,a4,0xff
	j	.L124
.L129:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	ret
	.cfi_endproc
.LFE67:
	.size	_Z7setchr1jj, .-_Z7setchr1jj
	.section	.text._Z7setchr2jj,"ax",@progbits
	.align	2
	.globl	_Z7setchr2jj
	.hidden	_Z7setchr2jj
	.type	_Z7setchr2jj, @function
_Z7setchr2jj:
.LFB68:
	.cfi_startproc
	lla	a5,CHRptr
	lw	a4,0(a5)
	beq	a4,zero,.L140
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	lla	a5,CHRptr
	lw	a4,0(a5)
	la a5, CHRmask2; lw a5, 0(a5);
	srli	a3,s1,10
	and	a1,s0,a5
	addi	a2,a3,1
	slli	a1,a1,11
	la a5, VPageR; lw a5, 0(a5);
	slli	a2,a2,2
	sub	a0,a1,s1
	add	a4,a4,a0
	add	a5,a5,a2
	sw	a4,0(a5)
	sw	a4,-4(a5)
	la a4, CHRram; lbu a4, 0(a4);
	li	a5,3
	sll	a5,a5,a3
	lla	a3,PPUCHRRAM
	bne	a4,zero,.L143
	lbu	a4,0(a3)
	not	a5,a5
	and	a5,a4,a5
	sb	a5,0(a3)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L143:
	.cfi_restore_state
	lbu	a4,0(a3)
	or	a5,a4,a5
	sb	a5,0(a3)
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L140:
	ret
	.cfi_endproc
.LFE68:
	.size	_Z7setchr2jj, .-_Z7setchr2jj
	.section	.text._Z7setchr4jj,"ax",@progbits
	.align	2
	.globl	_Z7setchr4jj
	.hidden	_Z7setchr4jj
	.type	_Z7setchr4jj, @function
_Z7setchr4jj:
.LFB69:
	.cfi_startproc
	la a5, CHRptr; lw a5, 0(a5);
	mv	a2,a1
	beq	a5,zero,.L144
	mv	a1,a0
	li	a0,0
	tail	_Z8setchr4rijj.part.0
.L144:
	ret
	.cfi_endproc
.LFE69:
	.size	_Z7setchr4jj, .-_Z7setchr4jj
	.section	.text._Z7setchr8j,"ax",@progbits
	.align	2
	.globl	_Z7setchr8j
	.hidden	_Z7setchr8j
	.type	_Z7setchr8j, @function
_Z7setchr8j:
.LFB70:
	.cfi_startproc
	la a5, CHRptr; lw a5, 0(a5);
	mv	a1,a0
	beq	a5,zero,.L146
	li	a0,0
	tail	_Z8setchr8rij.part.0
.L146:
	ret
	.cfi_endproc
.LFE70:
	.size	_Z7setchr8j, .-_Z7setchr8j
	.section	.text._Z9setntamemPhij,"ax",@progbits
	.align	2
	.globl	_Z9setntamemPhij
	.hidden	_Z9setntamemPhij
	.type	_Z9setntamemPhij, @function
_Z9setntamemPhij:
.LFB71:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a2
	sw	a0,0(sp)
	mv	s1,a1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s0,2
	lw	a0,0(sp)
	lla	a2,PPUNTARAM
	lla	a3,vnapage
	add	a3,a3,a4
	lbu	a5,0(a2)
	li	a4,1
	sll	a4,a4,s0
	not	a1,a4
	sw	a0,0(a3)
	and	a5,a5,a1
	beq	s1,zero,.L149
	or	a5,a5,a4
	andi	a5,a5,0xff
.L149:
	sb	a5,0(a2)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE71:
	.size	_Z9setntamemPhij, .-_Z9setntamemPhij
	.section	.text._Z10setmirrorwiiii,"ax",@progbits
	.align	2
	.globl	_Z10setmirrorwiiii
	.hidden	_Z10setmirrorwiiii
	.type	_Z10setmirrorwiiii, @function
_Z10setmirrorwiiii:
.LFB72:
	.cfi_startproc
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	sw	s0,12(sp)
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sw	a0,4(sp)
	sw	a1,0(sp)
	mv	s1,a2
	mv	s0,a3
	call	_Z18FCEUPPU_LineUpdatev
	lw	a0,4(sp)
	lw	a1,0(sp)
	lla	a5,NTARAM
	lw	ra,16(sp)
	.cfi_restore 1
	slli	a2,s1,10
	slli	a3,s0,10
	slli	a0,a0,10
	lw	s0,12(sp)
	.cfi_restore 8
	slli	a1,a1,10
	lla	a4,vnapage
	add	a0,a0,a5
	add	a1,a1,a5
	add	a2,a2,a5
	add	a3,a3,a5
	sw	a0,0(a4)
	sw	a1,4(a4)
	sw	a2,8(a4)
	sw	a3,12(a4)
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE72:
	.size	_Z10setmirrorwiiii, .-_Z10setmirrorwiiii
	.section	.text._Z9setmirrori,"ax",@progbits
	.align	2
	.globl	_Z9setmirrori
	.hidden	_Z9setmirrori
	.type	_Z9setmirrori, @function
_Z9setmirrori:
.LFB73:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z18FCEUPPU_LineUpdatev
	la a5, _ZL10mirrorhard; lw a5, 0(a5);
	bne	a5,zero,.L156
	li	a5,2
	beq	s0,a5,.L158
	bgt	s0,a5,.L159
	beq	s0,zero,.L160
	li	a5,1
	bne	s0,a5,.L162
	lla	a5,vnapage
	lla	a3,NTARAM
	lla	a4,NTARAM+1024
	sw	a3,8(a5)
	sw	a3,0(a5)
	sw	a4,12(a5)
	sw	a4,4(a5)
.L162:
	li	a5,15
	la a4, PPUNTARAM; sb a5, 0(a4);
.L156:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L158:
	.cfi_restore_state
	lla	a5,vnapage
	lla	a4,NTARAM
	sw	a4,12(a5)
	sw	a4,8(a5)
	sw	a4,4(a5)
	sw	a4,0(a5)
	j	.L162
.L160:
	lla	a5,vnapage
	lla	a3,NTARAM
	lla	a4,NTARAM+1024
	sw	a3,4(a5)
	sw	a3,0(a5)
	sw	a4,12(a5)
	sw	a4,8(a5)
	j	.L162
.L159:
	li	a5,3
	bne	s0,a5,.L162
	lla	a5,vnapage
	lla	a4,NTARAM+1024
	sw	a4,12(a5)
	sw	a4,8(a5)
	sw	a4,4(a5)
	sw	a4,0(a5)
	j	.L162
	.cfi_endproc
.LFE73:
	.size	_Z9setmirrori, .-_Z9setmirrori
	.section	.text._Z18SetupCartMirroringiiPh,"ax",@progbits
	.align	2
	.globl	_Z18SetupCartMirroringiiPh
	.hidden	_Z18SetupCartMirroringiiPh
	.type	_Z18SetupCartMirroringiiPh, @function
_Z18SetupCartMirroringiiPh:
.LFB74:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	li	a5,3
	mv	s0,a1
	ble	a0,a5,.L169
	lla	a5,vnapage
	lla	a3,NTARAM
	sw	a3,0(a5)
	addi	a4,a2,1024
	lla	a3,NTARAM+1024
	sw	a4,12(a5)
	sw	a3,4(a5)
	sw	a2,8(a5)
	li	a5,15
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a4, PPUNTARAM; sb a5, 0(a4);
	la a5, _ZL10mirrorhard; sw s0, 0(a5);
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L169:
	.cfi_restore_state
	la a5, _ZL10mirrorhard; sw zero, 0(a5);
	call	_Z9setmirrori
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL10mirrorhard; sw s0, 0(a5);
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE74:
	.size	_Z18SetupCartMirroringiiPh, .-_Z18SetupCartMirroringiiPh
	.section	.text._Z15FCEU_CloseGeniev,"ax",@progbits
	.align	2
	.globl	_Z15FCEU_CloseGeniev
	.hidden	_Z15FCEU_CloseGeniev
	.type	_Z15FCEU_CloseGeniev, @function
_Z15FCEU_CloseGeniev:
.LFB75:
	.cfi_startproc
	lla	a5,VPage
	la a4, VPageR; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE75:
	.size	_Z15FCEU_CloseGeniev, .-_Z15FCEU_CloseGeniev
	.section	.text._Z14FCEU_KillGeniev,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_KillGeniev
	.hidden	_Z14FCEU_KillGeniev
	.type	_Z14FCEU_KillGeniev, @function
_Z14FCEU_KillGeniev:
.LFB76:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE76:
	.size	_Z14FCEU_KillGeniev, .-_Z14FCEU_KillGeniev
	.section	.sbss._ZL10mirrorhard,"aw",@nobits
	.align	2
	.type	_ZL10mirrorhard, @object
	.size	_ZL10mirrorhard, 4
_ZL10mirrorhard:
	.zero	4
	.section	.bss._ZL7nothing,"aw",@nobits
	.align	2
	.type	_ZL7nothing, @object
	.size	_ZL7nothing, 8192
_ZL7nothing:
	.zero	8192
	.hidden	CHRmask8
	.globl	CHRmask8
	.section	.bss.CHRmask8,"aw",@nobits
	.align	2
	.type	CHRmask8, @object
	.size	CHRmask8, 128
CHRmask8:
	.zero	128
	.hidden	CHRmask4
	.globl	CHRmask4
	.section	.bss.CHRmask4,"aw",@nobits
	.align	2
	.type	CHRmask4, @object
	.size	CHRmask4, 128
CHRmask4:
	.zero	128
	.hidden	CHRmask2
	.globl	CHRmask2
	.section	.bss.CHRmask2,"aw",@nobits
	.align	2
	.type	CHRmask2, @object
	.size	CHRmask2, 128
CHRmask2:
	.zero	128
	.hidden	CHRmask1
	.globl	CHRmask1
	.section	.bss.CHRmask1,"aw",@nobits
	.align	2
	.type	CHRmask1, @object
	.size	CHRmask1, 128
CHRmask1:
	.zero	128
	.hidden	PRGmask32
	.globl	PRGmask32
	.section	.bss.PRGmask32,"aw",@nobits
	.align	2
	.type	PRGmask32, @object
	.size	PRGmask32, 128
PRGmask32:
	.zero	128
	.hidden	PRGmask16
	.globl	PRGmask16
	.section	.bss.PRGmask16,"aw",@nobits
	.align	2
	.type	PRGmask16, @object
	.size	PRGmask16, 128
PRGmask16:
	.zero	128
	.hidden	PRGmask8
	.globl	PRGmask8
	.section	.bss.PRGmask8,"aw",@nobits
	.align	2
	.type	PRGmask8, @object
	.size	PRGmask8, 128
PRGmask8:
	.zero	128
	.hidden	PRGmask4
	.globl	PRGmask4
	.section	.bss.PRGmask4,"aw",@nobits
	.align	2
	.type	PRGmask4, @object
	.size	PRGmask4, 128
PRGmask4:
	.zero	128
	.hidden	PRGmask2
	.globl	PRGmask2
	.section	.bss.PRGmask2,"aw",@nobits
	.align	2
	.type	PRGmask2, @object
	.size	PRGmask2, 128
PRGmask2:
	.zero	128
	.hidden	CHRsize
	.globl	CHRsize
	.section	.bss.CHRsize,"aw",@nobits
	.align	2
	.type	CHRsize, @object
	.size	CHRsize, 128
CHRsize:
	.zero	128
	.hidden	PRGsize
	.globl	PRGsize
	.section	.bss.PRGsize,"aw",@nobits
	.align	2
	.type	PRGsize, @object
	.size	PRGsize, 128
PRGsize:
	.zero	128
	.hidden	CHRptr
	.globl	CHRptr
	.section	.bss.CHRptr,"aw",@nobits
	.align	2
	.type	CHRptr, @object
	.size	CHRptr, 128
CHRptr:
	.zero	128
	.hidden	PRGptr
	.globl	PRGptr
	.section	.bss.PRGptr,"aw",@nobits
	.align	2
	.type	PRGptr, @object
	.size	PRGptr, 128
PRGptr:
	.zero	128
	.hidden	PRGram
	.globl	PRGram
	.section	.bss.PRGram,"aw",@nobits
	.align	2
	.type	PRGram, @object
	.size	PRGram, 32
PRGram:
	.zero	32
	.hidden	CHRram
	.globl	CHRram
	.section	.bss.CHRram,"aw",@nobits
	.align	2
	.type	CHRram, @object
	.size	CHRram, 32
CHRram:
	.zero	32
	.section	.bss._ZL8PRGIsRAM,"aw",@nobits
	.align	2
	.type	_ZL8PRGIsRAM, @object
	.size	_ZL8PRGIsRAM, 32
_ZL8PRGIsRAM:
	.zero	32
	.hidden	MMC5BGVPage
	.globl	MMC5BGVPage
	.section	.bss.MMC5BGVPage,"aw",@nobits
	.align	2
	.type	MMC5BGVPage, @object
	.size	MMC5BGVPage, 32
MMC5BGVPage:
	.zero	32
	.hidden	MMC5SPRVPage
	.globl	MMC5SPRVPage
	.section	.bss.MMC5SPRVPage,"aw",@nobits
	.align	2
	.type	MMC5SPRVPage, @object
	.size	MMC5SPRVPage, 32
MMC5SPRVPage:
	.zero	32
	.hidden	VPageG
	.globl	VPageG
	.section	.bss.VPageG,"aw",@nobits
	.align	2
	.type	VPageG, @object
	.size	VPageG, 32
VPageG:
	.zero	32
	.hidden	VPageR
	.globl	VPageR
	.section	.sdata.VPageR,"aw"
	.align	2
	.type	VPageR, @object
	.size	VPageR, 4
VPageR:
	.word	VPage
	.hidden	VPage
	.globl	VPage
	.section	.bss.VPage,"aw",@nobits
	.align	2
	.type	VPage, @object
	.size	VPage, 32
VPage:
	.zero	32
	.hidden	Page
	.globl	Page
	.section	.bss.Page,"aw",@nobits
	.align	2
	.type	Page, @object
	.size	Page, 128
Page:
	.zero	128
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
