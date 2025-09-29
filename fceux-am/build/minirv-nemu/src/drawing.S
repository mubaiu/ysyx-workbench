#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"drawing.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z15DrawTextTransWHPhiS_hiii.part.0,"ax",@progbits
	.align	2
	.type	_Z15DrawTextTransWHPhiS_hiii.part.0, @function
_Z15DrawTextTransWHPhiS_hiii.part.0:
.LFB49:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s1,40(sp)
	sw	s0,44(sp)
	sw	s2,36(sp)
	sw	s3,32(sp)
	sw	s4,28(sp)
	sw	s5,24(sp)
	sw	s6,20(sp)
	sw	s7,16(sp)
	sw	s8,12(sp)
	sw	s9,8(sp)
	sw	s10,4(sp)
	sw	s11,0(sp)
	.cfi_offset 9, -8
	.cfi_offset 8, -4
	.cfi_offset 18, -12
	.cfi_offset 19, -16
	.cfi_offset 20, -20
	.cfi_offset 21, -24
	.cfi_offset 22, -28
	.cfi_offset 23, -32
	.cfi_offset 24, -36
	.cfi_offset 25, -40
	.cfi_offset 26, -44
	.cfi_offset 27, -48
	lbu	a5,0(a1)
	mv	s1,a0
	beq	a5,zero,.L56
	li	a4,0
	li	s6,2
	li	s2,2
	li	t2,2
	li	s7,10
	li	s11,98
	li	s10,255
	lla	a0,target
	li	s9,7
	li	t5,1
	li	t4,61
	li	t6,2
	lla	s8,_ZL7Font6x7
.L18:
	beq	a5,s7,.L84
	addi	a5,a5,-32
	bgtu	a5,s11,.L57
	slli	a5,a5,3
	lla	a4,_ZL7Font6x7
	addi	s3,a5,1
	add	a5,a4,a5
	add	a4,a4,s3
	lbu	s0,0(a5)
	lbu	a7,0(a4)
.L5:
	add	a5,s2,s0
	ble	a5,s10,.L6
	addi	t2,t2,8
	li	s2,2
.L6:
	slli	t0,t2,8
	add	t0,t0,s2
	mv	s5,a0
	add	t0,a0,t0
	addi	s4,t2,7
	mv	t3,t2
	sub	t1,s9,s0
	sub	s3,s3,t2
.L16:
	mv	a6,t0
	li	a5,7
	bne	s0,zero,.L14
	j	.L15
.L86:
	bgt	t3,t4,.L85
	sb	t6,0(a6)
	addi	a5,a5,-1
	addi	a6,a6,1
	beq	t1,a5,.L15
.L14:
	sra	a4,a7,a5
	andi	a4,a4,1
	bne	a4,zero,.L86
	sb	t5,0(a6)
	addi	a5,a5,-1
	addi	a6,a6,1
	bne	t1,a5,.L14
.L15:
	addi	t3,t3,1
	addi	t0,t0,256
	beq	t3,s4,.L87
	add	a5,s3,t3
	add	a5,a5,s8
	lbu	a7,0(a5)
	j	.L16
.L85:
	addi	t3,s6,2
	li	a5,256
	bgt	t3,a5,.L88
.L82:
	li	s10,62
.L2:
	lla	t6,target
	li	t1,0
	li	s3,159
	li	t4,199
	li	s0,9
	li	t5,1
	li	s8,13
	li	s7,254
	li	a0,14
	li	t2,255
.L22:
	li	a5,-1
	addi	s2,t6,256
	blt	s6,a5,.L52
	mv	a7,s2
	mv	a6,s1
	mv	a4,t6
	li	a1,0
	mv	s11,s10
.L50:
	lbu	t0,0(a4)
	slli	a5,t0,1
	add	a5,a5,t0
	slli	a5,a5,3
	add	a5,a5,t0
	slli	a5,a5,2
	ble	a3,zero,.L23
	beq	a1,zero,.L24
	lbu	t0,-1(a4)
	add	a5,a5,t0
	beq	a1,t2,.L25
.L24:
	lbu	t0,1(a4)
	add	a5,a5,t0
.L25:
	beq	t1,zero,.L26
	lbu	t0,-256(a4)
	add	a5,a5,t0
	bleu	t1,a0,.L26
