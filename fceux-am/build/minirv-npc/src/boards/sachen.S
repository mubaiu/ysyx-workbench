#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sachen.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL9SARestorei,"ax",@progbits
	.align	2
	.type	_ZL9SARestorei, @function
_ZL9SARestorei:
.LFB28:
	.cfi_startproc
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE28:
	.size	_ZL9SARestorei, .-_ZL9SARestorei
	.section	.text._ZL8SADWritejh,"ax",@progbits
	.align	2
	.type	_ZL8SADWritejh, @function
_ZL8SADWritejh:
.LFB29:
	.cfi_startproc
	la a5, _ZL5latch; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
	.cfi_endproc
.LFE29:
	.size	_ZL8SADWritejh, .-_ZL8SADWritejh
	.section	.text._ZL9TCU02Readj,"ax",@progbits
	.align	2
	.type	_ZL9TCU02Readj, @function
_ZL9TCU02Readj:
.LFB48:
	.cfi_startproc
	la a0, _ZL5latch; lbu a0, 0(a0);
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-64
	andi	a0,a0,63
	or	a0,a0,a5
	ret
	.cfi_endproc
.LFE48:
	.size	_ZL9TCU02Readj, .-_ZL9TCU02Readj
	.section	.text._ZL12SA0161MSyncov,"ax",@progbits
	.align	2
	.type	_ZL12SA0161MSyncov, @function
_ZL12SA0161MSyncov:
.LFB31:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,3
	andi	a1,a1,1
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
.LFE31:
	.size	_ZL12SA0161MSyncov, .-_ZL12SA0161MSyncov
	.section	.text._ZL12SA72007Syncov,"ax",@progbits
	.align	2
	.type	_ZL12SA72007Syncov, @function
_ZL12SA72007Syncov:
.LFB32:
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
	la a0, _ZL5latch; lbu a0, 0(a0);
	srli	a0,a0,7
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE32:
	.size	_ZL12SA72007Syncov, .-_ZL12SA72007Syncov
	.section	.text._ZL12SA72008Syncov,"ax",@progbits
	.align	2
	.type	_ZL12SA72008Syncov, @function
_ZL12SA72008Syncov:
.LFB34:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	li	a0,32768
	srli	a1,a1,2
	andi	a1,a1,1
	call	_Z8setprg32jj
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
.LFE34:
	.size	_ZL12SA72008Syncov, .-_ZL12SA72008Syncov
	.section	.text._ZL10SA009Syncov,"ax",@progbits
	.align	2
	.type	_ZL10SA009Syncov, @function
_ZL10SA009Syncov:
.LFB33:
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
	la a0, _ZL5latch; lbu a0, 0(a0);
	andi	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE33:
	.size	_ZL10SA009Syncov, .-_ZL10SA009Syncov
	.section	.text._ZL10TCU01Writejh,"ax",@progbits
	.align	2
	.type	_ZL10TCU01Writejh, @function
_ZL10TCU01Writejh:
.LFB42:
	.cfi_startproc
	andi	a0,a0,259
	li	a4,258
	beq	a0,a4,.L18
	ret
.L18:
	mv	a5,a1
	srli	a4,a5,2
	srli	a1,a1,6
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	andi	a4,a4,1
	andi	a1,a1,2
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	li	a0,32768
	or	a1,a1,a4
	sb	a5,0(s0)
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE42:
	.size	_ZL10TCU01Writejh, .-_ZL10TCU01Writejh
	.section	.text._ZL7SAPowerv,"ax",@progbits
	.align	2
	.type	_ZL7SAPowerv, @function
_ZL7SAPowerv:
.LFB27:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL5latch; sb zero, 0(a5);
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, _ZL5WSync; lw a5, 0(a5);
	jalr	a5
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL7SAWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE27:
	.size	_ZL7SAPowerv, .-_ZL7SAPowerv
	.section	.text._ZL8SADPowerv,"ax",@progbits
	.align	2
	.type	_ZL8SADPowerv, @function
