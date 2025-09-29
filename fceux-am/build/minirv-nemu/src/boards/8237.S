#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"8237.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL12UNL8237Powerv,"ax",@progbits
	.align	2
	.type	_ZL12UNL8237Powerv, @function
_ZL12UNL8237Powerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	li	a4,3
	sb	zero,2(a5)
	sb	zero,0(a5)
	sb	a4,1(a5)
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_ZL12UNL8237Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL14UNL8237ExWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE12:
	.size	_ZL12UNL8237Powerv, .-_ZL12UNL8237Powerv
	.section	.text._ZL12UNL8237Writejh,"ax",@progbits
	.align	2
	.type	_ZL12UNL8237Writejh, @function
_ZL12UNL8237Writejh:
.LFB10:
	.cfi_startproc
	srli	a4,a0,12
	la a3, EXPREGS+2; lbu a3, 0(a3);
	andi	a0,a0,1
	andi	a4,a4,6
	slli	a3,a3,3
	lla	a5,_ZL7adrperm
	or	a4,a4,a0
	add	a5,a5,a3
	add	a5,a5,a4
	lbu	a4,0(a5)
	li	a5,24576
	li	a2,3
	slli	a0,a4,12
	and	a0,a0,a5
	andi	a5,a4,1
	or	a0,a0,a5
	li	a5,-32768
	or	a0,a0,a5
	slli	a0,a0,16
	mv	a5,a1
	srli	a0,a0,16
	bgtu	a4,a2,.L5
	bne	a4,zero,.L6
	lla	a4,_ZL7regperm
	andi	a2,a1,7
	add	a4,a4,a3
	add	a4,a4,a2
	lbu	a4,0(a4)
	andi	a5,a1,-64
	or	a5,a4,a5
.L6:
	mv	a1,a5
	tail	_Z13MMC3_CMDWritejh
.L5:
	tail	_Z13MMC3_IRQWritejh
	.cfi_endproc
.LFE10:
	.size	_ZL12UNL8237Writejh, .-_ZL12UNL8237Writejh
	.section	.text._ZL9UNL8237PWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL8237PWjh, @function
_ZL9UNL8237PWjh:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	lla	a5,EXPREGS
	lbu	a4,0(a5)
	lbu	a5,1(a5)
	slli	a2,a4,24
	andi	a3,a4,64
	srai	a2,a2,24
	.cfi_offset 1, -4
	beq	a3,zero,.L8
	andi	a3,a5,16
	bge	a2,zero,.L9
	sw	s0,8(sp)
	slli	a5,a5,4
	.cfi_offset 8, -8
	srli	s0,a3,1
	andi	a3,a4,7
	or	s0,s0,a3
	andi	a5,a5,48
	andi	a4,a4,32
	or	s0,s0,a5
	beq	a4,zero,.L12
.L14:
	srli	a1,s0,1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L8:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	bge	a2,zero,.L11
	sw	s0,8(sp)
	.cfi_offset 8, -8
	slli	s0,a5,4
	andi	s0,s0,48
	andi	a5,a4,15
	andi	a4,a4,32
	or	s0,s0,a5
	bne	a4,zero,.L14
.L12:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L9:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	slli	a5,a5,5
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a5,a5,96
	or	a5,a5,a3
	andi	a1,a1,15
	or	a1,a5,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L11:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_restore 1
	slli	a5,a5,5
	andi	a5,a5,96
	andi	a1,a1,31
	or	a1,a5,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE7:
	.size	_ZL9UNL8237PWjh, .-_ZL9UNL8237PWjh
	.section	.text._ZL10UNL8237APWjh,"ax",@progbits
	.align	2
	.type	_ZL10UNL8237APWjh, @function
_ZL10UNL8237APWjh:
.LFB9:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	lla	a5,EXPREGS
	lbu	a4,0(a5)
	lbu	a5,1(a5)
	slli	a2,a4,24
	andi	a3,a4,64
	srai	a2,a2,24
	.cfi_offset 1, -4
	beq	a3,zero,.L17
	andi	a3,a5,16
	bge	a2,zero,.L18
	slli	a5,a5,24
	srai	a5,a5,24
	sw	s0,8(sp)
	.cfi_offset 8, -8
	slli	s0,a5,4
	slli	a5,a5,3
	andi	a2,a4,7
	andi	s0,s0,48
	andi	a5,a5,64
	srli	a3,a3,1
	or	s0,s0,a5
	or	a3,a3,a2
	andi	a4,a4,32
	or	s0,s0,a3
	beq	a4,zero,.L21
.L23:
	srli	a1,s0,1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L17:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	bge	a2,zero,.L20
	slli	a5,a5,24
	srai	a5,a5,24
	sw	s0,8(sp)
	.cfi_offset 8, -8
	slli	s0,a5,4
	slli	a5,a5,3
	andi	a5,a5,64
	andi	s0,s0,48
	or	s0,s0,a5
	andi	a5,a4,15
	andi	a4,a4,32
	or	s0,s0,a5
	bne	a4,zero,.L23
