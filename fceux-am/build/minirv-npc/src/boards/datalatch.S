#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"datalatch.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB10:
	.cfi_startproc
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE10:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL10LatchClosev,"ax",@progbits
	.align	2
	.type	_ZL10LatchClosev, @function
_ZL10LatchClosev:
.LFB9:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L9
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L9:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL10LatchClosev, .-_ZL10LatchClosev
	.section	.text._ZL9UNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9UNROMSyncv, @function
_ZL9UNROMSyncv:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a1, _ZL6latche; lbu a1, 0(a1);
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE14:
	.size	_ZL9UNROMSyncv, .-_ZL9UNROMSyncv
	.section	.text._ZL6M8Syncv,"ax",@progbits
	.align	2
	.type	_ZL6M8Syncv, @function
_ZL6M8Syncv:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,3
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,1
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,3
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE20:
	.size	_ZL6M8Syncv, .-_ZL6M8Syncv
	.section	.text._ZL7M70Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M70Syncv, @function
_ZL7M70Syncv:
.LFB33:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE33:
	.size	_ZL7M70Syncv, .-_ZL7M70Syncv
	.section	.text._ZL11SSUNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL11SSUNROMSyncv, @function
_ZL11SSUNROMSyncv:
.LFB43:
	.cfi_startproc
	la a1, _ZL6latche; lbu a1, 0(a1);
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	srli	a1,a1,4
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE43:
	.size	_ZL11SSUNROMSyncv, .-_ZL11SSUNROMSyncv
	.section	.text._ZL7M94Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M94Syncv, @function
_ZL7M94Syncv:
.LFB45:
	.cfi_startproc
	la a1, _ZL6latche; lbu a1, 0(a1);
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	srli	a1,a1,2
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	li	a1,-1
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE45:
	.size	_ZL7M94Syncv, .-_ZL7M94Syncv
	.section	.text._ZL8M180Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M180Syncv, @function
_ZL8M180Syncv:
.LFB58:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a0,49152
	la a1, _ZL6latche; lbu a1, 0(a1);
	call	_Z8setprg16jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE58:
	.size	_ZL8M180Syncv, .-_ZL8M180Syncv
	.section	.text._ZL8M203Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M203Syncv, @function
_ZL8M203Syncv:
.LFB62:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,2
	andi	a1,a1,3
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,3
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE62:
	.size	_ZL8M203Syncv, .-_ZL8M203Syncv
	.section	.text._ZL10LatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL10LatchWritejh, @function
_ZL10LatchWritejh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, _ZL12bus_conflict; lbu a5, 0(a5);
	mv	s0,a1
	bne	a5,zero,.L32
.L27:
	la a5, _ZL6latche; sb s0, 0(a5);
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL5WSync; lw a5, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L32:
	.cfi_restore_state
	call	_Z6CartBRj
	and	s0,a0,s0
	j	.L27
	.cfi_endproc
.LFE7:
	.size	_ZL10LatchWritejh, .-_ZL10LatchWritejh
	.section	.rodata._ZL10Latch_InitP8CartInfoPFvvEhtthh.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"LATC"
	.section	.text._ZL10Latch_InitP8CartInfoPFvvEhtthh,"ax",@progbits
	.align	2
	.type	_ZL10Latch_InitP8CartInfoPFvvEhtthh, @function
_ZL10Latch_InitP8CartInfoPFvvEhtthh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lbu	t1,12(sp)
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	lla	t0,_ZL10LatchPowerv
	lw	a0,52(a0)
	sw	t0,0(s0)
	la t0, _ZL12bus_conflict; sb t1, 0(t0);
	la t1, _ZL10latcheinit; sb a2, 0(t1);
	la a2, _ZL8addrreg0; sh a3, 0(a2);
	la a3, _ZL8addrreg1; sh a4, 0(a3);
	la a4, _ZL5WSync; sw a1, 0(a4);
	lla	a4,_ZL10LatchClosev
	sw	a4,8(s0)
	lla	a4,_ZL12StateRestorei
	la a3, GameStateRestore; sw a4, 0(a3);
	bne	a0,zero,.L34
	beq	a5,zero,.L36
	sw	s1,0(sp)
	li	a5,8192
	.cfi_offset 9, -12
	lla	s1,_ZL8WRAMSIZE
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,_ZL4WRAM
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L40
	sw	a0,12(s0)
	sw	a1,28(s0)