_ZL8SADPowerv:
.LFB30:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a5, _ZL5latch; sb zero, 0(a5);
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL5WSync; lw a5, 0(a5);
	jalr	a5
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a2,_ZL8SADWritejh
	li	a0,32768
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE30:
	.size	_ZL8SADPowerv, .-_ZL8SADPowerv
	.section	.text._ZL10TCA01Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCA01Powerv, @function
_ZL10TCA01Powerv:
.LFB53:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,0
	li	a0,32768
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z8setprg16jj
	li	a1,1
	li	a0,49152
	call	_Z8setprg16jj
	li	a0,0
	call	_Z7setchr8j
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL9TCA01Readj
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE53:
	.size	_ZL10TCA01Powerv, .-_ZL10TCA01Powerv
	.section	.text._ZL13S74LS374NReadj,"ax",@progbits
	.align	2
	.type	_ZL13S74LS374NReadj, @function
_ZL13S74LS374NReadj:
.LFB9:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,256
	and	a0,a0,a5
	beq	a0,a5,.L28
	la a0, X+24; lbu a0, 0(a0);
	ret
.L28:
	la a0, _ZL3cmd; lbu a0, 0(a0);
	not	a0,a0
	la a5, _ZL3dip; lbu a5, 0(a5);
	andi	a0,a0,63
	xor	a0,a0,a5
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL13S74LS374NReadj, .-_ZL13S74LS374NReadj
	.section	.text._ZL7SAWritejh,"ax",@progbits
	.align	2
	.type	_ZL7SAWritejh, @function
_ZL7SAWritejh:
.LFB26:
	.cfi_startproc
	andi	a0,a0,256
	beq	a0,zero,.L29
	la a5, _ZL5latch; sb a1, 0(a5);
	la a5, _ZL5WSync; lw a5, 0(a5);
	jr	a5
.L29:
	ret
	.cfi_endproc
.LFE26:
	.size	_ZL7SAWritejh, .-_ZL7SAWritejh
	.section	.text._ZL9TCA01Readj,"ax",@progbits
	.align	2
	.type	_ZL9TCA01Readj, @function
_ZL9TCA01Readj:
.LFB52:
	.cfi_startproc
	li	a4,16384
	addi	a4,a4,256
	and	a3,a0,a4
	mv	a5,a0
	la a0, X+24; lbu a0, 0(a0);
	beq	a3,a4,.L33
	ret
.L33:
	not	a5,a5
	andi	a5,a5,63
	andi	a0,a0,-64
	or	a0,a5,a0
	ret
	.cfi_endproc
.LFE52:
	.size	_ZL9TCA01Readj, .-_ZL9TCA01Readj
	.section	.text._ZL10TCU02Writejh,"ax",@progbits
	.align	2
	.type	_ZL10TCU02Writejh, @function
_ZL10TCU02Writejh:
.LFB47:
	.cfi_startproc
	andi	a0,a0,259
	li	a5,258
	beq	a0,a5,.L39
	ret
.L39:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	addi	a5,a1,3
	li	a0,32768
	li	a1,0
	sb	a5,0(s0)
	call	_Z8setprg32jj
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
.LFE47:
	.size	_ZL10TCU02Writejh, .-_ZL10TCU02Writejh
	.section	.text._ZL13S74LS374MSynch,"ax",@progbits
	.align	2
	.type	_ZL13S74LS374MSynch, @function
_ZL13S74LS374MSynch:
.LFB6:
	.cfi_startproc
	andi	a0,a0,3
	li	a5,2
	beq	a0,a5,.L41
	li	a5,3
	beq	a0,a5,.L42
	li	a5,1
	beq	a0,a5,.L43
	li	a0,1
	tail	_Z9setmirrori
.L42:
	li	a0,2
	tail	_Z9setmirrori
.L41:
	li	a3,1
	li	a2,1
	li	a1,1
	li	a0,0
	tail	_Z10setmirrorwiiii
