#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"fceu.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL5BNulljh,"ax",@progbits
	.align	2
	.type	_ZL5BNulljh, @function
_ZL5BNulljh:
.LFB70:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE70:
	.size	_ZL5BNulljh, .-_ZL5BNulljh
	.section	.text._ZL5ANullj,"ax",@progbits
	.align	2
	.type	_ZL5ANullj, @function
_ZL5ANullj:
.LFB71:
	.cfi_startproc
	la a0, X+24; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE71:
	.size	_ZL5ANullj, .-_ZL5ANullj
	.section	.text._ZL5BRAMLjh,"ax",@progbits
	.align	2
	.type	_ZL5BRAMLjh, @function
_ZL5BRAMLjh:
.LFB84:
	.cfi_startproc
	lla	a5,RAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE84:
	.size	_ZL5BRAMLjh, .-_ZL5BRAMLjh
	.section	.text._ZL5BRAMHjh,"ax",@progbits
	.align	2
	.type	_ZL5BRAMHjh, @function
_ZL5BRAMHjh:
.LFB85:
	.cfi_startproc
	andi	a0,a0,2047
	lla	a5,RAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE85:
	.size	_ZL5BRAMHjh, .-_ZL5BRAMHjh
	.section	.text._ZL5ARAMLj,"ax",@progbits
	.align	2
	.type	_ZL5ARAMLj, @function
_ZL5ARAMLj:
.LFB86:
	.cfi_startproc
	lla	a5,RAM
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE86:
	.size	_ZL5ARAMLj, .-_ZL5ARAMLj
	.section	.text._ZL5ARAMHj,"ax",@progbits
	.align	2
	.type	_ZL5ARAMHj, @function
_ZL5ARAMHj:
.LFB87:
	.cfi_startproc
	andi	a0,a0,2047
	lla	a5,RAM
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE87:
	.size	_ZL5ARAMHj, .-_ZL5ARAMHj
	.section	.text._ZL14FCEU_CloseGamev,"ax",@progbits
	.align	2
	.type	_ZL14FCEU_CloseGamev, @function
_ZL14FCEU_CloseGamev:
.LFB69:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,GameInfo
	lw	a5,0(s0)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L8
	lw	a0,0(a5)
	beq	a0,zero,.L10
	call	free
	lw	a5,0(s0)
	sw	zero,0(a5)
.L10:
	li	a0,3
	la a5, GameInterface; lw a5, 0(a5);
	jalr	a5
	la a0, XBuf; lw a0, 0(a0);
	beq	a0,zero,.L11
	li	a2,65536
	li	a1,0
	call	memset
.L11:
	call	_Z15FCEU_CloseGeniev
	lw	a0,0(s0)
	call	free
	la a5, GameInfo; sw zero, 0(a5);
.L8:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE69:
	.size	_ZL14FCEU_CloseGamev, .-_ZL14FCEU_CloseGamev
	.section	.rodata._ZL13RegisterAReadPFhjE.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/fceu.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._ZL13RegisterAReadPFhjE,"ax",@progbits
	.align	2
	.type	_ZL13RegisterAReadPFhjE, @function
_ZL13RegisterAReadPFhjE:
.LFB72:
	.cfi_startproc
	lla	a2,_ZL5ARead
	mv	a3,a0
	mv	a5,a2
	li	a0,0
	li	a1,16
	j	.L26
.L23:
	beq	a4,a3,.L22
	addi	a0,a0,1
	addi	a5,a5,4
	beq	a0,a1,.L31
.L26:
	lw	a4,0(a5)
	bne	a4,zero,.L23
	slli	a5,a0,2
	add	a5,a2,a5
	sw	a3,0(a5)
	ret
.L31:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,165
	lla	a1,.LC0
	lla	a0,.LC1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	li	a0,1
	call	halt
.L22:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	ret
	.cfi_endproc
.LFE72:
	.size	_ZL13RegisterAReadPFhjE, .-_ZL13RegisterAReadPFhjE
	.section	.text._ZL14RegisterBWritePFvjhE,"ax",@progbits
	.align	2
	.type	_ZL14RegisterBWritePFvjhE, @function
_ZL14RegisterBWritePFvjhE:
.LFB73:
	.cfi_startproc
	lla	a2,_ZL6BWrite
	mv	a3,a0
	mv	a5,a2
	li	a0,0
	li	a1,16
	j	.L36
.L33:
	beq	a4,a3,.L32
	addi	a0,a0,1
	addi	a5,a5,4
	beq	a0,a1,.L41
.L36:
	lw	a4,0(a5)
	bne	a4,zero,.L33
	slli	a5,a0,2
	add	a5,a2,a5
	sw	a3,0(a5)
	ret
.L41:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,175
	lla	a1,.LC0
	lla	a0,.LC1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	li	a0,1
	call	halt
.L32:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	ret
	.cfi_endproc
.LFE73:
	.size	_ZL14RegisterBWritePFvjhE, .-_ZL14RegisterBWritePFvjhE
	.section	.text._ZN6FCEUGIC2Ev,"ax",@progbits
	.align	2
	.globl	_ZN6FCEUGIC2Ev
	.hidden	_ZN6FCEUGIC2Ev
	.type	_ZN6FCEUGIC2Ev, @function
_ZN6FCEUGIC2Ev:
.LFB63:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE63:
	.size	_ZN6FCEUGIC2Ev, .-_ZN6FCEUGIC2Ev
	.globl	_ZN6FCEUGIC1Ev
	.hidden	_ZN6FCEUGIC1Ev
	.set	_ZN6FCEUGIC1Ev,_ZN6FCEUGIC2Ev
	.section	.text._ZN6FCEUGID2Ev,"ax",@progbits
	.align	2
	.globl	_ZN6FCEUGID2Ev
	.hidden	_ZN6FCEUGID2Ev
	.type	_ZN6FCEUGID2Ev, @function
_ZN6FCEUGID2Ev:
.LFB66:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE66:
	.size	_ZN6FCEUGID2Ev, .-_ZN6FCEUGID2Ev
	.globl	_ZN6FCEUGID1Ev
	.hidden	_ZN6FCEUGID1Ev
	.set	_ZN6FCEUGID1Ev,_ZN6FCEUGID2Ev
	.section	.rodata._Z14FCEU_TogglePPUv.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"New PPU loaded\n"
	.align	2