.L40:
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s1,0(sp)
	.cfi_restore 9
.L36:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL6latche
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
.L34:
	.cfi_restore_state
	lw	a4,64(s0)
	lw	a3,60(s0)
	add	a4,a4,a3
	ble	a4,zero,.L49
.L37:
	li	a5,8192
	sw	s1,0(sp)
	.cfi_offset 9, -12
	li	a0,8192
	lla	s1,_ZL8WRAMSIZE
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	lla	a4,_ZL4WRAM
	li	a3,1
	mv	a1,a0
	li	a0,16
	sw	a1,0(a4)
	li	s1,32768
	call	_Z19SetupCartPRGMappingiPhji
	lla	a2,_Z6CartBRj
	addi	a1,s1,-1
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_Z6CartBWjh
	addi	a1,s1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lw	a3,64(s0)
	beq	a3,zero,.L48
	lla	a4,_ZL4WRAM
	lw	a4,0(a4)
	li	a5,8192
	lw	s1,0(sp)
	.cfi_restore 9
	sw	a5,28(s0)
	sw	a4,12(s0)
	j	.L36
.L49:
	beq	a5,zero,.L36
	j	.L37
.L48:
	.cfi_offset 9, -12
	lw	s1,0(sp)
	.cfi_restore 9
	j	.L36
	.cfi_endproc
.LFE11:
	.size	_ZL10Latch_InitP8CartInfoPFvvEhtthh, .-_ZL10Latch_InitP8CartInfoPFvvEhtthh
	.section	.text._ZL9NROMPowerv,"ax",@progbits
	.align	2
	.type	_ZL9NROMPowerv, @function
_ZL9NROMPowerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg8rijj
	li	a1,-2
	li	a0,32768
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE12:
	.size	_ZL9NROMPowerv, .-_ZL9NROMPowerv
	.section	.text._ZL10LatchPowerv,"ax",@progbits
	.align	2
	.type	_ZL10LatchPowerv, @function
_ZL10LatchPowerv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL10latcheinit; lbu a5, 0(a5);
	sw	s0,4(sp)
	la a4, _ZL6latche; sb a5, 0(a4);
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, _ZL5WSync; lw a5, 0(a5);
	jalr	a5
	lla	s0,_ZL4WRAM
	lw	a5,0(s0)
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	beq	a5,zero,.L53
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,32768
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	a2,0(s0)
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	li	a1,24576
	srli	a0,a0,10
	call	_Z16FCEU_CheatAddRAMijPh
.L54:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a1, _ZL8addrreg1; lhu a1, 0(a1);
	la a0, _ZL8addrreg0; lhu a0, 0(a0);
	lla	a2,_ZL10LatchWritejh
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
.L53:
	.cfi_restore_state
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	j	.L54
	.cfi_endproc
.LFE8:
	.size	_ZL10LatchPowerv, .-_ZL10LatchPowerv
	.section	.text._ZL9CNROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9CNROMSyncv, @function
_ZL9CNROMSyncv:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a0, _ZL6latche; lbu a0, 0(a0);
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setchr8j
	li	a1,0
	li	a0,32768
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a2,0
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg8rijj
	.cfi_endproc
.LFE16:
	.size	_ZL9CNROMSyncv, .-_ZL9CNROMSyncv
	.section	.text._ZL7M11Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M11Syncv, @function
