#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"yoko.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL14UNLYOKOReadDipj,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOReadDipj, @function
_ZL14UNLYOKOReadDipj:
.LFB10:
	.cfi_startproc
	la a5, X+24; lbu a5, 0(a5);
	andi	a5,a5,-4
	la a0, _ZL3dip; lbu a0, 0(a0);
	or	a0,a5,a0
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL14UNLYOKOReadDipj, .-_ZL14UNLYOKOReadDipj
	.section	.text._ZL14UNLYOKOReadLowj,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOReadLowj, @function
_ZL14UNLYOKOReadLowj:
.LFB11:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL3low
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL14UNLYOKOReadLowj, .-_ZL14UNLYOKOReadLowj
	.section	.text._ZL15UNLYOKOWriteLowjh,"ax",@progbits
	.align	2
	.type	_ZL15UNLYOKOWriteLowjh, @function
_ZL15UNLYOKOWriteLowjh:
.LFB12:
	.cfi_startproc
	andi	a0,a0,3
	lla	a5,_ZL3low
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL15UNLYOKOWriteLowjh, .-_ZL15UNLYOKOWriteLowjh
	.section	.text._ZL11UNLYOKOSyncv,"ax",@progbits
	.align	2
	.type	_ZL11UNLYOKOSyncv, @function
