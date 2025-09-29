#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"onebus.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL20UNLOneBusReadAPU40XXj,"ax",@progbits
	.align	2
	.type	_ZL20UNLOneBusReadAPU40XXj, @function
_ZL20UNLOneBusReadAPU40XXj:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	andi	s0,a0,63
	slli	a4,s0,2
	lla	a5,_ZL10defapuread
	add	a5,a5,a4
	lw	a5,0(a5)
	sw	ra,8(sp)
	.cfi_offset 1, -4
	jalr	a5
	li	a5,21
	beq	s0,a5,.L8
.L2:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L8:
	.cfi_restore_state
	la a5, _ZL7apu40xx+48; lbu a5, 0(a5);
	andi	a5,a5,16
	beq	a5,zero,.L2
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	la a5, _ZL7pcm_irq; lbu a5, 0(a5);
	andi	a0,a0,127
	or	a0,a0,a5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	_ZL20UNLOneBusReadAPU40XXj, .-_ZL20UNLOneBusReadAPU40XXj
	.section	.text._ZL5PSyncv,"ax",@progbits
	.align	2
	.type	_ZL5PSyncv, @function
_ZL5PSyncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	ra,24(sp)
	sw	s0,20(sp)
	sw	s1,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL7cpu410x
	lbu	a0,11(a5)
	li	a3,7
	andi	a4,a0,7
	beq	a4,a3,.L12
	li	a3,63
	sra	a3,a3,a4
	li	t2,-64
	andi	a2,a3,0xff
	sra	t2,t2,a4
.L10:
	lbu	s0,0(a5)
	lbu	t1,10(a5)
	lbu	s1,5(a5)
	li	t0,4096
	la a4, _ZL8inv_hack; lbu a4, 0(a4);
	slli	s0,s0,4
	addi	t0,t0,-256
	xori	a1,a4,7
	and	t1,t1,t2
	xori	a4,a4,8
	and	s0,s0,t0
	slli	s1,s1,8
	add	a1,a5,a1
	add	a4,a5,a4
	add	s0,s0,t1
	andi	a0,a0,64
	li	t1,16384
	and	s1,s1,t1
	lbu	a1,0(a1)
	lbu	a4,0(a4)
	li	t1,254
	beq	a0,zero,.L11
	lbu	t1,9(a5)
.L11:
	and	a1,a2,a1
	li	a0,32768
	or	a1,a1,s0
	or	a0,s1,a0
	sw	a3,12(sp)
	sw	t1,4(sp)
	sw	a4,8(sp)
	sw	a2,0(sp)
	call	_Z7setprg8jj
	lw	a2,0(sp)
	lw	a4,8(sp)
	li	a0,40960
	and	a1,a2,a4
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a2,0(sp)
	lw	t1,4(sp)
	li	a0,49152
	xor	a0,s1,a0
	and	a1,a2,t1
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a3,12(sp)
	lw	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,16(sp)
	.cfi_restore 9
	or	a1,s0,a3
	lw	s0,20(sp)
	.cfi_restore 8
	li	a0,57344
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L12:
	.cfi_restore_state
	li	a3,255
	li	t2,-256
	li	a2,255
	j	.L10
	.cfi_endproc
.LFE6:
	.size	_ZL5PSyncv, .-_ZL5PSyncv
	.section	.text._ZL5CSyncv,"ax",@progbits
	.align	2
	.type	_ZL5CSyncv, @function