_ZL7M11Syncv:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,15
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,4
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE22:
	.size	_ZL7M11Syncv, .-_ZL7M11Syncv
	.section	.text._ZL7M38Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M38Syncv, @function
_ZL7M38Syncv:
.LFB29:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE29:
	.size	_ZL7M38Syncv, .-_ZL7M38Syncv
	.section	.text._ZL9MHROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9MHROMSyncv, @function
_ZL9MHROMSyncv:
.LFB31:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE31:
	.size	_ZL9MHROMSyncv, .-_ZL9MHROMSyncv
	.section	.text._ZL7M86Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M86Syncv, @function
_ZL7M86Syncv:
.LFB37:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a5,4
	andi	a0,a0,4
	andi	a5,a5,3
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE37:
	.size	_ZL7M86Syncv, .-_ZL7M86Syncv
	.section	.text._ZL7M87Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M87Syncv, @function
_ZL7M87Syncv:
.LFB39:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	la a5, _ZL6latche; lbu a5, 0(a5);
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a5,1
	slli	a5,a5,1
	andi	a0,a0,1
	andi	a5,a5,2
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE39:
	.size	_ZL7M87Syncv, .-_ZL7M87Syncv
	.section	.text._ZL8M101Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M101Syncv, @function
_ZL8M101Syncv:
.LFB49:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,32768
	li	a1,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg32jj
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL6latche; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE49:
	.size	_ZL8M101Syncv, .-_ZL8M101Syncv
	.section	.text._ZL8M107Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M107Syncv, @function
_ZL8M107Syncv:
.LFB51:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,1
	andi	a1,a1,3
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,7
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE51:
	.size	_ZL8M107Syncv, .-_ZL8M107Syncv
	.section	.text._ZL8M113Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M113Syncv, @function
_ZL8M113Syncv:
.LFB53:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,3
	andi	a1,a1,7
	call	_Z8setprg32jj
	lbu	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a5,3
	andi	a0,a0,8
	andi	a5,a5,7
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE53:
	.size	_ZL8M113Syncv, .-_ZL8M113Syncv
	.section	.text._ZL8M240Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M240Syncv, @function
_ZL8M240Syncv:
.LFB64:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,0
	li	a1,24576
	li	a0,16
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z8setprg8rijj
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE64:
	.size	_ZL8M240Syncv, .-_ZL8M240Syncv
	.section	.text._ZL8M241Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M241Syncv, @function
_ZL8M241Syncv:
.LFB66:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setchr8j
	li	a1,24576
	li	a2,0
	li	a0,16
	call	_Z8setprg8rijj
	la a1, _ZL6latche; lbu a1, 0(a1);
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L77
	ori	a1,a1,8
.L77:
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE66:
	.size	_ZL8M241Syncv, .-_ZL8M241Syncv
	.section	.text._ZL9ANROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9ANROMSyncv, @function
_ZL9ANROMSyncv:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,15
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	srli	a0,a0,4
	andi	a0,a0,1
	addi	a0,a0,2
	call	_Z9setmirrori
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE18:
	.size	_ZL9ANROMSyncv, .-_ZL9ANROMSyncv
	.section	.text._ZL7M78Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M78Syncv, @function
_ZL7M78Syncv:
.LFB35:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	srli	a0,a0,4
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,3
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE35:
	.size	_ZL7M78Syncv, .-_ZL7M78Syncv
	.section	.text._ZL7M89Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M89Syncv, @function
_ZL7M89Syncv:
.LFB41:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a5,0(s0)
	srli	a0,a5,4
	andi	a0,a0,8
	andi	a5,a5,7
	or	a0,a0,a5
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,3
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE41:
	.size	_ZL7M89Syncv, .-_ZL7M89Syncv
	.section	.text._ZL7M97Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M97Syncv, @function