.LC3:
	.string	"Old PPU loaded\n"
	.section	.text._Z14FCEU_TogglePPUv,"ax",@progbits
	.align	2
	.globl	_Z14FCEU_TogglePPUv
	.hidden	_Z14FCEU_TogglePPUv
	.type	_Z14FCEU_TogglePPUv, @function
_Z14FCEU_TogglePPUv:
.LFB68:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,newppu
	lw	a5,0(s0)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	li	a4,1
	xori	a3,a5,1
	sw	a3,0(s0)
	beq	a5,a4,.L45
	lla	a0,.LC2
	call	printf
	lla	a0,.LC2
	call	printf
	la a5, overclock_enabled; sb zero, 0(a5);
.L46:
	la a5, dendy; lw a5, 0(a5);
	seqz	a5,a5
	lw	a4,0(s0)
	neg	a5,a5
	andi	a5,a5,-50
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	a5,a5,290
	add	a5,a4,a5
	la a4, normalscanlines; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L45:
	.cfi_restore_state
	lla	a0,.LC3
	call	printf
	lla	a0,.LC3
	call	printf
	j	.L46
	.cfi_endproc
.LFE68:
	.size	_Z14FCEU_TogglePPUv, .-_Z14FCEU_TogglePPUv
	.section	.text._Z14GetReadHandleri,"ax",@progbits
	.align	2
	.globl	_Z14GetReadHandleri
	.hidden	_Z14GetReadHandleri
	.type	_Z14GetReadHandleri, @function
_Z14GetReadHandleri:
.LFB76:
	.cfi_startproc
	srli	a5,a0,1
	lla	a4,_ZL8AReadIdx
	add	a5,a5,a4
	andi	a0,a0,1
	lbu	a5,0(a5)
	beq	a0,zero,.L51
	srli	a5,a5,4
	lla	a4,_ZL5ARead
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
.L51:
	andi	a5,a5,15
	lla	a4,_ZL5ARead
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
	.cfi_endproc
.LFE76:
	.size	_Z14GetReadHandleri, .-_Z14GetReadHandleri
	.section	.text._Z17SetOneReadHandleriPFhjE,"ax",@progbits
	.align	2
	.globl	_Z17SetOneReadHandleriPFhjE
	.hidden	_Z17SetOneReadHandleriPFhjE
	.type	_Z17SetOneReadHandleriPFhjE, @function
_Z17SetOneReadHandleriPFhjE:
.LFB77:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	lla	a0,_ZL5ANullj
	beq	a1,zero,.L54
	mv	a0,a1
.L54:
	call	_ZL13RegisterAReadPFhjE
	andi	a0,a0,0xff
	li	a5,15
	bgtu	a0,a5,.L62
	andi	a4,s0,1
	li	a5,240
	beq	a4,zero,.L56
	slli	a0,a0,4
	andi	a0,a0,0xff
	li	a5,15
.L56:
	lla	a4,_ZL8AReadIdx
	srli	s0,s0,1
	add	s0,s0,a4
	lbu	a4,0(s0)
	and	a5,a5,a4
	or	a0,a0,a5
	sb	a0,0(s0)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L62:
	.cfi_restore_state
	li	a2,192
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE77:
	.size	_Z17SetOneReadHandleriPFhjE, .-_Z17SetOneReadHandleriPFhjE
	.section	.text._Z14SetReadHandleriiPFhjE,"ax",@progbits
	.align	2
	.globl	_Z14SetReadHandleriiPFhjE
	.hidden	_Z14SetReadHandleriiPFhjE
	.type	_Z14SetReadHandleriiPFhjE, @function
_Z14SetReadHandleriiPFhjE:
.LFB78:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a0
	mv	s0,a1
	beq	a2,zero,.L74
.L64:
	mv	a0,a2
	call	_ZL13RegisterAReadPFhjE
	blt	s0,s1,.L63
	andi	a1,a0,0xff
	li	a5,15
	bgtu	a1,a5,.L66
	slli	t1,a1,4
	andi	t1,t1,0xff
	addi	a2,s1,-1
	lla	a0,_ZL8AReadIdx
	j	.L67
.L75:
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,240
	mv	a4,a1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	beq	s0,a2,.L63
.L67:
	andi	a5,s0,1
	beq	a5,zero,.L75
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,15
	mv	a4,t1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	bne	s0,a2,.L67
.L63:
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
.L74:
	.cfi_restore_state
	lla	a2,_ZL5ANullj
	j	.L64
.L66:
	li	a2,192
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE78:
	.size	_Z14SetReadHandleriiPFhjE, .-_Z14SetReadHandleriiPFhjE
	.section	.text._Z15GetWriteHandleri,"ax",@progbits
	.align	2
	.globl	_Z15GetWriteHandleri
	.hidden	_Z15GetWriteHandleri
	.type	_Z15GetWriteHandleri, @function
_Z15GetWriteHandleri:
.LFB79:
	.cfi_startproc
	srli	a5,a0,1
	lla	a4,_ZL9BWriteIdx
	add	a5,a5,a4
	andi	a0,a0,1
	lbu	a5,0(a5)
	beq	a0,zero,.L77
	srli	a5,a5,4
	lla	a4,_ZL6BWrite
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
.L77:
	andi	a5,a5,15
	lla	a4,_ZL6BWrite
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,0(a5)
	ret
	.cfi_endproc
.LFE79:
	.size	_Z15GetWriteHandleri, .-_Z15GetWriteHandleri
	.section	.text._Z18SetOneWriteHandleriPFvjhE,"ax",@progbits
	.align	2
	.globl	_Z18SetOneWriteHandleriPFvjhE
	.hidden	_Z18SetOneWriteHandleriPFvjhE
	.type	_Z18SetOneWriteHandleriPFvjhE, @function
_Z18SetOneWriteHandleriPFvjhE:
.LFB80:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	lla	a0,_ZL5BNulljh
	beq	a1,zero,.L80
	mv	a0,a1
.L80:
	call	_ZL14RegisterBWritePFvjhE
	andi	a0,a0,0xff
	li	a5,15
	bgtu	a0,a5,.L88
	andi	a4,s0,1
	li	a5,240
	beq	a4,zero,.L82
	slli	a0,a0,4
	andi	a0,a0,0xff
	li	a5,15