.L43:
	li	a0,0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL13S74LS374MSynch, .-_ZL13S74LS374MSynch
	.section	.text._ZL10S8259Syncov,"ax",@progbits
	.align	2
	.type	_ZL10S8259Syncov, @function
_ZL10S8259Syncov:
.LFB18:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	lbu	a1,5(s0)
	li	a0,32768
	andi	a1,a1,7
	call	_Z8setprg32jj
	la a4, UNIFchrrama; lw a4, 0(a4);
	beq	a4,zero,.L63
	lbu	a0,7(s0)
	andi	a2,a0,1
.L58:
	bne	a2,zero,.L59
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL13S74LS374MSynch
.L59:
	.cfi_restore_state
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L63:
	.cfi_restore_state
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lbu	a0,7(s0)
	li	s1,0
	li	a3,2
	andi	t1,a0,1
	j	.L57
.L65:
	lbu	a1,0(s0)
	lla	a5,_ZL4type
	andi	a1,a1,7
	or	a1,a1,t2
	lw	t2,0(a5)
	beq	t2,a3,.L48
.L66:
	bgt	t2,a3,.L49
	beq	t2,zero,.L50
	li	a4,1
	bne	t2,a4,.L52
.L62:
	slli	a0,s1,11
	call	_Z7setchr2jj
	lbu	a0,7(s0)
	li	a3,2
	andi	t1,a0,1
	mv	a2,t1
.L52:
	addi	s1,s1,1
	li	a4,4
	beq	s1,a4,.L64
.L57:
	lbu	a4,4(s0)
	andi	a2,t1,0xff
	slli	t0,a4,3
	andi	t2,t0,56
	bne	t1,zero,.L65
	add	a1,s0,s1
	lbu	a1,0(a1)
	lla	a5,_ZL4type
	andi	a1,a1,7
	or	a1,a1,t2
	lw	t2,0(a5)
	bne	t2,a3,.L66
.L48:
	slli	a1,a1,2
	or	a1,a1,s1
	j	.L62
.L49:
	li	a1,3
	bne	t2,a1,.L52
	add	a2,s0,s1
	lbu	a1,0(a2)
	andi	a1,a1,7
	beq	s1,a3,.L54
	beq	s1,t2,.L55
	li	a2,1
	bne	s1,a2,.L56
	slli	a4,a4,4
	andi	a4,a4,16
	or	a1,a1,a4
.L56:
	slli	a0,s1,10
	call	_Z7setchr1jj
	li	a0,4096
	li	a1,-1
	call	_Z7setchr4jj
	lbu	a0,7(s0)
	addi	s1,s1,1
	li	a4,4
	andi	t1,a0,1
	mv	a2,t1
	li	a3,2
	bne	s1,a4,.L57
