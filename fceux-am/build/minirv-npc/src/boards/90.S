#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"90.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL11M90TekWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90TekWritejh, @function
_ZL11M90TekWritejh:
.LFB9:
	.cfi_startproc
	li	a4,24576
	addi	a4,a4,-1021
	li	a5,24576
	and	a0,a0,a4
	addi	a5,a5,-2047
	beq	a0,a5,.L2
	li	a5,24576
	addi	a5,a5,-2045
	beq	a0,a5,.L3
	li	a5,24576
	addi	a5,a5,-2048
	bne	a0,a5,.L1
	la a5, _ZL3mul; sb a1, 0(a5);
	ret
.L3:
	la a5, _ZL5regie; sb a1, 0(a5);
.L1:
	ret
.L2:
	la a5, _ZL3mul+1; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL11M90TekWritejh, .-_ZL11M90TekWritejh
	.section	.text._ZL13M90DummyWritejh,"ax",@progbits
	.align	2
	.type	_ZL13M90DummyWritejh, @function
_ZL13M90DummyWritejh:
.LFB17:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE17:
	.size	_ZL13M90DummyWritejh, .-_ZL13M90DummyWritejh
	.section	.text._ZL7tekpromv,"ax",@progbits
	.align	2
	.type	_ZL7tekpromv, @function
_ZL7tekpromv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL5tkcom
	lbu	a3,0(s1)
	lla	a2,.L10
	lbu	a4,3(s1)
	andi	a5,a3,7
	slli	a5,a5,2
	add	a5,a5,a2
	lw	a5,0(a5)
	slli	s0,a4,5
	slli	a3,a3,24
	add	a5,a5,a2
	andi	s0,s0,192
	srai	a3,a3,24
	jr	a5
	.section	.rodata._ZL7tekpromv,"a",@progbits
	.align	2
	.align	2
.L10:
	.word	.L8-.L10
	.word	.L14-.L10
	.word	.L13-.L10
	.word	.L13-.L10
	.word	.L12-.L10
	.word	.L11-.L10
	.word	.L9-.L10
	.word	.L9-.L10
	.section	.text._ZL7tekpromv
.L9:
	lla	a5,_ZL4prgb
	blt	a3,zero,.L30
