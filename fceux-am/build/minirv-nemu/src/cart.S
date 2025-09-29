#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"cart.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
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
	sw	s2,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,a0
	mv	s2,a1
	mv	s0,a2
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s1,2
	lla	a5,CHRmask4
	add	a5,a5,a4
	lw	a3,0(a5)
	lla	a5,CHRptr
	add	a5,a5,a4
	lw	a4,0(a5)
	srli	a0,s2,10
	and	a2,s0,a3
	slli	a2,a2,12
	addi	a3,a0,3
	la a5, VPageR; lw a5, 0(a5);
	slli	a3,a3,2
	sub	a1,a2,s2
	add	a5,a5,a3
	add	a4,a4,a1
	sw	a4,0(a5)
	sw	a4,-4(a5)
	sw	a4,-8(a5)
	sw	a4,-12(a5)
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a5,0(a5)
	li	a4,15
	sll	a4,a4,a0
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
	lw	s2,0(sp)
	.cfi_restore 18
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
	lw	s2,0(sp)
	.cfi_restore 18
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s1,2
	lla	a5,CHRmask8
	add	a5,a5,a4
	lw	a5,0(a5)
	la a6, VPageR; lw a6, 0(a6);
	lla	a1,CHRptr
	and	a2,s0,a5
	slli	a2,a2,13
	addi	a5,a6,28
	add	a1,a1,a4
.L7:
	lw	a4,0(a1)
	mv	a3,a5
	addi	a5,a5,-4
	add	a4,a4,a2
	sw	a4,4(a5)
	bne	a6,a3,.L7
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a5,0(a5)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	snez	a5,a5
	neg	a5,a5
	la a4, PPUCHRRAM; sb a5, 0(a4);
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z14PPU_ResetHooksv
	lla	a6,_ZL7nothing
	lla	a0,Page
	lla	a1,CHRptr
	lla	a2,PRGptr
	lla	a3,CHRsize
	lla	a4,PRGsize
	lla	a7,_ZL7nothing-65536
	mv	a5,a6
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
	bne	a5,a7,.L11
	la a3, VPageR; lw a3, 0(a3);
	lla	a4,MMC5BGVPage
	lla	a5,MMC5SPRVPage
	lla	a2,_ZL7nothing-8192
