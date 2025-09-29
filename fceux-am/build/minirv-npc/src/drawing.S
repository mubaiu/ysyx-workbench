#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"drawing.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	.cfi_offset 9, -8
	.cfi_offset 8, -4
	mv	t0,a1
	lbu	a1,0(a1)
	sw	a2,8(sp)
	sw	a3,28(sp)
	mv	s1,a0
	beq	a1,zero,.L56
	li	a5,2
	li	a2,0
	sw	a5,0(sp)
	li	a4,2
	li	t2,1
	li	s0,61
	sw	a0,20(sp)
.L18:
	li	a3,10
	beq	a1,a3,.L89
	addi	a1,a1,-32
	li	a3,98
	bgtu	a1,a3,.L57
	slli	a1,a1,3
	lla	a3,_ZL7Font6x7
	addi	a2,a1,1
	add	a0,a3,a2
	add	a1,a3,a1
	lbu	a3,0(a1)
	lbu	a0,0(a0)
.L5:
	add	a1,a5,a3
	li	t1,255
	ble	a1,t1,.L6
	addi	a4,a4,8
	li	a5,2
.L6:
	slli	s1,a4,8
	lla	a1,target
	add	s1,s1,a5
	sw	a1,16(sp)
	add	s1,a1,s1
	addi	a1,a4,7
	sw	a1,4(sp)
	sub	a2,a2,a4
	li	a1,7
	mv	t1,a4
	sub	a1,a1,a3
	sw	a2,12(sp)
	sw	a5,24(sp)
	sw	a4,32(sp)
	sw	t0,36(sp)
.L16:
	mv	a2,s1
	li	a5,7
	li	t0,2
	bne	a3,zero,.L14
	j	.L15
.L91:
	bgt	t1,s0,.L90
	sb	t0,0(a2)
	addi	a5,a5,-1
	addi	a2,a2,1
	beq	a1,a5,.L15
.L14:
	sra	a4,a0,a5
	andi	a4,a4,1
	bne	a4,zero,.L91
	sb	t2,0(a2)
	addi	a5,a5,-1
	addi	a2,a2,1
	bne	a1,a5,.L14
.L15:
	lw	a5,4(sp)
	addi	t1,t1,1
	addi	s1,s1,256
	beq	t1,a5,.L92
	lw	a5,12(sp)
	lla	a4,_ZL7Font6x7
	add	a5,a5,t1
	add	a5,a5,a4
	lbu	a0,0(a5)
	j	.L16
.L90:
	lw	a5,0(sp)
	lw	s1,20(sp)
	addi	t2,a5,2
	li	a5,256
	bgt	t2,a5,.L93
.L87:
	li	a0,62
.L2:
	lw	a4,0(sp)
	lla	a5,target
	sw	a5,4(sp)
	li	t0,0
	li	a5,-1
.L22:
	blt	a4,a5,.L83
	sw	a0,20(sp)
	lw	a0,28(sp)
	sw	t2,0(sp)
	sw	s1,24(sp)
.L51:
	lw	a4,4(sp)
	lw	a5,24(sp)
	slli	a2,t0,8
	addi	t1,a4,256
	add	a2,a5,a2
	mv	a1,t1
	li	a3,0
	li	s0,199
	mv	s1,a0
	sw	t1,12(sp)
.L50:
	lbu	a0,0(a4)
	slli	a5,a0,1
	add	a5,a5,a0
	slli	a5,a5,3
	add	a5,a5,a0
	slli	a5,a5,2
	ble	s1,zero,.L23
	beq	a3,zero,.L24
	lbu	t1,-1(a4)
	li	a0,255
	add	a5,a5,t1
	beq	a3,a0,.L25
.L24:
	lbu	a0,1(a4)
	add	a5,a5,a0
.L25:
	beq	t0,zero,.L26
	lbu	t1,-256(a4)
	li	a0,14
	add	a5,a5,t1
	ble	t0,a0,.L26
.L27:
	li	a0,1
	beq	s1,a0,.L23
	beq	a3,zero,.L28
	lbu	t1,-1(a4)
	li	t2,255
	slli	a0,t1,2
	add	a0,a0,t1
	slli	a0,a0,1
	add	a5,a5,a0
	bne	a3,t2,.L28
	beq	t0,zero,.L94
	lbu	t2,-256(a4)
	li	t1,14
	slli	a0,t2,2
	add	a0,a0,t2
	slli	a0,a0,1
	add	a0,a0,a5
	ble	t0,t1,.L55
	lw	a5,4(sp)
	lbu	t2,-257(a4)
	lbu	t1,253(a5)
	lbu	a5,-512(a4)
	add	t2,t2,a0
	add	t1,t1,t2
	add	a5,a5,t1