_ZL7M97Syncv:
.LFB47:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg16jj
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,49152
	andi	a1,a1,15
	call	_Z8setprg16jj
	lbu	a5,0(s0)
	li	a3,1
	srli	a4,a5,6
	beq	a4,a3,.L86
	li	a3,2
	beq	a4,a3,.L87
.L88:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a5,1
	slli	a5,a5,1
	andi	a0,a0,1
	andi	a5,a5,2
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L87:
	.cfi_restore_state
	li	a0,1
	call	_Z9setmirrori
	lbu	a5,0(s0)
	j	.L88
.L86:
	li	a0,0
	call	_Z9setmirrori
	lbu	a5,0(s0)
	j	.L88
	.cfi_endproc
.LFE47:
	.size	_ZL7M97Syncv, .-_ZL7M97Syncv
	.section	.text._ZL8M152Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M152Syncv, @function
_ZL8M152Syncv:
.LFB56:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,4
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a0,0(s0)
	andi	a0,a0,15
	call	_Z7setchr8j
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,7
	addi	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE56:
	.size	_ZL8M152Syncv, .-_ZL8M152Syncv
	.section	.text._ZL12BMCA65ASSyncv,"ax",@progbits
	.align	2
	.type	_ZL12BMCA65ASSyncv, @function
_ZL12BMCA65ASSyncv:
.LFB68:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL6latche
	lbu	a5,0(s0)
	andi	a4,a5,64
	srli	a1,a5,1
	beq	a4,zero,.L93
	andi	a1,a1,15
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	slli	a5,a0,24
	srai	a5,a5,24
	blt	a5,zero,.L98
.L95:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,3
	xori	a0,a0,1
	andi	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L93:
	.cfi_restore_state
	andi	a5,a5,7
	andi	a1,a1,24
	or	a1,a1,a5
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,49152
	srli	a1,a1,1
	andi	a1,a1,24
	ori	a1,a1,7
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	lbu	a0,0(s0)
	slli	a5,a0,24
	srai	a5,a5,24
	bge	a5,zero,.L95
.L98:
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,5
	andi	a0,a0,1
	addi	a0,a0,2
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE68:
	.size	_ZL12BMCA65ASSyncv, .-_ZL12BMCA65ASSyncv
	.section	.text._ZL12BMC11160Syncv,"ax",@progbits
	.align	2
	.type	_ZL12BMC11160Syncv, @function
_ZL12BMC11160Syncv:
.LFB70:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s1,0(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	lla	s1,_ZL6latche
	lbu	s0,0(s1)
	li	a0,32768
	srli	s0,s0,4
	andi	s0,s0,7
	mv	a1,s0
	call	_Z8setprg32jj
	lbu	a0,0(s1)
	slli	s0,s0,2
	andi	a0,a0,3
	or	a0,a0,s0
	call	_Z7setchr8j
	lbu	a0,0(s1)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a0,7
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE70:
	.size	_ZL12BMC11160Syncv, .-_ZL12BMC11160Syncv
	.section	.text._ZL9CPROMSyncv,"ax",@progbits
	.align	2
	.type	_ZL9CPROMSyncv, @function
_ZL9CPROMSyncv:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setchr4jj
	la a1, _ZL6latche; lbu a1, 0(a1);
	andi	a1,a1,3
	li	a0,4096
	call	_Z7setchr4jj
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE25:
	.size	_ZL9CPROMSyncv, .-_ZL9CPROMSyncv
	.section	.text._ZL8M184Syncv,"ax",@progbits
	.align	2
	.type	_ZL8M184Syncv, @function
_ZL8M184Syncv:
.LFB60:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,0(s0)
	li	a0,4096
	srli	a1,a1,4
	call	_Z7setchr4jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,0
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE60:
	.size	_ZL8M184Syncv, .-_ZL8M184Syncv
	.section	.text._ZL7M29Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M29Syncv, @function
_ZL7M29Syncv:
.LFB27:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL6latche
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	andi	a1,a1,7
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	li	a0,0
	andi	a1,a1,3
	call	_Z8setchr8rij
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a2,0
	li	a1,24576
	li	a0,16
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z8setprg8rijj
	.cfi_endproc
.LFE27:
	.size	_ZL7M29Syncv, .-_ZL7M29Syncv
	.section	.text._Z9NROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z9NROM_InitP8CartInfo
	.hidden	_Z9NROM_InitP8CartInfo
	.type	_Z9NROM_InitP8CartInfo, @function
_Z9NROM_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL9NROMPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10LatchClosev
	lla	s1,_ZL8WRAMSIZE
	sw	a5,8(a0)
	mv	s0,a0
	li	a5,8192
	li	a0,8192
	sw	a5,0(s1)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s1)
	mv	a1,a0
	lla	a5,_ZL4WRAM
	li	a0,16
	li	a3,1
	sw	a1,0(a5)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a4,48(s0)
	lla	a5,_ZL4WRAM
	lw	a0,0(a5)
	lw	a1,0(s1)
	beq	a4,zero,.L109
	sw	a0,12(s0)
	sw	a1,28(s0)