.L21:
	mv	a1,s0
	li	a0,32768
	call	_Z8setprg16jj
	mv	a1,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L18:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	slli	a4,a5,5
	slli	a5,a5,4
	andi	a4,a4,96
	andi	a5,a5,128
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	or	a5,a4,a5
	or	a5,a5,a3
	andi	a1,a1,15
	or	a1,a5,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L20:
	.cfi_restore_state
	slli	a4,a5,5
	slli	a5,a5,4
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a4,a4,96
	andi	a5,a5,128
	or	a5,a4,a5
	andi	a1,a1,31
	or	a1,a5,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE9:
	.size	_ZL10UNL8237APWjh, .-_ZL10UNL8237APWjh
	.section	.text._ZL14UNL8237ExWritejh,"ax",@progbits
	.align	2
	.type	_ZL14UNL8237ExWritejh, @function
_ZL14UNL8237ExWritejh:
.LFB11:
	.cfi_startproc
	li	a5,20480
	addi	a5,a5,1
	beq	a0,a5,.L26
	li	a5,20480
	addi	a5,a5,7
	beq	a0,a5,.L27
	li	a4,20480
	bne	a0,a4,.L25
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L27:
	la a5, EXPREGS+2; sb a1, 0(a5);
.L25:
	ret
.L26:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	la a5, EXPREGS+1; sb a1, 0(a5);
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
.LFE11:
	.size	_ZL14UNL8237ExWritejh, .-_ZL14UNL8237ExWritejh
	.section	.text._ZL9UNL8237CWjh,"ax",@progbits
	.align	2
	.type	_ZL9UNL8237CWjh, @function
_ZL9UNL8237CWjh:
.LFB6:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a3,0(a4)
	lbu	a5,1(a4)
	andi	a3,a3,64
	slli	a4,a5,6
	andi	a4,a4,768
	beq	a3,zero,.L32
	slli	a5,a5,2
	andi	a5,a5,128
	or	a5,a5,a4
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L32:
	or	a1,a1,a4
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE6:
	.size	_ZL9UNL8237CWjh, .-_ZL9UNL8237CWjh
	.section	.text._ZL10UNL8237ACWjh,"ax",@progbits
	.align	2
	.type	_ZL10UNL8237ACWjh, @function
_ZL10UNL8237ACWjh:
.LFB8:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a3,0(a4)
	lbu	a5,1(a4)
	andi	a3,a3,64
	slli	a4,a5,7
	andi	a4,a4,1792
	beq	a3,zero,.L34
	slli	a5,a5,2
	andi	a5,a5,128
	or	a5,a5,a4
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
.L34:
	or	a1,a1,a4
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE8:
	.size	_ZL10UNL8237ACWjh, .-_ZL10UNL8237ACWjh
	.section	.rodata._Z12UNL8237_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"EXPR"
	.align	2
.LC1:
	.string	"CMDI"
	.section	.text._Z12UNL8237_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNL8237_InitP8CartInfo
	.hidden	_Z12UNL8237_InitP8CartInfo
	.type	_Z12UNL8237_InitP8CartInfo, @function
_Z12UNL8237_InitP8CartInfo:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9UNL8237CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9UNL8237PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL8237Powerv
	sw	a5,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL5cmdin
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE13:
	.size	_Z12UNL8237_InitP8CartInfo, .-_Z12UNL8237_InitP8CartInfo
	.section	.text._Z13UNL8237A_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13UNL8237A_InitP8CartInfo
	.hidden	_Z13UNL8237A_InitP8CartInfo
	.type	_Z13UNL8237A_InitP8CartInfo, @function
_Z13UNL8237A_InitP8CartInfo:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10UNL8237ACWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10UNL8237APWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL12UNL8237Powerv
	sw	a5,0(s0)
	lla	a3,.LC0
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,_ZL5cmdin
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE14:
	.size	_Z13UNL8237A_InitP8CartInfo, .-_Z13UNL8237A_InitP8CartInfo
	.section	.rodata._ZL7adrperm,"a"
	.align	2
	.type	_ZL7adrperm, @object
	.size	_ZL7adrperm, 64
_ZL7adrperm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	"\003\002"
	.ascii	"\004\001\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	"\005"
	.ascii	"\001\002\003\007\006\004"
	.string	"\003\001"
	.ascii	"\005\002\004\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.section	.rodata._ZL7regperm,"a"
	.align	2
	.type	_ZL7regperm, @object
	.size	_ZL7regperm, 64
_ZL7regperm:
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\002\006\001\007\003\004\005"
	.string	""
	.ascii	"\005\004\001\007\002\006\003"
	.string	""
	.ascii	"\006\003\007\005\002\004\001"
	.string	""
	.ascii	"\002\005\003\006\001\007\004"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.string	""
	.ascii	"\001\002\003\004\005\006\007"
	.section	.sbss._ZL5cmdin,"aw",@nobits
	.type	_ZL5cmdin, @object
	.size	_ZL5cmdin, 1
_ZL5cmdin:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
