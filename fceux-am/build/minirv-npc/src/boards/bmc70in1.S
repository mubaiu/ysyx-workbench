#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"bmc70in1.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	la a5, _ZL9bank_mode; lbu a5, 0(a5);
	li	a4,32
	.cfi_offset 1, -4
	beq	a5,a4,.L2
	bleu	a5,a4,.L10
	li	a4,48
	bne	a5,a4,.L5
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL8prg_bank
	lla	s1,_ZL10large_bank
	lbu	a5,0(s0)
	lbu	a1,0(s1)
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	lbu	a1,0(s1)
	lbu	a5,0(s0)
	li	a0,49152
	or	a1,a1,a5
	call	_Z8setprg16jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
.L5:
	la a0, _ZL9mirroring; lbu a0, 0(a0);
	call	_Z9setmirrori
	la a5, _ZL14is_large_banks; lbu a5, 0(a5);
	beq	a5,zero,.L11
.L1:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L10:
	.cfi_restore_state
	andi	a5,a5,239
	bne	a5,zero,.L5
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL10large_bank
	lbu	a1,0(s0)
	la a5, _ZL8prg_bank; lbu a5, 0(a5);
	li	a0,32768
	or	a1,a1,a5
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	ori	a1,a1,7
	call	_Z8setprg16jj
	la a0, _ZL9mirroring; lbu a0, 0(a0);
	lw	s0,4(sp)
	.cfi_restore 8
	call	_Z9setmirrori
	la a5, _ZL14is_large_banks; lbu a5, 0(a5);
	bne	a5,zero,.L1
.L11:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a0, _ZL8chr_bank; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L2:
	.cfi_restore_state
	la a5, _ZL8prg_bank; lbu a5, 0(a5);
	la a1, _ZL10large_bank; lbu a1, 0(a1);
	or	a1,a1,a5
	srli	a1,a1,1
	li	a0,32768
	call	_Z8setprg32jj
	j	.L5
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL13BMC70in1Resetv,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Resetv, @function
_ZL13BMC70in1Resetv:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL9bank_mode; sb zero, 0(a5);
	la a5, _ZL10large_bank; sb zero, 0(a5);
	call	_ZL4Syncv
	lla	a4,_ZL9hw_switch
	lbu	a5,0(a4)
	addi	a5,a5,1
	andi	a5,a5,15
	sb	a5,0(a4)
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL13BMC70in1Resetv, .-_ZL13BMC70in1Resetv
	.section	.text._ZL13BMC70in1Writejh,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Writejh, @function
_ZL13BMC70in1Writejh:
.LFB8:
	.cfi_startproc
	slli	a4,a0,17
	andi	a5,a0,0xff
	bge	a4,zero,.L16
	andi	a4,a5,48
	andi	a5,a5,7
	la a3, _ZL9bank_mode; sb a4, 0(a3);
	la a4, _ZL8prg_bank; sb a5, 0(a4);
	tail	_ZL4Syncv
.L16:
	srli	a0,a0,5
	xori	a0,a0,1
	andi	a0,a0,1
	la a4, _ZL9mirroring; sb a0, 0(a4);
	la a4, _ZL14is_large_banks; lbu a4, 0(a4);
	beq	a4,zero,.L18
	slli	a5,a5,3
	andi	a5,a5,24
	la a4, _ZL10large_bank; sb a5, 0(a4);
	tail	_ZL4Syncv
.L18:
	andi	a5,a5,7
	la a4, _ZL8chr_bank; sb a5, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE8:
	.size	_ZL13BMC70in1Writejh, .-_ZL13BMC70in1Writejh
	.section	.text._ZL13BMC70in1Powerv,"ax",@progbits
	.align	2
	.type	_ZL13BMC70in1Powerv, @function
_ZL13BMC70in1Powerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setchr8j
	li	s0,65536
	la a5, _ZL9bank_mode; sb zero, 0(a5);
	la a5, _ZL10large_bank; sb zero, 0(a5);
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL12BMC70in1Readj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL13BMC70in1Writejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE10:
	.size	_ZL13BMC70in1Powerv, .-_ZL13BMC70in1Powerv
	.section	.text._ZL12BMC70in1Readj,"ax",@progbits
	.align	2
	.type	_ZL12BMC70in1Readj, @function