.L109:
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	lla	a3,.LC0
	li	a2,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z9NROM_InitP8CartInfo, .-_Z9NROM_InitP8CartInfo
	.section	.text._Z10UNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10UNROM_InitP8CartInfo
	.hidden	_Z10UNROM_InitP8CartInfo
	.type	_Z10UNROM_InitP8CartInfo, @function
_Z10UNROM_InitP8CartInfo:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,1
	li	a4,65536
	sw	a5,0(sp)
	addi	a4,a4,-1
	li	a5,0
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9UNROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	_Z10UNROM_InitP8CartInfo, .-_Z10UNROM_InitP8CartInfo
	.section	.text._Z10CNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10CNROM_InitP8CartInfo
	.hidden	_Z10CNROM_InitP8CartInfo
	.type	_Z10CNROM_InitP8CartInfo, @function
_Z10CNROM_InitP8CartInfo:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,1
	li	a4,65536
	sw	a5,0(sp)
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9CNROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	_Z10CNROM_InitP8CartInfo, .-_Z10CNROM_InitP8CartInfo
	.section	.text._Z10ANROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ANROM_InitP8CartInfo
	.hidden	_Z10ANROM_InitP8CartInfo
	.type	_Z10ANROM_InitP8CartInfo, @function
_Z10ANROM_InitP8CartInfo:
.LFB19:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,16384
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,32
	li	a2,0
	lla	a1,_ZL9ANROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	_Z10ANROM_InitP8CartInfo, .-_Z10ANROM_InitP8CartInfo
	.section	.text._Z12Mapper8_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper8_InitP8CartInfo
	.hidden	_Z12Mapper8_InitP8CartInfo
	.type	_Z12Mapper8_InitP8CartInfo, @function
_Z12Mapper8_InitP8CartInfo:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL6M8Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	_Z12Mapper8_InitP8CartInfo, .-_Z12Mapper8_InitP8CartInfo
	.section	.text._Z13Mapper11_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper11_InitP8CartInfo
	.hidden	_Z13Mapper11_InitP8CartInfo
	.type	_Z13Mapper11_InitP8CartInfo, @function
_Z13Mapper11_InitP8CartInfo:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M11Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	_Z13Mapper11_InitP8CartInfo, .-_Z13Mapper11_InitP8CartInfo
	.section	.text._Z14Mapper144_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper144_InitP8CartInfo
	.hidden	_Z14Mapper144_InitP8CartInfo
	.type	_Z14Mapper144_InitP8CartInfo, @function
_Z14Mapper144_InitP8CartInfo:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,32768
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,1
	li	a2,0
	lla	a1,_ZL7M11Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	_Z14Mapper144_InitP8CartInfo, .-_Z14Mapper144_InitP8CartInfo
	.section	.text._Z10CPROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10CPROM_InitP8CartInfo
	.hidden	_Z10CPROM_InitP8CartInfo
	.type	_Z10CPROM_InitP8CartInfo, @function