.L12:
	sw	a6,0(a3)
	sw	a6,0(a4)
	sw	a6,0(a5)
	addi	a6,a6,-1024
	addi	a3,a3,4
	addi	a4,a4,4
	addi	a5,a5,4
	bne	a6,a2,.L12
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	srli	t1,a2,12
	srli	a7,a2,13
	srli	a4,a2,14
	sw	s0,12(sp)
	sw	s1,8(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	slli	a5,a0,2
	addi	s1,t1,-1
	addi	t4,a7,-1
	addi	t1,a4,-1
	lla	s0,PRGptr
	lla	t2,PRGsize
	lla	t6,PRGmask2
	lla	t5,PRGmask4
	lla	t3,PRGmask8
	lla	a7,PRGmask16
	lla	a4,PRGmask32
	add	s0,s0,a5
	add	t2,t2,a5
	add	t6,t6,a5
	add	t5,t5,a5
	add	t3,t3,a5
	add	a7,a7,a5
	add	a4,a4,a5
	lla	a5,PRGram
	add	a5,a5,a0
	snez	a3,a3
	sb	a3,0(a5)
	sw	a1,0(s0)
	srli	t0,a2,11
	lw	s0,12(sp)
	.cfi_restore 8
	srli	a6,a2,15
	addi	t0,t0,-1
	addi	a6,a6,-1
	sw	s1,0(t5)
	sw	a2,0(t2)
	sw	t0,0(t6)
	sw	t4,0(t3)
	sw	t1,0(a7)
	sw	a6,0(a4)
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,16
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
	srli	t1,a2,10
	srli	a7,a2,11
	srli	a4,a2,12
	slli	a5,a0,2
	addi	t6,t1,-1
	addi	t4,a7,-1
	addi	t1,a4,-1
	lla	t2,CHRptr
	lla	t0,CHRsize
	lla	t5,CHRmask1
	lla	t3,CHRmask2
	lla	a7,CHRmask4
	lla	a4,CHRmask8
	add	t2,t2,a5
	add	t0,t0,a5
	add	t5,t5,a5
	add	t3,t3,a5
	add	a7,a7,a5
	add	a4,a4,a5
	srli	a6,a2,13
	lla	a5,CHRram
	addi	a6,a6,-1
	add	a5,a5,a0
	sw	a1,0(t2)
	sw	a2,0(t0)
	sw	t6,0(t5)
	sw	t4,0(t3)
	sw	t1,0(a7)
	sw	a6,0(a4)
	sb	a3,0(a5)
	ret
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
	beq	a5,zero,.L20
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	beq	a5,zero,.L20
	add	a5,a5,a0
	sb	a1,0(a5)
.L20:
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
	beq	a5,zero,.L31
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L31:
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
	slli	a7,a0,2
	lla	a5,PRGptr
	add	a5,a5,a7
	lw	a5,0(a5)
	srli	a4,a1,11
	li	a6,0
	beq	a5,zero,.L33
	lla	a3,PRGmask2
	add	a3,a3,a7
	lw	a6,0(a3)
	lla	a3,PRGram
	add	a3,a3,a0
	and	a2,a2,a6
	slli	a2,a2,11
	lbu	a6,0(a3)
	sub	a2,a2,a1
	add	a5,a5,a2
.L33:
	lla	a3,_ZL8PRGIsRAM
	slli	a2,a4,2
	add	a3,a3,a4
	lla	a4,Page
	add	a4,a4,a2
	sb	a6,0(a3)
	sw	a5,0(a4)
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
	beq	a5,zero,.L37
	la a3, PRGmask2; lw a3, 0(a3);
	and	a1,a1,a3
	slli	a1,a1,11
	sub	a1,a1,a0
	la a2, PRGram; lbu a2, 0(a2);
	add	a5,a5,a1
.L37:
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
	slli	a3,a0,2
	lla	a5,PRGptr
	add	a5,a5,a3
	lw	a5,0(a5)
	srli	a7,a1,11
	addi	a6,a7,1
	li	t1,0
	beq	a5,zero,.L41
	lla	a4,PRGmask4
	add	a4,a4,a3
	lw	a3,0(a4)
	lla	a4,PRGram
	add	a4,a4,a0
	and	a2,a2,a3
	slli	a2,a2,12
	lbu	t1,0(a4)
	sub	a2,a2,a1
	add	a5,a5,a2
.L41:
	lla	a3,_ZL8PRGIsRAM
	lla	a4,Page
	slli	a2,a6,2
	add	a2,a4,a2
	add	a6,a3,a6
	slli	a1,a7,2
	sb	t1,0(a6)
	sw	a5,0(a2)
	add	a3,a3,a7
	add	a4,a4,a1
	sb	t1,0(a3)
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
	srli	a6,a0,11
	la a5, PRGptr; lw a5, 0(a5);
	addi	a2,a6,1
	li	a7,0
	beq	a5,zero,.L45
	la a4, PRGmask4; lw a4, 0(a4);
	and	a1,a1,a4
	slli	a1,a1,12
	sub	a1,a1,a0
	la a7, PRGram; lbu a7, 0(a7);
	add	a5,a5,a1
.L45:
	lla	a3,_ZL8PRGIsRAM
	lla	a4,Page
	slli	a1,a2,2
	add	a1,a4,a1
	add	a2,a3,a2
	slli	a0,a6,2
	sb	a7,0(a2)
	sw	a5,0(a1)
	add	a3,a3,a6
	add	a4,a4,a0
	sb	a7,0(a3)
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
	li	a7,8192
	lw	a6,0(a4)
	bltu	a3,a7,.L49
	lla	a4,PRGmask8
	add	a5,a4,a5
	lw	a5,0(a5)
	srli	a7,a1,11
	beq	a6,zero,.L50
	lla	a4,PRGram
	and	a3,a5,a2
	add	a4,a4,a0
	lla	a2,Page
	lbu	a0,0(a4)
	slli	a3,a3,13
	slli	a4,a7,2
	sub	a3,a3,a1
	lla	a5,_ZL8PRGIsRAM
	add	a4,a4,a2
	lla	a2,_ZL8PRGIsRAM-4
	add	a3,a6,a3
	add	a5,a7,a5
	add	a2,a2,a7
.L51:
	sb	a0,3(a5)
	sw	a3,12(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a2,a5,.L51
	ret
.L49:
	li	t1,4096
	lla	t4,PRGram
	lla	t3,PRGmask2
	slli	a3,a2,2
	add	a7,a1,a7
	lla	t6,_ZL8PRGIsRAM
	lla	t5,Page
	add	t4,t4,a0
	add	t3,t3,a5
	addi	t1,t1,-2048
.L55:
	srli	a4,a1,11
	beq	a6,zero,.L56
	lw	a5,0(t3)
	lbu	a0,0(t4)
	and	a5,a3,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,a6,a5
.L54:
	slli	a2,a4,2
	add	a2,t5,a2
	add	a4,t6,a4
	sb	a0,0(a4)
	sw	a5,0(a2)
	add	a1,a1,t1
	addi	a3,a3,1
	bne	a1,a7,.L55
	ret
.L56:
	li	a5,0
	li	a0,0
	j	.L54
.L50:
	lla	a3,Page
	slli	a4,a7,2
	lla	a5,_ZL8PRGIsRAM
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-4
	add	a5,a7,a5
	add	a3,a3,a7
.L52:
	sb	zero,3(a5)
	sw	zero,12(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L52
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
	slli	a4,a0,2
	lla	a5,PRGsize
	add	a5,a5,a4
	lw	a3,0(a5)
	lla	a5,PRGptr
	add	a5,a5,a4
	li	a7,16384
	lw	a6,0(a5)
	bltu	a3,a7,.L62
	lla	a5,PRGmask16
	add	a5,a5,a4
	lw	a5,0(a5)
	srli	a7,a1,11
	beq	a6,zero,.L63
	lla	a4,PRGram
	and	a3,a5,a2
	add	a4,a4,a0
	lla	a2,Page
	lbu	a0,0(a4)
	slli	a3,a3,14
	slli	a4,a7,2
	sub	a3,a3,a1
	lla	a5,_ZL8PRGIsRAM+7
	add	a4,a4,a2
	lla	a2,_ZL8PRGIsRAM-1
	add	a3,a6,a3
	add	a5,a7,a5
	add	a2,a2,a7
.L64:
	sb	a0,0(a5)
	sw	a3,28(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a2,a5,.L64
	ret
.L62:
	li	t1,4096
	lla	t6,PRGram
	lla	t5,PRGmask2
	slli	a2,a2,3
	add	a7,a1,a7
	lla	t4,_ZL8PRGIsRAM
	lla	t3,Page
	add	t6,t6,a0
	add	t5,t5,a4
	addi	t1,t1,-2048
	j	.L68
.L74:
	lw	a5,0(t5)
	lbu	a0,0(t6)
	slli	a3,a4,2
	and	a5,a2,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,a6,a5
	add	a4,t4,a4
	add	a3,t3,a3
	sb	a0,0(a4)
	sw	a5,0(a3)
	add	a1,a1,t1
	addi	a2,a2,1
	beq	a1,a7,.L73
.L68:
	srli	a4,a1,11
	bne	a6,zero,.L74
	slli	a3,a4,2
	li	a5,0
	li	a0,0
	add	a4,t4,a4
	add	a3,t3,a3
	sb	a0,0(a4)
	sw	a5,0(a3)
	add	a1,a1,t1
	addi	a2,a2,1
	bne	a1,a7,.L68
.L73:
	ret
.L63:
	lla	a3,Page
	slli	a4,a7,2
	lla	a5,_ZL8PRGIsRAM+7
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-1
	add	a5,a7,a5
	add	a3,a3,a7
.L65:
	sb	zero,0(a5)
	sw	zero,28(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L65
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
	slli	a4,a0,2
	lla	a5,PRGsize
	add	a5,a5,a4
	lw	a7,0(a5)
	lla	a5,PRGptr
	add	a5,a5,a4
	li	a3,32768
	lw	a6,0(a5)
	bltu	a7,a3,.L77
	lla	a5,PRGmask32
	add	a5,a5,a4
	lw	a5,0(a5)
	srli	a7,a1,11
	beq	a6,zero,.L78
	lla	a4,PRGram
	and	a3,a5,a2
	add	a4,a4,a0
	lla	a2,Page
	lbu	a0,0(a4)
	slli	a3,a3,15
	slli	a4,a7,2
	sub	a3,a3,a1
	lla	a5,_ZL8PRGIsRAM+15
	add	a4,a4,a2
	lla	a2,_ZL8PRGIsRAM-1
	add	a3,a6,a3
	add	a5,a7,a5
	add	a2,a2,a7
.L79:
	sb	a0,0(a5)
	sw	a3,60(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a2,a5,.L79
	ret
.L77:
	slli	a3,a2,4
	li	a7,4096
	lla	t6,PRGram
	lla	t5,PRGmask2
	addi	t4,a3,16
	lla	t3,_ZL8PRGIsRAM
	lla	t1,Page
	add	t6,t6,a0
	add	t5,t5,a4
	addi	a7,a7,-2048
	j	.L83
.L89:
	lw	a5,0(t5)
	lbu	a0,0(t6)
	slli	a2,a4,2
	and	a5,a3,a5
	slli	a5,a5,11
	sub	a5,a5,a1
	add	a5,a6,a5
	add	a4,t3,a4
	add	a2,t1,a2
	sb	a0,0(a4)
	sw	a5,0(a2)
	addi	a3,a3,1
	add	a1,a1,a7
	beq	a3,t4,.L88
.L83:
	srli	a4,a1,11
	bne	a6,zero,.L89
	slli	a2,a4,2
	li	a5,0
	li	a0,0
	add	a4,t3,a4
	add	a2,t1,a2
	sb	a0,0(a4)
	sw	a5,0(a2)
	addi	a3,a3,1
	add	a1,a1,a7
	bne	a3,t4,.L83
.L88:
	ret
.L78:
	lla	a3,Page
	slli	a4,a7,2
	lla	a5,_ZL8PRGIsRAM+15
	add	a4,a4,a3
	lla	a3,_ZL8PRGIsRAM-1
	add	a5,a7,a5
	add	a3,a3,a7
.L80:
	sb	zero,0(a5)
	sw	zero,60(a4)
	addi	a5,a5,-1
	addi	a4,a4,-4
	bne	a5,a3,.L80
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s3,12(sp)
	sw	s4,8(sp)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lla	s3,CHRptr
	slli	s4,a0,2
	add	a5,s3,s4
	lw	a5,0(a5)
	sw	ra,28(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L91
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,a0
	mv	s2,a1
	mv	s0,a2
	call	_Z18FCEUPPU_LineUpdatev
	lla	a4,CHRmask1
	add	a4,a4,s4
	lla	a5,CHRram
	lw	a3,0(a4)
	add	a5,a5,s1
	lbu	a5,0(a5)
	srli	a4,s2,10
	and	a2,s0,a3
	li	a3,1
	sll	a3,a3,a4
	lla	a6,PPUCHRRAM
	bne	a5,zero,.L99
	lbu	a5,0(a6)
	not	a3,a3
	and	a5,a5,a3
.L94:
	add	s3,s3,s4
	lw	a0,0(s3)
	sb	a5,0(a6)
	slli	a2,a2,10
	la a3, VPageR; lw a3, 0(a3);
	sub	a1,a2,s2
	slli	a4,a4,2
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	add	a4,a3,a4
	add	a3,a0,a1
	sw	a3,0(a4)
.L91:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L99:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lbu	a5,0(a6)
	or	a5,a5,a3
	andi	a5,a5,0xff
	j	.L94
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s2,16(sp)
	sw	s4,8(sp)
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	lla	s2,CHRptr
	slli	s4,a0,2
	add	s2,s2,s4
	lw	a5,0(s2)
	sw	ra,28(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L100
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	mv	s1,a0
	mv	s3,a1
	mv	s0,a2
	call	_Z18FCEUPPU_LineUpdatev
	lla	a5,CHRmask2
	add	a5,a5,s4
	lw	a5,0(a5)
	lw	a4,0(s2)
	srli	a0,s3,10
	and	a2,s0,a5
	addi	a3,a0,1
	slli	a2,a2,11
	la a5, VPageR; lw a5, 0(a5);
	slli	a3,a3,2
	sub	a1,a2,s3
	add	a5,a5,a3
	add	a4,a4,a1
	sw	a4,0(a5)
	sw	a4,-4(a5)
	lla	a5,CHRram
	add	a5,a5,s1
	lbu	a4,0(a5)
	li	a5,3
	sll	a5,a5,a0
	lla	a3,PPUCHRRAM
	beq	a4,zero,.L102
	lbu	a4,0(a3)
	or	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
.L100:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L102:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	lbu	a4,0(a3)
	not	a5,a5
	and	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,24(sp)
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
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
	beq	a5,zero,.L107
	tail	_Z8setchr4rijj.part.0
.L107:
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
	beq	a5,zero,.L109
	tail	_Z8setchr8rij.part.0
.L109:
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,CHRptr
	lw	a5,0(s2)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L111
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	call	_Z18FCEUPPU_LineUpdatev
	la a3, CHRmask1; lw a3, 0(a3);
	srli	a4,s1,10
	and	a1,s0,a3
	la a5, CHRram; lbu a5, 0(a5);
	li	a3,1
	sll	a3,a3,a4
	lla	a6,PPUCHRRAM
	bne	a5,zero,.L119
	lbu	a5,0(a6)
	not	a3,a3
	and	a5,a5,a3
.L114:
	lw	a2,0(s2)
	sb	a5,0(a6)
	slli	a1,a1,10
	la a3, VPageR; lw a3, 0(a3);
	sub	a0,a1,s1
	slli	a4,a4,2
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	add	a4,a3,a4
	add	a3,a2,a0
	sw	a3,0(a4)
.L111:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L119:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lbu	a5,0(a6)
	or	a5,a5,a3
	andi	a5,a5,0xff
	j	.L114
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,CHRptr
	lw	a5,0(s2)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L120
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	call	_Z18FCEUPPU_LineUpdatev
	la a5, CHRmask2; lw a5, 0(a5);
	lw	a4,0(s2)
	srli	a2,s1,10
	and	a1,s0,a5
	addi	a3,a2,1
	slli	a1,a1,11
	la a5, VPageR; lw a5, 0(a5);
	slli	a3,a3,2
	sub	a0,a1,s1
	add	a5,a5,a3
	add	a4,a4,a0
	sw	a4,0(a5)
	sw	a4,-4(a5)
	la a4, CHRram; lbu a4, 0(a4);
	li	a5,3
	sll	a5,a5,a2
	lla	a3,PPUCHRRAM
	beq	a4,zero,.L122
	lbu	a4,0(a3)
	or	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
.L120:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L122:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lbu	a4,0(a3)
	not	a5,a5
	and	a5,a4,a5
	sb	a5,0(a3)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
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
	beq	a5,zero,.L127
	mv	a1,a0
	li	a0,0
	tail	_Z8setchr4rijj.part.0
.L127:
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
	beq	a5,zero,.L129
	li	a0,0
	tail	_Z8setchr8rij.part.0
.L129:
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
	sw	s2,0(sp)
	mv	s1,a1
	.cfi_offset 18, -16
	mv	s2,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	slli	a4,s0,2
	lla	a2,PPUNTARAM
	lla	a3,vnapage
	add	a3,a3,a4
	lbu	a5,0(a2)
	li	a4,1
	sll	a4,a4,s0
	not	a1,a4
	sw	s2,0(a3)
	and	a5,a5,a1
	beq	s1,zero,.L132
	or	a5,a5,a4
	andi	a5,a5,0xff
.L132:
	sb	a5,0(a2)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	mv	s3,a0
	mv	s2,a1
	mv	s1,a2
	mv	s0,a3
	call	_Z18FCEUPPU_LineUpdatev
	lla	a4,NTARAM
	lw	ra,28(sp)
	.cfi_restore 1
	slli	a0,s3,10
	slli	a1,s2,10
	slli	a2,s1,10
	slli	a3,s0,10
	lw	s0,24(sp)
	.cfi_restore 8
	lla	a5,vnapage
	add	a0,a0,a4
	add	a1,a1,a4
	add	a2,a2,a4
	add	a3,a3,a4
	sw	a0,0(a5)
	sw	a1,4(a5)
	sw	a2,8(a5)
	sw	a3,12(a5)
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z18FCEUPPU_LineUpdatev
	la a5, _ZL10mirrorhard; lw a5, 0(a5);
	bne	a5,zero,.L139
	li	a5,2
	beq	s0,a5,.L141
	bgt	s0,a5,.L142
	beq	s0,zero,.L143
	li	a5,1
	bne	s0,a5,.L145
	lla	a5,vnapage
	lla	a3,NTARAM
	lla	a4,NTARAM+1024
	sw	a3,8(a5)
	sw	a3,0(a5)
	sw	a4,12(a5)
	sw	a4,4(a5)
.L145:
	li	a5,15
	la a4, PPUNTARAM; sb a5, 0(a4);
.L139:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L141:
	.cfi_restore_state
	lla	a5,vnapage
	lla	a4,NTARAM
	sw	a4,12(a5)
	sw	a4,8(a5)
	sw	a4,4(a5)
	sw	a4,0(a5)
	j	.L145
.L143:
	lla	a5,vnapage
	lla	a3,NTARAM
	lla	a4,NTARAM+1024
	sw	a3,4(a5)
	sw	a3,0(a5)
	sw	a4,12(a5)
	sw	a4,8(a5)
	j	.L145
.L142:
	li	a5,3
	bne	s0,a5,.L145
	lla	a5,vnapage
	lla	a4,NTARAM+1024
	sw	a4,12(a5)
	sw	a4,8(a5)
	sw	a4,4(a5)
	sw	a4,0(a5)
	j	.L145
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	li	a5,3
	mv	s0,a1
	ble	a0,a5,.L152
	lla	a5,vnapage
	lla	a3,NTARAM
	sw	a3,0(a5)
	addi	a4,a2,1024
	lla	a3,NTARAM+1024
	sw	a4,12(a5)
	sw	a3,4(a5)
	sw	a2,8(a5)
	li	a5,15
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a4, PPUNTARAM; sb a5, 0(a4);
	la a5, _ZL10mirrorhard; sw s0, 0(a5);
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L152:
	.cfi_restore_state
	la a5, _ZL10mirrorhard; sw zero, 0(a5);
	call	_Z9setmirrori
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL10mirrorhard; sw s0, 0(a5);
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
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
