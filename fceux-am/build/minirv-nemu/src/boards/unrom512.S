#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"unrom512.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB11:
	.cfi_startproc
	la a5, _ZL6WHSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE11:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL19UNROM512LLatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNROM512LLatchWritejh, @function
_ZL19UNROM512LLatchWritejh:
.LFB12:
	.cfi_startproc
	la a5, _ZL6latche; sb a1, 0(a5);
	la a5, _ZL6latcha; sh a0, 0(a5);
	la a5, _ZL6WLSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE12:
	.size	_ZL19UNROM512LLatchWritejh, .-_ZL19UNROM512LLatchWritejh
	.section	.text._ZL18UNROM512LatchClosev,"ax",@progbits
	.align	2
	.type	_ZL18UNROM512LatchClosev, @function
_ZL18UNROM512LatchClosev:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a0, _ZL17flash_write_count; lw a0, 0(a0);
	beq	a0,zero,.L5
	call	_Z10FCEU_gfreePv
.L5:
	la a0, _ZL9flashdata; lw a0, 0(a0);
	beq	a0,zero,.L6
	call	_Z10FCEU_gfreePv
.L6:
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL17flash_write_count; sw zero, 0(a5);
	la a5, _ZL9flashdata; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	_ZL18UNROM512LatchClosev, .-_ZL18UNROM512LatchClosev
	.section	.text._ZL19UNROM512HLatchWritejh,"ax",@progbits
	.align	2
	.type	_ZL19UNROM512HLatchWritejh, @function
_ZL19UNROM512HLatchWritejh:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	la a5, _ZL12bus_conflict; lbu a5, 0(a5);
	mv	s1,a0
	mv	s0,a1
	bne	a5,zero,.L22
.L15:
	la a5, _ZL6latche; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	la a5, _ZL6latcha; sh s1, 0(a5);
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	la a5, _ZL6WHSync; lw a5, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L22:
	.cfi_restore_state
	call	_Z6CartBRj
	sub	a0,a0,s0
	seqz	a0,a0
	neg	a0,a0
	and	s0,s0,a0
	j	.L15
	.cfi_endproc
.LFE13:
	.size	_ZL19UNROM512HLatchWritejh, .-_ZL19UNROM512HLatchWritejh
	.section	.text._ZL18UNROM512LatchPowerv,"ax",@progbits
	.align	2
	.type	_ZL18UNROM512LatchPowerv, @function
_ZL18UNROM512LatchPowerv:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL10latcheinit; lbu a5, 0(a5);
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL6latche; sb a5, 0(a4);
	la a5, _ZL6WHSync; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	lla	a2,_ZL17UNROM512LatchReadj
	addi	a1,s0,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	la a5, _ZL10flash_save; lbu a5, 0(a5);
	bne	a5,zero,.L24
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL19UNROM512HLatchWritejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
.L24:
	.cfi_restore_state
	li	a1,49152
	lla	a2,_ZL19UNROM512LLatchWritejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL19UNROM512HLatchWritejh
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE15:
	.size	_ZL18UNROM512LatchPowerv, .-_ZL18UNROM512LatchPowerv
	.section	.text._ZL17UNROM512LatchReadj,"ax",@progbits
	.align	2
	.type	_ZL17UNROM512LatchReadj, @function
_ZL17UNROM512LatchReadj:
.LFB14:
	.cfi_startproc
	li	a5,-20480
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a5,a5,1717
	sh	a5,12(sp)
	li	a5,-73
	sb	a5,14(sp)
	la a5, _ZL11software_id; lbu a5, 0(a5);
	beq	a5,zero,.L28
	andi	a5,a0,1
	li	a0,191
	beq	a5,zero,.L29
	la a5, ROM_size; lw a5, 0(a5);
	srli	a5,a5,4
	addi	a5,a5,16
	add	a5,a5,sp
	lbu	a0,-4(a5)
.L29:
	addi	sp,sp,16
	.cfi_remember_state
	.cfi_def_cfa_offset 0
	jr	ra