_ZL11UNLYOKOSyncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s1,_ZL4mode
	lbu	a0,0(s1)
	lla	s0,_ZL3reg
	not	a0,a0
	andi	a0,a0,1
	call	_Z9setmirrori
	lbu	a1,3(s0)
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,4(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,5(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,6(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a5,0(s1)
	andi	a4,a5,16
	bne	a4,zero,.L9
	andi	a5,a5,8
	la a1, _ZL4bank; lbu a1, 0(a1);
	beq	a5,zero,.L7
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	srli	a1,a1,1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L7:
	.cfi_restore_state
	li	a0,32768
	call	_Z8setprg16jj
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a1,-1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L9:
	.cfi_restore_state
	lbu	a1,0(s0)
	la s1, _ZL4bank; lbu s1, 0(s1);
	slli	s1,s1,1
	andi	s1,s1,16
	andi	a1,a1,15
	or	a1,a1,s1
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	andi	a1,a1,15
	or	a1,a1,s1
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	andi	a1,a1,15
	or	a1,a1,s1
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	ori	a1,s1,15
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE6:
	.size	_ZL11UNLYOKOSyncv, .-_ZL11UNLYOKOSyncv
	.section	.text._ZL19UNLYOKOStateRestorei,"ax",@progbits
	.align	2
	.type	_ZL19UNLYOKOStateRestorei, @function
_ZL19UNLYOKOStateRestorei:
.LFB19:
	.cfi_startproc
	tail	_ZL11UNLYOKOSyncv
	.cfi_endproc
.LFE19:
	.size	_ZL19UNLYOKOStateRestorei, .-_ZL19UNLYOKOStateRestorei
	.section	.text._ZL12UNLYOKOResetv,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOResetv, @function
_ZL12UNLYOKOResetv:
.LFB15:
	.cfi_startproc
	lla	a4,_ZL3dip
	lbu	a5,0(a4)
	la a3, _ZL4bank; sb zero, 0(a3);
	la a3, _ZL4mode; sb zero, 0(a3);
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,0(a4)
	tail	_ZL11UNLYOKOSyncv
	.cfi_endproc
.LFE15:
	.size	_ZL12UNLYOKOResetv, .-_ZL12UNLYOKOResetv
	.section	.text._ZL12UNLYOKOPowerv,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOPowerv, @function
_ZL12UNLYOKOPowerv:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a5, _ZL4bank; sb zero, 0(a5);
	la a5, _ZL4mode; sb zero, 0(a5);
	li	a5,3
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL3dip; sb a5, 0(a4);
	call	_ZL11UNLYOKOSyncv
	li	a1,20480
	lla	a2,_ZL14UNLYOKOReadDipj
	addi	a1,a1,1023
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	li	a0,20480
	lla	a2,_ZL14UNLYOKOReadLowj
	addi	a1,a1,-1
	addi	a0,a0,1024
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	li	a0,20480
	lla	a2,_ZL15UNLYOKOWriteLowjh
	addi	a1,a1,-1
	addi	a0,a0,1024
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL12UNLYOKOWritejh
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE13:
	.size	_ZL12UNLYOKOPowerv, .-_ZL12UNLYOKOPowerv
	.section	.text._ZL12UNLYOKOWritejh,"ax",@progbits
	.align	2
	.type	_ZL12UNLYOKOWritejh, @function
_ZL12UNLYOKOWritejh:
.LFB8:
	.cfi_startproc
	li	a4,36864
	addi	a4,a4,-1001
	li	a5,36864
	and	a0,a0,a4
	addi	a5,a5,-1025
	bleu	a0,a5,.L30
	li	a5,-36864
	addi	a5,a5,1024
	add	a0,a0,a5
	li	a5,23
	bgtu	a0,a5,.L14
	lla	a4,.L22
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL12UNLYOKOWritejh,"a",@progbits
	.align	2
	.align	2
.L22:
	.word	.L28-.L22
	.word	.L27-.L22
	.word	.L26-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L25-.L22
	.word	.L24-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L14-.L22
	.word	.L23-.L22
	.word	.L21-.L22
	.section	.text._ZL12UNLYOKOWritejh
.L30:
	li	a5,36864
	addi	a5,a5,-2048
	beq	a0,a5,.L16
	bgtu	a0,a5,.L17
	li	a5,32768
	beq	a0,a5,.L18
	addi	a5,a5,1024
	bne	a0,a5,.L31
	la a5, _ZL4mode; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L14:
	ret
.L17:
	li	a5,36864
	addi	a5,a5,-2047
	bne	a0,a5,.L32
	lla	a3,_ZL8IRQCount
	lbu	a5,0(a3)
	la a4, _ZL4mode; lbu a4, 0(a4);
	slli	a1,a1,8
	andi	a4,a4,-128
	or	a5,a5,a1
	la a2, _ZL4IRQa; sb a4, 0(a2);
	sw	a5,0(a3)
	ret
.L24:
	la a5, _ZL3reg+4; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L25:
	la a5, _ZL3reg+3; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L26:
	la a5, _ZL3reg+2; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L27:
	la a5, _ZL3reg+1; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L21:
	la a5, _ZL3reg+6; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L23:
	la a5, _ZL3reg+5; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L28:
	la a5, _ZL3reg; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L16:
	lla	a3,_ZL8IRQCount
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L18:
	la a5, _ZL4bank; sb a1, 0(a5);
	tail	_ZL11UNLYOKOSyncv
.L31:
	ret
.L32:
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL12UNLYOKOWritejh, .-_ZL12UNLYOKOWritejh
	.section	.text._ZL7M83Syncv,"ax",@progbits
	.align	2
	.type	_ZL7M83Syncv, @function
_ZL7M83Syncv:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s5,4(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s4,8(sp)
	.cfi_offset 21, -28
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 20, -24
	lla	s5,_ZL4mode
	lbu	a5,0(s5)
	li	a4,2
	andi	a5,a5,3
	beq	a5,a4,.L34
	li	a4,3
	beq	a5,a4,.L35
	li	a4,1
	beq	a5,a4,.L36
	li	a0,1
	call	_Z9setmirrori
.L37:
	lla	s4,_ZL3reg
	la a5, _ZL8is2kbank; lbu a5, 0(a5);
	lbu	a1,0(s4)
	beq	a5,zero,.L38
	la a5, _ZL11isnot2kbank; lbu a5, 0(a5);
	beq	a5,zero,.L47
.L38:
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	lla	s1,_ZL3reg
	li	s0,0
	lla	s3,_ZL4bank
	li	s2,8192
.L40:
	lbu	a5,0(s3)
	lbu	a1,0(s1)
	mv	a0,s0
	slli	a5,a5,4
	andi	a5,a5,768
	or	a1,a5,a1
	addi	s0,s0,1024
	call	_Z7setchr1jj
	addi	s1,s1,1
	bne	s0,s2,.L40
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
.L39:
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a5,0(s5)
	andi	a5,a5,64
	beq	a5,zero,.L41
	lla	s0,_ZL4bank
	lbu	a1,0(s0)
	li	a0,32768
	andi	a1,a1,63
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	andi	a1,a1,48
	li	a0,49152
	ori	a1,a1,15
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L35:
	.cfi_restore_state
	li	a0,3
	call	_Z9setmirrori
	j	.L37
.L41:
	lbu	a1,8(s4)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,9(s4)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,10(s4)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	li	a1,-1
	li	a0,57344
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L36:
	.cfi_restore_state
	li	a0,0
	call	_Z9setmirrori
	j	.L37
.L34:
	li	a0,2
	call	_Z9setmirrori
	j	.L37
.L47:
	li	a0,0
	call	_Z7setchr2jj
	lbu	a1,1(s4)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lbu	a1,6(s4)
	li	a0,4096
	call	_Z7setchr2jj
	lbu	a1,7(s4)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	j	.L39
	.cfi_endproc
.LFE7:
	.size	_ZL7M83Syncv, .-_ZL7M83Syncv
	.section	.text._ZL15M83StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL15M83StateRestorei, @function
_ZL15M83StateRestorei:
.LFB20:
	.cfi_startproc
	tail	_ZL7M83Syncv
	.cfi_endproc
.LFE20:
	.size	_ZL15M83StateRestorei, .-_ZL15M83StateRestorei
	.section	.text._ZL8M83Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M83Resetv, @function
_ZL8M83Resetv:
.LFB16:
	.cfi_startproc
	lla	a4,_ZL3dip
	lbu	a5,0(a4)
	xori	a5,a5,1
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
	.cfi_endproc
.LFE16:
	.size	_ZL8M83Resetv, .-_ZL8M83Resetv
	.section	.text._ZL8M83Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M83Writejh, @function
_ZL8M83Writejh:
.LFB9:
	.cfi_startproc
	li	a5,32768
	addi	a5,a5,791
	li	a4,32768
	bgtu	a0,a5,.L51
	li	a5,32768
	addi	a5,a5,767
	bleu	a0,a5,.L72
	li	a5,-32768
	addi	a5,a5,-768
	add	a0,a0,a5
	li	a5,23
	bgtu	a0,a5,.L50
	lla	a4,.L59
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M83Writejh,"a",@progbits
	.align	2
	.align	2
.L59:
	.word	.L69-.L59
	.word	.L68-.L59
	.word	.L67-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L50-.L59
	.word	.L66-.L59
	.word	.L65-.L59
	.word	.L64-.L59
	.word	.L63-.L59
	.word	.L62-.L59
	.word	.L61-.L59
	.word	.L60-.L59
	.word	.L58-.L59
	.section	.text._ZL8M83Writejh
.L72:
	li	a5,32768
	addi	a5,a5,512
	beq	a0,a5,.L53
	bgtu	a0,a5,.L54
	beq	a0,a4,.L55
	li	a5,32768
	addi	a5,a5,256
	bne	a0,a5,.L73
	lla	a4,_ZL4mode
	lbu	a5,0(a4)
	andi	a5,a5,64
	or	a5,a1,a5
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L51:
	li	a5,45056
	andi	a4,a0,-257
	addi	a5,a5,255
	li	a3,45056
	beq	a4,a5,.L71
	beq	a0,a3,.L71
.L50:
	ret
.L54:
	li	a5,32768
	addi	a5,a5,513
	bne	a0,a5,.L74
	lla	a3,_ZL8IRQCount
	lbu	a5,0(a3)
	la a4, _ZL4mode; lbu a4, 0(a4);
	slli	a1,a1,8
	andi	a4,a4,-128
	or	a5,a5,a1
	la a2, _ZL4IRQa; sb a4, 0(a2);
	sw	a5,0(a3)
	ret
.L60:
	la a5, _ZL3reg+6; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L61:
	la a5, _ZL3reg+5; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL11isnot2kbank; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L62:
	la a5, _ZL3reg+4; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL11isnot2kbank; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L63:
	la a5, _ZL3reg+3; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL11isnot2kbank; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L64:
	la a5, _ZL3reg+2; sb a1, 0(a5);
	li	a5,1
	la a4, _ZL11isnot2kbank; sb a5, 0(a4);
	tail	_ZL7M83Syncv
.L65:
	la a5, _ZL3reg+1; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L66:
	la a5, _ZL3reg; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L67:
	lla	a4,_ZL4mode
	lbu	a5,0(a4)
	la a3, _ZL3reg+10; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L68:
	lla	a4,_ZL4mode
	lbu	a5,0(a4)
	la a3, _ZL3reg+9; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L69:
	lla	a4,_ZL4mode
	lbu	a5,0(a4)
	la a3, _ZL3reg+8; sb a1, 0(a3);
	andi	a5,a5,-65
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L58:
	la a5, _ZL3reg+7; sb a1, 0(a5);
	tail	_ZL7M83Syncv
.L55:
	li	a5,1
	la a4, _ZL8is2kbank; sb a5, 0(a4);
.L71:
	lla	a4,_ZL4mode
	lbu	a5,0(a4)
	la a3, _ZL4bank; sb a1, 0(a3);
	ori	a5,a5,64
	sb	a5,0(a4)
	tail	_ZL7M83Syncv
.L53:
	lla	a3,_ZL8IRQCount
	lw	a5,0(a3)
	li	a4,65536
	addi	a4,a4,-256
	and	a5,a5,a4
	or	a5,a5,a1
	li	a0,1
	sw	a5,0(a3)
	tail	_Z12X6502_IRQEndi
.L73:
	ret
.L74:
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL8M83Writejh, .-_ZL8M83Writejh
	.section	.text._ZL8M83Closev,"ax",@progbits
	.align	2
	.type	_ZL8M83Closev, @function
_ZL8M83Closev:
.LFB17:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L81
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L81:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE17:
	.size	_ZL8M83Closev, .-_ZL8M83Closev
	.section	.text._ZL8M83Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M83Powerv, @function
_ZL8M83Powerv:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL8is2kbank; sb zero, 0(a5);
	la a5, _ZL11isnot2kbank; sb zero, 0(a5);
	la a5, _ZL4bank; sb zero, 0(a5);
	la a5, _ZL4mode; sb zero, 0(a5);
	la a5, _ZL3dip; sb zero, 0(a5);
	call	_ZL7M83Syncv
	lla	a2,_ZL14UNLYOKOReadDipj
	li	a1,20480
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL14UNLYOKOReadLowj
	addi	a1,a1,259
	addi	a0,a0,256
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL15UNLYOKOWriteLowjh
	addi	a1,a1,259
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_Z6CartBWjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL8M83Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL8WRAMSIZE; lw a0, 0(a0);
	la a2, _ZL4WRAM; lw a2, 0(a2);
	li	a1,24576
	srli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE14:
	.size	_ZL8M83Powerv, .-_ZL8M83Powerv
	.section	.text._ZL14UNLYOKOIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL14UNLYOKOIRQHooki, @function
_ZL14UNLYOKOIRQHooki:
.LFB18:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L91
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQCount
	lw	a5,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	sub	a5,a5,a0
	sw	a5,0(s0)
	blt	a5,zero,.L94
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L91:
	ret
.L94:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,65536
	addi	a5,a5,-1
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	_ZL14UNLYOKOIRQHooki, .-_ZL14UNLYOKOIRQHooki
	.section	.text._Z12UNLYOKO_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12UNLYOKO_InitP8CartInfo
	.hidden	_Z12UNLYOKO_InitP8CartInfo
	.type	_Z12UNLYOKO_InitP8CartInfo, @function
_Z12UNLYOKO_InitP8CartInfo:
.LFB21:
	.cfi_startproc
	lla	a5,_ZL12UNLYOKOPowerv
	sw	a5,0(a0)
	lla	a5,_ZL12UNLYOKOResetv
	sw	a5,4(a0)
	lla	a5,_ZL14UNLYOKOIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL19UNLYOKOStateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE21:
	.size	_Z12UNLYOKO_InitP8CartInfo, .-_Z12UNLYOKO_InitP8CartInfo
	.section	.rodata._Z13Mapper83_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z13Mapper83_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper83_InitP8CartInfo
	.hidden	_Z13Mapper83_InitP8CartInfo
	.type	_Z13Mapper83_InitP8CartInfo, @function
_Z13Mapper83_InitP8CartInfo:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,_ZL8M83Powerv
	sw	a5,0(a0)
	lla	a5,_ZL8M83Resetv
	sw	a5,4(a0)
	lla	a5,_ZL8M83Closev
	sw	a5,8(a0)
	lla	a5,_ZL14UNLYOKOIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL15M83StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,_ZL4WRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE22:
	.size	_Z13Mapper83_InitP8CartInfo, .-_Z13Mapper83_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"MODE"
	.align	2
.LC2:
	.string	"BANK"
	.align	2
.LC3:
	.string	"IRQC"
	.align	2
.LC4:
	.string	"IRQA"
	.align	2
.LC5:
	.string	"REGS"
	.align	2
.LC6:
	.string	"LOWR"
	.align	2
.LC7:
	.string	"IS2K"
	.align	2
.LC8:
	.string	"NT2K"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 108
_ZL9StateRegs:
	.word	_ZL4mode
	.word	1
	.word	.LC1
	.word	_ZL4bank
	.word	1
	.word	.LC2
	.word	_ZL8IRQCount
	.word	4
	.word	.LC3
	.word	_ZL4IRQa
	.word	1
	.word	.LC4
	.word	_ZL3reg
	.word	11
	.word	.LC5
	.word	_ZL3low
	.word	4
	.word	.LC6
	.word	_ZL8is2kbank
	.word	1
	.word	.LC7
	.word	_ZL11isnot2kbank
	.word	1
	.word	.LC8
	.word	0
	.zero	8
	.section	.sbss._ZL11isnot2kbank,"aw",@nobits
	.type	_ZL11isnot2kbank, @object
	.size	_ZL11isnot2kbank, 1
_ZL11isnot2kbank:
	.zero	1
	.section	.sbss._ZL8is2kbank,"aw",@nobits
	.type	_ZL8is2kbank, @object
	.size	_ZL8is2kbank, 1
_ZL8is2kbank:
	.zero	1
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
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	2
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 4
_ZL8IRQCount:
	.zero	4
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL3dip,"aw",@nobits
	.type	_ZL3dip, @object
	.size	_ZL3dip, 1
_ZL3dip:
	.zero	1
	.section	.sbss._ZL3low,"aw",@nobits
	.align	2
	.type	_ZL3low, @object
	.size	_ZL3low, 4
_ZL3low:
	.zero	4
	.section	.bss._ZL3reg,"aw",@nobits
	.align	2
	.type	_ZL3reg, @object
	.size	_ZL3reg, 11
_ZL3reg:
	.zero	11
	.section	.sbss._ZL4bank,"aw",@nobits
	.type	_ZL4bank, @object
	.size	_ZL4bank, 1
_ZL4bank:
	.zero	1
	.section	.sbss._ZL4mode,"aw",@nobits
	.type	_ZL4mode, @object
	.size	_ZL4mode, 1
_ZL4mode:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