_ZL5CSyncv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-44
	.cfi_def_cfa_offset 44
	sw	ra,40(sp)
	sw	s1,32(sp)
	sw	s0,36(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	lla	t2,_ZL7ppu201x
	lbu	t0,10(t2)
	lla	a2,_ZL7cpu410x
	lbu	s0,0(a2)
	andi	a4,t0,7
	lla	a5,_ZZL5CSyncvE4midx
	lbu	a1,8(t2)
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a0,32768
	lbu	a3,6(t2)
	lbu	t1,5(a2)
	addi	a0,a0,-2048
	slli	s0,s0,11
	and	s0,s0,a0
	slli	a1,a1,4
	li	a5,255
	li	a0,-256
	sra	a5,a5,a4
	andi	a1,a1,1792
	sra	a0,a0,a4
	and	a0,a0,t0
	lbu	a4,7(t2)
	li	t0,4096
	sw	a3,28(sp)
	or	s0,s0,a1
	slli	t1,t1,5
	and	a1,a5,a3
	lbu	a3,3(t2)
	and	s1,t1,t0
	lbu	a2,4(t2)
	lbu	t1,2(t2)
	lbu	t2,5(t2)
	add	s0,s0,a0
	andi	a1,a1,254
	or	a1,a1,s0
	mv	a0,s1
	sw	a3,4(sp)
	andi	a3,a5,0xff
	and	a5,a5,a4
	sw	t2,20(sp)
	sw	a2,8(sp)
	sw	t1,24(sp)
	sw	a4,16(sp)
	sw	a5,12(sp)
	sw	a3,0(sp)
	call	_Z7setchr1jj
	lw	a3,28(sp)
	xori	a0,s1,1024
	ori	a1,a3,1
	lw	a3,0(sp)
	and	a1,a3,a1
	or	a1,a1,s0
	call	_Z7setchr1jj
	lw	a5,12(sp)
	li	a0,4096
	addi	a0,a0,-2048
	andi	a1,a5,254
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lw	a4,16(sp)
	lw	a5,0(sp)
	li	a0,4096
	ori	a1,a4,1
	and	a1,a5,a1
	addi	a0,a0,-1024
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lw	t1,24(sp)
	lw	a5,0(sp)
	li	t0,4096
	xor	a0,s1,t0
	and	a1,a5,t1
	or	a1,a1,s0
	call	_Z7setchr1jj
	lw	a3,4(sp)
	lw	a5,0(sp)
	li	a0,4096
	addi	a0,a0,1024
	and	a1,a5,a3
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lw	a2,8(sp)
	lw	a5,0(sp)
	li	a0,8192
	addi	a0,a0,-2048
	and	a1,a5,a2
	or	a1,a1,s0
	xor	a0,s1,a0
	call	_Z7setchr1jj
	lw	a5,0(sp)
	lw	t2,20(sp)
	li	a0,8192
	addi	a0,a0,-1024
	and	a1,a5,t2
	xor	a0,s1,a0
	or	a1,a1,s0
	call	_Z7setchr1jj
	lla	a2,_ZL7cpu410x
	lbu	a0,6(a2)
	lw	s0,36(sp)
	.cfi_restore 8
	lw	ra,40(sp)
	.cfi_restore 1
	lw	s1,32(sp)
	.cfi_restore 9
	not	a0,a0
	andi	a0,a0,1
	addi	sp,sp,44
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE7:
	.size	_ZL5CSyncv, .-_ZL5CSyncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL5PSyncv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
	.cfi_endproc
.LFE18:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL21UNLOneBusWritePPU201Xjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWritePPU201Xjh, @function
_ZL21UNLOneBusWritePPU201Xjh:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	andi	a0,a0,15
	lla	a5,_ZL7ppu201x
	sw	ra,8(sp)
	.cfi_offset 1, -4
	add	a5,a5,a0
	sb	a1,0(a5)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
	.cfi_endproc
.LFE10:
	.size	_ZL21UNLOneBusWritePPU201Xjh, .-_ZL21UNLOneBusWritePPU201Xjh
	.section	.text._ZL14UNLOneBusResetv,"ax",@progbits
	.align	2
	.type	_ZL14UNLOneBusResetv, @function
_ZL14UNLOneBusResetv:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,16
	li	a1,0
	lla	a0,_ZL7cpu410x
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sb zero, 0(a5);
	la a5, _ZL9IRQReload; sb zero, 0(a5);
	call	memset
	li	a2,16
	li	a1,0
	lla	a0,_ZL7ppu201x
	call	memset
	li	a2,64
	li	a1,0
	lla	a0,_ZL7apu40xx
	call	memset
	call	_ZL5PSyncv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
	.cfi_endproc
.LFE17:
	.size	_ZL14UNLOneBusResetv, .-_ZL14UNLOneBusResetv
	.section	.text._ZL14UNLOneBusPowerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLOneBusPowerv, @function
_ZL14UNLOneBusPowerv:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	li	a2,16
	li	a1,0
	lla	a0,_ZL7cpu410x
	sw	ra,16(sp)
	sw	s0,12(sp)
	sw	s1,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	la a5, _ZL4IRQa; sb zero, 0(a5);
	la a5, _ZL8IRQCount; sb zero, 0(a5);
	la a5, _ZL9IRQReload; sb zero, 0(a5);
	call	memset
	li	a2,16
	li	a1,0
	lla	a0,_ZL7ppu201x
	call	memset
	li	a2,64
	li	a1,0
	lla	a0,_ZL7apu40xx
	call	memset
	li	a3,0
	la a2, PRGsize; lw a2, 0(a2);
	la a1, PRGptr; lw a1, 0(a1);
	li	a0,0
	call	_Z19SetupCartCHRMappingiPhji
	lla	s0,_ZL10defapuread
	lla	a4,_ZL11defapuwrite
	li	s1,0
.L25:
	li	a5,16384
	or	a3,s1,a5
	mv	a0,a3
	sw	a4,4(sp)
	sw	a3,0(sp)
	call	_Z14GetReadHandleri
	lw	a3,0(sp)
	mv	a2,a0
	sw	a2,0(s0)
	mv	a0,a3
	call	_Z15GetWriteHandleri
	lw	a4,4(sp)
	addi	s1,s1,1
	li	a3,64
	sw	a0,0(a4)
	addi	s0,s0,4
	addi	a4,a4,4
	bne	s1,a3,.L25
	li	a1,16384
	lla	a2,_ZL20UNLOneBusReadAPU40XXj
	addi	a1,a1,63
	li	a0,16384
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	lla	a2,_ZL21UNLOneBusWriteAPU40XXjh
	addi	a1,a1,63
	li	a0,16384
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,8192
	li	a0,8192
	lla	a2,_ZL21UNLOneBusWritePPU201Xjh
	addi	a1,a1,31
	addi	a0,a0,16
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,16384
	li	a0,16384
	lla	a2,_ZL21UNLOneBusWriteCPU410Xjh
	addi	a1,a1,271
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL18UNLOneBusWriteMMC3jh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	call	_ZL5PSyncv
	lw	s0,12(sp)
	.cfi_restore 8
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
	.cfi_endproc
.LFE16:
	.size	_ZL14UNLOneBusPowerv, .-_ZL14UNLOneBusPowerv
	.section	.text._ZL18UNLOneBusWriteMMC3jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLOneBusWriteMMC3jh, @function
_ZL18UNLOneBusWriteMMC3jh:
.LFB11:
	.cfi_startproc
	li	a5,57344
	addi	a5,a5,1
	and	a0,a0,a5
	li	a4,49152
	beq	a0,a4,.L29
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	bgtu	a0,a4,.L30
	li	a5,32768
	addi	a5,a5,1
	li	a4,32768
	beq	a0,a5,.L31
	li	a5,40960
	beq	a0,a5,.L32
	bne	a0,a4,.L28
	lla	a4,_ZL7cpu410x
	lbu	a5,5(a4)
	andi	a1,a1,-57
	andi	a5,a5,56
	or	a1,a5,a1
	sb	a1,5(a4)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L30:
	.cfi_restore_state
	li	a3,57344
	beq	a0,a3,.L35
	beq	a0,a5,.L36
	li	a5,49152
	addi	a5,a5,1
	bne	a0,a5,.L28
	li	a5,1
	la a4, _ZL9IRQReload; sb a5, 0(a4);
.L28:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L32:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7cpu410x+6; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L36:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L31:
	.cfi_restore_state
	lla	a3,_ZL7cpu410x
	lbu	a5,5(a3)
	lla	a4,.L40
	andi	a5,a5,7
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL18UNLOneBusWriteMMC3jh,"a",@progbits
	.align	2
	.align	2
.L40:
	.word	.L38-.L40
	.word	.L46-.L40
	.word	.L45-.L40
	.word	.L44-.L40
	.word	.L43-.L40
	.word	.L42-.L40
	.word	.L41-.L40
	.word	.L39-.L40
	.section	.text._ZL18UNLOneBusWriteMMC3jh
.L35:
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L29:
	andi	a1,a1,-2
	la a5, _ZL7cpu410x+1; sb a1, 0(a5);
	ret
.L39:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	sb	a1,8(a3)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5PSyncv
.L41:
	.cfi_restore_state
	sb	a1,7(a3)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5PSyncv
.L42:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7ppu201x+5; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L43:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7ppu201x+4; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L44:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7ppu201x+3; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L45:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7ppu201x+2; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L46:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL7ppu201x+7; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L38:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL7ppu201x+6; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
	.cfi_endproc
.LFE11:
	.size	_ZL18UNLOneBusWriteMMC3jh, .-_ZL18UNLOneBusWriteMMC3jh
	.section	.text._ZL21UNLOneBusWriteAPU40XXjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWriteAPU40XXjh, @function
_ZL21UNLOneBusWriteAPU40XXjh:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	lla	a5,_ZL7apu40xx
	.cfi_offset 8, -8
	andi	s0,a0,63
	sw	s1,4(sp)
	add	a4,a5,s0
	sw	ra,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sb	a1,0(a4)
	li	a4,19
	mv	s1,a0
	beq	s0,a4,.L52
	li	a4,21
	beq	s0,a4,.L53
	li	a4,18
	bne	s0,a4,.L55
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L55
	slli	a5,a1,6
	la a4, _ZL8pcm_addr; sh a5, 0(a4);
.L55:
	slli	s0,s0,2
	lla	a5,_ZL11defapuwrite
	add	a5,a5,s0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	a5,0(a5)
	mv	a0,s1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L53:
	.cfi_restore_state
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L55
	andi	a5,a1,16
	lla	a4,_ZL10pcm_enable
	sb	a5,0(a4)
	la a3, _ZL7pcm_irq; lbu a3, 0(a3);
	bne	a3,zero,.L74
.L56:
	beq	a5,zero,.L57
	la a5, _ZL9pcm_clock; lhu a5, 0(a5);
	la a4, _ZL9pcm_latch; sh a5, 0(a4);
.L57:
	andi	a1,a1,239
	j	.L55
.L52:
	lbu	a5,48(a5)
	andi	a5,a5,16
	beq	a5,zero,.L55
	slli	a5,a1,4
	addi	a5,a5,1
	la a4, _ZL8pcm_size; sh a5, 0(a4);
	j	.L55
.L74:
	li	a0,1
	sw	a1,0(sp)
	call	_Z12X6502_IRQEndi
	lla	a4,_ZL10pcm_enable
	lbu	a5,0(a4)
	lw	a1,0(sp)
	la a4, _ZL7pcm_irq; sb zero, 0(a4);
	j	.L56
	.cfi_endproc
.LFE13:
	.size	_ZL21UNLOneBusWriteAPU40XXjh, .-_ZL21UNLOneBusWriteAPU40XXjh
	.section	.text._ZL16UNLOneBusIRQHookv,"ax",@progbits
	.align	2
	.type	_ZL16UNLOneBusIRQHookv, @function
_ZL16UNLOneBusIRQHookv:
.LFB12:
	.cfi_startproc
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L76
	la a5, _ZL7cpu410x+1; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a5, _ZL9IRQReload; sb zero, 0(a5);
	ret
.L76:
	la a3, _ZL9IRQReload; lbu a3, 0(a3);
	bne	a3,zero,.L83
	addi	a5,a5,-1
	andi	a5,a5,0xff
.L79:
	sb	a5,0(a4)
	bne	a5,zero,.L75
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	bne	a5,zero,.L84
.L75:
	ret
.L83:
	la a5, _ZL7cpu410x+1; lbu a5, 0(a5);
	la a3, _ZL9IRQReload; sb zero, 0(a3);
	j	.L79
.L84:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE12:
	.size	_ZL16UNLOneBusIRQHookv, .-_ZL16UNLOneBusIRQHookv
	.section	.text._ZL16UNLOneBusCpuHooki,"ax",@progbits
	.align	2
	.type	_ZL16UNLOneBusCpuHooki, @function
_ZL16UNLOneBusCpuHooki:
.LFB15:
	.cfi_startproc
	la a5, _ZL10pcm_enable; lbu a5, 0(a5);
	beq	a5,zero,.L91
	lla	a4,_ZL9pcm_latch
	lhu	a5,0(a4)
	sub	a0,a5,a0
	slli	a5,a0,16
	srai	a5,a5,16
	slli	a0,a0,16
	sh	a5,0(a4)
	srli	a0,a0,16
	ble	a5,zero,.L93
.L91:
	ret
.L93:
	lla	a3,_ZL8pcm_size
	lhu	a5,0(a3)
	la a2, _ZL9pcm_clock; lhu a2, 0(a2);
	add	a0,a0,a2
	addi	a5,a5,-1
	slli	a5,a5,16
	srai	a5,a5,16
	sh	a0,0(a4)
	sh	a5,0(a3)
	blt	a5,zero,.L94
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8pcm_addr
	lhu	a5,0(s0)
	la a0, _ZL7apu40xx+48; lbu a0, 0(a0);
	xori	a0,a0,3
	slli	a0,a0,14
	or	a0,a0,a5
	slli	a0,a0,16
	srli	a0,a0,16
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z5readbi
	srli	a1,a0,1
	li	a0,16384
	la a5, _ZL11defapuwrite+68; lw a5, 0(a5);
	andi	a1,a1,0xff
	addi	a0,a0,17
	jalr	a5
	lhu	a5,0(s0)
	lw	ra,8(sp)
	.cfi_restore 1
	addi	a5,a5,1
	slli	a5,a5,17
	srli	a5,a5,17
	sh	a5,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L94:
	li	a5,-128
	la a4, _ZL7pcm_irq; sb a5, 0(a4);
	li	a0,1
	la a5, _ZL10pcm_enable; sb zero, 0(a5);
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE15:
	.size	_ZL16UNLOneBusCpuHooki, .-_ZL16UNLOneBusCpuHooki
	.section	.text._ZL21UNLOneBusWriteCPU410Xjh,"ax",@progbits
	.align	2
	.type	_ZL21UNLOneBusWriteCPU410Xjh, @function
_ZL21UNLOneBusWriteCPU410Xjh:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	andi	a5,a0,15
	li	a4,3
	beq	a5,a4,.L96
	andi	a0,a0,12
	bne	a0,zero,.L97
	li	a4,1
	beq	a5,a4,.L98
	li	a3,2
	bne	a5,a3,.L100
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL9IRQReload; sb a4, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L97:
	.cfi_restore_state
	li	a4,4
	bne	a5,a4,.L100
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L100:
	.cfi_restore_state
	lla	a4,_ZL7cpu410x
	add	a5,a4,a5
	sb	a1,0(a5)
	call	_ZL5PSyncv
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL5CSyncv
.L96:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L98:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	andi	a1,a1,-2
	la a5, _ZL7cpu410x+1; sb a1, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_ZL21UNLOneBusWriteCPU410Xjh, .-_ZL21UNLOneBusWriteCPU410Xjh
	.section	.text._Z14UNLOneBus_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLOneBus_InitP8CartInfo
	.hidden	_Z14UNLOneBus_InitP8CartInfo
	.type	_Z14UNLOneBus_InitP8CartInfo, @function
_Z14UNLOneBus_InitP8CartInfo:
.LFB19:
	.cfi_startproc
	lla	a3,_ZL14UNLOneBusPowerv
	lw	a4,76(a0)
	li	a5,811585536
	sw	a3,0(a0)
	lla	a3,_ZL14UNLOneBusResetv
	sw	a3,4(a0)
	addi	a5,a5,-573
	beq	a4,a5,.L105
	li	a5,1790955520
	addi	a5,a5,-370
	beq	a4,a5,.L105
.L106:
	lla	a5,_ZL16UNLOneBusIRQHookv
	la a4, GameHBIRQHook; sw a5, 0(a4);
	lla	a5,_ZL16UNLOneBusCpuHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
.L105:
	li	a5,15
	la a4, _ZL8inv_hack; sb a5, 0(a4);
	j	.L106
	.cfi_endproc
.LFE19:
	.size	_Z14UNLOneBus_InitP8CartInfo, .-_Z14UNLOneBus_InitP8CartInfo
	.section	.srodata._ZZL5CSyncvE4midx,"a"
	.align	2
	.type	_ZZL5CSyncvE4midx, @object
	.size	_ZZL5CSyncvE4midx, 8
_ZZL5CSyncvE4midx:
	.string	""
	.string	"\001\002"
	.string	"\003\004\005"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"REGC"
	.align	2
.LC1:
	.string	"REGS"
	.align	2
.LC2:
	.string	"REGA"
	.align	2
.LC3:
	.string	"IRQR"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQA"
	.align	2
.LC6:
	.string	"PCME"
	.align	2
.LC7:
	.string	"PCMI"
	.align	2
.LC8:
	.string	"PCMA"
	.align	2
.LC9:
	.string	"PCMS"
	.align	2
.LC10:
	.string	"PCML"
	.align	2
.LC11:
	.string	"PCMC"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 156
_ZL9StateRegs:
	.word	_ZL7cpu410x
	.word	16
	.word	.LC0
	.word	_ZL7ppu201x
	.word	16
	.word	.LC1
	.word	_ZL7apu40xx
	.word	64
	.word	.LC2
	.word	_ZL9IRQReload
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	1
	.word	.LC4
	.word	_ZL4IRQa
	.word	1
	.word	.LC5
	.word	_ZL10pcm_enable
	.word	1
	.word	.LC6
	.word	_ZL7pcm_irq
	.word	1
	.word	.LC7
	.word	_ZL8pcm_addr
	.word	2
	.word	.LC8
	.word	_ZL8pcm_size
	.word	2
	.word	.LC9
	.word	_ZL9pcm_latch
	.word	2
	.word	.LC10
	.word	_ZL9pcm_clock
	.word	2
	.word	.LC11
	.word	0
	.zero	8
	.section	.bss._ZL10defapuread,"aw",@nobits
	.align	2
	.type	_ZL10defapuread, @object
	.size	_ZL10defapuread, 256
_ZL10defapuread:
	.zero	256
	.section	.bss._ZL11defapuwrite,"aw",@nobits
	.align	2
	.type	_ZL11defapuwrite, @object
	.size	_ZL11defapuwrite, 256
_ZL11defapuwrite:
	.zero	256
	.section	.sdata._ZL9pcm_clock,"aw"
	.align	1
	.type	_ZL9pcm_clock, @object
	.size	_ZL9pcm_clock, 2
_ZL9pcm_clock:
	.half	225
	.section	.sbss._ZL9pcm_latch,"aw",@nobits
	.align	1
	.type	_ZL9pcm_latch, @object
	.size	_ZL9pcm_latch, 2
_ZL9pcm_latch:
	.zero	2
	.section	.sbss._ZL8pcm_size,"aw",@nobits
	.align	1
	.type	_ZL8pcm_size, @object
	.size	_ZL8pcm_size, 2
_ZL8pcm_size:
	.zero	2
	.section	.sbss._ZL8pcm_addr,"aw",@nobits
	.align	1
	.type	_ZL8pcm_addr, @object
	.size	_ZL8pcm_addr, 2
_ZL8pcm_addr:
	.zero	2
	.section	.sbss._ZL7pcm_irq,"aw",@nobits
	.type	_ZL7pcm_irq, @object
	.size	_ZL7pcm_irq, 1
_ZL7pcm_irq:
	.zero	1
	.section	.sbss._ZL10pcm_enable,"aw",@nobits
	.type	_ZL10pcm_enable, @object
	.size	_ZL10pcm_enable, 1
_ZL10pcm_enable:
	.zero	1
	.section	.sbss._ZL8inv_hack,"aw",@nobits
	.type	_ZL8inv_hack, @object
	.size	_ZL8inv_hack, 1
_ZL8inv_hack:
	.zero	1
	.section	.sbss._ZL9IRQReload,"aw",@nobits
	.type	_ZL9IRQReload, @object
	.size	_ZL9IRQReload, 1
_ZL9IRQReload:
	.zero	1
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.bss._ZL7apu40xx,"aw",@nobits
	.align	2
	.type	_ZL7apu40xx, @object
	.size	_ZL7apu40xx, 64
_ZL7apu40xx:
	.zero	64
	.section	.bss._ZL7ppu201x,"aw",@nobits
	.align	2
	.type	_ZL7ppu201x, @object
	.size	_ZL7ppu201x, 16
_ZL7ppu201x:
	.zero	16
	.section	.bss._ZL7cpu410x,"aw",@nobits
	.align	2
	.type	_ZL7cpu410x, @object
	.size	_ZL7cpu410x, 16
_ZL7cpu410x:
	.zero	16
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