.L23:
	bgt	a5,s0,.L44
	li	a0,9
	bgt	a5,a0,.L45
	beq	a5,zero,.L43
.L46:
	li	a5,-49
	sb	a5,0(a2)
.L43:
	lw	a5,0(sp)
	addi	a3,a3,1
	addi	a4,a4,1
	addi	a2,a2,1
	addi	a1,a1,1
	bgt	a5,a3,.L50
	lw	t1,12(sp)
	lw	a5,20(sp)
	addi	t0,t0,1
	sw	t1,4(sp)
	mv	a0,s1
	bgt	a5,t0,.L51
.L1:
	lw	s0,44(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,40(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L44:
	.cfi_restore_state
	lw	a5,8(sp)
	sb	a5,0(a2)
	j	.L43
.L26:
	lbu	a0,0(a1)
	add	a5,a5,a0
	j	.L27
.L28:
	lbu	t1,1(a4)
	slli	a0,t1,2
	add	a0,a0,t1
	slli	a0,a0,1
	add	a5,a0,a5
	beq	t0,zero,.L31
	lbu	t2,-256(a4)
	li	t1,14
	slli	a0,t2,2
	add	a0,a0,t2
	slli	a0,a0,1
	add	a0,a0,a5
	ble	t0,t1,.L32
	bne	a3,zero,.L95
	lw	a5,4(sp)
	lbu	t2,-255(a5)
	lbu	t1,2(a5)
	lbu	a5,-512(a4)
	add	t2,t2,a0
	add	t1,t1,t2
	add	a5,a5,t1
	j	.L23
.L31:
	lw	a0,16(sp)
	add	a0,a0,a3
	lbu	t1,256(a0)
	slli	a0,t1,2
	add	a0,a0,t1
	slli	a0,a0,1
	add	a0,a0,a5
	bne	a3,zero,.L38
	lw	a5,4(sp)
	lbu	t1,257(a5)
	lbu	a5,2(a4)
	add	t1,t1,a0
	add	a5,a5,t1
.L30:
	lbu	a0,512(a4)
	add	a5,a0,a5
	beq	a5,zero,.L43
	li	a0,199
	bgt	a5,a0,.L44
	li	a0,9
	ble	a5,a0,.L46
.L45:
	lbu	a5,0(a2)
	li	a0,159
	bgtu	a5,a0,.L49
	li	a5,-63
	sb	a5,0(a2)
	j	.L43
.L49:
	li	a5,-47
	sb	a5,0(a2)
	j	.L43
.L95:
	lbu	a5,-257(a4)
	lbu	t2,-255(a4)
	li	t1,1
	add	a5,a5,a0
	add	a5,t2,a5
	bleu	a3,t1,.L96
	lbu	a0,-2(a4)
	li	t1,253
	add	a5,a0,a5
	bleu	a3,t1,.L97
.L41:
	lbu	a0,-512(a4)
	add	a5,a0,a5
	j	.L23
.L94:
	lw	a0,16(sp)
	lbu	t1,-1(a1)
	lbu	t2,511(a0)
	lw	a0,4(sp)
	lbu	a0,253(a0)
	sw	a0,28(sp)
	slli	a0,t2,2
	add	a0,a0,t2
	slli	a0,a0,1
	add	a0,a0,a5
	add	t1,t1,a0
	lw	a0,28(sp)
	add	a5,a0,t1
	j	.L30
.L98:
	lbu	a5,-257(a4)
	lbu	a0,-255(a4)
	add	a5,a5,t1
	add	a0,a0,a5
.L38:
	lbu	t1,-1(a1)
	lbu	a5,1(a1)
	li	t2,1
	add	t1,t1,a0
	add	a5,a5,t1
	bleu	a3,t2,.L40
	lbu	t1,-2(a4)
	li	a0,254
	add	a5,a5,t1
	bne	a3,a0,.L40
.L42:
	li	a0,1
	ble	t0,a0,.L30
.L53:
	lbu	t1,-512(a4)
	li	a0,13
	add	a5,a5,t1
	ble	t0,a0,.L30
	j	.L23
.L32:
	lbu	t1,0(a1)
	slli	a5,t1,2
	add	t1,a5,t1
	slli	t1,t1,1
	add	t1,t1,a0
	bne	a3,zero,.L98
	lw	a5,4(sp)
	lbu	a0,-255(a4)
	lbu	a5,257(a5)
	add	a0,a0,t1
	add	a5,a5,a0
.L40:
	lbu	a0,2(a4)
	add	a5,a5,a0
	j	.L42
.L55:
	lbu	a5,0(a1)
	lbu	t1,-1(a1)
	lbu	t2,-257(a4)
	sw	t1,28(sp)
	slli	t1,a5,2
	add	t1,t1,a5
	slli	t1,t1,1
	lw	a5,4(sp)
	add	t1,t1,a0
	add	t2,t2,t1
	lw	t1,28(sp)
	lbu	a5,253(a5)
	add	a0,t1,t2
	add	a5,a5,a0
	j	.L42
.L96:
	lbu	a0,2(a4)
	add	a5,a0,a5
	j	.L41
.L97:
	lbu	a0,2(a4)
	add	a5,a0,a5
	j	.L53
.L83:
	lw	a3,4(sp)
	addi	t0,t0,1
	addi	a3,a3,256
	sw	a3,4(sp)
	blt	t0,a0,.L22
	j	.L1
.L89:
	addi	a4,a4,8
	li	a5,2
.L4:
	lbu	a1,1(t0)
	addi	t0,t0,1
	bne	a1,zero,.L18
	add	a4,a4,a2
	li	a5,-1
	lw	s1,20(sp)
	blt	a4,a5,.L1
	lw	a5,0(sp)
	addi	t2,a5,2
	li	a5,256
	ble	t2,a5,.L20
	li	t2,256
.L20:
	addi	a0,a4,2
	lla	a4,target
	li	a5,62
	sw	a4,16(sp)
	ble	a0,a5,.L2
	j	.L87
.L57:
	li	a0,0
	li	a2,1
	li	a3,6
	j	.L5
.L93:
	li	t2,256
	j	.L87
.L92:
	lw	a5,24(sp)
	lw	a4,32(sp)
	lw	t0,36(sp)
	add	a5,a5,a3
	lw	a3,0(sp)
	blt	a3,a5,.L99
	li	a2,7
	j	.L4
.L99:
	sw	a5,0(sp)
	li	a2,7
	j	.L4
.L56:
	li	a5,2
	sw	a5,0(sp)
	lla	a5,target
	li	a0,4
	li	t2,4
	sw	a5,16(sp)
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
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	lw	t1,24(sp)
	mv	a4,a0
	mv	a5,a1
	sw	s0,16(sp)
	li	a1,0
	.cfi_offset 8, -8
	mv	s0,a2
	lla	a0,target
	li	a2,16384
	sw	s1,12(sp)
	sw	a4,0(sp)
	sw	a5,8(sp)
	sw	ra,20(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sw	t1,4(sp)
	mv	s1,a3
	call	memset
	lw	a5,8(sp)
	li	a4,256
	bne	a5,a4,.L103
	mv	a1,s0
	lw	s0,16(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a3,4(sp)
	lw	a0,0(sp)
	lw	ra,20(sp)
	.cfi_restore 1
	mv	a2,s1
	lw	s1,12(sp)
	.cfi_restore 9
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	tail	_Z15DrawTextTransWHPhiS_hiii.part.0
.L103:
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
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	mv	a4,a0
	sw	s0,12(sp)
	sw	s1,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a2
	mv	s1,a1
	li	a2,16384
	li	a1,0
	lla	a0,target
	sw	a4,0(sp)
	sw	ra,16(sp)
	.cfi_offset 1, -4
	sw	a3,4(sp)
	call	memset
	li	a4,256
	bne	s1,a4,.L107
	mv	a1,s0
	lw	s0,12(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	a2,4(sp)
	lw	a0,0(sp)
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s1,8(sp)
	.cfi_restore 9
	li	a3,2
	addi	sp,sp,20
	.cfi_def_cfa_offset 0
	tail	_Z15DrawTextTransWHPhiS_hiii.part.0
.L107:
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