.L28:
	.cfi_restore_state
	la a4, _ZL10flash_save; lbu a4, 0(a4);
	srli	a5,a0,11
	beq	a4,zero,.L30
	srli	a3,a0,12
	li	a4,49152
	la a2, _ZL17flash_write_count; lw a2, 0(a2);
	andi	a3,a3,3
	bltu	a0,a4,.L47
	la a4, ROM_size; lw a4, 0(a4);
	addi	a4,a4,-1
	andi	a4,a4,0xff
.L46:
	slli	a4,a4,2
	add	a4,a4,a3
	slli	a4,a4,2
	add	a2,a2,a4
	lw	a4,0(a2)
	beq	a4,zero,.L30
	slli	a5,a5,2
	lla	a4,_ZL9FlashPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	j	.L29
.L30:
	slli	a5,a5,2
	lla	a4,Page
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	addi	sp,sp,16
	.cfi_remember_state
	.cfi_def_cfa_offset 0
	jr	ra
.L47:
	.cfi_restore_state
	la a4, _ZL10flash_bank; lbu a4, 0(a4);
	j	.L46
	.cfi_endproc
.LFE14:
	.size	_ZL17UNROM512LatchReadj, .-_ZL17UNROM512LatchReadj
	.section	.text._ZL13UNROM512LSyncv,"ax",@progbits
	.align	2
	.type	_ZL13UNROM512LSyncv, @function