_ZL12BMC70in1Readj:
.LFB7:
	.cfi_startproc
	la a3, _ZL9bank_mode; lbu a3, 0(a3);
	li	a4,16
	beq	a3,a4,.L23
	tail	_Z6CartBRj
.L23:
	li	a4,65536
	addi	a4,a4,-16
	and	a0,a0,a4
	la a5, _ZL9hw_switch; lbu a5, 0(a5);
	or	a0,a0,a5
	tail	_Z6CartBRj
	.cfi_endproc
.LFE7:
	.size	_ZL12BMC70in1Readj, .-_ZL12BMC70in1Readj
	.section	.text._Z13BMC70in1_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC70in1_InitP8CartInfo
	.hidden	_Z13BMC70in1_InitP8CartInfo
	.type	_Z13BMC70in1_InitP8CartInfo, @function
_Z13BMC70in1_InitP8CartInfo:
.LFB12:
	.cfi_startproc
	lla	a5,_ZL13BMC70in1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13BMC70in1Resetv
	sw	a5,4(a0)
	la a5, _ZL14is_large_banks; sb zero, 0(a5);
	li	a5,13
	la a4, _ZL9hw_switch; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE12:
	.size	_Z13BMC70in1_InitP8CartInfo, .-_Z13BMC70in1_InitP8CartInfo
	.section	.text._Z14BMC70in1B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14BMC70in1B_InitP8CartInfo
	.hidden	_Z14BMC70in1B_InitP8CartInfo
	.type	_Z14BMC70in1B_InitP8CartInfo, @function
_Z14BMC70in1B_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	lla	a5,_ZL13BMC70in1Powerv
	sw	a5,0(a0)
	lla	a5,_ZL13BMC70in1Resetv
	sw	a5,4(a0)
	li	a5,1
	la a4, _ZL14is_large_banks; sb a5, 0(a4);
	li	a5,6
	la a4, _ZL9hw_switch; sb a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14BMC70in1B_InitP8CartInfo, .-_Z14BMC70in1B_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LB"
	.align	2
.LC1:
	.string	"DPSW"
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"BM"
	.align	2
.LC5:
	.string	"MIRR"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 84
_ZL9StateRegs:
	.word	_ZL10large_bank
	.word	1
	.word	.LC0
	.word	_ZL9hw_switch
	.word	1
	.word	.LC1
	.word	_ZL8prg_bank
	.word	1
	.word	.LC2
	.word	_ZL8chr_bank
	.word	1
	.word	.LC3
	.word	_ZL9bank_mode
	.word	1
	.word	.LC4
	.word	_ZL9mirroring
	.word	1
	.word	.LC5
	.word	0
	.zero	8
	.section	.sbss._ZL9mirroring,"aw",@nobits
	.type	_ZL9mirroring, @object
	.size	_ZL9mirroring, 1
_ZL9mirroring:
	.zero	1
	.section	.sbss._ZL9bank_mode,"aw",@nobits
	.type	_ZL9bank_mode, @object
	.size	_ZL9bank_mode, 1
_ZL9bank_mode:
	.zero	1
	.section	.sbss._ZL8chr_bank,"aw",@nobits
	.type	_ZL8chr_bank, @object
	.size	_ZL8chr_bank, 1
_ZL8chr_bank:
	.zero	1
	.section	.sbss._ZL8prg_bank,"aw",@nobits
	.type	_ZL8prg_bank, @object
	.size	_ZL8prg_bank, 1
_ZL8prg_bank:
	.zero	1
	.section	.sbss._ZL10large_bank,"aw",@nobits
	.type	_ZL10large_bank, @object
	.size	_ZL10large_bank, 1
_ZL10large_bank:
	.zero	1
	.section	.sbss._ZL9hw_switch,"aw",@nobits
	.type	_ZL9hw_switch, @object
	.size	_ZL9hw_switch, 1
_ZL9hw_switch:
	.zero	1
	.section	.sbss._ZL14is_large_banks,"aw",@nobits
	.type	_ZL14is_large_banks, @object
	.size	_ZL14is_large_banks, 1
_ZL14is_large_banks:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