.L82:
	lla	a4,_ZL9BWriteIdx
	srli	s0,s0,1
	add	s0,s0,a4
	lbu	a4,0(s0)
	and	a5,a5,a4
	or	a0,a0,a5
	sb	a0,0(s0)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L88:
	.cfi_restore_state
	li	a2,192
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE80:
	.size	_Z18SetOneWriteHandleriPFvjhE, .-_Z18SetOneWriteHandleriPFvjhE
	.section	.text._Z15SetWriteHandleriiPFvjhE,"ax",@progbits
	.align	2
	.globl	_Z15SetWriteHandleriiPFvjhE
	.hidden	_Z15SetWriteHandleriiPFvjhE
	.type	_Z15SetWriteHandleriiPFvjhE, @function
_Z15SetWriteHandleriiPFvjhE:
.LFB81:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a0
	mv	s0,a1
	beq	a2,zero,.L100
.L90:
	mv	a0,a2
	call	_ZL14RegisterBWritePFvjhE
	blt	s0,s1,.L89
	andi	a1,a0,0xff
	li	a5,15
	bgtu	a1,a5,.L92
	slli	t1,a1,4
	andi	t1,t1,0xff
	addi	a2,s1,-1
	lla	a0,_ZL9BWriteIdx
	j	.L93
.L101:
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,240
	mv	a4,a1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	beq	s0,a2,.L89
.L93:
	andi	a5,s0,1
	beq	a5,zero,.L101
	srli	a5,s0,1
	add	a5,a0,a5
	lbu	t0,0(a5)
	li	a3,15
	mv	a4,t1
	and	a3,a3,t0
	or	a4,a4,a3
	addi	s0,s0,-1
	sb	a4,0(a5)
	bne	s0,a2,.L93
.L89:
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
.L100:
	.cfi_restore_state
	lla	a2,_ZL5BNulljh
	j	.L90
.L92:
	li	a2,192
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE81:
	.size	_Z15SetWriteHandleriiPFvjhE, .-_Z15SetWriteHandleriiPFvjhE
	.section	.rodata._Z8PowerNESv.part.0.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"Power on\n"
	.section	.text._Z8PowerNESv.part.0,"ax",@progbits
	.align	2
	.type	_Z8PowerNESv.part.0, @function
_Z8PowerNESv.part.0:
.LFB110:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL5ANullj
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL5BNulljh
	li	a0,0
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL5ARAMLj
	li	a1,2047
	li	a0,0
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL5BRAMLjh
	li	a1,2047
	li	a0,0
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,8192
	li	a0,4096
	addi	a1,s0,-1
	lla	a2,_ZL5ARAMHj
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	li	a0,4096
	addi	a1,s0,-1
	lla	a2,_ZL5BRAMHjh
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	call	_Z15InitializeInputv
	call	_Z13FCEUSND_Powerv
	call	_Z13FCEUPPU_Powerv
	li	a0,2
	la a5, GameInterface; lw a5, 0(a5);
	jalr	a5
	lla	a5,timestampbase
	li	a3,0
	li	a4,0
	sw	a3,0(a5)
	sw	a4,4(a5)
	call	_Z11X6502_Powerv
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC4
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE110:
	.size	_Z8PowerNESv.part.0, .-_Z8PowerNESv.part.0
	.section	.text._Z5readbi,"ax",@progbits
	.align	2
	.globl	_Z5readbi
	.hidden	_Z5readbi
	.type	_Z5readbi, @function
_Z5readbi:
.LFB82:
	.cfi_startproc
	lla	a4,_ZL8AReadIdx
	srli	a5,a0,1
	add	a5,a5,a4
	andi	a4,a0,1
	lbu	a5,0(a5)
	beq	a4,zero,.L105
	srli	a5,a5,4
	slli	a5,a5,2
	lla	a4,_ZL5ARead
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
.L105:
	andi	a5,a5,15
	slli	a5,a5,2
	lla	a4,_ZL5ARead
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.cfi_endproc
.LFE82:
	.size	_Z5readbi, .-_Z5readbi
	.section	.text._Z6writebih,"ax",@progbits
	.align	2
	.globl	_Z6writebih
	.hidden	_Z6writebih
	.type	_Z6writebih, @function
_Z6writebih:
.LFB83:
	.cfi_startproc
	lla	a4,_ZL9BWriteIdx
	srli	a5,a0,1
	add	a5,a5,a4
	lbu	a4,0(a5)
	andi	a3,a0,1
	andi	a5,a4,15
	beq	a3,zero,.L109
	srli	a5,a4,4
.L109:
	slli	a5,a5,2
	lla	a4,_ZL6BWrite
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.cfi_endproc
.LFE83:
	.size	_Z6writebih, .-_Z6writebih
	.section	.text._Z15ResetGameLoadedv,"ax",@progbits
	.align	2
	.globl	_Z15ResetGameLoadedv
	.hidden	_Z15ResetGameLoadedv
	.type	_Z15ResetGameLoadedv, @function
_Z15ResetGameLoadedv:
.LFB88:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, GameInfo; lw a5, 0(a5);
	beq	a5,zero,.L111
	call	_ZL14FCEU_CloseGamev
.L111:
	la a5, EmulationPaused; sw zero, 0(a5);
	la a5, GameStateRestore; sw zero, 0(a5);
	la a5, PPU_hook; sw zero, 0(a5);
	la a5, GameHBIRQHook; sw zero, 0(a5);
	la a5, FFCEUX_PPURead; sw zero, 0(a5);
	la a5, FFCEUX_PPUWrite; sw zero, 0(a5);
	la a5, GameExpSound+20; lw a5, 0(a5);
	beq	a5,zero,.L112
	jalr	a5
.L112:
	li	a2,24
	li	a1,0
	lla	a0,GameExpSound
	call	memset
	lla	a4,PAL
	lbu	a5,0(a4)
	la a3, MapIRQHook; sw zero, 0(a3);
	la a3, MMC5Hack; sw zero, 0(a3);
	andi	a5,a5,1
	sb	a5,0(a4)
	lw	ra,8(sp)
	.cfi_restore 1
	la a3, PEC586Hack; sw zero, 0(a3);
	la a3, QTAIHack; sw zero, 0(a3);
	la a5, default_palette_selection; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE88:
	.size	_Z15ResetGameLoadedv, .-_Z15ResetGameLoadedv
	.section	.text._Z16FCEUI_Initializev,"ax",@progbits
	.align	2
	.globl	_Z16FCEUI_Initializev
	.hidden	_Z16FCEUI_Initializev
	.type	_Z16FCEUI_Initializev, @function