.L64:
	lw	s1,0(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L58
.L50:
	.cfi_restore_state
	slli	a1,a1,1
	andi	a4,s1,1
	or	a1,a4,a1
	j	.L62
.L54:
	andi	a4,t0,16
	or	a1,a1,a4
	j	.L56
.L55:
	lbu	a2,6(s0)
	slli	a4,a4,2
	andi	a4,a4,16
	slli	a2,a2,3
	andi	a2,a2,8
	or	a4,a2,a4
	or	a1,a1,a4
	j	.L56
	.cfi_endproc
.LFE18:
	.size	_ZL10S8259Syncov, .-_ZL10S8259Syncov
	.section	.text._ZL12S8259Restorei,"ax",@progbits
	.align	2
	.type	_ZL12S8259Restorei, @function
_ZL12S8259Restorei:
.LFB21:
	.cfi_startproc
	tail	_ZL10S8259Syncov
	.cfi_endproc
.LFE21:
	.size	_ZL12S8259Restorei, .-_ZL12S8259Restorei
	.section	.text._ZL10S8259Resetv,"ax",@progbits
	.align	2
	.type	_ZL10S8259Resetv, @function
_ZL10S8259Resetv:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL5latch
	li	a0,0
	sw	zero,0(a5)
	sw	zero,4(a5)
	la a4, _ZL3cmd; sb zero, 0(a4);
	call	_Z7setchr8j
	call	_ZL10S8259Syncov
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL10S8259Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE20:
	.size	_ZL10S8259Resetv, .-_ZL10S8259Resetv
	.section	.text._ZL14S74LS374NWritejh,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NWritejh, @function
_ZL14S74LS374NWritejh:
.LFB8:
	.cfi_startproc
	li	a4,16384
	addi	a4,a4,257
	li	a5,16384
	and	a0,a0,a4
	addi	a5,a5,256
	mv	a4,a1
	beq	a0,a5,.L84
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL3cmd; lbu a5, 0(a5);
	li	a3,7
	bgtu	a5,a3,.L73
	lla	a3,.L75
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL14S74LS374NWritejh,"a",@progbits
	.align	2
	.align	2
.L75:
	.word	.L73-.L75
	.word	.L73-.L75
	.word	.L79-.L75
	.word	.L73-.L75
	.word	.L78-.L75
	.word	.L77-.L75
	.word	.L76-.L75
	.word	.L74-.L75
	.section	.text._ZL14S74LS374NWritejh
.L84:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	andi	a5,a1,7
	la a4, _ZL3cmd; sb a5, 0(a4);
	ret
.L74:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	srli	a5,a4,1
	sb	a5,2(s0)
.L80:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL13S74LS374MSynch
.L79:
	.cfi_restore_state
	slli	a5,a1,3
	lla	s0,_ZL5latch
	andi	a1,a1,1
	andi	a5,a5,8
	sb	a1,0(s0)
	sb	a5,3(s0)
	j	.L80
.L78:
	slli	a4,a1,2
	lla	s0,_ZL5latch
	andi	a4,a4,4
	lbu	a1,0(s0)
	sb	a4,4(s0)
	j	.L80
.L77:
	andi	a1,a1,7
	lla	s0,_ZL5latch
	sb	a1,0(s0)
	j	.L80
.L76:
	lla	s0,_ZL5latch
	andi	a5,a1,3
	sb	a5,1(s0)
	lbu	a1,0(s0)
	j	.L80
.L73:
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	j	.L80
	.cfi_endproc
.LFE8:
	.size	_ZL14S74LS374NWritejh, .-_ZL14S74LS374NWritejh
	.section	.text._ZL15S74LS374NAWritejh,"ax",@progbits
	.align	2
	.type	_ZL15S74LS374NAWritejh, @function
_ZL15S74LS374NAWritejh:
.LFB15:
	.cfi_startproc
	li	a4,16384
	addi	a4,a4,257
	li	a5,16384
	and	a0,a0,a4
	addi	a5,a5,256
	mv	a4,a1
	beq	a0,a5,.L100
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL3cmd; lbu a5, 0(a5);
	li	a3,7
	bgtu	a5,a3,.L88
	lla	a3,.L90
	slli	a5,a5,2
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a5,a5,a3
	jr	a5
	.section	.rodata._ZL15S74LS374NAWritejh,"a",@progbits
	.align	2
	.align	2
.L90:
	.word	.L95-.L90
	.word	.L88-.L90
	.word	.L94-.L90
	.word	.L88-.L90
	.word	.L93-.L90
	.word	.L92-.L90
	.word	.L91-.L90
	.word	.L89-.L90
	.section	.text._ZL15S74LS374NAWritejh
.L100:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	andi	a1,a1,7
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
.L89:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	andi	a4,a4,1
	sb	a4,2(s0)
.L96:
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a0,1(s0)
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL13S74LS374MSynch
.L88:
	.cfi_restore_state
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	j	.L96
.L95:
	lla	s0,_ZL5latch
	li	a5,768
	sh	a5,0(s0)
	li	a1,0
	j	.L96
.L94:
	slli	a4,a1,3
	lla	s0,_ZL5latch
	andi	a4,a4,8
	lbu	a1,0(s0)
	sb	a4,3(s0)
	j	.L96
.L93:
	lla	s0,_ZL5latch
	lbu	a5,1(s0)
	andi	a4,a1,3
	lbu	a1,0(s0)
	andi	a5,a5,6
	or	a5,a5,a4
	sb	a5,1(s0)
	j	.L96
.L92:
	andi	a1,a1,1
	lla	s0,_ZL5latch
	sb	a1,0(s0)
	j	.L96
.L91:
	lla	s0,_ZL5latch
	lbu	a5,1(s0)
	lbu	a3,3(s0)
	slli	a1,a1,1
	andi	a5,a5,1
	andi	a1,a1,6
	or	a5,a5,a3
	or	a5,a5,a1
	sb	a5,1(s0)
	lbu	a1,0(s0)
	j	.L96
	.cfi_endproc
.LFE15:
	.size	_ZL15S74LS374NAWritejh, .-_ZL15S74LS374NAWritejh
	.section	.text._ZL10S8259Writejh,"ax",@progbits
	.align	2
	.type	_ZL10S8259Writejh, @function
_ZL10S8259Writejh:
.LFB19:
	.cfi_startproc
	li	a4,16384
	addi	a4,a4,257
	li	a5,16384
	and	a0,a0,a4
	addi	a5,a5,256
	bne	a0,a5,.L102
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
.L102:
	la a4, _ZL3cmd; lbu a4, 0(a4);
	andi	a4,a4,7
	lla	a5,_ZL5latch
	add	a5,a5,a4
	sb	a1,0(a5)
	tail	_ZL10S8259Syncov
	.cfi_endproc
.LFE19:
	.size	_ZL10S8259Writejh, .-_ZL10S8259Writejh
	.section	.text._ZL12TCU02Restorei,"ax",@progbits
	.align	2
	.type	_ZL12TCU02Restorei, @function
_ZL12TCU02Restorei:
.LFB50:
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
	la a0, _ZL5latch; lbu a0, 0(a0);
	andi	a0,a0,3
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE50:
	.size	_ZL12TCU02Restorei, .-_ZL12TCU02Restorei
	.section	.text._ZL15S74LS374NAPowerv,"ax",@progbits
	.align	2
	.type	_ZL15S74LS374NAPowerv, @function
_ZL15S74LS374NAPowerv:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a5,768
	lla	s0,_ZL5latch
	li	a1,0
	li	a0,32768
	sw	a5,0(s0)
	sb	zero,4(s0)
	call	_Z8setprg32jj
	lbu	a0,1(s0)
	call	_Z7setchr8j
	lbu	a0,2(s0)
	call	_ZL13S74LS374MSynch
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL15S74LS374NAWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE16:
	.size	_ZL15S74LS374NAPowerv, .-_ZL15S74LS374NAPowerv
	.section	.text._ZL10TCU02Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCU02Powerv, @function
_ZL10TCU02Powerv:
.LFB49:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	.cfi_offset 9, -12
	li	s1,65536
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	a1,s1,-1
	lla	s0,_ZL5latch
	lla	a2,_Z6CartBRj
	li	a0,32768
	sb	zero,0(s0)
	call	_Z14SetReadHandleriiPFhjE
	li	a1,16384
	addi	a1,a1,256
	mv	a0,a1
	lla	a2,_ZL9TCU02Readj
	call	_Z14SetReadHandleriiPFhjE
	li	a0,16384
	addi	a1,s1,-1
	lla	a2,_ZL10TCU02Writejh
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,32768
	li	a1,0
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	andi	a0,a0,3
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE49:
	.size	_ZL10TCU02Powerv, .-_ZL10TCU02Powerv
	.section	.text._ZL12TCU01Restorei,"ax",@progbits
	.align	2
	.type	_ZL12TCU01Restorei, @function
_ZL12TCU01Restorei:
.LFB44:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5latch
	lbu	a5,0(s0)
	li	a0,32768
	srli	a1,a5,6
	srli	a5,a5,2
	andi	a5,a5,1
	andi	a1,a1,2
	or	a1,a1,a5
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE44:
	.size	_ZL12TCU01Restorei, .-_ZL12TCU01Restorei
	.section	.text._ZL10TCU01Powerv,"ax",@progbits
	.align	2
	.type	_ZL10TCU01Powerv, @function
_ZL10TCU01Powerv:
.LFB43:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	.cfi_offset 9, -12
	li	s1,65536
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	a1,s1,-1
	lla	s0,_ZL5latch
	lla	a2,_Z6CartBRj
	li	a0,32768
	sb	zero,0(s0)
	call	_Z14SetReadHandleriiPFhjE
	li	a0,16384
	addi	a1,s1,-1
	lla	a2,_ZL10TCU01Writejh
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lbu	a5,0(s0)
	li	a0,32768
	srli	a1,a5,6
	srli	a5,a5,2
	andi	a5,a5,1
	andi	a1,a1,2
	or	a1,a1,a5
	call	_Z8setprg32jj
	lbu	a0,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	srli	a0,a0,3
	andi	a0,a0,15
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
	.cfi_endproc
.LFE43:
	.size	_ZL10TCU01Powerv, .-_ZL10TCU01Powerv
	.section	.text._ZL16S74LS374NRestorei,"ax",@progbits
	.align	2
	.type	_ZL16S74LS374NRestorei, @function
_ZL16S74LS374NRestorei:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL5latch
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL13S74LS374MSynch
	.cfi_endproc
.LFE12:
	.size	_ZL16S74LS374NRestorei, .-_ZL16S74LS374NRestorei
	.section	.text._ZL14S74LS374NResetv,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NResetv, @function
_ZL14S74LS374NResetv:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a4,_ZL3dip
	lbu	a5,0(a4)
	lla	s0,_ZL5latch
	li	a1,0
	xori	a5,a5,1
	li	a0,32768
	sb	a5,0(a4)
	sb	zero,4(s0)
	sw	zero,0(s0)
	call	_Z8setprg32jj
	lbu	a5,1(s0)
	lbu	a4,3(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL13S74LS374MSynch
	.cfi_endproc
.LFE11:
	.size	_ZL14S74LS374NResetv, .-_ZL14S74LS374NResetv
	.section	.text._ZL14S74LS374NPowerv,"ax",@progbits
	.align	2
	.type	_ZL14S74LS374NPowerv, @function
_ZL14S74LS374NPowerv:
.LFB10:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a1,0
	lla	s0,_ZL5latch
	li	a0,32768
	la a5, _ZL3dip; sb zero, 0(a5);
	sb	zero,4(s0)
	sw	zero,0(s0)
	call	_Z8setprg32jj
	lbu	a4,3(s0)
	lbu	a5,1(s0)
	lbu	a0,4(s0)
	or	a5,a5,a4
	or	a0,a5,a0
	call	_Z7setchr8j
	lbu	a0,2(s0)
	call	_ZL13S74LS374MSynch
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL14S74LS374NWritejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL13S74LS374NReadj
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE10:
	.size	_ZL14S74LS374NPowerv, .-_ZL14S74LS374NPowerv
	.section	.rodata._Z14S74LS374N_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"LATC"
	.align	2
.LC1:
	.string	"CMD"
	.align	2
.LC2:
	.string	"DIP"
	.section	.text._Z14S74LS374N_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14S74LS374N_InitP8CartInfo
	.hidden	_Z14S74LS374N_InitP8CartInfo
	.type	_Z14S74LS374N_InitP8CartInfo, @function
_Z14S74LS374N_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL14S74LS374NPowerv
	sw	a5,0(a0)
	lla	a5,_ZL14S74LS374NResetv
	sw	a5,4(a0)
	lla	a3,.LC0
	lla	a5,_ZL16S74LS374NRestorei
	li	a2,0
	li	a1,5
	lla	a0,_ZL5latch
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,_ZL3dip
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z14S74LS374N_InitP8CartInfo, .-_Z14S74LS374N_InitP8CartInfo
	.section	.text._Z15S74LS374NA_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z15S74LS374NA_InitP8CartInfo
	.hidden	_Z15S74LS374NA_InitP8CartInfo
	.type	_Z15S74LS374NA_InitP8CartInfo, @function
_Z15S74LS374NA_InitP8CartInfo:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL15S74LS374NAPowerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,5
	lla	a0,_ZL5latch
	lla	a5,_ZL16S74LS374NRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE17:
	.size	_Z15S74LS374NA_InitP8CartInfo, .-_Z15S74LS374NA_InitP8CartInfo
	.section	.text._Z11S8259A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259A_InitP8CartInfo
	.hidden	_Z11S8259A_InitP8CartInfo
	.type	_Z11S8259A_InitP8CartInfo, @function
_Z11S8259A_InitP8CartInfo:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,_ZL5latch
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4type; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	_Z11S8259A_InitP8CartInfo, .-_Z11S8259A_InitP8CartInfo
	.section	.text._Z11S8259B_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259B_InitP8CartInfo
	.hidden	_Z11S8259B_InitP8CartInfo
	.type	_Z11S8259B_InitP8CartInfo, @function
_Z11S8259B_InitP8CartInfo:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,_ZL5latch
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	li	a5,1
	la a4, _ZL4type; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	_Z11S8259B_InitP8CartInfo, .-_Z11S8259B_InitP8CartInfo
	.section	.text._Z11S8259C_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259C_InitP8CartInfo
	.hidden	_Z11S8259C_InitP8CartInfo
	.type	_Z11S8259C_InitP8CartInfo, @function
_Z11S8259C_InitP8CartInfo:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,_ZL5latch
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	li	a5,2
	la a4, _ZL4type; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	_Z11S8259C_InitP8CartInfo, .-_Z11S8259C_InitP8CartInfo
	.section	.text._Z11S8259D_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11S8259D_InitP8CartInfo
	.hidden	_Z11S8259D_InitP8CartInfo
	.type	_Z11S8259D_InitP8CartInfo, @function
_Z11S8259D_InitP8CartInfo:
.LFB25:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL10S8259Resetv
	sw	a5,0(a0)
	lla	a3,.LC0
	lla	a5,_ZL12S8259Restorei
	li	a2,0
	li	a1,8
	lla	a0,_ZL5latch
	la a4, GameStateRestore; sw a5, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL3cmd
	call	_Z10AddExStatePvjiPKc
	lw	ra,8(sp)
	.cfi_restore 1
	li	a5,3
	la a4, _ZL4type; sw a5, 0(a4);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	_Z11S8259D_InitP8CartInfo, .-_Z11S8259D_InitP8CartInfo
	.section	.text._Z12SA0161M_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA0161M_InitP8CartInfo
	.hidden	_Z12SA0161M_InitP8CartInfo
	.type	_Z12SA0161M_InitP8CartInfo, @function
_Z12SA0161M_InitP8CartInfo:
.LFB35:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA0161MSyncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE35:
	.size	_Z12SA0161M_InitP8CartInfo, .-_Z12SA0161M_InitP8CartInfo
	.section	.text._Z12SA72007_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA72007_InitP8CartInfo
	.hidden	_Z12SA72007_InitP8CartInfo
	.type	_Z12SA72007_InitP8CartInfo, @function
_Z12SA72007_InitP8CartInfo:
.LFB36:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72007Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE36:
	.size	_Z12SA72007_InitP8CartInfo, .-_Z12SA72007_InitP8CartInfo
	.section	.text._Z12SA72008_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12SA72008_InitP8CartInfo
	.hidden	_Z12SA72008_InitP8CartInfo
	.type	_Z12SA72008_InitP8CartInfo, @function
_Z12SA72008_InitP8CartInfo:
.LFB37:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72008Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE37:
	.size	_Z12SA72008_InitP8CartInfo, .-_Z12SA72008_InitP8CartInfo
	.section	.text._Z10SA009_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10SA009_InitP8CartInfo
	.hidden	_Z10SA009_InitP8CartInfo
	.type	_Z10SA009_InitP8CartInfo, @function
_Z10SA009_InitP8CartInfo:
.LFB38:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL7SAPowerv
	sw	a5,0(a0)
	lla	a5,_ZL10SA009Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE38:
	.size	_Z10SA009_InitP8CartInfo, .-_Z10SA009_InitP8CartInfo
	.section	.text._Z11SA0036_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SA0036_InitP8CartInfo
	.hidden	_Z11SA0036_InitP8CartInfo
	.type	_Z11SA0036_InitP8CartInfo, @function
_Z11SA0036_InitP8CartInfo:
.LFB39:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL8SADPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA72007Syncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE39:
	.size	_Z11SA0036_InitP8CartInfo, .-_Z11SA0036_InitP8CartInfo
	.section	.text._Z11SA0037_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11SA0037_InitP8CartInfo
	.hidden	_Z11SA0037_InitP8CartInfo
	.type	_Z11SA0037_InitP8CartInfo, @function
_Z11SA0037_InitP8CartInfo:
.LFB40:
	.cfi_startproc
	lla	a5,_ZL9SARestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL8SADPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12SA0161MSyncov
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	la a4, _ZL5WSync; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE40:
	.size	_Z11SA0037_InitP8CartInfo, .-_Z11SA0037_InitP8CartInfo
	.section	.text._Z10TCU01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCU01_InitP8CartInfo
	.hidden	_Z10TCU01_InitP8CartInfo
	.type	_Z10TCU01_InitP8CartInfo, @function
_Z10TCU01_InitP8CartInfo:
.LFB45:
	.cfi_startproc
	lla	a5,_ZL12TCU01Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10TCU01Powerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE45:
	.size	_Z10TCU01_InitP8CartInfo, .-_Z10TCU01_InitP8CartInfo
	.section	.text._Z10TCU02_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCU02_InitP8CartInfo
	.hidden	_Z10TCU02_InitP8CartInfo
	.type	_Z10TCU02_InitP8CartInfo, @function
_Z10TCU02_InitP8CartInfo:
.LFB51:
	.cfi_startproc
	lla	a5,_ZL12TCU02Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10TCU02Powerv
	sw	a5,0(a0)
	lla	a3,.LC0
	li	a2,0
	li	a1,1
	lla	a0,_ZL5latch
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE51:
	.size	_Z10TCU02_InitP8CartInfo, .-_Z10TCU02_InitP8CartInfo
	.section	.text._Z10TCA01_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TCA01_InitP8CartInfo
	.hidden	_Z10TCA01_InitP8CartInfo
	.type	_Z10TCA01_InitP8CartInfo, @function
_Z10TCA01_InitP8CartInfo:
.LFB54:
	.cfi_startproc
	lla	a5,_ZL10TCA01Powerv
	sw	a5,0(a0)
	ret
	.cfi_endproc
.LFE54:
	.size	_Z10TCA01_InitP8CartInfo, .-_Z10TCA01_InitP8CartInfo
	.section	.sbss._ZL5WSync,"aw",@nobits
	.align	2
	.type	_ZL5WSync, @object
	.size	_ZL5WSync, 4
_ZL5WSync:
	.zero	4
	.section	.sbss._ZL4type,"aw",@nobits
	.align	2
	.type	_ZL4type, @object
	.size	_ZL4type, 4
_ZL4type:
	.zero	4
	.section	.sbss._ZL5latch,"aw",@nobits
	.align	2
	.type	_ZL5latch, @object
	.size	_ZL5latch, 8
_ZL5latch:
	.zero	8
	.section	.sbss._ZL3dip,"aw",@nobits
	.type	_ZL3dip, @object
	.size	_ZL3dip, 1
_ZL3dip:
	.zero	1
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