_Z10CPROM_InitP8CartInfo:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9CPROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	_Z10CPROM_InitP8CartInfo, .-_Z10CPROM_InitP8CartInfo
	.section	.text._Z13Mapper29_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper29_InitP8CartInfo
	.hidden	_Z13Mapper29_InitP8CartInfo
	.type	_Z13Mapper29_InitP8CartInfo, @function
_Z13Mapper29_InitP8CartInfo:
.LFB28:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M29Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	_Z13Mapper29_InitP8CartInfo, .-_Z13Mapper29_InitP8CartInfo
	.section	.text._Z13Mapper38_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper38_InitP8CartInfo
	.hidden	_Z13Mapper38_InitP8CartInfo
	.type	_Z13Mapper38_InitP8CartInfo, @function
_Z13Mapper38_InitP8CartInfo:
.LFB30:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,28672
	li	a2,0
	lla	a1,_ZL7M38Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	_Z13Mapper38_InitP8CartInfo, .-_Z13Mapper38_InitP8CartInfo
	.section	.text._Z10MHROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10MHROM_InitP8CartInfo
	.hidden	_Z10MHROM_InitP8CartInfo
	.type	_Z10MHROM_InitP8CartInfo, @function
_Z10MHROM_InitP8CartInfo:
.LFB32:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL9MHROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE32:
	.size	_Z10MHROM_InitP8CartInfo, .-_Z10MHROM_InitP8CartInfo
	.section	.text._Z13Mapper70_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper70_InitP8CartInfo
	.hidden	_Z13Mapper70_InitP8CartInfo
	.type	_Z13Mapper70_InitP8CartInfo, @function
_Z13Mapper70_InitP8CartInfo:
.LFB34:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M70Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE34:
	.size	_Z13Mapper70_InitP8CartInfo, .-_Z13Mapper70_InitP8CartInfo
	.section	.text._Z13Mapper78_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper78_InitP8CartInfo
	.hidden	_Z13Mapper78_InitP8CartInfo
	.type	_Z13Mapper78_InitP8CartInfo, @function
_Z13Mapper78_InitP8CartInfo:
.LFB36:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M78Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	_Z13Mapper78_InitP8CartInfo, .-_Z13Mapper78_InitP8CartInfo
	.section	.text._Z13Mapper86_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper86_InitP8CartInfo
	.hidden	_Z13Mapper86_InitP8CartInfo
	.type	_Z13Mapper86_InitP8CartInfo, @function
_Z13Mapper86_InitP8CartInfo:
.LFB38:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,28672
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL7M86Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	_Z13Mapper86_InitP8CartInfo, .-_Z13Mapper86_InitP8CartInfo
	.section	.text._Z13Mapper87_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper87_InitP8CartInfo
	.hidden	_Z13Mapper87_InitP8CartInfo
	.type	_Z13Mapper87_InitP8CartInfo, @function
_Z13Mapper87_InitP8CartInfo:
.LFB40:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL7M87Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	_Z13Mapper87_InitP8CartInfo, .-_Z13Mapper87_InitP8CartInfo
	.section	.text._Z13Mapper89_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper89_InitP8CartInfo
	.hidden	_Z13Mapper89_InitP8CartInfo
	.type	_Z13Mapper89_InitP8CartInfo, @function
_Z13Mapper89_InitP8CartInfo:
.LFB42:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M89Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	_Z13Mapper89_InitP8CartInfo, .-_Z13Mapper89_InitP8CartInfo
	.section	.text._Z18SUNSOFT_UNROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z18SUNSOFT_UNROM_InitP8CartInfo
	.hidden	_Z18SUNSOFT_UNROM_InitP8CartInfo
	.type	_Z18SUNSOFT_UNROM_InitP8CartInfo, @function
