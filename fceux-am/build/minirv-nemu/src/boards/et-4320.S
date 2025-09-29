#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"et-4320.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL16BMC810131C_Closev,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Closev, @function
_ZL16BMC810131C_Closev:
.LFB11:
	.cfi_startproc
	la a0, _ZL6CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	la a5, _ZL6CHRRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL16BMC810131C_Closev, .-_ZL16BMC810131C_Closev
	.section	.text._ZL16BMC810131C_Resetv,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Resetv, @function
_ZL16BMC810131C_Resetv:
.LFB9:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE9:
	.size	_ZL16BMC810131C_Resetv, .-_ZL16BMC810131C_Resetv
	.section	.text._ZL16BMC810131C_Powerv,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Powerv, @function
_ZL16BMC810131C_Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL16BMC810131C_Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL16BMC810131C_Powerv, .-_ZL16BMC810131C_Powerv
	.section	.text._ZL6TKSPPUj,"ax",@progbits
	.align	2
	.type	_ZL6TKSPPUj, @function
_ZL6TKSPPUj:
.LFB12:
	.cfi_startproc
	srli	a0,a0,10
	andi	a0,a0,7
	la a5, EXPREGS; lbu a5, 0(a5);
	la a4, _ZL9PPUCHRBus; sb a0, 0(a4);
	andi	a5,a5,8
	bne	a5,zero,.L16
	ret
.L16:
	lla	a5,_ZL6TKSMIR
	add	a5,a5,a0
	lbu	a0,0(a5)
	addi	a0,a0,2
	tail	_Z9setmirrori
	.cfi_endproc
.LFE12:
	.size	_ZL6TKSPPUj, .-_ZL6TKSPPUj
	.section	.text._ZL13BMC810131C_CWjh,"ax",@progbits
	.align	2
	.type	_ZL13BMC810131C_CWjh, @function
_ZL13BMC810131C_CWjh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	lla	s2,EXPREGS
	lbu	a5,0(s2)
	mv	s1,a0
	mv	s0,a1
	andi	a4,a5,16
	bne	a4,zero,.L26
	slli	a1,a5,7
	li	a4,40
	andi	a5,a5,40
	andi	a1,a1,896
	beq	a5,a4,.L27
	andi	a5,s0,127
	or	a1,a5,a1
	call	_Z7setchr1jj
.L19:
	lbu	a5,0(s2)
	srli	a0,s1,10
	lla	a4,_ZL6TKSMIR
	srli	s0,s0,7
	add	a4,a4,a0
	sb	s0,0(a4)
	andi	a5,a5,8
	beq	a5,zero,.L17
	la a5, _ZL9PPUCHRBus; lbu a5, 0(a5);
	beq	a0,a5,.L28
.L17:
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
.L26:
	.cfi_restore_state
	mv	a2,a1
	mv	a1,a0
	li	a0,16
	call	_Z8setchr1rijj
	j	.L19
.L28:
	addi	a0,s0,2
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L27:
	.cfi_restore_state
	or	a1,s0,a1
	call	_Z7setchr1jj
	j	.L19
	.cfi_endproc
.LFE7:
	.size	_ZL13BMC810131C_CWjh, .-_ZL13BMC810131C_CWjh
	.section	.text._ZL13BMC810131C_PWjh,"ax",@progbits
	.align	2
	.type	_ZL13BMC810131C_PWjh, @function
_ZL13BMC810131C_PWjh:
.LFB6:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a4,a5,4
	andi	a5,a5,8
	andi	a4,a4,112
	beq	a5,zero,.L30
	andi	a1,a1,31
	or	a1,a1,a4
	tail	_Z7setprg8jj
.L30:
	andi	a1,a1,15
	or	a1,a1,a4
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL13BMC810131C_PWjh, .-_ZL13BMC810131C_PWjh
	.section	.text._ZL16BMC810131C_Writejh,"ax",@progbits
	.align	2
	.type	_ZL16BMC810131C_Writejh, @function
_ZL16BMC810131C_Writejh:
.LFB8:
	.cfi_startproc
	la a5, A001B; lbu a5, 0(a5);
	andi	a4,a5,192
	li	a3,128
	mv	a5,a0
	bne	a4,a3,.L32
	lla	a3,EXPREGS
	lbu	a4,0(a3)
	andi	a4,a4,7
	beq	a4,zero,.L36
.L32:
	mv	a0,a5
	tail	_Z6CartBWjh
.L36:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a5,a5,63
	sb	a5,0(a3)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE8:
	.size	_ZL16BMC810131C_Writejh, .-_ZL16BMC810131C_Writejh
	.section	.rodata._Z15BMC810131C_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"CHRR"
	.align	2
.LC1:
	.string	"EXPR"
	.section	.text._Z15BMC810131C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15BMC810131C_InitP8CartInfo
	.hidden	_Z15BMC810131C_InitP8CartInfo
	.type	_Z15BMC810131C_InitP8CartInfo, @function
_Z15BMC810131C_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a5,8192
	lla	s1,_ZL10CHRRAMSize
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	s2,_ZL6CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s2)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lla	a5,_ZL13BMC810131C_PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL13BMC810131C_CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL16BMC810131C_Powerv
	sw	a5,0(s0)
	lla	a5,_ZL16BMC810131C_Resetv
	sw	a5,4(s0)
	lla	a5,_ZL16BMC810131C_Closev
	sw	a5,8(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z15BMC810131C_InitP8CartInfo, .-_Z15BMC810131C_InitP8CartInfo
	.section	.sbss._ZL6TKSMIR,"aw",@nobits
	.align	2
	.type	_ZL6TKSMIR, @object
	.size	_ZL6TKSMIR, 8
_ZL6TKSMIR:
	.zero	8
	.section	.sbss._ZL9PPUCHRBus,"aw",@nobits
	.type	_ZL9PPUCHRBus, @object
	.size	_ZL9PPUCHRBus, 1
_ZL9PPUCHRBus:
	.zero	1
	.section	.sbss._ZL10CHRRAMSize,"aw",@nobits
	.align	2
	.type	_ZL10CHRRAMSize, @object
	.size	_ZL10CHRRAMSize, 4
_ZL10CHRRAMSize:
	.zero	4
	.section	.sbss._ZL6CHRRAM,"aw",@nobits
	.align	2
	.type	_ZL6CHRRAM, @object
	.size	_ZL6CHRRAM, 4
_ZL6CHRRAM:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