.L27:
	beq	a3,t5,.L23
	beq	a1,zero,.L28
	lbu	s4,-1(a4)
	slli	t0,s4,2
	add	t0,t0,s4
	slli	t0,t0,1
	add	a5,a5,t0
	bne	a1,t2,.L28
	beq	t1,zero,.L89
	lbu	s4,-256(a4)
	slli	t0,s4,2
	add	t0,t0,s4
	slli	t0,t0,1
	add	t0,t0,a5
	bleu	t1,a0,.L55
	lbu	s10,-257(a4)
	lbu	s4,253(t6)
	lbu	a5,-512(a4)
	add	t0,s10,t0
	add	t0,s4,t0
	add	a5,a5,t0
.L23:
	bgt	a5,t4,.L44
	bgt	a5,s0,.L45
	beq	a5,zero,.L43
.L46:
	li	a5,-49
	sb	a5,0(a6)
.L43:
	addi	a1,a1,1
	addi	a4,a4,1
	addi	a6,a6,1
	addi	a7,a7,1
	bgt	t3,a1,.L50
	mv	s10,s11
.L52:
	addi	t1,t1,1
	mv	t6,s2
	addi	s1,s1,256
	bgt	s10,t1,.L22
.L1:
	lw	s0,44(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,40(sp)
	.cfi_restore 9
	lw	s2,36(sp)
	.cfi_restore 18
	lw	s3,32(sp)
	.cfi_restore 19
	lw	s4,28(sp)
	.cfi_restore 20
	lw	s5,24(sp)
	.cfi_restore 21
	lw	s6,20(sp)
	.cfi_restore 22
	lw	s7,16(sp)
	.cfi_restore 23
	lw	s8,12(sp)
	.cfi_restore 24
	lw	s9,8(sp)
	.cfi_restore 25
	lw	s10,4(sp)
	.cfi_restore 26
	lw	s11,0(sp)
	.cfi_restore 27
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L26:
	.cfi_restore_state
	lbu	t0,0(a7)
	add	a5,a5,t0
	j	.L27
.L44:
	sb	a2,0(a6)
	j	.L43
.L28:
	lbu	s4,1(a4)
	slli	t0,s4,2
	add	t0,t0,s4
	slli	t0,t0,1
	add	t0,t0,a5
	beq	t1,zero,.L31
	lbu	s4,-256(a4)
	slli	a5,s4,2
	add	a5,a5,s4
	slli	a5,a5,1
	add	t0,a5,t0
	bleu	t1,a0,.L32
	bne	a1,zero,.L90
	lbu	s10,-255(t6)
	lbu	s4,2(t6)
	lbu	a5,-512(a4)
	add	t0,s10,t0
	add	t0,s4,t0
	add	a5,a5,t0
	j	.L23
.L31:
	add	a5,s5,a1
	lbu	s4,256(a5)
	slli	a5,s4,2
	add	a5,a5,s4
	slli	a5,a5,1
	add	t0,a5,t0
	bne	a1,zero,.L38
	lbu	s4,257(t6)
	lbu	a5,2(a4)
	add	t0,s4,t0
	add	a5,a5,t0
.L30:
	lbu	t0,512(a4)
	add	a5,t0,a5
	beq	a5,zero,.L43
	bgt	a5,t4,.L44
	ble	a5,s0,.L46
.L45:
	lbu	a5,0(a6)
	bgtu	a5,s3,.L49
	li	a5,-63
	sb	a5,0(a6)
	j	.L43
.L49:
	li	a5,-47
	sb	a5,0(a6)
	j	.L43
.L90:
	lbu	s4,-257(a4)
	lbu	a5,-255(a4)
	add	t0,s4,t0
	add	a5,a5,t0
	bleu	a1,t5,.L91
	lbu	s4,-2(a4)
	li	t0,253
	add	a5,s4,a5
	bleu	a1,t0,.L92
.L41:
	lbu	t0,-512(a4)
	add	a5,t0,a5
	j	.L23
.L89:
	lbu	s10,511(s5)
	lbu	t0,253(t6)
	lbu	s4,-1(a7)
	mv	s9,t0
	slli	t0,s10,2
	add	t0,t0,s10
	slli	t0,t0,1
	add	a5,t0,a5
	add	s4,s4,a5
	add	a5,s9,s4
	j	.L30
.L93:
	lbu	a5,-257(a4)
	lbu	t0,-255(a4)
	add	a5,a5,s4
	add	t0,t0,a5
.L38:
	lbu	s4,-1(a7)
	lbu	a5,1(a7)
	add	t0,s4,t0
	add	a5,a5,t0
	bleu	a1,t5,.L40
	lbu	t0,-2(a4)
	add	a5,a5,t0
	bne	a1,s7,.L40
.L42:
	bleu	t1,t5,.L30
.L53:
	lbu	t0,-512(a4)
	add	a5,a5,t0
	bleu	t1,s8,.L30
	j	.L23
.L32:
	lbu	a5,0(a7)
	slli	s4,a5,2
	add	s4,s4,a5
	slli	s4,s4,1
	add	s4,s4,t0
	bne	a1,zero,.L93
	lbu	t0,-255(a4)
	lbu	a5,257(t6)
	add	t0,t0,s4
	add	a5,a5,t0
.L40:
	lbu	t0,2(a4)
	add	a5,a5,t0
	j	.L42
.L55:
	lbu	s4,0(a7)
	lbu	s10,-257(a4)
	lbu	a5,-1(a7)
	slli	s9,s4,2
	add	s4,s9,s4
	slli	s4,s4,1
	lbu	s9,253(t6)
	add	s4,s4,t0
	add	s10,s10,s4
	add	a5,a5,s10
	add	a5,s9,a5
	j	.L42
.L91:
	lbu	t0,2(a4)
	add	a5,t0,a5
	j	.L41
.L92:
	lbu	t0,2(a4)
	add	a5,t0,a5
	j	.L53
.L84:
	addi	t2,t2,8
	li	s2,2
.L4:
	lbu	a5,1(a1)
	addi	a1,a1,1
	bne	a5,zero,.L18
	add	t2,t2,a4
	li	a5,-1
	blt	t2,a5,.L1
	addi	t3,s6,2
	li	a5,256
	ble	t3,a5,.L20
	li	t3,256
.L20:
	addi	s10,t2,2
	li	a5,62
	lla	s5,target
	ble	s10,a5,.L2
	j	.L82
.L57:
	li	a7,0
	li	s3,1
	li	s0,6
	j	.L5
.L88:
	li	t3,256
	j	.L82
.L87:
	add	s2,s2,s0
	blt	s6,s2,.L94
	li	a4,7
	j	.L4
.L94:
	mv	s6,s2
	li	a4,7
	j	.L4
.L56:
	li	s10,4
	li	t3,4
	li	s6,2
	lla	s5,target
	j	.L2
	.cfi_endproc
.LFE49:
	.size	_Z15DrawTextTransWHPhiS_hiii.part.0, .-_Z15DrawTextTransWHPhiS_hiii.part.0
	.section	.rodata._Z15DrawTextTransWHPhiS_hiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/drawing.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z15DrawTextTransWHPhiS_hiii,"ax",@progbits
	.align	2
	.globl	_Z15DrawTextTransWHPhiS_hiii
	.hidden	_Z15DrawTextTransWHPhiS_hiii
	.type	_Z15DrawTextTransWHPhiS_hiii, @function
_Z15DrawTextTransWHPhiS_hiii:
.LFB47:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s4,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 20, -24
	mv	s0,a0
	mv	s4,a1
	mv	s1,a2
	li	a1,0
	li	a2,16384
	lla	a0,target
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	mv	s2,a3
	mv	s3,a6
	call	memset
	li	a5,256
	bne	s4,a5,.L98
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s4,8(sp)
	.cfi_restore 20
	mv	a3,s3
	mv	a2,s2
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s2,16(sp)
	.cfi_restore 18
	mv	a1,s1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z15DrawTextTransWHPhiS_hiii.part.0
.L98:
	.cfi_restore_state
	li	a2,121
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE47:
	.size	_Z15DrawTextTransWHPhiS_hiii, .-_Z15DrawTextTransWHPhiS_hiii
	.section	.text._Z13DrawTextTransPhjS_h,"ax",@progbits
	.align	2
	.globl	_Z13DrawTextTransPhjS_h
	.hidden	_Z13DrawTextTransPhjS_h
	.type	_Z13DrawTextTransPhjS_h, @function
_Z13DrawTextTransPhjS_h:
.LFB48:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,a0
	mv	s0,a1
	mv	s2,a2
	li	a1,0
	li	a2,16384
	lla	a0,target
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	mv	s3,a3
	call	memset
	li	a5,256
	bne	s0,a5,.L102
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a2,s3
	mv	a1,s2
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s2,16(sp)
	.cfi_restore 18
	mv	a0,s1
	lw	s1,20(sp)
	.cfi_restore 9
	li	a3,2
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z15DrawTextTransWHPhiS_hiii.part.0
.L102:
	.cfi_restore_state
	li	a2,121
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE48:
	.size	_Z13DrawTextTransPhjS_h, .-_Z13DrawTextTransPhjS_h
	.hidden	target
	.globl	target
	.section	.bss.target,"aw",@nobits
	.align	2
	.type	target, @object
	.size	target, 16384
target:
	.zero	16384
	.section	.rodata._ZL7Font6x7,"a"
	.align	2
	.type	_ZL7Font6x7, @object
	.size	_ZL7Font6x7, 792
_ZL7Font6x7:
	.string	"\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\003@@@@@"
	.string	"@\005PPP"
	.string	""
	.string	""
	.string	""
	.string	"\006PP\370P\370PP\006 x\240p(\360 \006@\250P P\250\020\006`\220\240@\250\220h\003@@"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\004 @@@@@ \004@     @\006"
	.string	"P \370 P"
	.string	"\006"
	.string	"  \370  "
	.string	"\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\200\005"
	.string	""
	.string	""
	.string	"\360"
	.string	""
	.string	""
	.string	"\003"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"@\005\020\020   @@\006p\210\210\210\210\210p\006 `     \006p\210\b0@\200\370\006p\210\b0\b\210p\006\0200P\220\370\020\020\006\370\200\200\360\b\b\360\0060@\200\360\210\210p\006\370\b\020\020   \006p\210\210p\210\210p\006p\210\210x\b\020`\003"
	.string	""
	.string	"@"
	.string	""
	.string	"@"
	.string	"\003"
	.string	""
	.string	"@"
	.string	""
	.string	"@\200\004"
	.string	" @\200@ "
	.string	"\005"
	.string	""
	.string	"\360"
	.string	"\360"
	.string	""
	.string	"\004"
	.string	"\200@ @\200"
	.string	"\006p\210\b\020 "
	.string	" \006p\210\210\270\260\200p\006p\210\210\370\210\210\210\006\360\210\210\360\210\210\360\006p\210\200\200\200\210p\006\340\220\210\210\210\220\340\006\370\200\200\360\200\200\370\006\370\200\200\360\200\200\200\006p\210\200\270\210\210x\006\210\210\210\370\210\210\210\004\340@@@@@\340\006\b\b\b\b\b\210p\006\210\220\240\300\240\220\210\006\200\200\200\200\200\200\370\006\210\330\250\250\210\210\210\006\210\210\310\250\230\210\210\0070H\204\204\204H0\006\360\210\210\360\200\200\200\006p\210\210\210\250\220h\006\360\210\210\360\220\210\210\006p\210\200p\b\210p\006\370      \006\210\210\210\210\210\210p\006\210\210\210PP  \006\210\210\210\210\250\250P\006\210\210P P\210\210\006\210\210P    \006\370\b\020 @\200\370\003\300\200\200\200\200\200\300\005@@   \020\020\003\300@@@@@\300\004@\240"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\006"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\370\003\200@"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	"\005"
	.string	""
	.string	"`\020p\220p\005\200\200\340\220\220\220\340\005"
	.string	""
	.string	"p\200\200\200p\005\020\020p\220\220\220p\005"
	.string	""
	.string	"`\220\360\200p\0050@\340@@@@\005"
	.string	"p\220\220p\020\340\005\200\200\340\220\220\220\220\002\200"
	.string	"\200\200\200\200\200\004 "
	.string	"    \300\005\200\200\220\240\300\240\220\002\200\200\200\200\200\200\200\006"
	.string	""
	.string	"\320\250\250\250\250\005"
	.string	""
	.string	"\340\220\220\220\220\005"
	.string	""
	.string	"`\220\220\220`\005"
	.string	""
	.string	"\340\220\220\340\200\005"
	.string	""
	.string	"p\220\220p\020\005"
	.string	""
	.string	"\260\300\200\200\200\005"
	.string	""
	.string	"p\200`\020\340\004@@\340@@@ \005"
	.string	""
	.string	"\220\220\220\220p\005"
	.string	""
	.string	"\220\220\220\240\300\006"
	.string	""
	.string	"\210\210\250\250P\005"
	.string	""
	.string	"\220\220`\220\220\005"
	.string	"\220\220\220p\020`\005"
	.string	""
	.string	"\360 @\200\360\004 @@\200@@ \003@@@@@@@\004\200@@ @@\200\006"
	.string	"h\260"
	.string	""
	.string	""
	.string	""
	.string	""
	.zero	31
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