_Z18SUNSOFT_UNROM_InitP8CartInfo:
.LFB44:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL11SSUNROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	_Z18SUNSOFT_UNROM_InitP8CartInfo, .-_Z18SUNSOFT_UNROM_InitP8CartInfo
	.section	.text._Z13Mapper94_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper94_InitP8CartInfo
	.hidden	_Z13Mapper94_InitP8CartInfo
	.type	_Z13Mapper94_InitP8CartInfo, @function
_Z13Mapper94_InitP8CartInfo:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL7M94Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	_Z13Mapper94_InitP8CartInfo, .-_Z13Mapper94_InitP8CartInfo
	.section	.text._Z13Mapper97_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper97_InitP8CartInfo
	.hidden	_Z13Mapper97_InitP8CartInfo
	.type	_Z13Mapper97_InitP8CartInfo, @function
_Z13Mapper97_InitP8CartInfo:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,255
	lla	a1,_ZL7M97Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	_Z13Mapper97_InitP8CartInfo, .-_Z13Mapper97_InitP8CartInfo
	.section	.text._Z14Mapper101_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper101_InitP8CartInfo
	.hidden	_Z14Mapper101_InitP8CartInfo
	.type	_Z14Mapper101_InitP8CartInfo, @function
_Z14Mapper101_InitP8CartInfo:
.LFB50:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,255
	lla	a1,_ZL8M101Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	_Z14Mapper101_InitP8CartInfo, .-_Z14Mapper101_InitP8CartInfo
	.section	.text._Z14Mapper107_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper107_InitP8CartInfo
	.hidden	_Z14Mapper107_InitP8CartInfo
	.type	_Z14Mapper107_InitP8CartInfo, @function
_Z14Mapper107_InitP8CartInfo:
.LFB52:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,255
	lla	a1,_ZL8M107Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	_Z14Mapper107_InitP8CartInfo, .-_Z14Mapper107_InitP8CartInfo
	.section	.text._Z14Mapper113_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper113_InitP8CartInfo
	.hidden	_Z14Mapper113_InitP8CartInfo
	.type	_Z14Mapper113_InitP8CartInfo, @function
_Z14Mapper113_InitP8CartInfo:
.LFB54:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,16384
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	addi	a3,a3,256
	li	a2,0
	lla	a1,_ZL8M113Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE54:
	.size	_Z14Mapper113_InitP8CartInfo, .-_Z14Mapper113_InitP8CartInfo
	.section	.text._Z14Mapper140_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper140_InitP8CartInfo
	.hidden	_Z14Mapper140_InitP8CartInfo
	.type	_Z14Mapper140_InitP8CartInfo, @function
_Z14Mapper140_InitP8CartInfo:
.LFB55:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,0
	lla	a1,_ZL9MHROMSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE55:
	.size	_Z14Mapper140_InitP8CartInfo, .-_Z14Mapper140_InitP8CartInfo
	.section	.text._Z14Mapper152_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper152_InitP8CartInfo
	.hidden	_Z14Mapper152_InitP8CartInfo
	.type	_Z14Mapper152_InitP8CartInfo, @function
_Z14Mapper152_InitP8CartInfo:
.LFB57:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M152Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE57:
	.size	_Z14Mapper152_InitP8CartInfo, .-_Z14Mapper152_InitP8CartInfo
	.section	.text._Z14Mapper180_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper180_InitP8CartInfo
	.hidden	_Z14Mapper180_InitP8CartInfo
	.type	_Z14Mapper180_InitP8CartInfo, @function
_Z14Mapper180_InitP8CartInfo:
.LFB59:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M180Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE59:
	.size	_Z14Mapper180_InitP8CartInfo, .-_Z14Mapper180_InitP8CartInfo
	.section	.text._Z14Mapper184_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper184_InitP8CartInfo
	.hidden	_Z14Mapper184_InitP8CartInfo
	.type	_Z14Mapper184_InitP8CartInfo, @function