.L20:
	lbu	a1,0(a5)
	li	a0,32768
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,40960
	lbu	a1,1(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,49152
	lbu	a1,2(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lbu	a1,3(a5)
	li	a0,57344
	andi	a1,a1,63
	or	a1,a1,s0
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L13:
	.cfi_restore_state
	lla	a5,_ZL4prgb
	blt	a3,zero,.L31
.L17:
	lbu	a1,0(a5)
	li	a0,32768
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,40960
	lbu	a1,1(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	li	a0,49152
	lbu	a1,2(a5)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	ori	a1,s0,63
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L11:
	.cfi_restore_state
	lla	a5,_ZL4prgb
	blt	a3,zero,.L32
.L19:
	lbu	a1,1(a5)
	slli	a4,a4,4
	andi	a4,a4,96
	andi	a1,a1,31
	or	a1,a1,a4
	li	a0,32768
	sw	a5,0(sp)
	call	_Z8setprg16jj
	lw	a5,0(sp)
	lbu	a1,3(s1)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lbu	a4,3(a5)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a5,a1,4
	andi	a5,a5,96
	andi	a1,a4,31
	li	a0,49152
	or	a1,a5,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L14:
	.cfi_restore_state
	lla	a5,_ZL4prgb
	blt	a3,zero,.L33
.L16:
	lbu	a1,1(a5)
	slli	a4,a4,4
	andi	a4,a4,96
	andi	a1,a1,31
	or	a1,a1,a4
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,3(s1)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a1,a1,4
	andi	a1,a1,96
	li	a0,49152
	ori	a1,a1,31
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L12:
	.cfi_restore_state
	lla	a5,_ZL4prgb
	blt	a3,zero,.L34
.L18:
	lbu	a1,3(a5)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a4,a4,3
	andi	a4,a4,48
	andi	a1,a1,15
	or	a1,a1,a4
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L8:
	.cfi_restore_state
	blt	a3,zero,.L35
.L15:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a1,a4,3
	andi	a1,a1,48
	ori	a1,a1,15
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L30:
	.cfi_restore_state
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L20
.L35:
	la a1, _ZL4prgb+3; lbu a1, 0(a1);
	slli	a1,a1,2
	addi	a1,a1,3
	andi	a1,a1,63
	or	a1,a1,s0
	li	a0,24576
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	j	.L15
.L34:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,2
	addi	a1,a1,3
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L18
.L33:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,1
	addi	a1,a1,1
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L16
.L32:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	slli	a1,a1,1
	addi	a1,a1,1
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lbu	a4,3(s1)
	lw	a5,0(sp)
	j	.L19
.L31:
	lbu	a1,3(a5)
	li	a0,24576
	sw	a5,0(sp)
	andi	a1,a1,63
	or	a1,a1,s0
	call	_Z7setprg8jj
	lw	a5,0(sp)
	j	.L17
	.cfi_endproc
.LFE7:
	.size	_ZL7tekpromv, .-_ZL7tekpromv
	.section	.text._ZL11M90PRGWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90PRGWritejh, @function
_ZL11M90PRGWritejh:
.LFB11:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL4prgb
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekpromv
	.cfi_endproc
.LFE11:
	.size	_ZL11M90PRGWritejh, .-_ZL11M90PRGWritejh
	.section	.text._ZL7tekvromv,"ax",@progbits
	.align	2
	.type	_ZL7tekvromv, @function
_ZL7tekvromv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	ra,20(sp)
	sw	s0,16(sp)
	lla	a5,_ZL5tkcom
	lbu	a4,3(a5)
	lbu	a5,0(a5)
	andi	a3,a4,32
	andi	a5,a5,24
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	bne	a3,zero,.L38
	srli	a0,a4,2
	andi	a0,a0,6
	andi	a4,a4,1
	li	a3,16
	or	a0,a0,a4
	beq	a5,a3,.L39
	bgtu	a5,a3,.L40
	beq	a5,zero,.L61
	sw	s1,12(sp)
	slli	s0,a0,6
	.cfi_offset 9, -12
	li	s1,63
	j	.L46
.L38:
	.cfi_restore 9
	li	a4,16
	beq	a5,a4,.L53
	bgtu	a5,a4,.L49
	beq	a5,zero,.L54
	sw	s1,12(sp)
	.cfi_offset 9, -12
	li	s1,65536
	addi	s1,s1,-1
	li	s0,0
.L46:
	lla	a3,_ZL3chr
	lbu	a2,0(a3)
	lla	a4,_ZL7chrhigh
	lla	a5,_ZL6chrlow
	add	a1,a4,a2
	lbu	a1,0(a1)
	add	a2,a5,a2
	lbu	a2,0(a2)
	slli	a1,a1,8
	li	a0,0
	or	a1,a1,a2
	and	a1,a1,s1
	or	a1,a1,s0
	call	_Z7setchr4jj
	lla	a3,_ZL3chr
	lbu	a3,1(a3)
	lla	a4,_ZL7chrhigh
	lla	a5,_ZL6chrlow
	add	a4,a4,a3
	lbu	a1,0(a4)
	add	a5,a5,a3
	lbu	a5,0(a5)
	slli	a1,a1,8
	lw	ra,20(sp)
	.cfi_restore 1
	or	a1,a1,a5
	and	a1,a1,s1
	or	a1,a1,s0
	lw	s0,16(sp)
	.cfi_restore 8
	lw	s1,12(sp)
	.cfi_restore 9
	li	a0,4096
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
.L39:
	.cfi_def_cfa_offset 24
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	slli	a5,a0,7
	mv	s0,a5
	li	a5,127
	sw	s1,12(sp)
	sw	a5,8(sp)
	.cfi_offset 9, -12
.L47:
	lla	a4,_ZL6chrlow
	li	a5,0
	lla	s1,_ZL7chrhigh
	sw	a4,0(sp)
.L51:
	add	a4,s1,a5
	lbu	a1,0(a4)
	lw	a4,0(sp)
	slli	a0,a5,10
	sw	a5,4(sp)
	add	a4,a4,a5
	lbu	a4,0(a4)
	lw	a5,8(sp)
	slli	a1,a1,8
	or	a1,a1,a4
	and	a1,a1,a5
	or	a1,a1,s0
	call	_Z7setchr2jj
	lw	a5,4(sp)
	li	a4,8
	addi	a5,a5,2
	bne	a5,a4,.L51
.L60:
	lw	s1,12(sp)
	.cfi_restore 9
.L37:
	lw	ra,20(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
.L61:
	.cfi_restore_state
	slli	a0,a0,5
	li	a4,31
.L45:
	la a5, _ZL7chrhigh; lbu a5, 0(a5);
	lw	s0,16(sp)
	.cfi_remember_state
	.cfi_restore 8
	la a3, _ZL6chrlow; lbu a3, 0(a3);
	slli	a5,a5,8
	lw	ra,20(sp)
	.cfi_restore 1
	or	a5,a5,a3
	and	a5,a5,a4
	or	a0,a5,a0
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	_Z7setchr8j
.L54:
	.cfi_restore_state
	li	a4,65536
	addi	a4,a4,-1
	li	a0,0
	j	.L45
.L40:
	slli	a3,a0,8
	sw	a3,4(sp)
	li	a3,255
	li	a4,24
	sw	a3,8(sp)
	bne	a5,a4,.L37
	sw	s1,12(sp)
	.cfi_offset 9, -12
.L48:
	lla	a5,_ZL6chrlow
	li	s0,0
	lla	s1,_ZL7chrhigh
	sw	a5,0(sp)
.L50:
	lw	a5,0(sp)
	add	a4,s1,s0
	lbu	a1,0(a4)
	add	a4,a5,s0
	lbu	a4,0(a4)
	lw	a5,8(sp)
	slli	a1,a1,8
	or	a1,a1,a4
	and	a1,a1,a5
	lw	a5,4(sp)
	slli	a0,s0,10
	addi	s0,s0,1
	or	a1,a1,a5
	call	_Z7setchr1jj
	li	a5,8
	bne	s0,a5,.L50
	j	.L60
.L49:
	.cfi_restore 9
	li	a4,24
	bne	a5,a4,.L37
	li	a5,65536
	addi	a5,a5,-1
	sw	s1,12(sp)
	sw	a5,8(sp)
	sw	zero,4(sp)
	.cfi_remember_state
	.cfi_offset 9, -12
	j	.L48
.L53:
	.cfi_restore_state
	li	a5,65536
	addi	a5,a5,-1
	sw	s1,12(sp)
	.cfi_offset 9, -12
	sw	a5,8(sp)
	li	s0,0
	j	.L47
	.cfi_endproc
.LFE8:
	.size	_ZL7tekvromv, .-_ZL7tekvromv
	.section	.text._ZL13M90CHRhiWritejh,"ax",@progbits
	.align	2
	.type	_ZL13M90CHRhiWritejh, @function
_ZL13M90CHRhiWritejh:
.LFB13:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL7chrhigh
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekvromv
	.cfi_endproc
.LFE13:
	.size	_ZL13M90CHRhiWritejh, .-_ZL13M90CHRhiWritejh
	.section	.text._ZL14M90CHRlowWritejh,"ax",@progbits
	.align	2
	.type	_ZL14M90CHRlowWritejh, @function
_ZL14M90CHRlowWritejh:
.LFB12:
	.cfi_startproc
	andi	a0,a0,7
	lla	a5,_ZL6chrlow
	add	a5,a5,a0
	sb	a1,0(a5)
	tail	_ZL7tekvromv
	.cfi_endproc
.LFE12:
	.size	_ZL14M90CHRlowWritejh, .-_ZL14M90CHRlowWritejh
	.section	.text._ZL4mirav,"ax",@progbits
	.align	2
	.type	_ZL4mirav, @function
_ZL4mirav:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL5tkcom
	lbu	a5,0(s0)
	andi	a4,a5,32
	beq	a4,zero,.L65
	la a4, _ZL5is209; lw a4, 0(a4);
	beq	a4,zero,.L65
.L66:
	sw	s1,4(sp)
	.cfi_offset 9, -12
	andi	a5,a5,64
	bne	a5,zero,.L86
	lla	a3,_ZL5names
	li	s1,0
.L73:
	lhu	a4,0(a3)
	lbu	a5,1(s0)
	lla	t0,NTARAM
	slli	a0,a4,10
	xor	a5,a5,a4
	andi	a0,a0,1024
	andi	a5,a5,128
	sw	a3,0(sp)
	mv	a2,s1
	li	a1,1
	add	a0,t0,a0
	beq	a5,zero,.L84
	lla	a5,CHRptr
	lw	a0,0(a5)
	la a5, CHRmask1; lw a5, 0(a5);
	and	a4,a4,a5
	slli	a4,a4,10
	li	a1,0
	add	a0,a0,a4
.L84:
	call	_Z9setntamemPhij
	lw	a3,0(sp)
	addi	s1,s1,1
	li	a5,4
	addi	a3,a3,2
	bne	s1,a5,.L73
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L65:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL5is211; lw a4, 0(a4);
	bne	a4,zero,.L66
	lbu	a5,1(s0)
	li	a4,2
	li	a0,2
	andi	a5,a5,3
	beq	a5,a4,.L85
	li	a4,3
	li	a0,3
	beq	a5,a4,.L85
	li	a4,1
	li	a0,1
	bne	a5,a4,.L85
	li	a0,0
.L85:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L86:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a4,_ZL5names
	li	s1,0
	lla	t1,CHRptr
	lla	s0,CHRmask1
.L69:
	lhu	a5,0(a4)
	lw	a1,0(s0)
	lw	a0,0(t1)
	mv	a2,s1
	and	a5,a5,a1
	slli	a5,a5,10
	add	a0,a0,a5
	li	a1,0
	sw	a4,0(sp)
	call	_Z9setntamemPhij
	lw	a4,0(sp)
	addi	s1,s1,1
	li	a5,4
	addi	a4,a4,2
	lla	t1,CHRptr
	bne	s1,a5,.L69
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
.LFE6:
	.size	_ZL4mirav, .-_ZL4mirav
	.section	.text._ZL10M90Restorei,"ax",@progbits
	.align	2
	.type	_ZL10M90Restorei, @function
_ZL10M90Restorei:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_ZL7tekpromv
	call	_ZL7tekvromv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4mirav
	.cfi_endproc
.LFE24:
	.size	_ZL10M90Restorei, .-_ZL10M90Restorei
	.section	.text._ZL12M90ModeWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M90ModeWritejh, @function
_ZL12M90ModeWritejh:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	andi	a0,a0,3
	lla	a5,_ZL5tkcom
	sw	ra,8(sp)
	.cfi_offset 1, -4
	add	a5,a5,a0
	sb	a1,0(a5)
	call	_ZL7tekpromv
	call	_ZL7tekvromv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL4mirav
	.cfi_endproc
.LFE16:
	.size	_ZL12M90ModeWritejh, .-_ZL12M90ModeWritejh
	.section	.text._ZL10M90NTWritejh,"ax",@progbits
	.align	2
	.type	_ZL10M90NTWritejh, @function
_ZL10M90NTWritejh:
.LFB14:
	.cfi_startproc
	andi	a4,a0,3
	lla	a5,_ZL5names
	slli	a4,a4,1
	add	a3,a5,a4
	andi	a0,a0,4
	lhu	a3,0(a3)
	beq	a0,zero,.L92
	andi	a3,a3,255
	slli	a1,a1,8
	or	a1,a3,a1
	add	a5,a5,a4
	sh	a1,0(a5)
	tail	_ZL4mirav
.L92:
	andi	a3,a3,-256
	or	a1,a1,a3
	add	a5,a5,a4
	sh	a1,0(a5)
	tail	_ZL4mirav
	.cfi_endproc
.LFE14:
	.size	_ZL10M90NTWritejh, .-_ZL10M90NTWritejh
	.section	.text._ZL8M90Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M90Powerv, @function
_ZL8M90Powerv:
.LFB25:
	.cfi_startproc
	li	a1,24576
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a2,_ZL11M90TekWritejh
	addi	a1,a1,-1
	li	a0,20480
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,36864
	lla	a2,_ZL11M90PRGWritejh
	addi	a1,a1,-16
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL14M90CHRlowWritejh
	addi	a1,a1,-1
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,45056
	lla	a2,_ZL13M90CHRhiWritejh
	addi	a1,a1,-1
	li	a0,40960
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,49152
	lla	a2,_ZL10M90NTWritejh
	addi	a1,a1,-1
	li	a0,45056
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,53248
	lla	a2,_ZL11M90IRQWritejh
	addi	a1,a1,-1
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,53248
	lla	a2,_ZL12M90ModeWritejh
	addi	a1,a1,1535
	li	a0,53248
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL13M90DummyWritejh
	li	a0,57344
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	lla	a2,_ZL10M90TekReadj
	addi	a1,a1,-1
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a5,-1
	li	a2,4
	li	a1,0
	lla	a0,_ZL5tkcom
	la a4, _ZL5regie; sb a5, 0(a4);
	la a4, _ZL3mul; sh a5, 0(a4);
	call	memset
	li	a2,4
	li	a1,255
	lla	a0,_ZL4prgb
	call	memset
	li	a2,8
	li	a1,255
	lla	a0,_ZL6chrlow
	call	memset
	li	a2,8
	li	a1,255
	lla	a0,_ZL7chrhigh
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,_ZL5names
	call	memset
	la a5, _ZL5is211; lw a5, 0(a5);
	seqz	a5,a5
	neg	a5,a5
	andi	a5,a5,-192
	addi	a5,a5,192
	la a4, _ZL6tekker; sb a5, 0(a4);
	call	_ZL7tekpromv
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7tekvromv
	.cfi_endproc
.LFE25:
	.size	_ZL8M90Powerv, .-_ZL8M90Powerv
	.section	.text._ZL11M90IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M90IRQWritejh, @function
_ZL11M90IRQWritejh:
.LFB15:
	.cfi_startproc
	andi	a0,a0,7
	lla	a4,.L101
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL11M90IRQWritejh,"a",@progbits
	.align	2
	.align	2
.L101:
	.word	.L99-.L101
	.word	.L107-.L101
	.word	.L106-.L101
	.word	.L105-.L101
	.word	.L104-.L101
	.word	.L103-.L101
	.word	.L102-.L101
	.word	.L100-.L101
	.section	.text._ZL11M90IRQWritejh
.L100:
	la a5, _ZL10IRQPreSize; sb a1, 0(a5);
.L98:
	ret
.L107:
	la a5, _ZL7IRQMode; sb a1, 0(a5);
	ret
.L106:
	li	a0,1
	la a5, _ZL4IRQa; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L105:
	li	a5,1
	la a4, _ZL4IRQa; sb a5, 0(a4);
	ret
.L104:
	la a5, _ZL6IRQXOR; lbu a5, 0(a5);
	xor	a1,a1,a5
	la a5, _ZL6IRQPre; sb a1, 0(a5);
	ret
.L103:
	la a5, _ZL6IRQXOR; lbu a5, 0(a5);
	xor	a1,a1,a5
	la a5, _ZL8IRQCount; sb a1, 0(a5);
	ret
.L102:
	la a5, _ZL6IRQXOR; sb a1, 0(a5);
	ret
.L99:
	andi	a1,a1,1
	la a5, _ZL4IRQa; sb a1, 0(a5);
	bne	a1,zero,.L98
	li	a0,1
	tail	_Z12X6502_IRQEndi
	.cfi_endproc
.LFE15:
	.size	_ZL11M90IRQWritejh, .-_ZL11M90IRQWritejh
	.section	.rodata._ZL7toggliev.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"tekker=%02x\n"
	.section	.text._ZL7toggliev,"ax",@progbits
	.align	2
	.type	_ZL7toggliev, @function
_ZL7toggliev:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL6tekker
	lbu	a1,0(a5)
	lla	a0,.LC0
	addi	a1,a1,64
	andi	a1,a1,192
	sb	a1,0(a5)
	call	printf
	li	a2,4
	li	a1,0
	lla	a0,_ZL5tkcom
	call	memset
	li	a2,4
	li	a1,255
	lla	a0,_ZL4prgb
	call	memset
	call	_ZL7tekpromv
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL7tekvromv
	.cfi_endproc
.LFE23:
	.size	_ZL7toggliev, .-_ZL7toggliev
	.globl	__mulsi3
	.section	.text._ZL10M90TekReadj,"ax",@progbits
	.align	2
	.type	_ZL10M90TekReadj, @function
_ZL10M90TekReadj:
.LFB10:
	.cfi_startproc
	li	a4,24576
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	addi	a4,a4,-1021
	li	a5,24576
	sw	ra,8(sp)
	.cfi_offset 1, -4
	and	a0,a0,a4
	addi	a5,a5,-2047
	beq	a0,a5,.L112
	li	a5,24576
	addi	a5,a5,-2045
	beq	a0,a5,.L113
	li	a5,24576
	addi	a5,a5,-2048
	bne	a0,a5,.L114
	lla	a5,_ZL3mul
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a0,a0,0xff
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L113:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a0, _ZL5regie; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L112:
	.cfi_restore_state
	lla	a5,_ZL3mul
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	srai	a0,a0,8
	andi	a0,a0,0xff
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L114:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, _ZL6tekker; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL10M90TekReadj, .-_ZL10M90TekReadj
	.section	.text._ZL3CCLv,"ax",@progbits
	.align	2
	.type	_ZL3CCLv, @function
_ZL3CCLv:
.LFB18:
	.cfi_startproc
	la a5, _ZL7IRQMode; lbu a5, 0(a5);
	srli	a5,a5,6
	li	a4,1
	beq	a5,a4,.L127
	li	a4,2
	beq	a5,a4,.L128
.L117:
	ret
.L128:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	li	a3,255
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,a3,.L117
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L117
.L129:
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L127:
	lla	a4,_ZL8IRQCount
	lbu	a5,0(a4)
	addi	a5,a5,1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L117
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L117
	j	.L129
	.cfi_endproc
.LFE18:
	.size	_ZL3CCLv, .-_ZL3CCLv
	.section	.text._ZL12ClockCounterv,"ax",@progbits
	.align	2
	.type	_ZL12ClockCounterv, @function
_ZL12ClockCounterv:
.LFB19:
	.cfi_startproc
	la a4, _ZL7IRQMode; lbu a4, 0(a4);
	andi	a5,a4,4
	seqz	a5,a5
	neg	a5,a5
	andi	a5,a5,248
	srli	a4,a4,6
	li	a3,1
	addi	a5,a5,7
	beq	a4,a3,.L141
	li	a3,2
	beq	a4,a3,.L142
.L130:
	ret
.L142:
	lla	a3,_ZL6IRQPre
	lbu	a4,0(a3)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	bne	a4,a5,.L130
.L133:
	tail	_ZL3CCLv
.L141:
	lla	a3,_ZL6IRQPre
	lbu	a4,0(a3)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	beq	a4,zero,.L133
	ret
	.cfi_endproc
.LFE19:
	.size	_ZL12ClockCounterv, .-_ZL12ClockCounterv
	.section	.text._ZL6M90PPUj,"ax",@progbits
	.align	2
	.type	_ZL6M90PPUj, @function
_ZL6M90PPUj:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL7IRQMode; lbu a5, 0(a5);
	sw	ra,12(sp)
	andi	a5,a5,3
	li	a4,2
	.cfi_offset 1, -4
	beq	a5,a4,.L152
.L144:
	la a5, _ZL5is209; lw a5, 0(a5);
	beq	a5,zero,.L146
	srli	a5,a0,8
	andi	a4,a5,0xff
	li	a3,31
	bgtu	a4,a3,.L143
	andi	a5,a5,15
	li	a3,15
	beq	a5,a3,.L153
.L143:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L146:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,1024
	la a4, _ZL3chr; sh a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L152:
	.cfi_restore_state
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL8lastread
	lw	a5,0(s1)
	bne	a5,a0,.L154
	sw	a0,0(s1)
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L144
.L154:
	.cfi_offset 9, -12
	sw	a0,0(sp)
	call	_ZL12ClockCounterv
	call	_ZL12ClockCounterv
	lw	a0,0(sp)
	sw	a0,0(s1)
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L144
.L153:
	sw	s0,8(sp)
	.cfi_offset 8, -8
	li	a5,208
	andi	s0,a0,240
	beq	s0,a5,.L155
	li	a5,224
	beq	s0,a5,.L156
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	j	.L143
.L155:
	.cfi_restore_state
	srli	a3,a4,4
	lla	a5,_ZL3chr
	srli	a4,a4,2
	add	a5,a5,a3
	andi	a4,a4,4
	sb	a4,0(a5)
.L151:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7tekvromv
.L156:
	.cfi_restore_state
	srli	a5,a4,2
	andi	a5,a5,4
	srli	a4,a4,4
	lla	a3,_ZL3chr
	add	a4,a3,a4
	ori	a5,a5,2
	sb	a5,0(a4)
	j	.L151
	.cfi_endproc
.LFE22:
	.size	_ZL6M90PPUj, .-_ZL6M90PPUj
	.section	.text._Z7CPUWrapi,"ax",@progbits
	.align	2
	.globl	_Z7CPUWrapi
	.hidden	_Z7CPUWrapi
	.type	_Z7CPUWrapi, @function
_Z7CPUWrapi:
.LFB20:
	.cfi_startproc
	lla	a3,_ZL7IRQMode
	lbu	a4,0(a3)
	andi	a5,a4,3
	bne	a5,zero,.L170
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a0
	ble	a0,zero,.L157
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	a2,_ZL6IRQPre
	li	s0,0
	j	.L164
.L160:
	beq	a4,a0,.L174
.L162:
	addi	s0,s0,1
	beq	s1,s0,.L173
.L175:
	lbu	a4,0(a3)
.L164:
	andi	a5,a4,4
	seqz	a5,a5
	neg	a5,a5
	andi	a5,a5,248
	srli	a4,a4,6
	li	a1,1
	li	a0,2
	addi	a5,a5,7
	bne	a4,a1,.L160
	lbu	a4,0(a2)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	and	a4,a4,a5
	bne	a4,zero,.L162
.L161:
	call	_ZL3CCLv
	addi	s0,s0,1
	lla	a3,_ZL7IRQMode
	lla	a2,_ZL6IRQPre
	bne	s1,s0,.L175
.L173:
	lw	s0,4(sp)
	.cfi_restore 8
.L157:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L170:
	ret
.L174:
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lbu	a4,0(a2)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	and	a4,a5,a4
	bne	a5,a4,.L162
	j	.L161
	.cfi_endproc
.LFE20:
	.size	_Z7CPUWrapi, .-_Z7CPUWrapi
	.section	.text._ZL6SLWrapv,"ax",@progbits
	.align	2
	.type	_ZL6SLWrapv, @function
_ZL6SLWrapv:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,_ZL7IRQMode
	lbu	a4,0(s1)
	li	a5,1
	andi	a3,a4,3
	beq	a3,a5,.L193
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L193:
	.cfi_restore_state
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	a3,_ZL6IRQPre
	li	s0,8
	j	.L183
.L179:
	beq	a4,a1,.L194
.L181:
	addi	s0,s0,-1
	beq	s0,zero,.L192
.L195:
	lbu	a4,0(s1)
.L183:
	andi	a5,a4,4
	seqz	a5,a5
	neg	a5,a5
	andi	a5,a5,248
	srli	a4,a4,6
	li	a2,1
	li	a1,2
	addi	a5,a5,7
	bne	a4,a2,.L179
	lbu	a4,0(a3)
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a4,a5
	bne	a4,zero,.L181
.L180:
	call	_ZL3CCLv
	addi	s0,s0,-1
	lla	a3,_ZL6IRQPre
	bne	s0,zero,.L195
.L192:
	lw	s0,4(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L194:
	.cfi_restore_state
	lbu	a4,0(a3)
	addi	a4,a4,-1
	andi	a4,a4,0xff
	sb	a4,0(a3)
	and	a4,a5,a4
	bne	a5,a4,.L181
	j	.L180
	.cfi_endproc
.LFE21:
	.size	_ZL6SLWrapv, .-_ZL6SLWrapv
	.section	.text._Z13Mapper90_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper90_InitP8CartInfo
	.hidden	_Z13Mapper90_InitP8CartInfo
	.type	_Z13Mapper90_InitP8CartInfo, @function
_Z13Mapper90_InitP8CartInfo:
.LFB26:
	.cfi_startproc
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	la a5, _ZL5is211; sw zero, 0(a5);
	la a5, _ZL5is209; sw zero, 0(a5);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL13Tek_StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE26:
	.size	_Z13Mapper90_InitP8CartInfo, .-_Z13Mapper90_InitP8CartInfo
	.section	.text._Z14Mapper209_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper209_InitP8CartInfo
	.hidden	_Z14Mapper209_InitP8CartInfo
	.type	_Z14Mapper209_InitP8CartInfo, @function
_Z14Mapper209_InitP8CartInfo:
.LFB27:
	.cfi_startproc
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	la a5, _ZL5is211; sw zero, 0(a5);
	li	a5,1
	la a4, _ZL5is209; sw a5, 0(a4);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL13Tek_StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE27:
	.size	_Z14Mapper209_InitP8CartInfo, .-_Z14Mapper209_InitP8CartInfo
	.section	.text._Z14Mapper211_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper211_InitP8CartInfo
	.hidden	_Z14Mapper211_InitP8CartInfo
	.type	_Z14Mapper211_InitP8CartInfo, @function
_Z14Mapper211_InitP8CartInfo:
.LFB28:
	.cfi_startproc
	lla	a5,_ZL8M90Powerv
	sw	a5,0(a0)
	lla	a5,_ZL7toggliev
	sw	a5,4(a0)
	li	a5,1
	la a4, _ZL5is211; sw a5, 0(a4);
	lla	a5,_ZL6M90PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_Z7CPUWrapi
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL6SLWrapv
	la a4, GameHBIRQHook2; sw a5, 0(a4);
	lla	a5,_ZL10M90Restorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL13Tek_StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE28:
	.size	_Z14Mapper211_InitP8CartInfo, .-_Z14Mapper211_InitP8CartInfo
	.section	.sbss._ZL8lastread,"aw",@nobits
	.align	2
	.type	_ZL8lastread, @object
	.size	_ZL8lastread, 4
_ZL8lastread:
	.zero	4
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"IRQM"
	.align	2
.LC2:
	.string	"IRQP"
	.align	2
.LC3:
	.string	"IRQR"
	.align	2
.LC4:
	.string	"IRQC"
	.align	2
.LC5:
	.string	"IRQX"
	.align	2
.LC6:
	.string	"IRQA"
	.align	2
.LC7:
	.string	"MUL"
	.align	2
.LC8:
	.string	"REGI"
	.align	2
.LC9:
	.string	"TKCO"
	.align	2
.LC10:
	.string	"PRGB"
	.align	2
.LC11:
	.string	"CLTC"
	.align	2
.LC12:
	.string	"CHRL"
	.align	2
.LC13:
	.string	"CHRH"
	.align	2
.LC14:
	.string	"NMS0"
	.align	2
.LC15:
	.string	"NMS1"
	.align	2
.LC16:
	.string	"NMS2"
	.align	2
.LC17:
	.string	"NMS3"
	.align	2
.LC18:
	.string	"TEKR"
	.section	.data._ZL13Tek_StateRegs,"aw"
	.align	2
	.type	_ZL13Tek_StateRegs, @object
	.size	_ZL13Tek_StateRegs, 228
_ZL13Tek_StateRegs:
	.word	_ZL7IRQMode
	.word	1
	.word	.LC1
	.word	_ZL6IRQPre
	.word	1
	.word	.LC2
	.word	_ZL10IRQPreSize
	.word	1
	.word	.LC3
	.word	_ZL8IRQCount
	.word	1
	.word	.LC4
	.word	_ZL6IRQXOR
	.word	1
	.word	.LC5
	.word	_ZL4IRQa
	.word	1
	.word	.LC6
	.word	_ZL3mul
	.word	2
	.word	.LC7
	.word	_ZL5regie
	.word	1
	.word	.LC8
	.word	_ZL5tkcom
	.word	4
	.word	.LC9
	.word	_ZL4prgb
	.word	4
	.word	.LC10
	.word	_ZL3chr
	.word	2
	.word	.LC11
	.word	_ZL6chrlow
	.word	4
	.word	.LC12
	.word	_ZL7chrhigh
	.word	8
	.word	.LC13
	.word	_ZL5names
	.word	-2147483646
	.word	.LC14
	.word	_ZL5names+2
	.word	-2147483646
	.word	.LC15
	.word	_ZL5names+4
	.word	-2147483646
	.word	.LC16
	.word	_ZL5names+6
	.word	-2147483646
	.word	.LC17
	.word	_ZL6tekker
	.word	1
	.word	.LC18
	.word	0
	.zero	8
	.section	.sbss._ZL6tekker,"aw",@nobits
	.type	_ZL6tekker, @object
	.size	_ZL6tekker, 1
_ZL6tekker:
	.zero	1
	.section	.sbss._ZL5names,"aw",@nobits
	.align	2
	.type	_ZL5names, @object
	.size	_ZL5names, 8
_ZL5names:
	.zero	8
	.section	.sbss._ZL3chr,"aw",@nobits
	.align	2
	.type	_ZL3chr, @object
	.size	_ZL3chr, 2
_ZL3chr:
	.zero	2
	.section	.sbss._ZL7chrhigh,"aw",@nobits
	.align	2
	.type	_ZL7chrhigh, @object
	.size	_ZL7chrhigh, 8
_ZL7chrhigh:
	.zero	8
	.section	.sbss._ZL6chrlow,"aw",@nobits
	.align	2
	.type	_ZL6chrlow, @object
	.size	_ZL6chrlow, 8
_ZL6chrlow:
	.zero	8
	.section	.sbss._ZL4prgb,"aw",@nobits
	.align	2
	.type	_ZL4prgb, @object
	.size	_ZL4prgb, 4
_ZL4prgb:
	.zero	4
	.section	.sbss._ZL5tkcom,"aw",@nobits
	.align	2
	.type	_ZL5tkcom, @object
	.size	_ZL5tkcom, 4
_ZL5tkcom:
	.zero	4
	.section	.sbss._ZL5regie,"aw",@nobits
	.type	_ZL5regie, @object
	.size	_ZL5regie, 1
_ZL5regie:
	.zero	1
	.section	.sbss._ZL3mul,"aw",@nobits
	.align	2
	.type	_ZL3mul, @object
	.size	_ZL3mul, 2
_ZL3mul:
	.zero	2
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL6IRQXOR,"aw",@nobits
	.type	_ZL6IRQXOR, @object
	.size	_ZL6IRQXOR, 1
_ZL6IRQXOR:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 1
_ZL8IRQCount:
	.zero	1
	.section	.sbss._ZL10IRQPreSize,"aw",@nobits
	.type	_ZL10IRQPreSize, @object
	.size	_ZL10IRQPreSize, 1
_ZL10IRQPreSize:
	.zero	1
	.section	.sbss._ZL6IRQPre,"aw",@nobits
	.type	_ZL6IRQPre, @object
	.size	_ZL6IRQPre, 1
_ZL6IRQPre:
	.zero	1
	.section	.sbss._ZL7IRQMode,"aw",@nobits
	.type	_ZL7IRQMode, @object
	.size	_ZL7IRQMode, 1
_ZL7IRQMode:
	.zero	1
	.section	.sbss._ZL5is211,"aw",@nobits
	.align	2
	.type	_ZL5is211, @object
	.size	_ZL5is211, 4
_ZL5is211:
	.zero	4
	.section	.sbss._ZL5is209,"aw",@nobits
	.align	2
	.type	_ZL5is209, @object
	.size	_ZL5is209, 4
_ZL5is209:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