_ZL13UNROM512LSyncv:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	lla	a5,.LANCHOR0
	lw	t2,8(a5)
	lw	t0,12(a5)
	lw	t6,16(a5)
	lw	t5,20(a5)
	lw	t4,24(a5)
	lw	t3,28(a5)
	lw	t1,32(a5)
	lw	a7,36(a5)
	lw	a6,40(a5)
	lw	a0,44(a5)
	sw	s0,72(sp)
	sw	s1,68(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	s0,4(a5)
	lw	s1,0(a5)
	lw	a2,52(a5)
	lw	a3,56(a5)
	lw	a1,48(a5)
	sw	ra,76(sp)
	.cfi_offset 1, -4
	lla	a4,_ZL10flash_mode
	lbu	a5,0(a4)
	sw	s1,4(sp)
	sw	s0,8(sp)
	sw	t2,12(sp)
	sw	t0,16(sp)
	sw	t6,20(sp)
	sw	t5,24(sp)
	sw	t4,28(sp)
	sw	t3,32(sp)
	sw	t1,36(sp)
	sw	a7,40(sp)
	sw	a6,44(sp)
	sw	a0,48(sp)
	sw	a1,52(sp)
	sw	a2,56(sp)
	sw	a3,60(sp)
	bne	a5,zero,.L49
	lla	a0,_ZL11flash_state
	lbu	a3,0(a0)
	la a1, _ZL6latcha; lhu a1, 0(a1);
	la a2, _ZL6latche; lbu a2, 0(a2);
	slli	a5,a3,2
	addi	a5,a5,64
	add	a5,a5,sp
	lw	a6,-60(a5)
	beq	a1,a6,.L72
.L50:
	li	a5,2
	beq	a3,a5,.L73
.L53:
	li	a5,240
	bne	a2,a5,.L55
	la a5, _ZL11software_id; sb zero, 0(a5);
.L55:
	la a5, _ZL11flash_state; sb zero, 0(a5);
.L48:
	lw	ra,76(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,72(sp)
	.cfi_restore 8
	lw	s1,68(sp)
	.cfi_restore 9
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L49:
	.cfi_restore_state
	li	a4,1
	beq	a5,a4,.L74
	li	a3,2
	bne	a5,a3,.L48
	lla	s1,_ZL6latcha
	lhu	a3,0(s1)
	la a5, _ZL10flash_bank; lbu a5, 0(a5);
	slli	a5,a5,2
	srli	a2,a3,12
	andi	a2,a2,3
	add	a5,a5,a2
	slli	a5,a5,2
	la a2, _ZL17flash_write_count; lw a2, 0(a2);
	add	a5,a2,a5
	lw	a2,0(a5)
	lla	s0,_ZL9FlashPage
	beq	a2,zero,.L75
.L64:
	srli	a5,a3,11
	slli	a5,a5,2
	add	s0,s0,a5
	lw	a5,0(s0)
	la a2, _ZL6latche; lbu a2, 0(a2);
	add	a5,a5,a3
	lbu	a4,0(a5)
	and	a4,a4,a2
	sb	a4,0(a5)
.L71:
	lw	ra,76(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,72(sp)
	.cfi_restore 8
	la a5, _ZL11flash_state; sb zero, 0(a5);
	la a5, _ZL10flash_mode; sb zero, 0(a5);
	lw	s1,68(sp)
	.cfi_restore 9
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L72:
	.cfi_restore_state
	lw	a6,-40(a5)
	bne	a2,a6,.L50
	lw	a5,-20(a5)
	la a6, _ZL10flash_bank; lbu a6, 0(a6);
	bne	a6,a5,.L50
	addi	a3,a3,1
	andi	a3,a3,0xff
	sb	a3,0(a0)
	li	a5,5
	bne	a3,a5,.L48
	li	a5,1
	sb	a5,0(a4)
	j	.L48
.L74:
	la a5, _ZL6latche; lbu a5, 0(a5);
	li	a4,48
	beq	a5,a4,.L76
	li	a4,16
	bne	a5,a4,.L71
	lla	a1,ROM_size
	lw	a2,0(a1)
	slli	a5,a2,2
	beq	a5,zero,.L60
	la a0, _ZL17flash_write_count; lw a0, 0(a0);
	li	a3,0
.L62:
	andi	a5,a3,1023
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a4,0(a5)
	addi	a3,a3,1
	addi	a4,a4,1
	bne	a4,zero,.L61
	li	a4,1
.L61:
	sw	a4,0(a5)
	lw	a2,0(a1)
	slli	a5,a2,2
	bgtu	a5,a3,.L62
.L60:
	slli	a2,a2,14
	li	a1,255
	la a0, _ZL9flashdata; lw a0, 0(a0);
	call	memset
	j	.L71
.L73:
	li	a5,36864
	addi	a5,a5,1365
	bne	a1,a5,.L53
	li	a5,160
	beq	a2,a5,.L77
	li	a5,144
	bne	a2,a5,.L53
	la a5, _ZL10flash_bank; lbu a5, 0(a5);
	li	a4,1
	bne	a5,a4,.L55
	la a4, _ZL11flash_state; sb zero, 0(a4);
	la a4, _ZL11software_id; sb a5, 0(a4);
	j	.L48
.L77:
	la a2, _ZL10flash_bank; lbu a2, 0(a2);
	li	a5,1
	bne	a2,a5,.L55
	li	a5,3
	sb	a5,0(a0)
	sb	a3,0(a4)
	j	.L48
.L75:
	srli	a2,a3,9
	andi	a2,a2,120
	lla	a1,Page
	add	a1,a1,a2
	add	a2,s0,a2
	lw	a1,0(a1)
	lw	a0,0(a2)
	li	a2,-4096
	and	a3,a3,a2
	add	a1,a1,a3
	add	a0,a0,a3
	sw	a4,0(a5)
	li	a2,4096
	call	memcpy
	lhu	a3,0(s1)
	j	.L64
.L76:
	la a4, _ZL6latcha; lhu a4, 0(a4);
	la a5, _ZL10flash_bank; lbu a5, 0(a5);
	srli	a3,a4,12
	andi	a3,a3,3
	slli	a5,a5,2
	add	a5,a5,a3
	slli	a5,a5,2
	la a3, _ZL17flash_write_count; lw a3, 0(a3);
	add	a3,a3,a5
	lw	a5,0(a3)
	addi	a5,a5,1
	bne	a5,zero,.L58
	li	a5,1
.L58:
	srli	a1,a4,9
	andi	a1,a1,120
	lla	a2,_ZL9FlashPage
	add	a2,a2,a1
	lw	a0,0(a2)
	li	a2,-4096
	and	a4,a4,a2
	sw	a5,0(a3)
	li	a2,4096
	li	a1,255
	add	a0,a0,a4
	call	memset
	j	.L71
	.cfi_endproc
.LFE17:
	.size	_ZL13UNROM512LSyncv, .-_ZL13UNROM512LSyncv
	.section	.text._Z9setfprg16jj,"ax",@progbits
	.align	2
	.globl	_Z9setfprg16jj
	.hidden	_Z9setfprg16jj
	.type	_Z9setfprg16jj, @function
_Z9setfprg16jj:
.LFB8:
	.cfi_startproc
	la a5, PRGsize; lw a5, 0(a5);
	li	a6,16384
	la a2, _ZL9flashdata; lw a2, 0(a2);
	bltu	a5,a6,.L79
	srli	a3,a0,11
	la a5, PRGmask16; lw a5, 0(a5);
	beq	a2,zero,.L80
	and	a5,a5,a1
	slli	a5,a5,14
	sub	a5,a5,a0
	slli	a3,a3,2
	add	a2,a2,a5
	lla	a4,_ZL9FlashPage-32
	lla	a5,_ZL9FlashPage
	add	a5,a3,a5
	add	a4,a4,a3
.L81:
	sw	a2,28(a5)
	addi	a5,a5,-4
	bne	a5,a4,.L81
	ret
.L79:
	li	a7,4096
	slli	a3,a1,3
	la t3, PRGmask2; lw t3, 0(t3);
	add	a6,a0,a6
	lla	t1,_ZL9FlashPage
	addi	a7,a7,-2048
.L85:
	and	a5,a3,t3
	slli	a5,a5,11
	sub	a4,a5,a0
	srli	a5,a0,11
	slli	a5,a5,2
	add	a5,t1,a5
	add	a0,a0,a7
	li	a1,0
	beq	a2,zero,.L84
	add	a1,a2,a4
.L84:
	sw	a1,0(a5)
	addi	a3,a3,1
	bne	a0,a6,.L85
	ret
.L80:
	slli	a3,a3,2
	lla	a5,_ZL9FlashPage
	lla	a4,_ZL9FlashPage-32
	add	a5,a3,a5
	add	a4,a4,a3
.L82:
	sw	zero,28(a5)
	addi	a5,a5,-4
	bne	a4,a5,.L82
	ret
	.cfi_endproc
.LFE8:
	.size	_Z9setfprg16jj, .-_Z9setfprg16jj
	.section	.text._ZL13UNROM512HSyncv,"ax",@progbits
	.align	2
	.type	_ZL13UNROM512HSyncv, @function
_ZL13UNROM512HSyncv:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL6latche
	lbu	a5,0(s0)
	la a1, ROM_size; lw a1, 0(a1);
	addi	a1,a1,-1
	and	a1,a1,a5
	lla	s1,_ZL10flash_bank
	li	a0,32768
	sb	a1,0(s1)
	call	_Z8setprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z8setprg16jj
	lbu	a1,0(s1)
	li	a0,32768
	call	_Z9setfprg16jj
	li	a1,-1
	li	a0,49152
	call	_Z9setfprg16jj
	lbu	a1,0(s0)
	la a5, _ZL11chrram_mask; lbu a5, 0(a5);
	li	a0,0
	and	a1,a1,a5
	srli	a1,a1,5
	call	_Z8setchr8rij
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	srli	a0,a0,7
	addi	a0,a0,2
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE18:
	.size	_ZL13UNROM512HSyncv, .-_ZL13UNROM512HSyncv
	.section	.text._Z21inc_flash_write_counthj,"ax",@progbits
	.align	2
	.globl	_Z21inc_flash_write_counthj
	.hidden	_Z21inc_flash_write_counthj
	.type	_Z21inc_flash_write_counthj, @function
_Z21inc_flash_write_counthj:
.LFB9:
	.cfi_startproc
	srli	a1,a1,12
	andi	a1,a1,3
	slli	a0,a0,2
	add	a1,a1,a0
	slli	a1,a1,2
	la a4, _ZL17flash_write_count; lw a4, 0(a4);
	add	a4,a4,a1
	lw	a5,0(a4)
	addi	a5,a5,1
	bne	a5,zero,.L94
	li	a5,1
.L94:
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE9:
	.size	_Z21inc_flash_write_counthj, .-_Z21inc_flash_write_counthj
	.section	.text._Z18GetFlashWriteCounthj,"ax",@progbits
	.align	2
	.globl	_Z18GetFlashWriteCounthj
	.hidden	_Z18GetFlashWriteCounthj
	.type	_Z18GetFlashWriteCounthj, @function
_Z18GetFlashWriteCounthj:
.LFB10:
	.cfi_startproc
	srli	a1,a1,12
	andi	a1,a1,3
	slli	a0,a0,2
	add	a0,a0,a1
	slli	a0,a0,2
	la a5, _ZL17flash_write_count; lw a5, 0(a5);
	add	a5,a5,a0
	lw	a0,0(a5)
	ret
	.cfi_endproc
.LFE10:
	.size	_Z18GetFlashWriteCounthj, .-_Z18GetFlashWriteCounthj
	.section	.rodata._Z13UNROM512_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"FLASH_WRITE_COUNT"
	.align	2
.LC4:
	.string	"FLASH_DATA"
	.align	2
.LC5:
	.string	"FLASH_STATE"
	.align	2
.LC6:
	.string	"FLASH_MODE"
	.align	2
.LC7:
	.string	"FLASH_BANK"
	.align	2
.LC8:
	.string	"LATA"
	.align	2
.LC9:
	.string	"LATC"
	.align	2
.LC10:
	.string	"BUSC"
	.section	.text._Z13UNROM512_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNROM512_InitP8CartInfo
	.hidden	_Z13UNROM512_InitP8CartInfo
	.type	_Z13UNROM512_InitP8CartInfo, @function
_Z13UNROM512_InitP8CartInfo:
.LFB19:
	.cfi_startproc
	lw	a5,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lw	a2,68(a0)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL10flash_save
	sb	a5,0(s1)
	la a4, _ZL11flash_state; sb zero, 0(a4);
	la a4, _ZL10flash_bank; sb zero, 0(a4);
	li	a5,8192
	mv	s0,a0
	li	a3,0
	beq	a2,a5,.L97
	li	a5,16384
	li	a3,32
	beq	a2,a5,.L97
	li	a3,96
.L97:
	la a4, head+6; lbu a4, 0(a4);
	srli	a5,a4,2
	andi	a5,a5,2
	andi	a4,a4,1
	or	a5,a5,a4
	la a1, _ZL11chrram_mask; sb a3, 0(a1);
	li	a4,2
	beq	a5,a4,.L98
	li	a4,3
	beq	a5,a4,.L99
	li	a4,1
	li	a2,0
	li	a1,1
	beq	a5,a4,.L100
	li	a0,0
	call	_Z18SetupCartMirroringiiPh
.L101:
	lw	a5,48(s0)
	lla	a3,_ZL18UNROM512LatchPowerv
	sw	a3,0(s0)
	seqz	a5,a5
	la a3, _ZL12bus_conflict; sb a5, 0(a3);
	la a5, _ZL10latcheinit; sb zero, 0(a5);
	lla	a5,_ZL13UNROM512LSyncv
	la a3, _ZL6WLSync; sw a5, 0(a3);
	lla	a5,_ZL13UNROM512HSyncv
	la a3, _ZL6WHSync; sw a5, 0(a3);
	lbu	a4,0(s1)
	lla	a5,_ZL18UNROM512LatchClosev
	sw	a5,8(s0)
	lla	a5,_ZL12StateRestorei
	la a3, GameStateRestore; sw a5, 0(a3);
	bne	a4,zero,.L109
.L102:
	lla	a3,.LC9
	li	a2,0
	li	a1,1
	lla	a0,_ZL6latche
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC10
	li	a2,0
	li	a1,1
	lla	a0,_ZL12bus_conflict
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
.L99:
	.cfi_restore_state
	li	a5,-8192
	add	a2,a2,a5
	la a5, VROM; lw a5, 0(a5);
	add	a2,a5,a2
	li	a1,1
	li	a0,4
	call	_Z18SetupCartMirroringiiPh
	j	.L101
.L109:
	lla	s1,ROM_size
	lw	a0,0(s1)
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,_ZL9flashdata
	slli	a0,a0,14
	call	_Z12FCEU_gmallocj
	lw	a5,0(s1)
	sw	a0,0(s2)
	slli	a0,a5,4
	call	_Z12FCEU_gmallocj
	lw	a4,0(s1)
	lw	a3,0(s2)
	sw	a0,12(s0)
	slli	a1,a4,4
	slli	a4,a4,14
	sw	a4,32(s0)
	sw	a3,16(s0)
	sw	a1,28(s0)
	lla	a3,.LC3
	li	a2,0
	la a4, _ZL17flash_write_count; sw a0, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	a1,0(s1)
	lw	a0,0(s2)
	lla	a3,.LC4
	li	a2,0
	slli	a1,a1,14
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,_ZL11flash_state
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,_ZL10flash_mode
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC7
	li	a2,0
	li	a1,1
	lla	a0,_ZL10flash_bank
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC8
	li	a2,0
	li	a1,2
	lla	a0,_ZL6latcha
	call	_Z10AddExStatePvjiPKc
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L102
.L98:
	li	a2,0
	li	a1,0
	li	a0,2
	call	_Z18SetupCartMirroringiiPh
	j	.L101
.L100:
	li	a0,1
	call	_Z18SetupCartMirroringiiPh
	j	.L101
	.cfi_endproc
.LFE19:
	.size	_Z13UNROM512_InitP8CartInfo, .-_Z13UNROM512_InitP8CartInfo
	.section	.sbss._ZL6WHSync,"aw",@nobits
	.align	2
	.type	_ZL6WHSync, @object
	.size	_ZL6WHSync, 4
_ZL6WHSync:
	.zero	4
	.section	.sbss._ZL6WLSync,"aw",@nobits
	.align	2
	.type	_ZL6WLSync, @object
	.size	_ZL6WLSync, 4
_ZL6WLSync:
	.zero	4
	.section	.sbss._ZL10flash_bank,"aw",@nobits
	.type	_ZL10flash_bank, @object
	.size	_ZL10flash_bank, 1
_ZL10flash_bank:
	.zero	1
	.section	.sbss._ZL10flash_mode,"aw",@nobits
	.type	_ZL10flash_mode, @object
	.size	_ZL10flash_mode, 1
_ZL10flash_mode:
	.zero	1
	.section	.sbss._ZL11flash_state,"aw",@nobits
	.type	_ZL11flash_state, @object
	.size	_ZL11flash_state, 1
_ZL11flash_state:
	.zero	1
	.section	.sbss._ZL10flash_save,"aw",@nobits
	.type	_ZL10flash_save, @object
	.size	_ZL10flash_save, 1
_ZL10flash_save:
	.zero	1
	.section	.bss._ZL9FlashPage,"aw",@nobits
	.align	2
	.type	_ZL9FlashPage, @object
	.size	_ZL9FlashPage, 128
_ZL9FlashPage:
	.zero	128
	.section	.sbss._ZL17flash_write_count,"aw",@nobits
	.align	2
	.type	_ZL17flash_write_count, @object
	.size	_ZL17flash_write_count, 4
_ZL17flash_write_count:
	.zero	4
	.section	.sbss._ZL9flashdata,"aw",@nobits
	.align	2
	.type	_ZL9flashdata, @object
	.size	_ZL9flashdata, 4
_ZL9flashdata:
	.zero	4
	.section	.sbss._ZL6latcha,"aw",@nobits
	.align	1
	.type	_ZL6latcha, @object
	.size	_ZL6latcha, 2
_ZL6latcha:
	.zero	2
	.section	.sbss._ZL11software_id,"aw",@nobits
	.type	_ZL11software_id, @object
	.size	_ZL11software_id, 1
_ZL11software_id:
	.zero	1
	.section	.sbss._ZL11chrram_mask,"aw",@nobits
	.type	_ZL11chrram_mask, @object
	.size	_ZL11chrram_mask, 1
_ZL11chrram_mask:
	.zero	1
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
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	38229
	.word	43690
	.word	38229
	.word	38229
	.word	43690
.LC1:
	.word	170
	.word	85
	.word	128
	.word	170
	.word	85
.LC2:
	.word	1
	.word	0
	.word	1
	.word	1
	.word	0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