_Z14Mapper184_InitP8CartInfo:
.LFB61:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,32768
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,24576
	li	a2,0
	lla	a1,_ZL8M184Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE61:
	.size	_Z14Mapper184_InitP8CartInfo, .-_Z14Mapper184_InitP8CartInfo
	.section	.text._Z14Mapper203_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper203_InitP8CartInfo
	.hidden	_Z14Mapper203_InitP8CartInfo
	.type	_Z14Mapper203_InitP8CartInfo, @function
_Z14Mapper203_InitP8CartInfo:
.LFB63:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M203Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE63:
	.size	_Z14Mapper203_InitP8CartInfo, .-_Z14Mapper203_InitP8CartInfo
	.section	.text._Z14Mapper240_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper240_InitP8CartInfo
	.hidden	_Z14Mapper240_InitP8CartInfo
	.type	_Z14Mapper240_InitP8CartInfo, @function
_Z14Mapper240_InitP8CartInfo:
.LFB65:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,24576
	li	a3,16384
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	addi	a3,a3,32
	li	a2,0
	lla	a1,_ZL8M240Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE65:
	.size	_Z14Mapper240_InitP8CartInfo, .-_Z14Mapper240_InitP8CartInfo
	.section	.text._Z14Mapper241_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper241_InitP8CartInfo
	.hidden	_Z14Mapper241_InitP8CartInfo
	.type	_Z14Mapper241_InitP8CartInfo, @function
_Z14Mapper241_InitP8CartInfo:
.LFB67:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,1
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL8M241Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE67:
	.size	_Z14Mapper241_InitP8CartInfo, .-_Z14Mapper241_InitP8CartInfo
	.section	.text._Z13BMCA65AS_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMCA65AS_InitP8CartInfo
	.hidden	_Z13BMCA65AS_InitP8CartInfo
	.type	_Z13BMCA65AS_InitP8CartInfo, @function
_Z13BMCA65AS_InitP8CartInfo:
.LFB69:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL12BMCA65ASSyncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE69:
	.size	_Z13BMCA65AS_InitP8CartInfo, .-_Z13BMCA65AS_InitP8CartInfo
	.section	.text._Z13BMC11160_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13BMC11160_InitP8CartInfo
	.hidden	_Z13BMC11160_InitP8CartInfo
	.type	_Z13BMC11160_InitP8CartInfo, @function
_Z13BMC11160_InitP8CartInfo:
.LFB71:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,65536
	sw	zero,0(sp)
	li	a5,0
	addi	a4,a4,-1
	li	a3,32768
	li	a2,0
	lla	a1,_ZL12BMC11160Syncv
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL10Latch_InitP8CartInfoPFvvEhtthh
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE71:
	.size	_Z13BMC11160_InitP8CartInfo, .-_Z13BMC11160_InitP8CartInfo
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8addrreg1,"aw",@nobits
	.align	1
	.type	_ZL8addrreg1, @object
	.size	_ZL8addrreg1, 2
_ZL8addrreg1:
	.zero	2
	.section	.sbss._ZL8addrreg0,"aw",@nobits
	.align	1
	.type	_ZL8addrreg0, @object
	.size	_ZL8addrreg0, 2
_ZL8addrreg0:
	.zero	2
	.section	.sbss._ZL12bus_conflict,"aw",@nobits
	.type	_ZL12bus_conflict, @object
	.size	_ZL12bus_conflict, 1
_ZL12bus_conflict:
	.zero	1
	.section	.sbss._ZL10latcheinit,"aw",@nobits
	.type	_ZL10latcheinit, @object
	.size	_ZL10latcheinit, 1
_ZL10latcheinit:
	.zero	1
	.section	.sbss._ZL6latche,"aw",@nobits
	.type	_ZL6latche, @object
	.size	_ZL6latche, 1
_ZL6latche:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