_Z16FCEUI_Initializev:
.LFB91:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	srand
	call	_Z21FCEU_InitVirtualVideov
	li	a5,0
	beq	a0,zero,.L121
	li	a2,72
	li	a1,0
	lla	a0,FSettings
	call	memset
	lla	a5,FSettings
	li	a3,239
	li	a4,256
	sw	a3,52(a5)
	sw	a3,56(a5)
	li	a3,150
	sw	a3,8(a5)
	sw	a4,12(a5)
	sw	a4,16(a5)
	sw	a4,20(a5)
	sw	a4,24(a5)
	sw	a4,28(a5)
	la a2, FSettings+44; sw zero, 0(a2);
	la a2, FSettings+48; sw zero, 0(a2);
	call	_Z12FCEUPPU_Initv
	call	_Z10X6502_Initv
	li	a5,1
.L121:
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE91:
	.size	_Z16FCEUI_Initializev, .-_Z16FCEUI_Initializev
	.section	.text._Z10FCEUI_Killv,"ax",@progbits
	.align	2
	.globl	_Z10FCEUI_Killv
	.hidden	_Z10FCEUI_Killv
	.type	_Z10FCEUI_Killv, @function
_Z10FCEUI_Killv:
.LFB92:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z21FCEU_KillVirtualVideov
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14FCEU_KillGeniev
	.cfi_endproc
.LFE92:
	.size	_Z10FCEUI_Killv, .-_Z10FCEUI_Killv
	.section	.text._Z13FCEUI_EmulatePPhPPiS1_i,"ax",@progbits
	.align	2
	.globl	_Z13FCEUI_EmulatePPhPPiS1_i
	.hidden	_Z13FCEUI_EmulatePPhPPiS1_i
	.type	_Z13FCEUI_EmulatePPhPPiS1_i, @function
_Z13FCEUI_EmulatePPhPPiS1_i:
.LFB93:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	s0,16(sp)
	sw	ra,20(sp)
	sw	s1,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	la a5, frameAdvanceRequested; lbu a5, 0(a5);
	sw	a0,0(sp)
	sw	a1,4(sp)
	sw	a2,8(sp)
	mv	s0,a3
	bne	a5,zero,.L129
	lla	s1,EmulationPaused
	lw	a5,0(s1)
	andi	a3,a5,2
.L130:
	bne	a3,zero,.L135
	andi	a5,a5,1
	bne	a5,zero,.L152
	call	_Z16FCEU_UpdateInputv
	mv	a0,s0
	call	_Z12FCEUPPU_Loopi
	li	a5,2
	bne	s0,a5,.L153
.L139:
	lla	a3,timestampbase
	lw	a5,0(a3)
	lw	a1,4(a3)
	la a2, timestamp; lw a2, 0(a2);
	add	a2,a5,a2
	sltu	a5,a2,a5
	add	a5,a5,a1
	sw	a5,4(a3)
	la a5, timestamp; sw zero, 0(a5);
	la a5, soundtimestamp; sw zero, 0(a5);
	sw	a2,0(a3)
	li	a5,0
	li	a0,0
.L141:
	lw	a4,0(sp)
	sw	a5,0(a4)
	lw	a5,4(sp)
	sw	zero,0(a5)
	lw	a5,8(sp)
	sw	a0,0(a5)
	lw	a5,0(s1)
	andi	a5,a5,2
	beq	a5,zero,.L128
	li	a5,1
	sw	a5,0(s1)
.L128:
	lw	ra,20(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	lw	s1,12(sp)
	.cfi_restore 9
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
.L129:
	.cfi_restore_state
	lla	a2,frameAdvance_Delay_count
	lw	a3,0(a2)
	la a5, frameAdvance_Delay; lw a5, 0(a5);
	lla	s1,EmulationPaused
	bne	a3,zero,.L154
	li	a3,2
	sw	a3,0(s1)
	ble	a5,zero,.L132
	li	a5,1
	sw	a5,0(a2)
	li	a5,2
.L135:
	andi	a5,a5,-2
	sw	a5,0(s1)
.L155:
	call	_Z16FCEU_UpdateInputv
	mv	a0,s0
	call	_Z12FCEUPPU_Loopi
	li	a5,2
	beq	s0,a5,.L139
.L153:
	call	_Z17FlushEmulateSoundv
	lla	a3,timestampbase
	lw	a5,0(a3)
	lw	a1,4(a3)
	la a2, timestamp; lw a2, 0(a2);
	add	a2,a5,a2
	sltu	a5,a2,a5
	add	a5,a5,a1
	sw	a5,4(a3)
	sw	a2,0(a3)
	la a5, timestamp; sw zero, 0(a5);
	la a5, soundtimestamp; sw zero, 0(a5);
	bne	s0,zero,.L142
	la a5, XBuf; lw a5, 0(a5);
	j	.L141
.L154:
	blt	a3,a5,.L150
.L132:
	li	a5,2
	sw	a5,0(s1)
	j	.L155
.L150:
	lw	a5,0(s1)
	addi	a3,a3,1
	sw	a3,0(a2)
	andi	a3,a5,2
	j	.L130
.L152:
	lla	s0,XBuf
	lw	a0,0(s0)
	li	a2,65536
	li	a1,0
	call	memset
	lw	a5,0(s0)
	lw	a4,0(sp)
	lw	ra,20(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	sw	a5,0(a4)
	lw	a5,4(sp)
	lw	s1,12(sp)
	.cfi_restore 9
	sw	zero,0(a5)
	lw	a5,8(sp)
	sw	zero,0(a5)
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
.L142:
	.cfi_restore_state
	li	a5,0
	j	.L141
	.cfi_endproc
.LFE93:
	.size	_Z13FCEUI_EmulatePPhPPiS1_i, .-_Z13FCEUI_EmulatePPhPPiS1_i
	.section	.text._Z15FCEUI_CloseGamev,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_CloseGamev
	.hidden	_Z15FCEUI_CloseGamev
	.type	_Z15FCEUI_CloseGamev, @function
_Z15FCEUI_CloseGamev:
.LFB94:
	.cfi_startproc
	tail	_ZL14FCEU_CloseGamev
	.cfi_endproc
.LFE94:
	.size	_Z15FCEUI_CloseGamev, .-_Z15FCEUI_CloseGamev
	.section	.text._Z21xoroshiro128plus_nextv,"ax",@progbits
	.align	2
	.globl	_Z21xoroshiro128plus_nextv
	.hidden	_Z21xoroshiro128plus_nextv
	.type	_Z21xoroshiro128plus_nextv, @function
_Z21xoroshiro128plus_nextv:
.LFB95:
	.cfi_startproc
	li	a0,0
	li	a1,0
	ret
	.cfi_endproc
.LFE95:
	.size	_Z21xoroshiro128plus_nextv, .-_Z21xoroshiro128plus_nextv
	.section	.text._Z15FCEU_MemoryRandPhjb,"ax",@progbits
	.align	2
	.globl	_Z15FCEU_MemoryRandPhjb
	.hidden	_Z15FCEU_MemoryRandPhjb
	.type	_Z15FCEU_MemoryRandPhjb, @function
_Z15FCEU_MemoryRandPhjb:
.LFB96:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE96:
	.size	_Z15FCEU_MemoryRandPhjb, .-_Z15FCEU_MemoryRandPhjb
	.section	.text._Z8PowerNESv,"ax",@progbits
	.align	2
	.globl	_Z8PowerNESv
	.hidden	_Z8PowerNESv
	.type	_Z8PowerNESv, @function
_Z8PowerNESv:
.LFB97:
	.cfi_startproc
	la a5, GameInfo; lw a5, 0(a5);
	beq	a5,zero,.L159
	tail	_Z8PowerNESv.part.0
.L159:
	ret
	.cfi_endproc
.LFE97:
	.size	_Z8PowerNESv, .-_Z8PowerNESv
	.section	.text._Z16FCEU_ResetVidSysv,"ax",@progbits
	.align	2
	.globl	_Z16FCEU_ResetVidSysv
	.hidden	_Z16FCEU_ResetVidSysv
	.type	_Z16FCEU_ResetVidSysv, @function
_Z16FCEU_ResetVidSysv:
.LFB98:
	.cfi_startproc
	la a5, GameInfo; lw a5, 0(a5);
	lw	a5,12(a5)
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L162
	li	a4,1
	beq	a5,a4,.L163
	la a5, FSettings; lw a5, 0(a5);
	beq	a5,zero,.L162
.L163:
	li	a5,1
	la a4, PAL; sb a5, 0(a4);
	la a5, dendy; sw zero, 0(a5);
	la a5, newppu; lw a5, 0(a5);
	beq	a5,zero,.L167
	addi	a5,a5,240
	li	a0,1
	la a4, overclock_enabled; sb zero, 0(a4);
	la a4, normalscanlines; sw a5, 0(a4);
	la a4, totalscanlines; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z17SetSoundVariablesv
.L162:
	.cfi_restore_state
	la a5, PAL; sb zero, 0(a5);
	la a5, newppu; lw a5, 0(a5);
	la a0, dendy; lw a0, 0(a0);
	bne	a5,zero,.L164
	la a4, overclock_enabled; lbu a4, 0(a4);
	beq	a0,zero,.L177
	li	a0,1
	li	a5,290
.L166:
	la a3, normalscanlines; sw a5, 0(a3);
	beq	a4,zero,.L168
	la a4, postrenderscanlines; lw a4, 0(a4);
	add	a5,a5,a4
.L168:
	la a4, totalscanlines; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z17SetSoundVariablesv
.L164:
	.cfi_restore_state
	la a4, overclock_enabled; sb zero, 0(a4);
	beq	a0,zero,.L178
	addi	a5,a5,290
	li	a0,1
	la a4, normalscanlines; sw a5, 0(a4);
	la a4, totalscanlines; sw a5, 0(a4);
	call	_Z22FCEUPPU_SetVideoSystemi
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z17SetSoundVariablesv
.L167:
	.cfi_restore_state
	la a4, overclock_enabled; lbu a4, 0(a4);
	li	a0,1
.L177:
	li	a5,240
	j	.L166
.L178:
	addi	a5,a5,240
	la a4, normalscanlines; sw a5, 0(a4);
	j	.L168
	.cfi_endproc
.LFE98:
	.size	_Z16FCEU_ResetVidSysv, .-_Z16FCEU_ResetVidSysv
	.section	.rodata._Z21FCEUI_LoadGameVirtualPKcib.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"nes"
	.align	2
.LC6:
	.string	"fds"
	.align	2
.LC7:
	.string	"rb"
	.align	2
.LC8:
	.string	"Error opening \"%s\"!"
	.align	2
.LC9:
	.string	"Loading ...\n\n"
	.align	2
.LC10:
	.string	"PAL mode set\n"
	.align	2
.LC11:
	.string	"Dendy mode set\n"
	.align	2
.LC12:
	.string	"NTSC mode set\n"
	.align	2
.LC13:
	.string	"An error occurred while loading the file."
	.section	.text._Z21FCEUI_LoadGameVirtualPKcib,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_LoadGameVirtualPKcib
	.hidden	_Z21FCEUI_LoadGameVirtualPKcib
	.type	_Z21FCEUI_LoadGameVirtualPKcib, @function
_Z21FCEUI_LoadGameVirtualPKcib:
.LFB89:
	.cfi_startproc
	addi	sp,sp,-2044
	.cfi_def_cfa_offset 2044
	li	a3,4096
	li	a4,-4096
	sw	s0,2036(sp)
	sw	s1,2032(sp)
	sw	ra,2040(sp)
	addi	a4,a4,2032
	addi	sp,sp,-56
	.cfi_def_cfa_offset 2100
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	addi	t1,a3,-2028
	add	t1,t1,a4
	addi	a4,sp,20
	add	a4,t1,a4
	sw	a4,8(sp)
	addi	t1,a3,-2028
	li	a4,-4096
	add	t1,t1,a4
	addi	a4,sp,20
	add	a4,t1,a4
	sw	a4,4(sp)
	lw	a4,8(sp)
	lla	t2,PAL
	mv	t0,a1
	sw	a4,0(sp)
	lbu	t2,0(t2)
	sw	t0,8(sp)
	lw	t0,4(sp)
	mv	t1,a2
	sw	t2,16(sp)
	li	a5,-4096
	lla	t2,dendy
	lw	t2,0(t2)
	addi	a5,a5,2036
	addi	a4,a3,-2028
	sw	t1,12(sp)
	lla	t1,.LC5
	add	a4,a4,a5
	sw	t1,2036(t0)
	addi	a5,sp,20
	lla	t1,.LC6
	add	a5,a4,a5
	li	a3,0
	li	a4,-1
	lla	a2,.LC7
	li	a1,0
	sw	t1,2040(t0)
	sw	zero,2044(t0)
	sw	zero,2032(t0)
	sw	t2,20(sp)
	mv	s1,a0
	call	_Z10FCEU_fopenPKcS0_S0_PciPS0_Pi
	mv	s0,a0
	beq	a0,zero,.L210
	mv	a1,s1
	addi	a0,sp,40
	call	strcpy
	call	_Z15ResetGameLoadedv
	lla	a0,.LC9
	call	printf
	call	_ZL14FCEU_CloseGamev
	li	a0,60
	call	malloc
	lla	s1,GameInfo
	li	a2,60
	li	a1,0
	sw	a0,0(s1)
	call	memset
	lw	a3,4(s0)
	lw	a5,0(s1)
	lw	a2,8(sp)
	li	a4,-1
	sw	a3,56(a5)
	li	a3,2
	sw	zero,52(a5)
	sw	zero,48(a5)
	sw	zero,0(a5)
	sw	zero,8(a5)
	sw	a3,12(a5)
	sw	a4,20(a5)
	sw	a4,16(a5)
	sw	a4,24(a5)
	sw	zero,28(a5)
	mv	a1,s0
	addi	a0,sp,40
	call	_Z8iNESLoadPKcP8FCEUFILEi
	beq	a0,zero,.L183
	lw	a5,8(sp)
	bne	a5,zero,.L211
.L184:
	lw	a5,0(s1)
	beq	a5,zero,.L185
	call	_Z8PowerNESv.part.0
	lw	a5,0(s1)
.L185:
	lw	a4,8(a5)
	li	a5,3
	beq	a4,a5,.L186
	call	_Z20FCEU_LoadGamePalettev
.L186:
	call	_Z17FCEU_ResetPalettev
	lw	a5,16(sp)
	bne	a5,zero,.L187
	lla	a5,PAL
	lbu	a5,0(a5)
	bne	a5,zero,.L212
	lw	a5,20(sp)
	bne	a5,zero,.L193
	lla	a5,dendy
	lw	a5,0(a5)
	beq	a5,zero,.L189
.L191:
	lla	a0,.LC11
	call	printf
	lla	a0,.LC11
	call	printf
	j	.L189
.L183:
	lw	a5,12(sp)
	beq	a5,zero,.L213
.L194:
	lw	a0,0(s1)
	call	free
	la a5, GameInfo; sw zero, 0(a5);
.L189:
	mv	a0,s0
	call	_Z11FCEU_fcloseP8FCEUFILE
	lw	s0,0(s1)
.L179:
	addi	sp,sp,56
	.cfi_remember_state
	.cfi_def_cfa_offset 2044
	lw	ra,2040(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s1,2032(sp)
	.cfi_restore 9
	lw	s0,2036(sp)
	.cfi_restore 8
	addi	sp,sp,2044
	.cfi_def_cfa_offset 0
	jr	ra
.L187:
	.cfi_restore_state
	lw	a5,20(sp)
	bne	a5,zero,.L190
	lla	a5,dendy
	lw	a5,0(a5)
	bne	a5,zero,.L191
	lla	a5,PAL
	lbu	a5,0(a5)
	bne	a5,zero,.L189
.L195:
	lla	a0,.LC12
	call	printf
	lla	a0,.LC12
	call	printf
	j	.L189
.L190:
	lla	a5,PAL
	lbu	a5,0(a5)
	bne	a5,zero,.L189
.L193:
	lla	a5,dendy
	lw	a5,0(a5)
	bne	a5,zero,.L189
	j	.L195
.L212:
	lla	a0,.LC10
	call	printf
	lla	a0,.LC10
	call	printf
	j	.L189
.L210:
	lw	a5,12(sp)
	bne	a5,zero,.L179
	lw	a5,4(sp)
	lw	a5,2032(a5)
	bne	a5,zero,.L179
	mv	a1,s1
	lla	a0,.LC8
	call	printf
	j	.L179
.L211:
	call	_Z16FCEU_ResetVidSysv
	j	.L184
.L213:
	lla	a0,.LC13
	call	printf
	j	.L194
	.cfi_endproc
.LFE89:
	.size	_Z21FCEUI_LoadGameVirtualPKcib, .-_Z21FCEUI_LoadGameVirtualPKcib
	.section	.text._Z14FCEUI_LoadGamePKcib,"ax",@progbits
	.align	2
	.globl	_Z14FCEUI_LoadGamePKcib
	.hidden	_Z14FCEUI_LoadGamePKcib
	.type	_Z14FCEUI_LoadGamePKcib, @function
_Z14FCEUI_LoadGamePKcib:
.LFB90:
	.cfi_startproc
	tail	_Z21FCEUI_LoadGameVirtualPKcib
	.cfi_endproc
.LFE90:
	.size	_Z14FCEUI_LoadGamePKcib, .-_Z14FCEUI_LoadGamePKcib
	.section	.text._Z22FCEUI_SetRenderedLinesiiii,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetRenderedLinesiiii
	.hidden	_Z22FCEUI_SetRenderedLinesiiii
	.type	_Z22FCEUI_SetRenderedLinesiiii, @function
_Z22FCEUI_SetRenderedLinesiiii:
.LFB99:
	.cfi_startproc
	lla	a5,FSettings
	sw	a0,44(a5)
	sw	a1,52(a5)
	sw	a2,48(a5)
	sw	a3,56(a5)
	la a4, PAL; lbu a4, 0(a4);
	bne	a4,zero,.L216
	la a4, dendy; lw a4, 0(a4);
	beq	a4,zero,.L217
.L216:
	sw	a3,40(a5)
	sw	a2,36(a5)
	ret
.L217:
	mv	a3,a1
	mv	a2,a0
	sw	a3,40(a5)
	sw	a2,36(a5)
	ret
	.cfi_endproc
.LFE99:
	.size	_Z22FCEUI_SetRenderedLinesiiii, .-_Z22FCEUI_SetRenderedLinesiiii
	.section	.text._Z18FCEUI_SetVidSystemi,"ax",@progbits
	.align	2
	.globl	_Z18FCEUI_SetVidSystemi
	.hidden	_Z18FCEUI_SetVidSystemi
	.type	_Z18FCEUI_SetVidSystemi, @function
_Z18FCEUI_SetVidSystemi:
.LFB100:
	.cfi_startproc
	snez	a0,a0
	la a5, FSettings; sw a0, 0(a5);
	la a5, GameInfo; lw a5, 0(a5);
	beq	a5,zero,.L218
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z16FCEU_ResetVidSysv
	call	_Z17FCEU_ResetPalettev
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z18FCEUD_VideoChangedv
.L218:
	ret
	.cfi_endproc
.LFE100:
	.size	_Z18FCEUI_SetVidSystemi, .-_Z18FCEUI_SetVidSystemi
	.section	.text._Z25FCEUI_GetCurrentVidSystemPiS_,"ax",@progbits
	.align	2
	.globl	_Z25FCEUI_GetCurrentVidSystemPiS_
	.hidden	_Z25FCEUI_GetCurrentVidSystemPiS_
	.type	_Z25FCEUI_GetCurrentVidSystemPiS_, @function
_Z25FCEUI_GetCurrentVidSystemPiS_:
.LFB101:
	.cfi_startproc
	beq	a0,zero,.L224
	la a5, FSettings+36; lw a5, 0(a5);
	sw	a5,0(a0)
.L224:
	beq	a1,zero,.L225
	la a5, FSettings+40; lw a5, 0(a5);
	sw	a5,0(a1)
.L225:
	la a0, PAL; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE101:
	.size	_Z25FCEUI_GetCurrentVidSystemPiS_, .-_Z25FCEUI_GetCurrentVidSystemPiS_
	.section	.text._Z15FCEUI_SetRegionii,"ax",@progbits
	.align	2
	.globl	_Z15FCEUI_SetRegionii
	.hidden	_Z15FCEUI_SetRegionii
	.type	_Z15FCEUI_SetRegionii, @function
_Z15FCEUI_SetRegionii:
.LFB102:
	.cfi_startproc
	li	a5,1
	beq	a0,a5,.L233
	li	a4,2
	beq	a0,a4,.L234
	beq	a0,zero,.L235
	lla	a4,normalscanlines
	lw	a5,0(a4)
	la a0, pal_emulation; lw a0, 0(a0);
	snez	a0,a0
.L236:
	la a3, newppu; lw a3, 0(a3);
	add	a5,a5,a3
	sw	a5,0(a4)
	la a4, overclock_enabled; lbu a4, 0(a4);
	beq	a4,zero,.L237
	la a4, postrenderscanlines; lw a4, 0(a4);
	add	a5,a5,a4
.L237:
	la a4, totalscanlines; sw a5, 0(a4);
	la a5, FSettings; sw a0, 0(a5);
	la a5, GameInfo; lw a5, 0(a5);
	beq	a5,zero,.L246
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z16FCEU_ResetVidSysv
	call	_Z17FCEU_ResetPalettev
	call	_Z18FCEUD_VideoChangedv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z18RefreshThrottleFPSv
.L234:
	la a4, dendy; sw a5, 0(a4);
	la a4, pal_emulation; sw zero, 0(a4);
	li	a0,0
	li	a5,290
	lla	a4,normalscanlines
	j	.L236
.L246:
	tail	_Z18RefreshThrottleFPSv
.L235:
	la a5, pal_emulation; sw zero, 0(a5);
	la a5, dendy; sw zero, 0(a5);
	li	a5,240
	lla	a4,normalscanlines
	j	.L236
.L233:
	la a5, pal_emulation; sw a0, 0(a5);
	la a5, dendy; sw zero, 0(a5);
	li	a5,240
	lla	a4,normalscanlines
	j	.L236
	.cfi_endproc
.LFE102:
	.size	_Z15FCEUI_SetRegionii, .-_Z15FCEUI_SetRegionii
	.section	.text._Z19FCEUI_GetDesiredFPSv,"ax",@progbits
	.align	2
	.globl	_Z19FCEUI_GetDesiredFPSv
	.hidden	_Z19FCEUI_GetDesiredFPSv
	.type	_Z19FCEUI_GetDesiredFPSv, @function
_Z19FCEUI_GetDesiredFPSv:
.LFB103:
	.cfi_startproc
	la a5, PAL; lbu a5, 0(a5);
	li	a0,50
	bne	a5,zero,.L249
	la a0, dendy; lw a0, 0(a0);
	snez	a0,a0
	neg	a0,a0
	andi	a0,a0,-10
	addi	a0,a0,60
.L249:
	ret
	.cfi_endproc
.LFE103:
	.size	_Z19FCEUI_GetDesiredFPSv, .-_Z19FCEUI_GetDesiredFPSv
	.section	.text._Z21FCEUI_EmulationPausedv,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_EmulationPausedv
	.hidden	_Z21FCEUI_EmulationPausedv
	.type	_Z21FCEUI_EmulationPausedv, @function
_Z21FCEUI_EmulationPausedv:
.LFB104:
	.cfi_startproc
	la a0, EmulationPaused; lw a0, 0(a0);
	andi	a0,a0,1
	ret
	.cfi_endproc
.LFE104:
	.size	_Z21FCEUI_EmulationPausedv, .-_Z21FCEUI_EmulationPausedv
	.section	.text._Z23FCEU_TextScanlineOffseti,"ax",@progbits
	.align	2
	.globl	_Z23FCEU_TextScanlineOffseti
	.hidden	_Z23FCEU_TextScanlineOffseti
	.type	_Z23FCEU_TextScanlineOffseti, @function
_Z23FCEU_TextScanlineOffseti:
.LFB105:
	.cfi_startproc
	la a0, FSettings+36; lw a0, 0(a0);
	slli	a0,a0,8
	ret
	.cfi_endproc
.LFE105:
	.size	_Z23FCEU_TextScanlineOffseti, .-_Z23FCEU_TextScanlineOffseti
	.section	.text._Z33FCEU_TextScanlineOffsetFromBottomi,"ax",@progbits
	.align	2
	.globl	_Z33FCEU_TextScanlineOffsetFromBottomi
	.hidden	_Z33FCEU_TextScanlineOffsetFromBottomi
	.type	_Z33FCEU_TextScanlineOffsetFromBottomi, @function
_Z33FCEU_TextScanlineOffsetFromBottomi:
.LFB106:
	.cfi_startproc
	la a5, FSettings+40; lw a5, 0(a5);
	sub	a0,a5,a0
	slli	a0,a0,8
	ret
	.cfi_endproc
.LFE106:
	.size	_Z33FCEU_TextScanlineOffsetFromBottomi, .-_Z33FCEU_TextScanlineOffsetFromBottomi
	.hidden	FSettings
	.globl	FSettings
	.section	.bss.FSettings,"aw",@nobits
	.align	2
	.type	FSettings, @object
	.size	FSettings, 72
FSettings:
	.zero	72
	.hidden	PAL
	.globl	PAL
	.section	.sbss.PAL,"aw",@nobits
	.type	PAL, @object
	.size	PAL, 1
PAL:
	.zero	1
	.hidden	RAM
	.globl	RAM
	.section	.bss.RAM,"aw",@nobits
	.align	2
	.type	RAM, @object
	.size	RAM, 2048
RAM:
	.zero	2048
	.hidden	EnableAutosave
	.globl	EnableAutosave
	.section	.sbss.EnableAutosave,"aw",@nobits
	.align	2
	.type	EnableAutosave, @object
	.size	EnableAutosave, 4
EnableAutosave:
	.zero	4
	.hidden	AutosaveFrequency
	.globl	AutosaveFrequency
	.section	.sdata.AutosaveFrequency,"aw"
	.align	2
	.type	AutosaveFrequency, @object
	.size	AutosaveFrequency, 4
AutosaveFrequency:
	.word	256
	.hidden	AutosaveQty
	.globl	AutosaveQty
	.section	.sdata.AutosaveQty,"aw"
	.align	2
	.type	AutosaveQty, @object
	.size	AutosaveQty, 4
AutosaveQty:
	.word	4
	.hidden	frameAdvance_Delay
	.globl	frameAdvance_Delay
	.section	.sdata.frameAdvance_Delay,"aw"
	.align	2
	.type	frameAdvance_Delay, @object
	.size	frameAdvance_Delay, 4
frameAdvance_Delay:
	.word	10
	.hidden	frameAdvance_Delay_count
	.globl	frameAdvance_Delay_count
	.section	.sbss.frameAdvance_Delay_count,"aw",@nobits
	.align	2
	.type	frameAdvance_Delay_count, @object
	.size	frameAdvance_Delay_count, 4
frameAdvance_Delay_count:
	.zero	4
	.hidden	frameAdvanceRequested
	.globl	frameAdvanceRequested
	.section	.sbss.frameAdvanceRequested,"aw",@nobits
	.type	frameAdvanceRequested, @object
	.size	frameAdvanceRequested, 1
frameAdvanceRequested:
	.zero	1
	.hidden	EmulationPaused
	.globl	EmulationPaused
	.section	.sbss.EmulationPaused,"aw",@nobits
	.align	2
	.type	EmulationPaused, @object
	.size	EmulationPaused, 4
EmulationPaused:
	.zero	4
	.section	.bss._ZL6BWrite,"aw",@nobits
	.align	2
	.type	_ZL6BWrite, @object
	.size	_ZL6BWrite, 64
_ZL6BWrite:
	.zero	64
	.section	.bss._ZL5ARead,"aw",@nobits
	.align	2
	.type	_ZL5ARead, @object
	.size	_ZL5ARead, 64
_ZL5ARead:
	.zero	64
	.section	.bss._ZL9BWriteIdx,"aw",@nobits
	.align	2
	.type	_ZL9BWriteIdx, @object
	.size	_ZL9BWriteIdx, 32768
_ZL9BWriteIdx:
	.zero	32768
	.section	.bss._ZL8AReadIdx,"aw",@nobits
	.align	2
	.type	_ZL8AReadIdx, @object
	.size	_ZL8AReadIdx, 32768
_ZL8AReadIdx:
	.zero	32768
	.hidden	GameStateRestore
	.globl	GameStateRestore
	.section	.sbss.GameStateRestore,"aw",@nobits
	.align	2
	.type	GameStateRestore, @object
	.size	GameStateRestore, 4
GameStateRestore:
	.zero	4
	.hidden	GameInterface
	.globl	GameInterface
	.section	.sbss.GameInterface,"aw",@nobits
	.align	2
	.type	GameInterface, @object
	.size	GameInterface, 4
GameInterface:
	.zero	4
	.hidden	GameInfo
	.globl	GameInfo
	.section	.sbss.GameInfo,"aw",@nobits
	.align	2
	.type	GameInfo, @object
	.size	GameInfo, 4
GameInfo:
	.zero	4
	.hidden	timestampbase
	.globl	timestampbase
	.section	.sbss.timestampbase,"aw",@nobits
	.align	3
	.type	timestampbase, @object
	.size	timestampbase, 8
timestampbase:
	.zero	8
	.hidden	vblankscanlines
	.globl	vblankscanlines
	.section	.sbss.vblankscanlines,"aw",@nobits
	.align	2
	.type	vblankscanlines, @object
	.size	vblankscanlines, 4
vblankscanlines:
	.zero	4
	.hidden	postrenderscanlines
	.globl	postrenderscanlines
	.section	.sbss.postrenderscanlines,"aw",@nobits
	.align	2
	.type	postrenderscanlines, @object
	.size	postrenderscanlines, 4
postrenderscanlines:
	.zero	4
	.hidden	totalscanlines
	.globl	totalscanlines
	.section	.sbss.totalscanlines,"aw",@nobits
	.align	2
	.type	totalscanlines, @object
	.size	totalscanlines, 4
totalscanlines:
	.zero	4
	.hidden	normalscanlines
	.globl	normalscanlines
	.section	.sbss.normalscanlines,"aw",@nobits
	.align	2
	.type	normalscanlines, @object
	.size	normalscanlines, 4
normalscanlines:
	.zero	4
	.hidden	skip_7bit_overclocking
	.globl	skip_7bit_overclocking
	.section	.sdata.skip_7bit_overclocking,"aw"
	.type	skip_7bit_overclocking, @object
	.size	skip_7bit_overclocking, 1
skip_7bit_overclocking:
	.byte	1
	.hidden	overclocking
	.globl	overclocking
	.section	.sbss.overclocking,"aw",@nobits
	.type	overclocking, @object
	.size	overclocking, 1
overclocking:
	.zero	1
	.hidden	overclock_enabled
	.globl	overclock_enabled
	.section	.sbss.overclock_enabled,"aw",@nobits
	.type	overclock_enabled, @object
	.size	overclock_enabled, 1
overclock_enabled:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
