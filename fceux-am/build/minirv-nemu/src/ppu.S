#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ppu.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL5B2002jh,"ax",@progbits
	.align	2
	.type	_ZL5B2002jh, @function
_ZL5B2002jh:
.LFB98:
	.cfi_startproc
	la a5, PPUGenLatch; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE98:
	.size	_ZL5B2002jh, .-_ZL5B2002jh
	.section	.text._ZL5B2003jh,"ax",@progbits
	.align	2
	.type	_ZL5B2003jh, @function
_ZL5B2003jh:
.LFB99:
	.cfi_startproc
	andi	a5,a1,7
	la a4, PPUGenLatch; sb a1, 0(a4);
	la a4, PPU+3; sb a1, 0(a4);
	la a4, PPUSPL; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE99:
	.size	_ZL5B2003jh, .-_ZL5B2003jh
	.section	.text._ZL14CheckSpriteHiti,"ax",@progbits
	.align	2
	.type	_ZL14CheckSpriteHiti, @function
_ZL14CheckSpriteHiti:
.LFB110:
	.cfi_startproc
	lla	t4,_ZL6sphitx
	lw	a5,0(t4)
	li	a4,256
	addi	a0,a0,-16
	beq	a5,a4,.L4
	bge	a5,a0,.L4
	la a7, _ZL9sphitdata; lbu a7, 0(a7);
	la a6, _ZL6Plinef; lw a6, 0(a6);
	li	a3,0
	li	a1,128
	li	t3,254
	li	t1,7
	j	.L7
.L13:
	addi	a3,a3,1
	beq	a0,a5,.L4
.L7:
	sra	a4,a1,a3
	and	a4,a4,a7
	add	a2,a6,a5
	beq	a4,zero,.L6
	lbu	a4,0(a2)
	andi	a4,a4,64
	bne	a4,zero,.L6
	ble	a5,t3,.L12
.L6:
	addi	a5,a5,1
	bne	a3,t1,.L13
.L4:
	ret
.L12:
	lla	a4,PPU
	lbu	a5,2(a4)
	li	a3,256
	sw	a3,0(t4)
	ori	a5,a5,64
	sb	a5,2(a4)
	ret
	.cfi_endproc
.LFE110:
	.size	_ZL14CheckSpriteHiti, .-_ZL14CheckSpriteHiti
	.section	.text._ZL5B4014jh,"ax",@progbits
	.align	2
	.type	_ZL5B4014jh, @function
_ZL5B4014jh:
.LFB104:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	slli	s0,a1,8
	li	s1,8192
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	mv	s3,a1
	addi	s2,s0,256
	addi	s1,s1,4
.L15:
	mv	a0,s0
	call	_Z9X6502_DMRj
	mv	a1,a0
	addi	s0,s0,1
	mv	a0,s1
	call	_Z9X6502_DMWjh
	bne	s0,s2,.L15
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	la a5, SpriteDMA; sb s3, 0(a5);
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE104:
	.size	_ZL5B4014jh, .-_ZL5B4014jh
	.section	.text._Z22FFCEUX_PPURead_Defaultj,"ax",@progbits
	.align	2
	.globl	_Z22FFCEUX_PPURead_Defaultj
	.hidden	_Z22FFCEUX_PPURead_Defaultj
	.type	_Z22FFCEUX_PPURead_Defaultj, @function
_Z22FFCEUX_PPURead_Defaultj:
.LFB90:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, PPU_hook; lw a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L19
	jalr	a5
.L19:
	li	a5,8192
	bltu	s0,a5,.L42
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L22
	srli	a4,s0,8
	andi	a4,a4,12
	lla	a5,vnapage
	add	a5,a5,a4
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	a5,a5,s0
	lbu	a0,0(a5)
.L21:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L22:
	.cfi_restore_state
	la a4, PPU+1; lbu a4, 0(a4);
	andi	a5,s0,3
	andi	a4,a4,1
	bne	a5,zero,.L23
	andi	a5,s0,12
	bne	a5,zero,.L24
	la a0, PALRAM; lbu a0, 0(a0);
	beq	a4,zero,.L21
	andi	a0,a0,48
.L43:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L42:
	.cfi_restore_state
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	add	a5,a5,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lbu	a0,0(a5)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L23:
	.cfi_restore_state
	andi	s0,s0,31
	lla	a5,PALRAM
	add	a5,a5,s0
	lbu	a0,0(a5)
	beq	a4,zero,.L21
	andi	a0,a0,48
	j	.L43
.L24:
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,UPALRAM
	add	a5,a5,s0
	lbu	a0,-1(a5)
	beq	a4,zero,.L21
	andi	a0,a0,48
	j	.L43
	.cfi_endproc
.LFE90:
	.size	_Z22FFCEUX_PPURead_Defaultj, .-_Z22FFCEUX_PPURead_Defaultj
	.section	.text._ZL5B2004jh,"ax",@progbits
	.align	2
	.type	_ZL5B2004jh, @function
_ZL5B2004jh:
.LFB100:
	.cfi_startproc
	lla	a4,PPU
	la a5, PPUGenLatch; sb a1, 0(a5);
	la a3, newppu; lw a3, 0(a3);
	lbu	a5,3(a4)
	beq	a3,zero,.L45
	andi	a3,a5,3
	li	a2,2
	beq	a3,a2,.L50
	lla	a3,SPRAM
	add	a3,a3,a5
	addi	a5,a5,1
	sb	a1,0(a3)
	sb	a5,3(a4)
	ret
.L45:
	lla	a2,PPUSPL
	lbu	a3,0(a2)
	li	a0,7
	bgtu	a3,a0,.L51
	lla	a0,SPRAM
	add	a0,a0,a3
	sb	a1,0(a0)
.L49:
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a5,3(a4)
	sb	a3,0(a2)
	ret
.L51:
	bleu	a5,a0,.L49
	lla	a0,SPRAM
	add	a0,a0,a5
	sb	a1,0(a0)
	addi	a5,a5,1
	addi	a3,a3,1
	sb	a5,3(a4)
	sb	a3,0(a2)
	ret
.L50:
	lla	a3,SPRAM
	add	a3,a3,a5
	andi	a1,a1,227
	addi	a5,a5,1
	sb	a1,0(a3)
	sb	a5,3(a4)
	ret
	.cfi_endproc
.LFE100:
	.size	_ZL5B2004jh, .-_ZL5B2004jh
	.section	.rodata._ZL11RefreshLinei.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/ppu.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._ZL11RefreshLinei,"ax",@progbits
	.align	2
	.type	_ZL11RefreshLinei, @function
_ZL11RefreshLinei:
.LFB111:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sw	s2,64(sp)
	sw	s9,36(sp)
	sw	ra,76(sp)
	.cfi_offset 18, -16
	.cfi_offset 25, -44
	.cfi_offset 1, -4
	lla	s9,RefreshAddr
	sw	s1,68(sp)
	sw	s11,28(sp)
	la a4, _ZL6sphitx; lw a4, 0(a4);
	li	a3,256
	lw	a5,0(s9)
	mv	s2,a0
	srai	t5,a0,3
	.cfi_offset 9, -12
	.cfi_offset 27, -52
	beq	a4,a3,.L53
	la a3, PPU+2; lbu a3, 0(a3);
	andi	a3,a3,64
	beq	a3,zero,.L116
.L53:
	li	a4,34
	mv	s1,t5
	ble	t5,a4,.L54
	li	s1,34
.L54:
	lla	a4,_ZL9firsttile
	lw	t4,0(a4)
	sub	s11,s1,t4
	ble	s11,zero,.L52
	sw	s0,72(sp)
	lla	a3,_ZL5Pline
	la a4, PPU_hook; lw a4, 0(a4);
	.cfi_offset 8, -8
	lw	s0,0(a3)
	bne	a4,zero,.L117
	la a4, PEC586Hack; lw a4, 0(a4);
	bne	a4,zero,.L118
	la a4, MMC5Hack; lw a4, 0(a4);
	bne	a4,zero,.L119
	la a6, QTAIHack; lw a6, 0(a6);
	sw	s3,60(sp)
	.cfi_offset 19, -20
	bne	a6,zero,.L120
	sw	s8,40(sp)
	.cfi_offset 24, -40
	lla	s8,PPU
	lbu	a4,1(s8)
	lla	t0,PALRAM
	lbu	t2,0(t0)
	andi	a1,a4,1
	lbu	a2,0(s8)
	andi	a3,t2,48
	beq	a1,zero,.L121
	ori	a3,a3,64
	andi	a3,a3,0xff
	andi	a1,a4,24
	sw	a3,8(sp)
	beq	a1,zero,.L122
.L63:
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s10,32(sp)
	la a3, _ZL16PALcache_outdate; lw a3, 0(a3);
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 26, -48
	beq	a3,zero,.L65
	lbu	s4,4(t0)
	lbu	s3,8(t0)
	lbu	ra,12(t0)
	lla	t3,PALRAM
	ori	a7,s4,64
	ori	a0,s3,64
	ori	a3,t2,64
	ori	a1,ra,64
	sb	a7,4(t0)
	sb	a0,8(t0)
	sb	a3,0(t0)
	sb	a1,12(t0)
	lla	t1,_ZL8PALcache
	mv	t0,t3
	mv	a7,t3
	lla	a0,PALRAM+16
	li	t6,256
.L66:
	lb	s6,0(a7)
	mv	s5,t1
	mv	a3,t3
	slli	s6,s6,8
.L67:
	lbu	a1,0(a3)
	addi	s5,s5,2
	addi	a3,a3,1
	or	a1,s6,a1
	sh	a1,-2(s5)
	bne	a0,a3,.L67
	addi	a6,a6,16
	addi	a7,a7,1
	addi	t1,t1,32
	bne	a6,t6,.L66
	andi	t2,t2,63
	andi	s4,s4,63
	andi	s3,s3,63
	andi	ra,ra,63
	sb	t2,0(t0)
	sb	s4,4(t0)
	sb	s3,8(t0)
	sb	ra,12(t0)
	la a3, _ZL16PALcache_outdate; sw zero, 0(a3);
.L65:
	srli	a3,a5,8
	andi	a3,a3,12
	lla	a1,vnapage
	add	a3,a1,a3
	andi	s10,a5,3
	lw	t6,0(a3)
	mv	t1,s10
	beq	s10,zero,.L69
	srli	a3,a5,2
	andi	a1,a3,0xff
	srli	a1,a1,2
	andi	a0,a1,56
	andi	a3,a3,7
	or	a3,a3,a0
	ori	a3,a3,960
	add	a3,t6,a3
	lbu	t1,0(a3)
	andi	a1,a1,4
	slli	t1,t1,2
	sra	t1,t1,a1
.L69:
	bge	t4,s1,.L70
	slli	t0,a2,8
	lla	a1,_ZZL11RefreshLineiE7atlatch
	lla	a2,_ZZL11RefreshLineiE6pshift
	li	a0,4096
	lw	a3,0(a2)
	srli	a4,a5,12
	lw	a2,4(a2)
	lw	a1,0(a1)
	and	t0,t0,a0
	andi	a4,a4,7
	la s4, XOffset; lbu s4, 0(s4);
	li	t2,8
	sw	s7,44(sp)
	mv	a6,t4
	sw	t4,12(sp)
	or	t0,t0,a4
	mv	t4,s10
	sub	t2,t2,s4
	mv	s10,s11
	lla	s3,VPage
	li	ra,1
	.cfi_offset 23, -36
	lla	s7,_ZL7ppulut1
	lla	s6,_ZL7ppulut2
	lla	s5,_ZL7ppulut3
	lla	t3,_ZL8PALcache
	li	a0,31
	mv	s11,t5
.L75:
	ble	a6,ra,.L71
	srl	t5,a3,t2
	srl	a7,a2,t2
	andi	t5,t5,255
	andi	a7,a7,255
	slli	a4,a1,3
	slli	t5,t5,2
	slli	a7,a7,2
	or	a4,a4,s4
	add	t5,s7,t5
	add	a7,s6,a7
	slli	a4,a4,2
	lw	a7,0(a7)
	lw	t5,0(t5)
	add	a4,s5,a4
	lw	a4,0(a4)
	or	t5,t5,a7
	addi	s0,s0,8
	or	a4,t5,a4
	andi	a7,a4,255
	slli	a7,a7,1
	add	a7,a7,t3
	lhu	t5,0(a7)
	srli	a7,a4,7
	andi	a7,a7,510
	sh	t5,-8(s0)
	add	a7,a7,t3
	lhu	t5,0(a7)
	srli	a7,a4,15
	andi	a7,a7,510
	sh	t5,-6(s0)
	add	a7,a7,t3
	lhu	a7,0(a7)
	srli	a4,a4,24
	slli	a4,a4,1
	sh	a7,-4(s0)
	add	a4,a4,t3
	lhu	a4,0(a4)
	sh	a4,-2(s0)
.L71:
	andi	a4,a5,1023
	add	a4,t6,a4
	lbu	a7,0(a4)
	slli	a7,a7,4
	add	a7,a7,t0
	bne	t4,zero,.L72
	srli	a4,a5,2
	andi	t4,a4,0xff
	srli	t4,t4,2
	andi	t1,t4,56
	andi	a4,a4,7
	or	a4,a4,t1
	ori	a4,a4,960
	add	a4,t6,a4
	lbu	t1,0(a4)
	andi	t4,t4,4
	slli	t1,t1,2
	sra	t1,t1,t4
.L72:
	srli	a4,a7,10
	slli	a4,a4,2
	add	a4,s3,a4
	lw	t4,0(a4)
	andi	a4,a5,2
	srl	a4,t1,a4
	add	a7,t4,a7
	lbu	t5,0(a7)
	lbu	t4,8(a7)
	andi	a4,a4,12
	srli	a1,a1,2
	slli	a3,a3,8
	slli	a2,a2,8
	andi	a7,a5,31
	or	a1,a4,a1
	or	a3,a3,t5
	or	a2,a2,t4
	beq	a7,a0,.L123
	addi	a5,a5,1
.L74:
	addi	a6,a6,1
	beq	s1,a6,.L109
	andi	t4,a5,3
	j	.L75
.L109:
	lla	a0,_ZZL11RefreshLineiE7atlatch
	lw	t4,12(sp)
	lbu	a4,1(s8)
	lw	s7,44(sp)
	.cfi_restore 23
	sw	a1,0(a0)
	lla	a1,_ZZL11RefreshLineiE6pshift
	mv	t5,s11
	sw	a2,4(a1)
	mv	s11,s10
	sw	a3,0(a1)
.L70:
	sw	a5,0(s9)
	li	a5,2
	ble	t4,a5,.L76
	andi	a4,a4,8
	beq	a4,zero,.L124
.L78:
	li	a5,267
	ble	s2,a5,.L85
	la a5, _ZL5tofix; lw a5, 0(a5);
	bne	a5,zero,.L125
.L85:
	mv	a0,s2
	call	_ZL14CheckSpriteHiti
	lla	a5,_ZL5Pline
	sw	s0,0(a5)
	lw	s3,60(sp)
	.cfi_restore 19
	lw	s0,72(sp)
	.cfi_restore 8
	lw	s4,56(sp)
	.cfi_restore 20
	lw	s5,52(sp)
	.cfi_restore 21
	lw	s6,48(sp)
	.cfi_restore 22
	lw	s8,40(sp)
	.cfi_restore 24
	lw	s10,32(sp)
	.cfi_restore 26
	lla	a5,_ZL9firsttile
	sw	s1,0(a5)
.L52:
	lw	ra,76(sp)
	.cfi_restore 1
	lw	s1,68(sp)
	.cfi_restore 9
	lw	s2,64(sp)
	.cfi_restore 18
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L121:
	.cfi_def_cfa_offset 80
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	slli	a3,t2,24
	srai	a3,a3,24
	ori	a3,a3,64
	andi	a3,a3,0xff
	andi	a1,a4,24
	sw	a3,8(sp)
	bne	a1,zero,.L63
	j	.L122
.L116:
	.cfi_restore 8
	.cfi_restore 19
	.cfi_restore 24
	addi	a3,a0,-16
	bge	a4,a3,.L53
	addi	a3,t5,-2
	slli	a3,a3,3
	slt	a4,a4,a3
	seqz	a4,a4
	add	t5,t5,a4
	j	.L53
.L122:
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 24, -40
	lw	a1,8(sp)
	slli	s3,s11,3
	mv	a2,s3
	mv	a0,s0
	call	memset
	lla	a5,_ZL5Pline
	add	s3,s0,s3
	sw	s3,0(a5)
	lla	a5,_ZL9firsttile
	sw	s1,0(a5)
	li	a5,267
	ble	s2,a5,.L113
	la a5, _ZL5tofix; lw a5, 0(a5);
	beq	a5,zero,.L113
	lw	s0,72(sp)
	.cfi_restore 8
	lw	s3,60(sp)
	.cfi_restore 19
	lw	s8,40(sp)
	.cfi_restore 24
	la a5, _ZL5tofix; sw zero, 0(a5);
	j	.L52
.L123:
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	xori	a5,a5,1055
	srli	a4,a5,8
	andi	a4,a4,12
	lla	a7,vnapage
	add	a4,a7,a4
	lw	t6,0(a4)
	j	.L74
.L76:
	.cfi_restore 23
	ble	t5,a5,.L80
	andi	a3,a4,2
	bne	a3,zero,.L81
	lw	a2,8(sp)
	lla	a3,_ZL6Plinef
	lw	a1,0(a3)
	slli	a4,a2,8
	add	a4,a4,a2
	slli	a2,a4,16
	add	a4,a4,a2
	sw	a4,0(a1)
	lbu	a2,1(s8)
	sw	a4,4(a1)
	andi	a4,a2,8
	bne	a4,zero,.L78
	beq	t4,a5,.L114
	addi	s11,s1,-2
.L114:
	li	a5,0
	j	.L79
.L113:
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 26
	lw	s0,72(sp)
	.cfi_restore 8
	lw	ra,76(sp)
	.cfi_restore 1
	lw	s3,60(sp)
	.cfi_restore 19
	lw	s8,40(sp)
	.cfi_restore 24
	lw	s1,68(sp)
	.cfi_restore 9
	lw	s2,64(sp)
	.cfi_restore 18
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L124:
	.cfi_def_cfa_offset 80
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	addi	a5,t4,-2
	slli	a5,a5,3
	lla	a3,_ZL6Plinef
.L79:
	lw	a0,0(a3)
	lw	a1,8(sp)
	slli	a2,s11,3
	add	a0,a0,a5
	call	memset
	j	.L78
.L80:
	andi	a4,a4,8
	bne	a4,zero,.L78
	bne	t4,a5,.L78
	li	a5,0
	lla	a3,_ZL6Plinef
	j	.L79
.L125:
	lbu	a5,1(s8)
	andi	a5,a5,24
	beq	a5,zero,.L86
	lw	a4,0(s9)
	li	a3,28672
	li	a5,4096
	and	a2,a4,a3
	add	a5,a4,a5
	beq	a2,a3,.L126
.L89:
	sw	a5,0(s9)
.L86:
	la a5, _ZL5tofix; sw zero, 0(a5);
	j	.L85
.L81:
	andi	a4,a4,8
	bne	a4,zero,.L78
	lla	a3,_ZL6Plinef
	beq	t4,a5,.L114
	addi	s11,s1,-2
	li	a5,0
	lla	a3,_ZL6Plinef
	j	.L79
.L126:
	andi	a3,a4,992
	li	a1,928
	xor	a5,a4,a2
	beq	a3,a1,.L127
	li	a2,992
	addi	a5,a5,32
	bne	a3,a2,.L89
	li	a5,28672
	addi	a5,a5,992
	xor	a5,a4,a5
	sw	a5,0(s9)
	j	.L86
.L127:
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	sw	a5,0(s9)
	j	.L86
.L119:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 24
	.cfi_restore 26
	sw	s3,60(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s10,32(sp)
	li	a2,1121
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
.L115:
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
.L120:
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 26
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s10,32(sp)
	li	a2,1122
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	j	.L115
.L118:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 26
	sw	s3,60(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s10,32(sp)
	li	a2,1120
	.cfi_remember_state
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	j	.L115
.L117:
	.cfi_restore_state
	sw	s3,60(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s10,32(sp)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	li	a2,1119
	j	.L115
	.cfi_endproc
.LFE111:
	.size	_ZL11RefreshLinei, .-_ZL11RefreshLinei
	.globl	__udivsi3
	.section	.text._ZL5A200xj,"ax",@progbits
	.align	2
	.type	_ZL5A200xj, @function
_ZL5A200xj:
.LFB94:
	.cfi_startproc
	la a5, newppu; lw a5, 0(a5);
	bne	a5,zero,.L137
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L137
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	la a4, linestartts; lw a4, 0(a4);
	slli	a5,a5,4
	sub	a5,a5,a4
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L131
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L131:
	call	_ZL11RefreshLinei
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, PPUGenLatch; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L137:
	la a0, PPUGenLatch; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE94:
	.size	_ZL5A200xj, .-_ZL5A200xj
	.section	.text._ZL5A2002j,"ax",@progbits
	.align	2
	.type	_ZL5A2002j, @function
_ZL5A2002j:
.LFB92:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, newppu; lw a5, 0(a5);
	bne	a5,zero,.L141
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L141
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L143
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L143:
	call	_ZL11RefreshLinei
.L141:
	lla	a4,PPUGenLatch
	lbu	a0,0(a4)
	lla	a3,PPU
	lbu	a5,2(a3)
	andi	a0,a0,31
	la a2, vtoggle; sb zero, 0(a2);
	or	a0,a5,a0
	andi	a5,a5,127
	sb	a5,2(a3)
	sb	a0,0(a4)
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE92:
	.size	_ZL5A2002j, .-_ZL5A2002j
	.section	.text._ZL7ResetRLPh,"ax",@progbits
	.align	2
	.type	_ZL7ResetRLPh, @function
_ZL7ResetRLPh:
.LFB105:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,256
	li	a1,255
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	memset
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	la a0, X+16; lw a0, 0(a0);
	slli	a5,a5,4
	add	a5,a5,a0
	la a4, linestartts; sw a5, 0(a4);
	la a5, _ZL5tofix; sw zero, 0(a5);
	la a4, _ZL6Plinef; sw s0, 0(a4);
	la a4, _ZL5Pline; sw s0, 0(a4);
	la a4, _ZL9firsttile; sw zero, 0(a4);
	la a5, newppu; lw a5, 0(a5);
	bne	a5,zero,.L150
	beq	s0,zero,.L150
	neg	a5,a0
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L152
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L152:
	call	_ZL11RefreshLinei
.L150:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	li	a5,1
	la a4, _ZL5tofix; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE105:
	.size	_ZL7ResetRLPh, .-_ZL7ResetRLPh
	.section	.text._ZL5B2001jh,"ax",@progbits
	.align	2
	.type	_ZL5B2001jh, @function
_ZL5B2001jh:
.LFB97:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, newppu; lw a5, 0(a5);
	mv	s0,a1
	bne	a5,zero,.L159
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L159
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L161
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L161:
	call	_ZL11RefreshLinei
.L159:
	la a5, paldeemphswap; lbu a5, 0(a5);
	beq	a5,zero,.L162
	srli	a5,s0,1
	andi	a4,s0,-97
	andi	a5,a5,32
	slli	s0,s0,1
	or	a5,a5,a4
	andi	s0,s0,64
	or	s0,a5,s0
.L162:
	la a5, PPUGenLatch; sb s0, 0(a5);
	la a5, PPU+1; sb s0, 0(a5);
	li	a5,31
	bleu	s0,a5,.L158
	srli	s0,s0,5
	la a5, _ZL5deemp; sb s0, 0(a5);
.L158:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE97:
	.size	_ZL5B2001jh, .-_ZL5B2001jh
	.section	.text._Z19newppu_get_scanlinev,"ax",@progbits
	.align	2
	.globl	_Z19newppu_get_scanlinev
	.hidden	_Z19newppu_get_scanlinev
	.type	_Z19newppu_get_scanlinev, @function
_Z19newppu_get_scanlinev:
.LFB79:
	.cfi_startproc
	la a0, ppur+52; lw a0, 0(a0);
	ret
	.cfi_endproc
.LFE79:
	.size	_Z19newppu_get_scanlinev, .-_Z19newppu_get_scanlinev
	.section	.text._Z14newppu_get_dotv,"ax",@progbits
	.align	2
	.globl	_Z14newppu_get_dotv
	.hidden	_Z14newppu_get_dotv
	.type	_Z14newppu_get_dotv, @function
_Z14newppu_get_dotv:
.LFB80:
	.cfi_startproc
	la a0, ppur+56; lw a0, 0(a0);
	ret
	.cfi_endproc
.LFE80:
	.size	_Z14newppu_get_dotv, .-_Z14newppu_get_dotv
	.section	.text._Z28newppu_hacky_emergency_resetv,"ax",@progbits
	.align	2
	.globl	_Z28newppu_hacky_emergency_resetv
	.hidden	_Z28newppu_hacky_emergency_resetv
	.type	_Z28newppu_hacky_emergency_resetv, @function
_Z28newppu_hacky_emergency_resetv:
.LFB81:
	.cfi_startproc
	lla	a5,ppur
	lw	a4,60(a5)
	bne	a4,zero,.L174
	la a4, ppur+16; sw zero, 0(a4);
	la a4, ppur+12; sw zero, 0(a4);
	la a4, ppur+8; sw zero, 0(a4);
	la a4, ppur+4; sw zero, 0(a4);
	la a4, ppur; sw zero, 0(a4);
	la a4, ppur+44; sw zero, 0(a4);
	la a4, ppur+48; sw zero, 0(a4);
	la a4, ppur+40; sw zero, 0(a4);
	la a4, ppur+36; sw zero, 0(a4);
	la a4, ppur+32; sw zero, 0(a4);
	la a4, ppur+28; sw zero, 0(a4);
	la a4, ppur+24; sw zero, 0(a4);
	la a4, ppur+20; sw zero, 0(a4);
	la a4, ppur+56; sw zero, 0(a4);
	li	a4,341
	sw	a4,60(a5)
	li	a4,241
	sw	a4,52(a5)
.L174:
	ret
	.cfi_endproc
.LFE81:
	.size	_Z28newppu_hacky_emergency_resetv, .-_Z28newppu_hacky_emergency_resetv
	.section	.text._Z19READPAL_MOTHEROFALLj,"ax",@progbits
	.align	2
	.globl	_Z19READPAL_MOTHEROFALLj
	.hidden	_Z19READPAL_MOTHEROFALLj
	.type	_Z19READPAL_MOTHEROFALLj, @function
_Z19READPAL_MOTHEROFALLj:
.LFB84:
	.cfi_startproc
	la a5, PPU+1; lbu a5, 0(a5);
	andi	a4,a0,3
	andi	a5,a5,1
	bne	a4,zero,.L177
	andi	a4,a0,12
	bne	a4,zero,.L178
	la a0, PALRAM; lbu a0, 0(a0);
	beq	a5,zero,.L180
	andi	a0,a0,48
.L180:
	ret
.L178:
	srli	a0,a0,2
	andi	a0,a0,3
	lla	a4,UPALRAM
	add	a4,a4,a0
	lbu	a0,-1(a4)
	beq	a5,zero,.L180
	andi	a0,a0,48
	ret
.L177:
	andi	a0,a0,31
	lla	a4,PALRAM
	add	a4,a4,a0
	lbu	a0,0(a4)
	beq	a5,zero,.L180
	andi	a0,a0,48
	ret
	.cfi_endproc
.LFE84:
	.size	_Z19READPAL_MOTHEROFALLj, .-_Z19READPAL_MOTHEROFALLj
	.section	.text._Z14FCEUPPU_GetCHRjj,"ax",@progbits
	.align	2
	.globl	_Z14FCEUPPU_GetCHRjj
	.hidden	_Z14FCEUPPU_GetCHRjj
	.type	_Z14FCEUPPU_GetCHRjj, @function
_Z14FCEUPPU_GetCHRjj:
.LFB85:
	.cfi_startproc
	la a4, MMC5Hack; lw a4, 0(a4);
	mv	a5,a0
	beq	a4,zero,.L194
	la a3, MMC5HackCHRMode; lbu a3, 0(a3);
	li	a4,1
	beq	a3,a4,.L197
	tail	_Z13MMC5BGVRAMADRj
.L197:
	andi	a1,a1,1023
	la a4, MMC5HackExNTARAMPtr; lw a4, 0(a4);
	add	a4,a4,a1
	lbu	a4,0(a4)
	la a3, MMC5HackVROMMask; lw a3, 0(a3);
	slli	a0,a0,20
	and	a4,a4,a3
	slli	a4,a4,12
	la a3, MMC50x5130; lbu a3, 0(a3);
	li	a5,258048
	and	a5,a4,a5
	srli	a0,a0,20
	slli	a4,a3,18
	li	a3,786432
	or	a5,a5,a0
	and	a4,a4,a3
	add	a5,a5,a4
	la a0, MMC5HackVROMPTR; lw a0, 0(a0);
	add	a0,a0,a5
	ret
.L194:
	srli	a3,a0,10
	slli	a3,a3,2
	lla	a4,VPage
	add	a4,a4,a3
	lw	a0,0(a4)
	add	a0,a0,a5
	ret
	.cfi_endproc
.LFE85:
	.size	_Z14FCEUPPU_GetCHRjj, .-_Z14FCEUPPU_GetCHRjj
	.section	.text._Z15FCEUPPU_GetAttriii,"ax",@progbits
	.align	2
	.globl	_Z15FCEUPPU_GetAttriii
	.hidden	_Z15FCEUPPU_GetAttriii
	.type	_Z15FCEUPPU_GetAttriii, @function
_Z15FCEUPPU_GetAttriii:
.LFB86:
	.cfi_startproc
	srai	a5,a2,2
	slli	a5,a5,3
	slli	a4,a2,1
	addi	a5,a5,960
	srai	a7,a1,2
	andi	a4,a4,4
	andi	a6,a1,2
	la a3, MMC5Hack; lw a3, 0(a3);
	add	a5,a5,a7
	or	a4,a4,a6
	beq	a3,zero,.L199
	la a6, MMC5HackCHRMode; lbu a6, 0(a6);
	li	a3,1
	beq	a6,a3,.L204
.L199:
	slli	a0,a0,2
	lla	a3,vnapage
	add	a3,a3,a0
	lw	a2,0(a3)
	li	a3,3
	sll	a3,a3,a4
	add	a5,a2,a5
	lbu	a0,0(a5)
	and	a0,a0,a3
	sra	a0,a0,a4
	ret
.L204:
	slli	a2,a2,5
	add	a1,a2,a1
	andi	a2,a1,1023
	la a5, MMC5HackExNTARAMPtr; lw a5, 0(a5);
	add	a5,a5,a2
	lbu	a0,0(a5)
	srli	a0,a0,6
	ret
	.cfi_endproc
.LFE86:
	.size	_Z15FCEUPPU_GetAttriii, .-_Z15FCEUPPU_GetAttriii
	.section	.text._Z23FFCEUX_PPUWrite_Defaultjh,"axG",@progbits,_Z23FFCEUX_PPUWrite_Defaultjh,comdat
	.align	2
	.weak	_Z23FFCEUX_PPUWrite_Defaultjh
	.hidden	_Z23FFCEUX_PPUWrite_Defaultjh
	.type	_Z23FFCEUX_PPUWrite_Defaultjh, @function
_Z23FFCEUX_PPUWrite_Defaultjh:
.LFB87:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	la a5, PPU_hook; lw a5, 0(a5);
	mv	s0,a0
	mv	s1,a1
	beq	a5,zero,.L206
	jalr	a5
.L206:
	li	a5,8192
	bgeu	s0,a5,.L207
	srli	a4,s0,10
	la a5, PPUCHRRAM; lbu a5, 0(a5);
	sra	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L205
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,s0
	sb	s1,0(a5)
.L205:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L207:
	.cfi_restore_state
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L209
	srli	a5,s0,10
	la a4, QTAIHack; lw a4, 0(a4);
	andi	a5,a5,3
	beq	a4,zero,.L210
	la a4, qtaintramreg; lbu a4, 0(a4);
	andi	a3,a4,1
	beq	a3,zero,.L210
	srli	a4,a4,1
	srl	a5,a5,a4
	slli	a5,a5,10
	andi	a5,a5,1024
	andi	s0,s0,1023
	or	a5,a5,s0
	lla	a4,QTAINTRAM
	add	a5,a4,a5
	sb	s1,0(a5)
	j	.L205
.L209:
	andi	a5,s0,3
	andi	a1,s1,63
	bne	a5,zero,.L211
	andi	a5,s0,12
	bne	a5,zero,.L212
	lla	a5,PALRAM
	sb	a1,12(a5)
	sb	a1,8(a5)
	sb	a1,4(a5)
	sb	a1,0(a5)
	sb	a1,28(a5)
	sb	a1,24(a5)
	sb	a1,20(a5)
	sb	a1,16(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L205
.L210:
	la a4, PPUNTARAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L205
	slli	a5,a5,2
	lla	a4,vnapage
	add	a5,a4,a5
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	a5,a5,s0
	sb	s1,0(a5)
	j	.L205
.L211:
	andi	s0,s0,31
	lla	a5,PALRAM
	add	a5,a5,s0
	sb	a1,0(a5)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L212:
	.cfi_restore_state
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,UPALRAM
	add	a5,a5,s0
	sb	a1,-1(a5)
	j	.L205
	.cfi_endproc
.LFE87:
	.size	_Z23FFCEUX_PPUWrite_Defaultjh, .-_Z23FFCEUX_PPUWrite_Defaultjh
	.section	.text._ZL5B2007jh,"ax",@progbits
	.align	2
	.type	_ZL5B2007jh, @function
_ZL5B2007jh:
.LFB103:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,RefreshAddr
	la a5, newppu; lw a5, 0(a5);
	lw	a3,0(s1)
	mv	a4,a1
	beq	a5,zero,.L230
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,ppur
	lw	a5,4(s0)
	lw	a2,8(s0)
	lw	a6,16(s0)
	lw	a3,12(s0)
	lw	a0,0(s0)
	slli	a5,a5,11
	slli	a2,a2,10
	or	a5,a5,a2
	or	a5,a5,a6
	slli	a3,a3,5
	or	a5,a5,a3
	slli	a0,a0,12
	or	a0,a0,a5
	slli	a0,a0,18
	srli	a0,a0,18
	la a5, PPUGenLatch; sb a1, 0(a5);
	sw	a0,0(s1)
	la a5, FFCEUX_PPUWrite; lw a5, 0(a5);
	beq	a5,zero,.L231
	jalr	a5
.L232:
	lw	a3,52(s0)
	li	a5,240
	lw	a4,12(s0)
	lw	a6,4(s0)
	lw	a0,0(s0)
	bleu	a3,a5,.L269
	lla	a5,PPU
.L233:
	lbu	a3,0(a5)
	lw	a1,16(s0)
	addi	a5,a4,1
	andi	a3,a3,4
	beq	a3,zero,.L272
.L239:
	lw	a3,8(s0)
	srli	a2,a5,5
	andi	a4,a5,31
	add	a2,a2,a3
	srli	a5,a2,1
	add	a5,a5,a6
	srli	a3,a5,1
	add	a3,a3,a0
	andi	a1,a1,31
	andi	a2,a2,1
	andi	a5,a5,1
	andi	a3,a3,7
	sw	a4,12(s0)
	sw	a1,16(s0)
	sw	a2,8(s0)
	sw	a5,4(s0)
	sw	a3,0(s0)
	slli	a4,a4,5
.L238:
	or	a4,a4,a1
	slli	a5,a5,11
	or	a5,a5,a4
	slli	a2,a2,10
	slli	a3,a3,12
	li	a4,12288
	or	a5,a5,a2
	and	a3,a3,a4
	lw	s0,8(sp)
	.cfi_restore 8
	or	a5,a5,a3
	sw	a5,0(s1)
.L229:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L230:
	.cfi_restore_state
	la a2, PPUGenLatch; sb a1, 0(a2);
	slli	a5,a3,18
	slli	a2,a3,18
	srli	a5,a5,18
	blt	a2,zero,.L241
	srli	a1,a5,10
	la a2, PPUCHRRAM; lbu a2, 0(a2);
	sra	a2,a2,a1
	andi	a2,a2,1
	bne	a2,zero,.L273
.L243:
	la a5, PPU; lbu a5, 0(a5);
	andi	a5,a5,4
	addi	a0,a3,1
	beq	a5,zero,.L250
	addi	a0,a3,32
.L250:
	sw	a0,0(s1)
	la a5, PPU_hook; lw a5, 0(a5);
	beq	a5,zero,.L229
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	slli	a0,a0,18
	srli	a0,a0,18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L241:
	.cfi_restore_state
	li	a2,16384
	addi	a2,a2,-257
	bgtu	a5,a2,.L244
	srli	a5,a5,10
	la a2, QTAIHack; lw a2, 0(a2);
	andi	a5,a5,3
	beq	a2,zero,.L245
	la a2, qtaintramreg; lbu a2, 0(a2);
	andi	a1,a2,1
	beq	a1,zero,.L245
	srli	a2,a2,1
	srl	a5,a5,a2
	slli	a5,a5,10
	andi	a2,a3,1023
	andi	a5,a5,1024
	or	a5,a5,a2
	lla	a2,QTAINTRAM
	add	a5,a2,a5
	sb	a4,0(a5)
	j	.L243
.L269:
	.cfi_offset 8, -8
	lla	a5,PPU
	lbu	a3,1(a5)
	andi	a3,a3,24
	beq	a3,zero,.L233
	addi	a0,a0,1
	srli	a5,a0,3
	add	a4,a5,a4
	andi	a4,a4,31
	sw	a4,12(s0)
	li	a3,30
	beq	a4,a3,.L234
	slli	a4,a4,5
.L235:
	andi	a3,a0,7
	andi	a5,a6,1
	lw	a2,8(s0)
	lw	a1,16(s0)
	sw	a3,0(s0)
	sw	a5,4(s0)
	j	.L238
.L272:
	addi	a1,a1,1
	srli	a5,a1,5
	andi	a5,a5,1
	add	a5,a5,a4
	j	.L239
.L273:
	.cfi_restore 8
	slli	a1,a1,2
	lla	a3,VPage
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a5,a3,a5
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L243
.L244:
	andi	a2,a3,3
	andi	a4,a1,63
	bne	a2,zero,.L247
	andi	a2,a3,12
	bne	a2,zero,.L248
	lla	a5,PALRAM
	sb	a4,12(a5)
	sb	a4,8(a5)
	sb	a4,4(a5)
	sb	a4,0(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L243
.L231:
	.cfi_offset 8, -8
	call	_Z23FFCEUX_PPUWrite_Defaultjh
	j	.L232
.L245:
	.cfi_restore 8
	la a2, PPUNTARAM; lbu a2, 0(a2);
	sra	a2,a2,a5
	andi	a2,a2,1
	beq	a2,zero,.L243
	slli	a5,a5,2
	lla	a2,vnapage
	add	a5,a2,a5
	lw	a5,0(a5)
	andi	a3,a3,1023
	add	a5,a5,a3
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L243
.L247:
	andi	a2,a3,31
	lla	a5,PALRAM
	add	a5,a5,a2
	sb	a4,0(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L243
.L248:
	srli	a5,a5,2
	andi	a5,a5,3
	lla	a2,UPALRAM
	add	a5,a2,a5
	sb	a4,-1(a5)
	j	.L243
.L234:
	.cfi_offset 8, -8
	li	a3,1
	li	a4,960
	bne	a5,a3,.L235
	addi	a6,a6,1
	la a5, ppur+12; sw zero, 0(a5);
	li	a4,0
	j	.L235
	.cfi_endproc
.LFE103:
	.size	_ZL5B2007jh, .-_ZL5B2007jh
	.section	.text._Z13GetCHRAddressi,"ax",@progbits
	.align	2
	.globl	_Z13GetCHRAddressi
	.hidden	_Z13GetCHRAddressi
	.type	_Z13GetCHRAddressi, @function
_Z13GetCHRAddressi:
.LFB88:
	.cfi_startproc
	la a5, cdloggerVideoDataSize; lw a5, 0(a5);
	beq	a5,zero,.L275
	srai	a3,a0,10
	slli	a3,a3,2
	lla	a4,VPage
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a0
	la a0, CHRptr; lw a0, 0(a0);
	sub	a0,a4,a0
	blt	a0,zero,.L277
	bge	a0,a5,.L277
.L274:
	ret
.L275:
	li	a5,8192
	blt	a0,a5,.L274
.L277:
	li	a0,-1
	ret
	.cfi_endproc
.LFE88:
	.size	_Z13GetCHRAddressi, .-_Z13GetCHRAddressi
	.section	.text._Z12GetCHROffsetPh,"ax",@progbits
	.align	2
	.globl	_Z12GetCHROffsetPh
	.hidden	_Z12GetCHROffsetPh
	.type	_Z12GetCHROffsetPh, @function
_Z12GetCHROffsetPh:
.LFB89:
	.cfi_startproc
	la a4, CHRptr; lw a4, 0(a4);
	la a5, cdloggerVideoDataSize; lw a5, 0(a5);
	sub	a0,a0,a4
	beq	a5,zero,.L282
	blt	a0,zero,.L284
	ble	a5,a0,.L284
.L281:
	ret
.L282:
	li	a5,8192
	bltu	a0,a5,.L281
.L284:
	li	a0,-1
	ret
	.cfi_endproc
.LFE89:
	.size	_Z12GetCHROffsetPh, .-_Z12GetCHROffsetPh
	.section	.text._Z13ppu_getScrollRiS_,"ax",@progbits
	.align	2
	.globl	_Z13ppu_getScrollRiS_
	.hidden	_Z13ppu_getScrollRiS_
	.type	_Z13ppu_getScrollRiS_, @function
_Z13ppu_getScrollRiS_:
.LFB91:
	.cfi_startproc
	la a5, newppu; lw a5, 0(a5);
	beq	a5,zero,.L286
	lla	a4,ppur
	lw	a5,24(a4)
	lw	a2,32(a4)
	lw	a3,20(a4)
	slli	a5,a5,5
	add	a5,a5,a2
	slli	a5,a5,3
	add	a5,a5,a3
	sw	a5,0(a1)
	lw	a5,28(a4)
	lw	a3,36(a4)
	lw	a4,40(a4)
	slli	a5,a5,5
	add	a5,a5,a3
	slli	a5,a5,3
	add	a5,a5,a4
	sw	a5,0(a0)
	ret
.L286:
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	la a2, XOffset; lbu a2, 0(a2);
	srli	a5,a4,2
	slli	a4,a4,3
	andi	a4,a4,255
	andi	a5,a5,256
	or	a5,a5,a4
	or	a5,a5,a2
	sw	a5,0(a0)
	lw	a4,0(a3)
	srli	a5,a4,2
	srli	a4,a4,12
	andi	a4,a4,7
	andi	a5,a5,248
	or	a5,a5,a4
	sw	a5,0(a1)
	lw	a4,0(a3)
	slli	a3,a4,20
	bge	a3,zero,.L285
	addi	a5,a5,240
	sw	a5,0(a1)
.L285:
	ret
	.cfi_endproc
.LFE91:
	.size	_Z13ppu_getScrollRiS_, .-_Z13ppu_getScrollRiS_
	.section	.text._Z18FCEUPPU_LineUpdatev,"ax",@progbits
	.align	2
	.globl	_Z18FCEUPPU_LineUpdatev
	.hidden	_Z18FCEUPPU_LineUpdatev
	.type	_Z18FCEUPPU_LineUpdatev, @function
_Z18FCEUPPU_LineUpdatev:
.LFB106:
	.cfi_startproc
	la a5, newppu; lw a5, 0(a5);
	bne	a5,zero,.L292
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L292
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L301
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a1,15
	mv	a0,a5
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	__udivsi3
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL11RefreshLinei
.L292:
	ret
.L301:
	tail	_ZL11RefreshLinei
	.cfi_endproc
.LFE106:
	.size	_Z18FCEUPPU_LineUpdatev, .-_Z18FCEUPPU_LineUpdatev
	.section	.text._ZL5A2007j,"ax",@progbits
	.align	2
	.type	_ZL5A2007j, @function
_ZL5A2007j:
.LFB95:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,newppu
	lla	s1,RefreshAddr
	sw	s3,12(sp)
	lw	a5,0(s0)
	.cfi_offset 19, -20
	lw	s3,0(s1)
	li	a4,16384
	sw	s6,0(sp)
	addi	a4,a4,-1
	sw	ra,28(sp)
	sw	s2,16(sp)
	sw	s4,8(sp)
	.cfi_offset 22, -32
	.cfi_offset 1, -4
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	and	s6,s3,a4
	beq	a5,zero,.L305
	lla	s0,ppur
	lw	a5,4(s0)
	lw	a1,8(s0)
	lw	a0,16(s0)
	lw	a2,12(s0)
	lw	a3,0(s0)
	slli	a5,a5,11
	slli	a1,a1,10
	or	a5,a5,a1
	or	a5,a5,a0
	slli	a2,a2,5
	or	a5,a5,a2
	slli	a3,a3,12
	li	a2,12288
	and	a3,a3,a2
	or	a5,a5,a3
	li	a3,16384
	sw	s5,4(sp)
	and	a0,a5,a4
	addi	a3,a3,-256
	.cfi_offset 21, -28
	lla	s5,VRAMBuffer
	sw	a0,0(s1)
	and	a5,a5,a3
	lbu	s2,0(s5)
	la a4, FFCEUX_PPURead; lw a4, 0(a4);
	beq	a5,a3,.L385
	jalr	a4
	lla	s4,PPU
.L313:
	lw	a3,52(s0)
	sb	a0,0(s5)
	li	a5,240
	lw	a4,12(s0)
	lw	a6,4(s0)
	lw	a0,0(s0)
	bgtu	a3,a5,.L314
	lbu	a5,1(s4)
	andi	a5,a5,24
	bne	a5,zero,.L386
.L314:
	lbu	a3,0(s4)
	lw	a1,16(s0)
	addi	a5,a4,1
	andi	a3,a3,4
	bne	a3,zero,.L320
	addi	a1,a1,1
	srli	a5,a1,5
	andi	a5,a5,1
	add	a5,a5,a4
.L320:
	lw	a3,8(s0)
	srli	a2,a5,5
	andi	a4,a5,31
	add	a2,a2,a3
	srli	a5,a2,1
	add	a5,a5,a6
	srli	a3,a5,1
	add	a3,a3,a0
	andi	a1,a1,31
	andi	a2,a2,1
	andi	a5,a5,1
	andi	a3,a3,7
	sw	a4,12(s0)
	sw	a1,16(s0)
	sw	a2,8(s0)
	sw	a5,4(s0)
	sw	a3,0(s0)
	slli	a4,a4,5
.L319:
	or	a4,a4,a1
	slli	a5,a5,11
	or	a5,a5,a4
	slli	a2,a2,10
	slli	a3,a3,12
	li	a4,12288
	or	a5,a5,a2
	and	a3,a3,a4
	lw	s5,4(sp)
	.cfi_restore 21
	or	a5,a5,a3
	sw	a5,0(s1)
.L321:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s6,0(sp)
	.cfi_restore 22
	mv	a0,s2
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L385:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	lla	s4,PPU
	lbu	a5,1(s4)
	andi	a3,s3,3
	andi	a5,a5,1
	bne	a3,zero,.L307
	andi	s3,s3,12
	bne	s3,zero,.L308
	la s2, PALRAM; lbu s2, 0(s2);
	beq	a5,zero,.L310
	andi	s2,s2,48
.L310:
	li	a5,-4096
	add	a0,a0,a5
	jalr	a4
	j	.L313
.L305:
	.cfi_restore 21
	call	_Z18FCEUPPU_LineUpdatev
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s6,a5,.L387
	sw	s5,4(sp)
	.cfi_offset 21, -28
	lla	s4,PPU_hook
	lla	s5,VRAMBuffer
	lbu	s2,0(s5)
	lw	a4,0(s4)
	mv	a5,s2
	beq	a4,zero,.L330
	mv	a0,s6
	jalr	a4
	lbu	a5,0(s5)
.L330:
	la a4, PPUGenLatch; sb a5, 0(a4);
	slli	a5,s3,18
	blt	a5,zero,.L331
	la a5, MMC5Hack; lw a5, 0(a5);
	bne	a5,zero,.L388
.L332:
	srli	a4,s6,10
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	a4,0(s4)
	lla	s4,PPU
	add	a5,a5,s6
	lbu	a5,0(a5)
	sb	a5,0(s5)
	lw	s5,4(sp)
	.cfi_restore 21
.L329:
	lbu	a5,1(s4)
	lw	a3,0(s1)
	andi	a5,a5,24
	beq	a5,zero,.L333
.L390:
	la a2, scanline; lw a2, 0(a2);
	li	a5,239
	bgt	a2,a5,.L333
	li	a5,28672
	li	a0,4096
	and	a2,a3,a5
	add	a0,a3,a0
	beq	a2,a5,.L389
.L338:
	sw	a0,0(s1)
	beq	a4,zero,.L321
	slli	a0,a0,18
	srli	a0,a0,18
	jalr	a4
	j	.L321
.L386:
	.cfi_offset 21, -28
	addi	a0,a0,1
	srli	a5,a0,3
	add	a4,a5,a4
	andi	a4,a4,31
	sw	a4,12(s0)
	li	a3,30
	beq	a4,a3,.L315
	slli	a4,a4,5
.L316:
	andi	a3,a0,7
	andi	a5,a6,1
	lw	a2,8(s0)
	lw	a1,16(s0)
	sw	a3,0(s0)
	sw	a5,4(s0)
	j	.L319
.L387:
	.cfi_restore 21
	lla	s4,PPU
	lbu	a4,1(s4)
	andi	a5,s3,3
	andi	a4,a4,1
	bne	a5,zero,.L323
	andi	a5,s3,12
	bne	a5,zero,.L324
	la s2, PALRAM; lbu s2, 0(s2);
	bne	a4,zero,.L384
.L326:
	andi	s3,s3,1023
	la a5, vnapage+12; lw a5, 0(a5);
	add	a5,a5,s3
	lbu	a5,0(a5)
	lla	s0,PPU_hook
	lw	a4,0(s0)
	la a3, VRAMBuffer; sb a5, 0(a3);
	beq	a4,zero,.L329
	mv	a0,s6
	jalr	a4
	lbu	a5,1(s4)
	lw	a4,0(s0)
	lw	a3,0(s1)
	andi	a5,a5,24
	bne	a5,zero,.L390
.L333:
	lbu	a5,0(s4)
	addi	a0,a3,1
	andi	a5,a5,4
	beq	a5,zero,.L338
	addi	a0,a3,32
	j	.L338
.L307:
	.cfi_offset 21, -28
	andi	s3,s3,31
	lla	a3,PALRAM
	add	a3,a3,s3
	lbu	s2,0(a3)
	beq	a5,zero,.L310
	andi	s2,s2,48
	j	.L310
.L331:
	srli	s6,s6,8
	andi	s6,s6,12
	lla	a5,vnapage
	add	a5,a5,s6
	lw	a5,0(a5)
	andi	s3,s3,1023
	lw	a4,0(s4)
	add	a5,a5,s3
	lbu	a5,0(a5)
	lla	s4,PPU
	sb	a5,0(s5)
	lw	s5,4(sp)
	.cfi_restore 21
	j	.L329
.L323:
	andi	a3,s3,31
	lla	a5,PALRAM
	add	a5,a5,a3
	lbu	s2,0(a5)
	beq	a4,zero,.L326
.L384:
	andi	s2,s2,48
	j	.L326
.L308:
	.cfi_offset 21, -28
	srli	s6,s6,2
	andi	s6,s6,3
	lla	a3,UPALRAM
	add	a3,a3,s6
	lbu	s2,-1(a3)
	beq	a5,zero,.L310
	andi	s2,s2,48
	j	.L310
.L324:
	.cfi_restore 21
	srli	a3,s6,2
	andi	a3,a3,3
	lla	a5,UPALRAM
	add	a5,a5,a3
	lbu	s2,-1(a5)
	beq	a4,zero,.L326
	andi	s2,s2,48
	j	.L326
.L388:
	.cfi_offset 21, -28
	lw	a5,0(s0)
	beq	a5,zero,.L332
	mv	a0,s6
	call	_Z13MMC5BGVRAMADRj
	lbu	a5,0(a0)
	lw	a4,0(s4)
	lla	s4,PPU
	sb	a5,0(s5)
	lw	s5,4(sp)
	.cfi_remember_state
	.cfi_restore 21
	j	.L329
.L315:
	.cfi_restore_state
	li	a3,1
	li	a4,960
	bne	a5,a3,.L316
	addi	a6,a6,1
	la a5, ppur+12; sw zero, 0(a5);
	li	a4,0
	j	.L316
.L389:
	.cfi_restore 21
	andi	a5,a3,992
	li	a1,928
	xor	a2,a3,a2
	beq	a5,a1,.L391
	li	a1,992
	addi	a0,a2,32
	bne	a5,a1,.L338
	li	a0,28672
	addi	a0,a0,992
	xor	a0,a3,a0
	j	.L338
.L391:
	li	a0,32768
	addi	a0,a0,-1120
	xor	a0,a3,a0
	j	.L338
	.cfi_endproc
.LFE95:
	.size	_ZL5A2007j, .-_ZL5A2007j
	.section	.text._ZL5B2006jh,"ax",@progbits
	.align	2
	.type	_ZL5B2006jh, @function
_ZL5B2006jh:
.LFB102:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	s1,vtoggle
	call	_Z18FCEUPPU_LineUpdatev
	lbu	a2,0(s1)
	la a5, PPUGenLatch; sb s0, 0(a5);
	bne	a2,zero,.L393
	li	a5,16384
	slli	a7,s0,8
	addi	a5,a5,-256
	lla	a4,ppur
	and	a7,a7,a5
	srli	a5,s0,3
	lw	a3,32(a4)
	lla	t1,TempAddr
	andi	a5,a5,1
	lbu	a0,0(t1)
	slli	a6,s0,3
	srli	a1,s0,2
	sw	a5,24(a4)
	srli	s0,s0,4
	xori	a5,a2,1
	sb	a5,0(s1)
	andi	s0,s0,3
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	s0,20(a4)
	andi	a3,a3,7
	lw	s0,8(sp)
	.cfi_restore 8
	andi	a6,a6,24
	or	a0,a0,a7
	or	a3,a3,a6
	andi	a1,a1,1
	sw	a0,0(t1)
	sw	a3,32(a4)
	sw	a1,28(a4)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L393:
	.cfi_restore_state
	lla	a5,TempAddr
	lw	a0,0(a5)
	li	a4,65536
	addi	a4,a4,-256
	and	a0,a0,a4
	or	a0,a0,s0
	sw	a0,0(a5)
	la a5, RefreshAddr; sw a0, 0(a5);
	li	a5,1
	la a4, DummyRead; sw a5, 0(a4);
	la a5, PPU_hook; lw a5, 0(a5);
	beq	a5,zero,.L395
	jalr	a5
	lbu	a2,0(s1)
.L395:
	lla	a5,ppur
	lw	a4,32(a5)
	lw	a1,24(a5)
	lw	a3,28(a5)
	lw	a0,20(a5)
	srli	a6,s0,5
	andi	a4,a4,24
	andi	s0,s0,31
	or	a4,a4,a6
	sw	s0,36(a5)
	sw	s0,16(a5)
	sw	a4,32(a5)
	sw	a0,0(a5)
	sw	a1,4(a5)
	sw	a3,8(a5)
	sw	a4,12(a5)
	xori	a5,a2,1
	sb	a5,0(s1)
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
.LFE102:
	.size	_ZL5B2006jh, .-_ZL5B2006jh
	.section	.text._ZL5B2005jh,"ax",@progbits
	.align	2
	.type	_ZL5B2005jh, @function
_ZL5B2005jh:
.LFB101:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,TempAddr
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	lw	s1,0(s2)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z18FCEUPPU_LineUpdatev
	lla	a3,vtoggle
	lbu	a5,0(a3)
	la a4, PPUGenLatch; sb s0, 0(a4);
	srli	a1,s0,3
	andi	a2,s0,7
	bne	a5,zero,.L401
	li	a4,65536
	addi	a4,a4,-32
	lla	a0,ppur
	and	s1,s1,a4
	or	a4,s1,a1
	la a6, XOffset; sb a2, 0(a6);
	sw	a1,36(a0)
	sw	a2,40(a0)
.L402:
	xori	a5,a5,1
	sb	a5,0(a3)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	sw	a4,0(s2)
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L401:
	.cfi_restore_state
	slli	a4,s0,2
	li	a6,28672
	li	a0,36864
	slli	s0,s0,12
	and	s0,s0,a6
	addi	a0,a0,-993
	andi	a4,a4,-32
	lla	a6,ppur
	and	s1,s1,a0
	or	a4,a4,s0
	or	a4,a4,s1
	sw	a1,32(a6)
	sw	a2,20(a6)
	j	.L402
	.cfi_endproc
.LFE101:
	.size	_ZL5B2005jh, .-_ZL5B2005jh
	.section	.text._ZL5A2004j,"ax",@progbits
	.align	2
	.type	_ZL5A2004j, @function
_ZL5A2004j:
.LFB93:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sw	ra,76(sp)
	la a5, newppu; lw a5, 0(a5);
	.cfi_offset 1, -4
	beq	a5,zero,.L405
	lla	a4,ppur
	lw	t3,52(a4)
	li	a5,240
	lla	a7,PPU
	bgt	t3,a5,.L406
	lbu	a5,1(a7)
	andi	a5,a5,24
	beq	a5,zero,.L406
	lw	a3,56(a4)
	li	a5,63
	bgt	a3,a5,.L407
	lw	ra,76(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,255
	la a4, spr_read+48; sw a5, 0(a4);
	li	a0,255
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L406:
	.cfi_restore_state
	lbu	a4,3(a7)
	lw	ra,76(sp)
	.cfi_remember_state
	.cfi_restore 1
	lla	a5,SPRAM
	add	a5,a5,a4
	lbu	a0,0(a5)
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L405:
	.cfi_restore_state
	call	_Z18FCEUPPU_LineUpdatev
	lw	ra,76(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a0, PPUGenLatch; lbu a0, 0(a0);
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L407:
	.cfi_restore_state
	lla	a1,spr_read
	lw	a5,52(a1)
	beq	a3,a5,.L539
	sw	s0,72(sp)
	sw	s1,68(sp)
	sw	s2,64(sp)
	sw	s3,60(sp)
	sw	s5,52(sp)
	sw	s6,48(sp)
	sw	s7,44(sp)
	sw	s8,40(sp)
	sw	s10,32(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	lw	s8,12(a1)
	sw	s4,56(sp)
	lla	t6,SPRAM
	lw	s1,0(a1)
	lbu	a0,252(t6)
	lw	a4,8(a1)
	lw	a6,4(a1)
	lw	a2,56(a1)
	mv	t0,s8
	li	s5,0
	li	s3,0
	li	s6,0
	li	s2,0
	li	s7,0
	li	s10,0
	li	t4,255
	li	t2,4
	li	s0,319
	lla	t5,.L414
	sw	s8,12(sp)
	.cfi_offset 20, -24
.L454:
	bgt	a5,t4,.L411
	bgtu	a2,t2,.L412
	slli	t1,a2,2
	add	t1,t1,t5
	lw	t1,0(t1)
	add	t1,t1,t5
	jr	t1
	.section	.rodata._ZL5A2004j,"a",@progbits
	.align	2
	.align	2
.L414:
	.word	.L502-.L414
	.word	.L417-.L414
	.word	.L416-.L414
	.word	.L536-.L414
	.word	.L413-.L414
	.section	.text._ZL5A2004j
.L480:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	mv	a4,a2
	li	s3,1
	li	s7,1
	li	s10,1
.L416:
	andi	s4,a5,1
	li	a2,2
	beq	s4,zero,.L431
	lbu	t1,0(a7)
	slli	s2,a6,2
	or	s2,s2,a4
	add	s2,t6,s2
	lbu	s3,0(s2)
	andi	t1,t1,32
	seqz	t1,t1
	addi	s2,t3,-1
	slli	t1,t1,3
	sub	s2,s2,s3
	addi	t1,t1,-16
	and	t1,s2,t1
	beq	t1,zero,.L472
	addi	a6,a6,1
	li	t1,64
	bne	a6,t1,.L433
	li	a6,0
	li	s10,1
	li	a2,4
.L433:
	addi	a4,a4,1
	andi	a4,a4,3
	li	s3,1
	li	s7,1
.L431:
	mv	t1,a6
	li	s2,1
	j	.L412
.L481:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	mv	a4,s9
	lw	s11,28(sp)
	.cfi_restore 27
	lw	s9,36(sp)
	.cfi_restore 25
	li	s3,1
	li	s6,1
	li	s10,1
.L417:
	andi	a2,a5,1
	beq	a2,zero,.L466
	addi	a4,a4,1
	li	t1,4
	li	s3,1
	beq	a4,t1,.L540
.L428:
	li	s2,1
	slli	t1,a6,2
	ble	a6,s2,.L429
.L430:
	or	t1,t1,a4
	add	t1,t6,t1
	lbu	t1,0(t1)
	li	s2,1
.L412:
	addi	a5,a5,1
	bne	a3,a5,.L454
	beq	s5,zero,.L455
.L462:
	sw	s1,0(a1)
.L455:
	beq	s3,zero,.L456
	sw	a4,8(a1)
.L456:
	bne	s6,zero,.L541
.L457:
	beq	s2,zero,.L542
	sw	t1,48(a1)
.L459:
	beq	s7,zero,.L460
	sw	a6,4(a1)
.L460:
	beq	s10,zero,.L461
	sw	a2,56(a1)
.L461:
	andi	a0,t1,0xff
.L537:
	lw	s0,72(sp)
	.cfi_restore 8
	lw	s1,68(sp)
	.cfi_restore 9
	lw	s2,64(sp)
	.cfi_restore 18
	lw	s3,60(sp)
	.cfi_restore 19
	lw	s4,56(sp)
	.cfi_restore 20
	lw	s5,52(sp)
	.cfi_restore 21
	lw	s6,48(sp)
	.cfi_restore 22
	lw	s7,44(sp)
	.cfi_restore 23
	lw	s8,40(sp)
	.cfi_restore 24
	lw	s10,32(sp)
	.cfi_restore 26
	sw	a3,52(a1)
.L550:
	lw	ra,76(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L502:
	.cfi_def_cfa_offset 80
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	addi	t1,t0,4
	slli	t1,t1,2
	sw	s11,28(sp)
	sw	s9,36(sp)
	.cfi_offset 27, -52
	.cfi_offset 25, -44
	slli	s2,a6,2
	li	s11,1
	add	s8,a1,t1
.L418:
	mv	t1,s2
	bgt	a6,s11,.L419
	lbu	t1,3(a7)
	andi	t1,t1,248
	add	t1,s2,t1
.L419:
	add	s4,t6,t1
	sw	t1,0(s8)
	andi	s9,a5,1
	lbu	t1,0(s4)
	beq	s9,zero,.L420
	lbu	s2,0(a7)
	addi	s4,t3,-1
	sub	s4,s4,t1
	andi	s2,s2,32
	seqz	s2,s2
	slli	s2,s2,3
	addi	s2,s2,-16
	and	s4,s4,s2
	beq	s4,zero,.L543
	addi	a6,a6,1
	li	s2,64
	beq	a6,s2,.L425
	li	s2,8
	beq	t0,s2,.L544
	addi	a5,a5,1
	beq	a3,a5,.L485
	li	t1,256
	li	s7,1
	bne	a5,t1,.L486
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
.L411:
	bgt	a5,s0,.L440
.L464:
	srai	t1,a5,3
	andi	t1,t1,7
	blt	t1,t0,.L441
	bne	s1,zero,.L474
	li	s2,1
	li	t1,255
	j	.L412
.L536:
	or	s4,a6,a4
.L415:
	add	t1,t6,s4
	andi	s2,a5,1
	lbu	t1,0(t1)
	beq	s2,zero,.L434
	addi	a4,a4,1
	li	s2,4
	beq	a4,s2,.L545
	addi	a5,a5,1
	beq	a3,a5,.L482
	li	t1,256
	li	s3,1
	bne	a5,t1,.L536
	j	.L411
.L478:
	li	s7,1
	li	s10,1
.L413:
	li	a2,256
.L452:
	andi	a4,a5,1
	beq	a4,zero,.L437
	addi	a6,a6,1
	andi	a6,a6,63
	li	s7,1
.L437:
	slli	a4,a6,2
	add	a4,t6,a4
	addi	a5,a5,1
	lbu	t1,0(a4)
	beq	a3,a5,.L546
	bne	a5,a2,.L452
	li	s3,1
	li	a4,0
	li	a2,4
	j	.L411
.L441:
	andi	s2,a5,4
	bne	s2,zero,.L442
	addi	t1,t1,4
	slli	t1,t1,2
	add	t1,a1,t1
	lw	t1,0(t1)
	addi	s2,a4,1
	or	a4,a4,t1
	add	a4,t6,a4
	lbu	t1,0(a4)
	beq	s2,t2,.L475
	mv	a4,s2
	li	s3,1
	li	s2,1
	j	.L412
.L474:
	mv	t1,a0
	li	s5,1
	li	s1,0
	li	s2,1
	j	.L412
.L442:
	ori	t1,t1,3
	addi	t1,t1,4
	slli	t1,t1,2
	add	t1,a1,t1
	lw	t1,0(t1)
	li	s2,1
	add	t1,t6,t1
	lbu	t1,0(t1)
	j	.L412
.L434:
	addi	a5,a5,1
	beq	a3,a5,.L487
	li	t1,256
	bne	a5,t1,.L415
	j	.L411
.L420:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	addi	a5,a5,1
	beq	a3,a5,.L484
	li	t1,256
	bne	a5,t1,.L418
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	a2,0
	j	.L411
.L466:
	li	a2,1
	j	.L428
.L475:
	li	a4,0
	li	s3,1
	li	s2,1
	j	.L412
.L468:
	mv	a4,a2
	li	t1,0
	li	a2,4
	li	s7,1
	li	s10,1
	li	a6,0
.L429:
	lbu	s2,3(a7)
	andi	s2,s2,248
	add	t1,t1,s2
	j	.L430
.L440:
	lw	s8,12(sp)
	beq	s5,zero,.L443
	sw	s1,0(a1)
.L443:
	beq	s3,zero,.L444
	sw	a4,8(a1)
.L444:
	bne	s6,zero,.L547
.L445:
	beq	s7,zero,.L446
	sw	a6,4(a1)
.L446:
	beq	s10,zero,.L447
	sw	a2,56(a1)
.L447:
	beq	s8,zero,.L538
	lw	a5,16(a1)
	add	t6,t6,a5
	lbu	a0,0(t6)
.L538:
	sw	a0,48(a1)
	j	.L537
.L543:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	addi	a5,a5,1
	addi	t0,t0,1
	beq	a3,a5,.L548
	li	a4,256
	bne	a5,a4,.L481
	mv	a4,s9
	mv	a2,s9
	lw	s11,28(sp)
	.cfi_restore 27
	lw	s9,36(sp)
	.cfi_restore 25
	li	s3,1
	li	s6,1
.L450:
	li	s10,1
	li	a5,256
	j	.L464
.L472:
	mv	a4,s4
	li	s3,1
	li	s10,1
	li	a2,3
	j	.L431
.L541:
	sw	t0,12(a1)
	j	.L457
.L547:
	sw	t0,12(a1)
	mv	s8,t0
	j	.L445
.L545:
	addi	a6,a6,1
	addi	a5,a5,1
	andi	a6,a6,63
	beq	a3,a5,.L549
	li	a2,256
	bne	a5,a2,.L478
	li	a2,4
	li	s3,1
	li	s7,1
	j	.L450
.L540:
	addi	a6,a6,1
	li	a4,64
	beq	a6,a4,.L468
	li	a4,8
	beq	t0,a4,.L469
	mv	a4,a2
	li	s7,1
	li	s10,1
	li	a2,0
	j	.L428
.L425:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	addi	a5,a5,1
	beq	a3,a5,.L476
	li	a6,256
	bne	a5,a6,.L477
	mv	a6,a2
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	s7,1
	li	a2,4
	j	.L450
.L539:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 26
	lbu	a0,48(a1)
	sw	a3,52(a1)
	j	.L550
.L544:
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	addi	a5,a5,1
	beq	a3,a5,.L479
	li	a4,256
	bne	a5,a4,.L480
	mv	a4,a2
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	s3,1
	li	s7,1
	li	a2,2
	j	.L450
.L546:
	li	s3,1
	li	a4,0
	li	s2,1
	li	a2,4
	bne	s5,zero,.L462
	j	.L455
.L486:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	slli	s2,a6,2
	j	.L418
.L477:
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	mv	a6,a2
	li	s7,1
	li	s10,1
	j	.L413
.L469:
	li	a4,0
	li	s7,1
	li	s10,1
	li	a2,2
	j	.L428
.L484:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	a2,0
	li	s2,1
	bne	s5,zero,.L462
	j	.L455
.L487:
	li	s2,1
	bne	s5,zero,.L462
	j	.L455
.L542:
	lw	t1,48(a1)
	j	.L459
.L482:
	li	s3,1
	li	s2,1
	bne	s5,zero,.L462
	j	.L455
.L548:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	mv	a4,s9
	mv	a2,s9
	lw	s11,28(sp)
	.cfi_restore 27
	lw	s9,36(sp)
	.cfi_restore 25
	mv	s2,s5
	li	s6,1
.L424:
	mv	s10,s5
	mv	s3,s5
	bne	s5,zero,.L462
	li	s10,1
	li	s2,1
	sw	a4,8(a1)
	j	.L456
.L549:
	mv	s2,s5
	li	a2,4
	li	s7,1
	j	.L424
.L485:
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	lw	s9,36(sp)
	.cfi_remember_state
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	s2,1
	li	s7,1
	bne	s5,zero,.L462
	j	.L455
.L476:
	.cfi_restore_state
	mv	a6,a2
	lw	s9,36(sp)
	.cfi_remember_state
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	li	s2,1
	li	s7,1
	li	s10,1
	li	a2,4
	bne	s5,zero,.L462
	j	.L455
.L479:
	.cfi_restore_state
	mv	a4,a2
	lw	s9,36(sp)
	.cfi_restore 25
	lw	s11,28(sp)
	.cfi_restore 27
	mv	s2,s5
	li	s7,1
	li	a2,2
	j	.L424
	.cfi_endproc
.LFE93:
	.size	_ZL5A2004j, .-_ZL5A2004j
	.section	.text._ZL5B2000jh,"ax",@progbits
	.align	2
	.type	_ZL5B2000jh, @function
_ZL5B2000jh:
.LFB96:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	s1,PPU
	call	_Z18FCEUPPU_LineUpdatev
	lb	a5,0(s1)
	la a4, PPUGenLatch; sb s0, 0(a4);
	blt	a5,zero,.L552
	slli	a5,s0,24
	srai	a5,a5,24
	blt	a5,zero,.L554
.L552:
	lla	a0,TempAddr
	lw	a5,0(a0)
	li	a3,61440
	li	a4,4096
	addi	a3,a3,1023
	slli	a1,s0,10
	addi	a4,a4,-1024
	sb	s0,0(s1)
	and	a1,a1,a4
	and	a5,a5,a3
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	srli	a2,s0,1
	srli	a3,s0,4
	or	a5,a5,a1
	andi	a1,s0,1
	lw	s0,8(sp)
	.cfi_restore 8
	lla	a4,ppur
	andi	a2,a2,1
	andi	a3,a3,1
	sw	a5,0(a0)
	sw	a1,28(a4)
	sw	a2,24(a4)
	sw	a3,44(a4)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L554:
	.cfi_restore_state
	lb	a5,2(s1)
	bge	a5,zero,.L552
	call	_Z11TriggerNMI2v
	j	.L552
	.cfi_endproc
.LFE96:
	.size	_ZL5B2000jh, .-_ZL5B2000jh
	.section	.text._Z21FCEUI_SetRenderPlanesbb,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_SetRenderPlanesbb
	.hidden	_Z21FCEUI_SetRenderPlanesbb
	.type	_Z21FCEUI_SetRenderPlanesbb, @function
_Z21FCEUI_SetRenderPlanesbb:
.LFB107:
	.cfi_startproc
	la a5, _ZL13rendersprites; sb a0, 0(a5);
	la a5, _ZL8renderbg; sb a1, 0(a5);
	ret
	.cfi_endproc
.LFE107:
	.size	_Z21FCEUI_SetRenderPlanesbb, .-_Z21FCEUI_SetRenderPlanesbb
	.section	.text._Z21FCEUI_GetRenderPlanesRbS_,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_GetRenderPlanesRbS_
	.hidden	_Z21FCEUI_GetRenderPlanesRbS_
	.type	_Z21FCEUI_GetRenderPlanesRbS_, @function
_Z21FCEUI_GetRenderPlanesRbS_:
.LFB108:
	.cfi_startproc
	la a5, _ZL13rendersprites; lbu a5, 0(a5);
	sb	a5,0(a0)
	la a5, _ZL8renderbg; lbu a5, 0(a5);
	sb	a5,0(a1)
	ret
	.cfi_endproc
.LFE108:
	.size	_Z21FCEUI_GetRenderPlanesRbS_, .-_Z21FCEUI_GetRenderPlanesRbS_
	.section	.text._Z29FCEUI_DisableSpriteLimitationi,"ax",@progbits
	.align	2
	.globl	_Z29FCEUI_DisableSpriteLimitationi
	.hidden	_Z29FCEUI_DisableSpriteLimitationi
	.type	_Z29FCEUI_DisableSpriteLimitationi, @function
_Z29FCEUI_DisableSpriteLimitationi:
.LFB115:
	.cfi_startproc
	seqz	a0,a0
	neg	a0,a0
	andi	a0,a0,-56
	addi	a0,a0,64
	la a5, _ZL10maxsprites; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE115:
	.size	_Z29FCEUI_DisableSpriteLimitationi, .-_Z29FCEUI_DisableSpriteLimitationi
	.section	.text._Z22FCEUPPU_SetVideoSystemi,"ax",@progbits
	.align	2
	.globl	_Z22FCEUPPU_SetVideoSystemi
	.hidden	_Z22FCEUPPU_SetVideoSystemi
	.type	_Z22FCEUPPU_SetVideoSystemi, @function
_Z22FCEUPPU_SetVideoSystemi:
.LFB119:
	.cfi_startproc
	lla	a5,FSettings
	beq	a0,zero,.L561
	la a4, dendy; lw a4, 0(a4);
	seqz	a4,a4
	lw	a2,48(a5)
	lw	a3,56(a5)
	neg	a4,a4
	andi	a4,a4,50
	addi	a4,a4,262
	la a1, _ZL19scanlines_per_frame; sw a4, 0(a1);
	sw	a2,36(a5)
	sw	a3,40(a5)
	ret
.L561:
	lw	a4,44(a5)
	lw	a3,52(a5)
	li	a2,262
	la a1, _ZL19scanlines_per_frame; sw a2, 0(a1);
	sw	a4,36(a5)
	sw	a3,40(a5)
	ret
	.cfi_endproc
.LFE119:
	.size	_Z22FCEUPPU_SetVideoSystemi, .-_Z22FCEUPPU_SetVideoSystemi
	.section	.text._Z12FCEUPPU_Initv,"ax",@progbits
	.align	2
	.globl	_Z12FCEUPPU_Initv
	.hidden	_Z12FCEUPPU_Initv
	.type	_Z12FCEUPPU_Initv, @function
_Z12FCEUPPU_Initv:
.LFB120:
	.cfi_startproc
	lla	a2,_ZL7ppulut1
	lla	a3,_ZL7ppulut2
	li	a4,0
	li	t3,7
	li	t1,8
	li	a6,256
.L567:
	li	a5,0
	li	a1,0
.L566:
	sub	a0,t3,a1
	sra	a0,a4,a0
	slli	a7,a1,2
	andi	a0,a0,1
	sll	a0,a0,a7
	addi	a1,a1,1
	or	a5,a5,a0
	bne	a1,t1,.L566
	slli	a1,a5,1
	sw	a5,0(a2)
	sw	a1,0(a3)
	addi	a4,a4,1
	addi	a2,a2,4
	addi	a3,a3,4
	bne	a4,a6,.L567
	li	a5,0
	lla	t5,_ZL7ppulut3
	li	t4,34
	li	t3,8
	li	a3,16
.L568:
	slli	a2,a5,3
	li	a4,0
.L570:
	or	a0,a2,a4
	mv	t1,a4
	li	a6,2
	li	a7,0
.L569:
	srai	a1,t1,3
	slli	a1,a1,1
	sra	a1,a5,a1
	andi	a1,a1,3
	sll	a1,a1,a6
	addi	a6,a6,4
	or	a7,a7,a1
	addi	t1,t1,1
	bne	a6,t4,.L569
	slli	a1,a0,2
	add	a1,t5,a1
	sw	a7,0(a1)
	addi	a4,a4,1
	bne	a4,t3,.L570
	addi	a5,a5,1
	bne	a5,a3,.L568
	ret
	.cfi_endproc
.LFE120:
	.size	_Z12FCEUPPU_Initv, .-_Z12FCEUPPU_Initv
	.section	.text._Z14PPU_ResetHooksv,"ax",@progbits
	.align	2
	.globl	_Z14PPU_ResetHooksv
	.hidden	_Z14PPU_ResetHooksv
	.type	_Z14PPU_ResetHooksv, @function
_Z14PPU_ResetHooksv:
.LFB121:
	.cfi_startproc
	lla	a5,_Z22FFCEUX_PPURead_Defaultj
	la a4, FFCEUX_PPURead; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE121:
	.size	_Z14PPU_ResetHooksv, .-_Z14PPU_ResetHooksv
	.section	.text._Z13FCEUPPU_Resetv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUPPU_Resetv
	.hidden	_Z13FCEUPPU_Resetv
	.type	_Z13FCEUPPU_Resetv, @function
_Z13FCEUPPU_Resetv:
.LFB122:
	.cfi_startproc
	la a4, PPU; sw zero, 0(a4);
	la a4, VRAMBuffer; sb zero, 0(a4);
	la a4, PPUSPL; sb zero, 0(a4);
	la a4, PPUGenLatch; sb zero, 0(a4);
	la a4, TempAddr; sw zero, 0(a4);
	la a4, RefreshAddr; sw zero, 0(a4);
	la a4, vtoggle; sb zero, 0(a4);
	li	a4,2
	li	a5,1
	la a3, _ZL7ppudead; sw a4, 0(a3);
	la a4, _ZL4kook; sw zero, 0(a4);
	la a4, idleSynch; sb a5, 0(a4);
	la a4, _ZL13new_ppu_reset; sb a5, 0(a4);
	ret
	.cfi_endproc
.LFE122:
	.size	_Z13FCEUPPU_Resetv, .-_Z13FCEUPPU_Resetv
	.section	.text._Z13FCEUPPU_Powerv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUPPU_Powerv
	.hidden	_Z13FCEUPPU_Powerv
	.type	_Z13FCEUPPU_Powerv, @function
_Z13FCEUPPU_Powerv:
.LFB123:
	.cfi_startproc
	li	a2,4096
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	addi	a2,a2,-2048
	li	a1,0
	lla	a0,NTARAM
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	s9,4(sp)
	sw	s2,32(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 18, -16
	call	memset
	li	a2,32
	li	a1,0
	lla	a0,PALRAM
	call	memset
	li	a2,3
	li	a1,0
	lla	a0,UPALRAM
	call	memset
	li	a2,256
	li	a1,0
	lla	a0,SPRAM
	call	memset
	la a4, PPU; sw zero, 0(a4);
	la a4, VRAMBuffer; sb zero, 0(a4);
	la a4, PPUSPL; sb zero, 0(a4);
	la a4, PPUGenLatch; sb zero, 0(a4);
	la a4, TempAddr; sw zero, 0(a4);
	la a4, RefreshAddr; sw zero, 0(a4);
	la a4, vtoggle; sb zero, 0(a4);
	li	a4,2
	li	a5,1
	la a3, _ZL7ppudead; sw a4, 0(a3);
	li	s0,8192
	la a4, _ZL4kook; sw zero, 0(a4);
	la a4, idleSynch; sb a5, 0(a4);
	la a4, _ZL13new_ppu_reset; sb a5, 0(a4);
	lla	s1,_ZL5A200xj
	lla	s9,_ZL5B2000jh
	lla	s8,_ZL5B2001jh
	lla	s7,_ZL5A2002j
	lla	s6,_ZL5B2002jh
	lla	s5,_ZL5B2003jh
	lla	s4,_ZL5A2004j
	lla	s3,_ZL5B2004jh
.L579:
	mv	a0,s0
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s0
	mv	a1,s9
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,1
	mv	a0,s2
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	mv	a1,s8
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,2
	mv	a0,s2
	mv	a1,s7
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	mv	a1,s6
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,3
	mv	a0,s2
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	mv	a1,s5
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,4
	mv	a0,s2
	mv	a1,s4
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	mv	a1,s3
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,5
	mv	a0,s2
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	lla	a1,_ZL5B2005jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,6
	mv	a0,s2
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s2
	lla	a1,_ZL5B2006jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s2,s0,7
	lla	a1,_ZL5A2007j
	mv	a0,s2
	call	_Z17SetOneReadHandleriPFhjE
	lla	a1,_ZL5B2007jh
	mv	a0,s2
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	s0,s0,8
	li	a5,16384
	bne	s0,a5,.L579
	lw	s0,40(sp)
	.cfi_restore 8
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	lw	s7,12(sp)
	.cfi_restore 23
	lw	s8,8(sp)
	.cfi_restore 24
	lw	s9,4(sp)
	.cfi_restore 25
	li	a0,16384
	lla	a1,_ZL5B4014jh
	addi	a0,a0,20
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	_Z18SetOneWriteHandleriPFvjhE
	.cfi_endproc
.LFE123:
	.size	_Z13FCEUPPU_Powerv, .-_Z13FCEUPPU_Powerv
	.section	.text._Z17FCEUPPU_LoadStatei,"ax",@progbits
	.align	2
	.globl	_Z17FCEUPPU_LoadStatei
	.hidden	_Z17FCEUPPU_LoadStatei
	.type	_Z17FCEUPPU_LoadStatei, @function
_Z17FCEUPPU_LoadStatei:
.LFB125:
	.cfi_startproc
	la a4, _ZL9TempAddrT; lhu a4, 0(a4);
	la a5, _ZL12RefreshAddrT; lhu a5, 0(a5);
	la a3, TempAddr; sw a4, 0(a3);
	la a4, RefreshAddr; sw a5, 0(a4);
	ret
	.cfi_endproc
.LFE125:
	.size	_Z17FCEUPPU_LoadStatei, .-_Z17FCEUPPU_LoadStatei
	.section	.text._Z17FCEUPPU_SaveStatev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUPPU_SaveStatev
	.hidden	_Z17FCEUPPU_SaveStatev
	.type	_Z17FCEUPPU_SaveStatev, @function
_Z17FCEUPPU_SaveStatev:
.LFB126:
	.cfi_startproc
	la a5, TempAddr; lw a5, 0(a5);
	la a4, _ZL9TempAddrT; sh a5, 0(a4);
	la a5, RefreshAddr; lw a5, 0(a5);
	la a4, _ZL12RefreshAddrT; sh a5, 0(a4);
	ret
	.cfi_endproc
.LFE126:
	.size	_Z17FCEUPPU_SaveStatev, .-_Z17FCEUPPU_SaveStatev
	.section	.text._Z19FCEUPPU_PeekAddressv,"ax",@progbits
	.align	2
	.globl	_Z19FCEUPPU_PeekAddressv
	.hidden	_Z19FCEUPPU_PeekAddressv
	.type	_Z19FCEUPPU_PeekAddressv, @function
_Z19FCEUPPU_PeekAddressv:
.LFB127:
	.cfi_startproc
	la a5, newppu; lw a5, 0(a5);
	beq	a5,zero,.L585
	lla	a4,ppur
	lw	a5,4(a4)
	lw	a2,8(a4)
	lw	a1,16(a4)
	lw	a3,12(a4)
	lw	a0,0(a4)
	slli	a5,a5,11
	slli	a4,a2,10
	or	a5,a5,a4
	or	a5,a5,a1
	slli	a4,a3,5
	or	a5,a5,a4
	slli	a0,a0,12
	or	a0,a0,a5
	slli	a0,a0,18
	srli	a0,a0,18
	ret
.L585:
	la a0, RefreshAddr; lw a0, 0(a0);
	slli	a0,a0,18
	srli	a0,a0,18
	ret
	.cfi_endproc
.LFE127:
	.size	_Z19FCEUPPU_PeekAddressv, .-_Z19FCEUPPU_PeekAddressv
	.globl	__modsi3
	.section	.text._Z6runppui,"ax",@progbits
	.align	2
	.globl	_Z6runppui
	.hidden	_Z6runppui
	.type	_Z6runppui, @function
_Z6runppui:
.LFB128:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,ppur
	lw	a5,56(s1)
	lw	a1,60(s1)
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	add	a0,a0,a5
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	__modsi3
	sw	a0,56(s1)
	la a5, _ZL13new_ppu_reset; lbu a5, 0(a5);
	beq	a5,zero,.L590
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L590:
	.cfi_restore_state
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_RunDebugi
	.cfi_endproc
.LFE128:
	.size	_Z6runppui, .-_Z6runppui
	.section	.text._ZN6BGData6Record4ReadEv,"axG",@progbits,_ZN6BGData6Record4ReadEv,comdat
	.align	2
	.weak	_ZN6BGData6Record4ReadEv
	.hidden	_ZN6BGData6Record4ReadEv
	.type	_ZN6BGData6Record4ReadEv, @function
_ZN6BGData6Record4ReadEv:
.LFB129:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	.cfi_offset 8, -8
	lla	s0,ppur
	lw	a4,8(s0)
	lw	a3,4(s0)
	lw	a2,16(s0)
	lw	a5,12(s0)
	slli	a3,a3,11
	slli	a4,a4,10
	or	a4,a4,a3
	sw	s5,20(sp)
	or	a4,a4,a2
	slli	a5,a5,5
	.cfi_offset 21, -28
	lla	s5,PEC586Hack
	or	a4,a4,a5
	lw	a3,0(s5)
	li	a5,8192
	sw	s1,36(sp)
	sw	s2,32(sp)
	or	a5,a4,a5
	sw	ra,44(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	lla	s2,RefreshAddr
	sw	a5,0(s2)
	la a2, NTRefreshAddr; sw a5, 0(a2);
	mv	s1,a0
	beq	a3,zero,.L592
	srli	a4,a5,9
	andi	a4,a4,1
	sw	a4,44(s0)
.L593:
	slli	a5,a5,3
	andi	a5,a5,8
	sb	a5,1(s1)
	lla	s4,FFCEUX_PPURead
	lw	a5,0(s4)
	lw	a0,0(s2)
	lla	s3,_ZL13new_ppu_reset
	jalr	a5
	sb	a0,0(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lbu	a5,0(s3)
	sw	a0,56(s0)
	beq	a5,zero,.L632
.L594:
	lw	a5,4(s0)
	lw	a2,8(s0)
	lw	a3,16(s0)
	lw	a4,12(s0)
	slli	a2,a2,10
	slli	a5,a5,11
	srli	a3,a3,2
	or	a5,a5,a2
	andi	a3,a3,7
	slli	a4,a4,1
	or	a5,a5,a3
	andi	a4,a4,56
	li	a3,8192
	or	a5,a5,a4
	addi	a3,a3,960
	lw	a4,0(s4)
	or	a0,a5,a3
	sw	a0,0(s2)
	jalr	a4
	sb	a0,2(s1)
	lw	a5,12(s0)
	andi	a5,a5,2
	beq	a5,zero,.L595
	srli	a0,a0,4
	sb	a0,2(s1)
.L595:
	lw	a5,16(s0)
	andi	a5,a5,2
	beq	a5,zero,.L596
	srli	a0,a0,2
	andi	a0,a0,0xff
.L596:
	slli	a0,a0,2
	andi	a0,a0,12
	sb	a0,2(s1)
	lw	a0,56(s0)
	lw	s7,60(s0)
	addi	a0,a0,1
	mv	a1,s7
	call	__modsi3
	lbu	s6,0(s3)
	sw	a0,56(s0)
	beq	s6,zero,.L633
.L597:
	la a5, PPU+1; lbu a5, 0(a5);
	andi	a5,a5,24
	beq	a5,zero,.L599
	lw	a5,16(s0)
	lw	a2,8(s0)
	li	a3,251
	addi	a5,a5,1
	srli	a4,a5,5
	add	a4,a4,a2
	andi	a5,a5,31
	andi	a4,a4,1
	sw	a5,16(s0)
	sw	a4,8(s0)
	beq	a0,a3,.L634
.L599:
	mv	a1,s7
	addi	a0,a0,1
	call	__modsi3
	sw	a0,56(s0)
	beq	s6,zero,.L635
.L602:
	lw	a0,44(s0)
	lbu	a5,0(s1)
	lw	a4,0(s0)
	slli	a0,a0,12
	slli	a3,a5,4
	or	a0,a0,a4
	lw	a4,0(s5)
	or	a0,a0,a3
	sw	a5,48(s0)
	sw	a0,0(s2)
	beq	a4,zero,.L603
	lbu	a4,1(s1)
	lw	a5,0(s4)
	or	a0,a4,a0
	jalr	a5
	sb	a0,3(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lbu	a5,0(s3)
	sw	a0,56(s0)
	beq	a5,zero,.L636
.L604:
	lbu	a0,1(s1)
	lw	a4,0(s2)
	lw	a5,0(s4)
	or	a0,a0,a4
.L631:
	jalr	a5
	sb	a0,4(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lbu	a5,0(s3)
	sw	a0,56(s0)
	beq	a5,zero,.L605
.L591:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	lw	s7,12(sp)
	.cfi_restore 23
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L603:
	.cfi_restore_state
	la a5, QTAIHack; lw a5, 0(a5);
	beq	a5,zero,.L607
	lbu	a5,5(s1)
	andi	a5,a5,64
	bne	a5,zero,.L637
.L607:
	lw	a5,0(s4)
	jalr	a5
	sb	a0,3(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lbu	a5,0(s3)
	sw	a0,56(s0)
	beq	a5,zero,.L638
.L610:
	lw	a0,0(s2)
	lw	a5,0(s4)
	ori	a0,a0,8
	sw	a0,0(s2)
	j	.L631
.L592:
	la a3, QTAIHack; lw a3, 0(a3);
	beq	a3,zero,.L593
	srli	a3,a5,10
	la a2, qtaintramreg; lbu a2, 0(a2);
	andi	a3,a3,3
	srli	a2,a2,1
	srl	a3,a3,a2
	slli	a3,a3,10
	andi	a3,a3,1024
	andi	a4,a4,1023
	or	a4,a3,a4
	lla	a3,QTAINTRAM
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,5(a0)
	andi	a4,a4,63
	sw	a4,44(s0)
	j	.L593
.L640:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lw	a5,0(s2)
	lw	a4,0(s4)
	lbu	s3,0(s3)
	ori	a5,a5,8
	sw	a5,0(s2)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,4(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	sw	a0,56(s0)
	bne	s3,zero,.L591
.L605:
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	lw	s7,12(sp)
	.cfi_restore 23
	li	a0,2
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_RunDebugi
.L635:
	.cfi_restore_state
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L602
.L633:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lw	a0,56(s0)
	lw	s7,60(s0)
	lbu	s6,0(s3)
	j	.L597
.L632:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L594
.L636:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L604
.L634:
	lw	a5,0(s0)
	lw	a4,12(s0)
	li	a1,30
	addi	a5,a5,1
	srli	a2,a5,3
	add	a4,a2,a4
	andi	a4,a4,31
	sw	a4,12(s0)
	lw	a3,4(s0)
	beq	a4,a1,.L639
.L601:
	andi	a5,a5,7
	andi	a3,a3,1
	sw	a5,0(s0)
	sw	a3,4(s0)
	j	.L599
.L637:
	lla	s4,CHRptr
	lw	a5,0(s4)
	add	a5,a5,a0
	lbu	a5,0(a5)
	sb	a5,3(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lbu	a5,0(s3)
	sw	a0,56(s0)
	beq	a5,zero,.L640
	lw	a5,0(s2)
	lw	a4,0(s4)
	ori	a5,a5,8
	sw	a5,0(s2)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sb	a5,4(s1)
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	sw	a0,56(s0)
	j	.L591
.L638:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L610
.L639:
	li	a4,1
	bne	a2,a4,.L601
	addi	a3,a3,1
	la a4, ppur+12; sw zero, 0(a4);
	j	.L601
	.cfi_endproc
.LFE129:
	.size	_ZN6BGData6Record4ReadEv, .-_ZN6BGData6Record4ReadEv
	.section	.text._Z14FCEUX_PPU_Loopi,"ax",@progbits
	.align	2
	.globl	_Z14FCEUX_PPU_Loopi
	.hidden	_Z14FCEUX_PPU_Loopi
	.type	_Z14FCEUX_PPU_Loopi, @function
_Z14FCEUX_PPU_Loopi:
.LFB131:
	.cfi_startproc
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sw	s8,88(sp)
	sw	ra,124(sp)
	sw	s0,120(sp)
	sw	s1,116(sp)
	sw	s2,112(sp)
	.cfi_offset 24, -40
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	lla	s8,ppur
	bne	a5,zero,.L642
	lla	s1,_ZL7ppudead
	lw	a5,0(s1)
	lw	a0,56(s8)
	lw	a1,60(s8)
	bne	a5,zero,.L846
.L644:
	sw	s9,84(sp)
	sw	s3,108(sp)
	sw	s4,104(sp)
	sw	s5,100(sp)
	sw	s6,96(sp)
	sw	s7,92(sp)
	sw	s10,80(sp)
	sw	s11,76(sp)
	.cfi_offset 25, -44
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	lla	s9,PPU
	lbu	a5,2(s9)
	la a4, ppuphase; sw zero, 0(a4);
	li	s0,20
	ori	a5,a5,-128
	sb	a5,2(s9)
	la a5, PPUSPL; sb zero, 0(a5);
	la a5, PPU+3; sb zero, 0(a5);
	li	a5,241
	sw	a5,52(s8)
	li	s1,0
	j	.L651
.L649:
	addi	s0,s0,-1
	beq	s0,zero,.L650
.L847:
	lla	a5,_ZL13new_ppu_reset
	lw	a0,56(s8)
	lw	a1,60(s8)
	lbu	s1,0(a5)
.L651:
	addi	a0,a0,1
	call	__modsi3
	sw	a0,56(s8)
	bne	s1,zero,.L649
	li	a0,1
	addi	s0,s0,-1
	call	_Z14X6502_RunDebugi
	bne	s0,zero,.L847
.L650:
	lb	a5,0(s9)
	blt	a5,zero,.L848
.L652:
	lla	a5,PAL
	lbu	s2,0(a5)
	li	s3,0
	li	s0,20
	seqz	s2,s2
	neg	s2,s2
	andi	s2,s2,-50
	addi	s2,s2,70
	li	s1,341
	j	.L655
.L654:
	addi	s0,s0,1
	beq	s0,s1,.L849
.L655:
	lw	a0,56(s8)
	lw	a1,60(s8)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s8)
	bne	a5,zero,.L654
	li	a0,1
	addi	s0,s0,1
	call	_Z14X6502_RunDebugi
	bne	s0,s1,.L655
.L849:
	lw	a5,52(s8)
	addi	s3,s3,1
	li	s0,0
	addi	a5,a5,1
	sw	a5,52(s8)
	bne	s2,s3,.L655
	lla	a5,normalscanlines
	lw	a5,0(a5)
	la a4, PPU+2; sb zero, 0(a4);
	ble	a5,zero,.L850
	li	a5,16384
	li	s1,0
	lla	a4,MMC5Hack
	addi	a5,a5,-256
	li	s0,-1
	sw	a4,60(sp)
	lla	s7,_ZZ14FCEUX_PPU_LoopiE4oams
	sw	a5,24(sp)
	mv	s5,s1
.L657:
	lla	a5,timestamp
	lw	a3,0(a5)
	lla	a5,X
	lw	a2,16(a5)
	slli	a5,a3,1
	add	a5,a5,a3
	slli	a5,a5,4
	la a3, spr_read+12; sw zero, 0(a3);
	la a3, spr_read+4; sw zero, 0(a3);
	li	a3,64
	add	a5,a5,a2
	lla	a2,spr_read
	sw	a3,52(a2)
	la a3, spr_read+56; sw zero, 0(a3);
	la a3, spr_read+28; sw zero, 0(a3);
	la a3, spr_read+24; sw zero, 0(a3);
	la a3, spr_read+20; sw zero, 0(a3);
	la a3, spr_read+16; sw zero, 0(a3);
	la a3, spr_read+44; sw zero, 0(a3);
	la a3, spr_read+40; sw zero, 0(a3);
	la a3, spr_read+36; sw zero, 0(a3);
	la a3, spr_read+32; sw zero, 0(a3);
	la a3, g_rasterpos; sw zero, 0(a3);
	lla	a3,linestartts
	li	a4,1
	sw	a5,0(a3)
	lla	a5,ppuphase
	sw	a4,0(a2)
	sw	a4,8(a2)
	sw	s5,52(s8)
	sw	a4,0(a5)
	beq	s5,zero,.L660
	lw	a5,60(sp)
	lw	a5,0(a5)
	bne	a5,zero,.L851
.L660:
	lla	a1,_ZZ14FCEUX_PPU_LoopiE7oamslot
	lw	a4,0(a1)
	slli	a5,s0,8
	sw	a5,4(sp)
	lla	a3,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	slli	a5,a4,2
	add	a3,a3,a5
	lw	a2,0(a3)
	xori	s2,a4,1
	slli	a3,a4,9
	sw	s2,0(a1)
	addi	a3,a3,2
	lla	a1,_ZZ14FCEUX_PPU_LoopiE8oamcount
	slli	a4,a4,6
	lla	s11,bgdata+12
	sw	a2,0(a1)
	sw	a4,44(sp)
	add	s4,s7,a3
	li	s1,0
	li	s10,0
	sw	s2,52(sp)
	sw	s0,56(sp)
	sw	a5,48(sp)
.L690:
	mv	a0,s11
	call	_ZN6BGData6Record4ReadEv
	lla	a5,gNoBGFillColor
	lbu	ra,0(a5)
	li	a5,255
	beq	ra,a5,.L852
.L661:
	beq	s5,zero,.L663
	li	a5,240
	ble	s5,a5,.L853
.L663:
	addi	s10,s10,1
	li	a5,32
	addi	s11,s11,6
	addi	s1,s1,-8
	bne	s10,a5,.L690
	lbu	s1,0(s9)
	lw	s2,52(sp)
	lla	a5,_ZL10maxsprites
	andi	s1,s1,32
	lbu	t3,1(s9)
	seqz	s1,s1
	lw	t5,0(a5)
	slli	t6,s2,2
	neg	s1,s1
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	lw	s0,56(sp)
	lbu	t4,2(s9)
	add	a5,a5,t6
	andi	s1,s1,-8
	sw	zero,0(a5)
	addi	s1,s1,16
	la a5, _ZZ14FCEUX_PPU_LoopiE8oamcount; sw zero, 0(a5);
	andi	t3,t3,24
	lla	a4,SPRAM
	slli	a1,s2,6
	li	a2,0
	li	a3,0
	li	t0,0
	li	a6,0
	li	a7,7
	li	t1,1
	li	t2,8
	li	a0,64
.L696:
	add	a5,a1,a2
	lbu	ra,0(a4)
	slli	a5,a5,3
	add	a5,s7,a5
	sb	zero,7(a5)
	add	s3,ra,s1
	bgt	ra,s0,.L692
	add	a5,a2,a1
	slli	a5,a5,3
	add	a5,s7,a5
	ble	s3,s0,.L692
	ble	a2,a7,.L693
	beq	t3,zero,.L693
	ori	t4,t4,32
	beq	t5,t2,.L854
	li	t0,1
.L693:
	lw	a6,0(a4)
	sb	a3,6(a5)
	sb	t1,7(a5)
	sw	a6,0(a5)
	addi	a2,a2,1
	li	a6,1
.L692:
	addi	a3,a3,1
	addi	a4,a4,4
	bne	a3,a0,.L696
	beq	t0,zero,.L697
	sb	t4,2(s9)
.L697:
	beq	a6,zero,.L764
	lla	a5,_ZZ14FCEUX_PPU_LoopiE8oamcount
	sw	a2,0(a5)
.L698:
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	add	t6,a5,t6
	lla	a4,ppuphase
	li	a5,2
	sw	a2,0(t6)
	sw	a5,0(a4)
	ble	t5,zero,.L699
.L695:
	li	s10,0
	addi	a5,s1,-1
	slli	s3,s2,9
	sw	a5,12(sp)
	mv	a5,s8
	mv	s8,s10
	add	s11,s7,s3
	li	s4,7
	lla	s2,RefreshAddr
	lla	s3,FFCEUX_PPURead
	lla	s6,bitrevlut
	mv	s10,a5
	beq	s8,a2,.L855
.L700:
	lbu	a5,0(s11)
	lb	a4,2(s11)
	sub	a5,s0,a5
	bge	a4,zero,.L701
	lw	a4,12(sp)
	sub	a5,a4,a5
.L701:
	lbu	a3,7(s11)
	lbu	a4,1(s11)
	andi	a2,a5,7
	bne	a3,zero,.L702
	li	a2,0
	li	a4,0
	li	a5,0
.L702:
	lbu	a3,0(s9)
	andi	a1,a3,32
	beq	a1,zero,.L703
	andi	a3,a4,-2
	srli	a5,a5,3
	or	a5,a5,a3
	slli	a4,a4,12
	li	a3,4096
	slli	a5,a5,4
	and	a4,a4,a3
	or	s1,a5,a4
.L704:
	lbu	a5,1(s9)
	add	s1,s1,a2
	li	a4,2
	andi	a5,a5,24
	beq	a5,zero,.L705
	beq	s5,zero,.L706
	li	a5,240
	bgt	s5,a5,.L705
	lw	a3,56(s10)
	li	a5,256
	beq	a3,a5,.L856
.L705:
	ble	s8,s4,.L857
.L717:
	lw	a5,0(s3)
	sw	s1,0(s2)
	mv	a0,s1
	jalr	a5
	lw	a5,0(s2)
	lw	a4,0(s3)
	sb	a0,4(s11)
	addi	a0,a5,8
	sw	a0,0(s2)
	jalr	a4
	sb	a0,5(s11)
.L727:
	lbu	a5,2(s11)
	andi	a5,a5,64
	bne	a5,zero,.L733
	lbu	a4,5(s11)
	lbu	a5,4(s11)
	add	a4,s6,a4
	lbu	a4,0(a4)
	add	a5,s6,a5
	lbu	a5,0(a5)
	slli	a4,a4,8
	or	a5,a5,a4
	sh	a5,4(s11)
.L733:
	lla	a5,_ZL10maxsprites
	lw	a5,0(a5)
	addi	s8,s8,1
	addi	s11,s11,8
	ble	a5,s8,.L840
	lla	a5,_ZZ14FCEUX_PPU_LoopiE8oamcount
	lw	a2,0(a5)
	bne	s8,a2,.L700
.L855:
	ble	s8,s4,.L700
.L840:
	mv	s8,s10
.L699:
	li	a5,1
	lla	a4,ppuphase
	lla	a0,bgdata
	sw	a5,0(a4)
	call	_ZN6BGData6Record4ReadEv
	lla	a0,bgdata+6
	call	_ZN6BGData6Record4ReadEv
	lw	a0,56(s8)
	lw	a1,60(s8)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	s1,0(a5)
	sw	a0,56(s8)
	mv	a5,a0
	beq	s1,zero,.L858
	beq	s5,zero,.L749
	addi	a0,a5,2
	li	a5,341
	li	a1,341
	sw	a5,60(s8)
	call	__modsi3
	sw	a0,56(s8)
.L740:
	lw	a0,56(s8)
	li	a1,341
	addi	a0,a0,1
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s8)
	beq	a5,zero,.L859
.L741:
	lla	a5,normalscanlines
	lw	a5,0(a5)
	addi	s5,s5,1
	addi	s0,s0,1
	bgt	a5,s5,.L657
.L743:
	lw	a5,60(sp)
	la a4, DMC_7bit; sb zero, 0(a4);
	lw	a5,0(a5)
	bne	a5,zero,.L860
.L659:
	lw	a0,56(s8)
	lw	a1,60(s8)
	addi	a0,a0,341
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s8)
	beq	a5,zero,.L861
.L744:
.L648:
	lla	a4,framectr
	lw	a5,0(a4)
	lw	ra,124(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,120(sp)
	.cfi_restore 8
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	s3,108(sp)
	.cfi_restore 19
	lw	s4,104(sp)
	.cfi_restore 20
	lw	s5,100(sp)
	.cfi_restore 21
	lw	s6,96(sp)
	.cfi_restore 22
	lw	s7,92(sp)
	.cfi_restore 23
	lw	s9,84(sp)
	.cfi_restore 25
	lw	s10,80(sp)
	.cfi_restore 26
	lw	s11,76(sp)
	.cfi_restore 27
	lw	s1,116(sp)
	.cfi_restore 9
	lw	s2,112(sp)
	.cfi_restore 18
	lw	s8,88(sp)
	.cfi_restore 24
	li	a0,0
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
.L852:
	.cfi_restore_state
	lbu	a5,1(s9)
	lla	a4,PALRAM
	lbu	ra,0(a4)
	andi	a5,a5,1
	beq	a5,zero,.L661
	andi	ra,ra,48
	j	.L661
.L856:
	lw	a1,60(s10)
	li	a0,257
	sw	a1,4(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	lw	a1,4(sp)
	beq	a5,zero,.L862
.L713:
	lw	a3,36(s10)
	lw	a4,28(s10)
	sw	a3,16(s10)
	sw	a4,8(s10)
.L715:
	addi	a0,a0,1
	sw	a5,4(sp)
	call	__modsi3
	lw	a5,4(sp)
	sw	a0,56(s10)
	beq	a5,zero,.L711
.L712:
	li	a4,0
.L866:
	bgt	s8,s4,.L717
.L857:
	lw	a0,56(s10)
	lw	a1,60(s10)
	sw	a4,4(sp)
	add	a0,a4,a0
	sw	a1,8(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	lw	a4,4(sp)
	beq	a5,zero,.L718
	lbu	a5,0(s9)
	li	a4,24
	lw	a1,8(sp)
	andi	a5,a5,56
	beq	a5,a4,.L863
	li	a5,2
	beq	s8,a5,.L722
.L720:
	addi	a0,a0,2
	call	__modsi3
	sw	a0,56(s10)
.L731:
	lw	a5,0(s3)
	sw	s1,0(s2)
	mv	a0,s1
	jalr	a5
	lw	a5,56(s10)
	lw	a1,60(s10)
	sb	a0,4(s11)
	addi	a0,a5,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	beq	a5,zero,.L864
.L732:
	lw	a0,0(s2)
	lw	a5,0(s3)
	addi	a0,a0,8
	sw	a0,0(s2)
	jalr	a5
	lw	a5,56(s10)
	lw	a1,60(s10)
	sb	a0,5(s11)
	addi	a0,a5,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	bne	a5,zero,.L727
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L727
.L706:
	lw	a3,56(s10)
	li	a5,304
	bne	a3,a5,.L705
	lw	a1,60(s10)
	li	a0,305
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	beq	a5,zero,.L865
.L708:
	lw	a1,24(s10)
	lw	a2,28(s10)
	lw	a4,32(s10)
	lw	a5,36(s10)
	lw	a3,20(s10)
	sw	a1,4(s10)
	sw	a2,8(s10)
	sw	a3,0(s10)
	sw	a4,12(s10)
	sw	a5,16(s10)
.L710:
	lw	a1,60(s10)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s10)
	bne	a5,zero,.L712
.L711:
	li	a0,1
	call	_Z14X6502_RunDebugi
	li	a4,0
	j	.L866
.L703:
	slli	s1,a3,9
	li	a5,4096
	and	s1,s1,a5
	slli	a4,a4,4
	or	s1,s1,a4
	j	.L704
.L853:
	lw	a4,48(sp)
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	lbu	s6,1(s9)
	add	a5,a5,a4
	lw	t5,0(a5)
	lla	a5,_ZZ14FCEUX_PPU_LoopiE8oamcount
	andi	a4,s6,16
	sw	t5,0(a5)
	slli	s0,s10,3
	la t2, XBuf; lw t2, 0(t2);
	andi	a5,s6,8
	beq	a4,zero,.L664
	snez	a3,a5
	li	t1,1
	beq	s10,zero,.L867
.L668:
	lw	a5,44(sp)
	li	t4,8
	mv	a6,s4
	add	s3,t5,a5
	mv	s4,s6
	lla	a5,_ZZ14FCEUX_PPU_LoopiE4oams+2
	slli	s3,s3,3
	add	s3,s3,a5
	la t0, _ZL8renderbg; lbu t0, 0(t0);
	sub	t4,t4,s1
	sw	s5,28(sp)
	sw	s10,32(sp)
	sw	s1,36(sp)
	sw	s11,40(sp)
	sw	ra,20(sp)
	andi	s1,s4,24
	mv	s6,s3
	lw	a5,40(s8)
	lla	t3,g_rasterpos
	li	t6,7
	mv	s2,t5
	mv	s5,a3
	mv	s10,t1
	mv	s11,t2
	mv	s3,t0
	bne	s1,zero,.L758
.L869:
	lw	a4,4(s8)
	lw	a2,8(s8)
	lw	a1,16(s8)
	lw	a7,0(s8)
	lw	a0,12(s8)
	slli	a2,a2,10
	slli	a4,a4,11
	or	a4,a4,a2
	or	a4,a4,a1
	li	a3,12288
	slli	a1,a7,12
	slli	a2,a0,5
	and	a1,a1,a3
	lw	a3,24(sp)
	or	a4,a4,a2
	or	a4,a4,a1
	and	a2,a4,a3
	li	a0,0
	bne	a2,a3,.L670
	andi	s1,a4,31
	mv	a0,s1
.L670:
	sw	t4,16(sp)
	sw	a6,12(sp)
	sw	a5,8(sp)
	call	_Z19READPAL_MOTHEROFALLj
	lw	a5,8(sp)
	lw	a6,12(sp)
	lw	t4,16(sp)
	li	t6,7
	lla	t3,g_rasterpos
.L669:
	beq	s5,zero,.L671
	add	a5,s0,a5
	srai	a2,a5,3
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a4,a4,1
	addi	a2,a4,3
	lla	a3,bgdata
	add	a2,a2,a3
	lbu	a7,1(a2)
	lbu	a1,0(a2)
	not	a5,a5
	andi	a2,a5,7
	sra	a5,a7,a2
	add	a4,a3,a4
	lbu	a4,2(a4)
	slli	s1,a5,1
	sra	a1,a1,a2
	andi	s1,s1,2
	andi	a1,a1,1
	or	s1,s1,a1
	or	s1,s1,a4
.L671:
	beq	s3,zero,.L672
	lla	a5,PALRAM
	add	a4,a5,s1
	andi	a5,s4,1
	lbu	a0,0(a4)
	beq	a5,zero,.L672
	andi	a0,a0,48
.L672:
	mv	a5,a6
	li	ra,0
	ble	s2,zero,.L685
.L684:
	lbu	a4,1(a5)
	bgt	a4,s0,.L675
	addi	a4,a4,7
	blt	a4,s0,.L675
	lbu	a4,3(a5)
	lbu	a1,2(a5)
	srli	a2,a4,1
	slli	a2,a2,8
	srli	a3,a1,1
	or	a3,a3,a2
	sh	a3,2(a5)
	beq	s10,zero,.L675
	bne	ra,zero,.L747
	slli	a4,a4,1
	andi	a1,a1,1
	andi	a4,a4,2
	or	a1,a1,a4
	beq	a1,zero,.L675
	lbu	a3,4(a5)
	lbu	a4,0(a5)
	bne	a3,zero,.L678
	andi	a3,s1,3
	beq	a3,zero,.L682
	li	a3,255
	beq	s0,a3,.L681
	lbu	a3,2(s9)
	ori	a3,a3,64
	sb	a3,2(s9)
.L681:
	andi	a3,a4,32
	beq	a3,zero,.L682
.L747:
	mv	ra,s10
.L675:
	addi	a5,a5,8
	bne	s6,a5,.L684
.L685:
	srli	a5,s4,5
	beq	a5,t6,.L868
	li	a5,31
	bleu	s4,a5,.L688
	ori	a0,a0,64
	andi	a0,a0,0xff
.L687:
	lw	a5,4(sp)
	add	a5,s0,a5
	add	a5,s11,a5
	sb	a0,0(a5)
	lw	a5,0(t3)
	addi	s0,s0,1
	addi	a5,a5,1
	sw	a5,0(t3)
	beq	s0,t4,.L838
	lbu	s4,1(s9)
	lw	a5,40(s8)
	andi	s1,s4,24
	beq	s1,zero,.L869
.L758:
	lw	a0,20(sp)
	li	s1,0
	j	.L669
.L678:
	andi	a3,a4,32
	beq	a3,zero,.L682
	andi	a3,s1,3
	mv	ra,s10
	bne	a3,zero,.L675
.L682:
	lla	a3,_ZL13rendersprites
	lbu	ra,0(a3)
	beq	ra,zero,.L747
	slli	a4,a4,2
	andi	a4,a4,12
	lla	a3,PALRAM
	or	a4,a1,a4
	add	a4,a3,a4
	andi	a3,s4,1
	lbu	a0,16(a4)
	beq	a3,zero,.L675
	andi	a0,a0,48
	j	.L675
.L688:
	andi	a0,a0,63
	ori	a0,a0,128
	j	.L687
.L868:
	ori	a0,a0,-64
	andi	a0,a0,0xff
	j	.L687
.L838:
	lw	s5,28(sp)
	lw	s10,32(sp)
	lw	s1,36(sp)
	lw	s11,40(sp)
	mv	s4,a6
	j	.L663
.L718:
	mv	a0,a4
	call	_Z14X6502_RunDebugi
	lbu	a5,0(s9)
	li	a4,24
	andi	a5,a5,56
	beq	a5,a4,.L870
	li	a5,2
	bne	s8,a5,.L845
.L722:
	lbu	a5,1(s9)
	andi	a5,a5,24
	beq	a5,zero,.L845
	lla	a5,GameHBIRQHook
	lw	a5,0(a5)
	beq	a5,zero,.L729
	jalr	a5
.L721:
	lbu	a5,1(s9)
	andi	a5,a5,24
	beq	a5,zero,.L845
.L729:
	lla	a5,GameHBIRQHook2
	lw	a5,0(a5)
	beq	a5,zero,.L845
	jalr	a5
.L845:
	lw	a0,56(s10)
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	lw	a1,60(s10)
	addi	a0,a0,2
	sw	a5,4(sp)
	call	__modsi3
	lw	a5,4(sp)
	sw	a0,56(s10)
	bne	a5,zero,.L731
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L731
.L664:
	li	t1,0
	beq	a5,zero,.L844
	li	a3,1
	bne	s10,zero,.L668
.L667:
	srli	a3,s6,1
	andi	a3,a3,1
	j	.L668
.L867:
	andi	a4,s6,4
	bne	a4,zero,.L666
	li	t1,0
	bne	a5,zero,.L667
.L844:
	li	a3,0
	j	.L668
.L864:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L732
.L863:
	li	a5,2
	bne	s8,a5,.L720
	j	.L721
.L749:
	lla	a4,idleSynch
	lbu	a5,0(a4)
	beq	a5,zero,.L737
	lbu	a3,1(s9)
	andi	a3,a3,24
	beq	a3,zero,.L737
	lla	a3,PAL
	lbu	a3,0(a3)
	beq	a3,zero,.L738
.L737:
	xori	a5,a5,1
	li	a3,341
	li	a1,341
	addi	a0,a0,2
	sw	a3,60(s8)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s8)
	bne	s1,zero,.L740
.L739:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lw	a4,60(s8)
	li	a5,341
	bne	a4,a5,.L741
	j	.L740
.L666:
	li	t1,1
	bne	a5,zero,.L667
	li	a3,0
	j	.L668
.L870:
	li	a5,2
	bne	s8,a5,.L845
	j	.L721
.L858:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lla	a5,_ZL13new_ppu_reset
	lw	a0,56(s8)
	lbu	s1,0(a5)
	beq	s5,zero,.L749
	li	a5,341
	li	a1,341
	addi	a0,a0,2
	sw	a5,60(s8)
	call	__modsi3
	sw	a0,56(s8)
	beq	s1,zero,.L739
	j	.L740
.L865:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s9)
	lw	a0,56(s10)
	andi	a5,a5,24
	beq	a5,zero,.L710
	j	.L708
.L854:
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	sb	t4,2(s9)
	add	t6,a5,t6
	beq	a6,zero,.L871
	lla	a5,_ZZ14FCEUX_PPU_LoopiE8oamcount
	sw	a2,0(a5)
	lla	a4,ppuphase
	li	a5,2
	sw	a2,0(t6)
	sw	a5,0(a4)
	j	.L695
.L851:
	mv	a0,s0
	call	_Z7MMC5_hbi
	j	.L660
.L764:
	li	a2,0
	j	.L698
.L862:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s9)
	lw	a0,56(s10)
	lw	a1,60(s10)
	andi	a5,a5,24
	bne	a5,zero,.L714
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	j	.L715
.L642:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	la a5, ppur+16; sw zero, 0(a5);
	la a5, ppur+12; sw zero, 0(a5);
	la a5, ppur+8; sw zero, 0(a5);
	la a5, ppur+4; sw zero, 0(a5);
	la a5, ppur; sw zero, 0(a5);
	la a5, ppur+44; sw zero, 0(a5);
	la a5, ppur+48; sw zero, 0(a5);
	la a5, ppur+40; sw zero, 0(a5);
	la a5, ppur+36; sw zero, 0(a5);
	la a5, ppur+32; sw zero, 0(a5);
	la a5, ppur+28; sw zero, 0(a5);
	la a5, ppur+24; sw zero, 0(a5);
	la a5, ppur+20; sw zero, 0(a5);
	la a5, ppur+56; sw zero, 0(a5);
	li	a5,341
	sw	a5,60(s8)
	lla	s1,_ZL7ppudead
	la a5, spr_read+56; sw zero, 0(a5);
	la a5, spr_read+52; sw zero, 0(a5);
	la a5, spr_read+48; sw zero, 0(a5);
	la a5, spr_read+12; sw zero, 0(a5);
	la a5, spr_read+8; sw zero, 0(a5);
	la a5, spr_read+4; sw zero, 0(a5);
	la a5, spr_read; sw zero, 0(a5);
	la a5, spr_read+28; sw zero, 0(a5);
	la a5, spr_read+24; sw zero, 0(a5);
	la a5, spr_read+20; sw zero, 0(a5);
	la a5, spr_read+16; sw zero, 0(a5);
	la a5, spr_read+44; sw zero, 0(a5);
	la a5, spr_read+40; sw zero, 0(a5);
	la a5, spr_read+36; sw zero, 0(a5);
	la a5, spr_read+32; sw zero, 0(a5);
	la a5, _ZL13new_ppu_reset; sb zero, 0(a5);
	lw	a5,0(s1)
	li	a1,341
	li	a0,0
	beq	a5,zero,.L644
.L846:
	li	a5,241
	sw	a5,52(s8)
	la a5, PAL; lbu a5, 0(a5);
	bne	a5,zero,.L872
	li	s0,8192
	addi	s0,s0,-1372
.L842:
	add	a0,a0,s0
	call	__modsi3
	mv	a5,a0
	mv	a0,s0
	sw	a5,56(s8)
	call	_Z14X6502_RunDebugi
	lw	a0,56(s8)
	lw	a1,60(s8)
	li	s0,81920
	lla	a5,_ZL13new_ppu_reset
	addi	s0,s0,602
	lbu	s2,0(a5)
	add	a0,a0,s0
	la a5, ppur+52; sw zero, 0(a5);
	call	__modsi3
	sw	a0,56(s8)
	beq	s2,zero,.L873
.L647:
	lw	a5,0(s1)
	lw	ra,124(sp)
	.cfi_restore 1
	lw	s0,120(sp)
	.cfi_restore 8
	addi	a5,a5,-1
	sw	a5,0(s1)
	lw	s2,112(sp)
	.cfi_restore 18
	lw	s1,116(sp)
	.cfi_restore 9
	lw	s8,88(sp)
	.cfi_restore 24
	li	a0,0
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
.L738:
	.cfi_def_cfa_offset 128
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	xori	a5,a5,1
	li	a3,340
	li	a1,340
	addi	a0,a0,2
	sw	a3,60(s8)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s8)
	bne	s1,zero,.L741
	j	.L739
.L861:
	li	a0,341
	call	_Z14X6502_RunDebugi
	j	.L744
.L860:
	li	a0,240
	call	_Z7MMC5_hbi
	j	.L659
.L871:
	li	a5,2
	lla	a4,ppuphase
	sw	zero,0(t6)
	sw	a5,0(a4)
	li	a2,0
	j	.L695
.L859:
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L741
.L872:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	li	s0,24576
	addi	s0,s0,-706
	j	.L842
.L848:
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	call	_Z10TriggerNMIv
	j	.L652
.L873:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	mv	a0,s0
	call	_Z14X6502_RunDebugi
	j	.L647
.L850:
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	lla	a5,MMC5Hack
	sw	a5,60(sp)
	j	.L743
.L714:
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	j	.L713
	.cfi_endproc
.LFE131:
	.size	_Z14FCEUX_PPU_Loopi, .-_Z14FCEUX_PPU_Loopi
	.section	.text._Z12FCEUPPU_Loopi,"ax",@progbits
	.align	2
	.globl	_Z12FCEUPPU_Loopi
	.hidden	_Z12FCEUPPU_Loopi
	.type	_Z12FCEUPPU_Loopi, @function
_Z12FCEUPPU_Loopi:
.LFB124:
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sw	s7,92(sp)
	sw	ra,124(sp)
	la a5, newppu; lw a5, 0(a5);
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	mv	s7,a0
	beq	a5,zero,.L875
	la a5, GameInfo; lw a5, 0(a5);
	lw	a4,8(a5)
	li	a5,3
	bne	a4,a5,.L1334
.L875:
	sw	s0,120(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL7ppudead
	sw	s4,104(sp)
	.cfi_offset 20, -24
	lw	s4,0(s0)
	beq	s4,zero,.L876
	li	a2,61440
	li	a1,128
	la a0, XBuf; lw a0, 0(a0);
	call	memset
	la a0, _ZL19scanlines_per_frame; lw a0, 0(a0);
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	lw	a5,0(s0)
	addi	a5,a5,-1
	sw	a5,0(s0)
.L877:
	call	_Z7ShowFPSv
	seqz	s4,s7
.L874:
	lw	s0,120(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,124(sp)
	.cfi_restore 1
	lw	s7,92(sp)
	.cfi_restore 23
	mv	a0,s4
	lw	s4,104(sp)
	.cfi_restore 20
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
.L876:
	.cfi_restore_state
	li	a0,341
	sw	s1,116(sp)
	sw	s5,100(sp)
	.cfi_offset 9, -12
	.cfi_offset 21, -28
	lla	s1,PPU
	call	_Z14X6502_RunDebugi
	lbu	a5,2(s1)
	li	a0,12
	la a4, PPUSPL; sb zero, 0(a4);
	ori	a5,a5,-128
	sb	a5,2(s1)
	lla	s5,GameInfo
	la a5, PPU+3; sb zero, 0(a5);
	call	_Z14X6502_RunDebugi
	lw	a4,0(s5)
	li	a5,3
	lw	a4,8(a4)
	sw	s2,112(sp)
	sw	s3,108(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	beq	a4,a5,.L1335
	sw	s10,80(sp)
	lb	a5,0(s1)
	.cfi_offset 26, -48
	blt	a5,zero,.L1336
.L879:
	la a4, _ZL19scanlines_per_frame; lw a4, 0(a4);
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a3,a5,4
	add	a5,a5,a3
	slli	a5,a5,2
	li	a0,-81920
	add	a5,a5,a4
	addi	a0,a0,-614
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	lla	s3,overclock_enabled
	lbu	a5,0(s3)
	beq	a5,zero,.L880
	la a4, vblankscanlines; lw a4, 0(a4);
	beq	a4,zero,.L880
	la a5, DMC_7bit; lbu a5, 0(a5);
	beq	a5,zero,.L881
	la a5, skip_7bit_overclocking; lbu a5, 0(a5);
	bne	a5,zero,.L880
.L881:
	slli	a5,a4,2
	add	a5,a5,a4
	slli	a3,a5,4
	add	a0,a5,a3
	slli	a0,a0,2
	add	a0,a0,a4
	li	a5,1
	addi	a0,a0,-12
	la a4, overclocking; sb a5, 0(a4);
	call	_Z14X6502_RunDebugi
	la a5, overclocking; sb zero, 0(a5);
.L880:
	lbu	a5,2(s1)
	li	a0,256
	andi	a5,a5,31
	sb	a5,2(s1)
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L883
	la a4, GameHBIRQHook; lw a4, 0(a4);
	beq	a4,zero,.L884
	lbu	a5,0(s1)
	li	a3,24
	andi	a5,a5,56
	beq	a5,a3,.L884
	jalr	a4
.L884:
	lla	s2,PPU_hook
	lw	a5,0(s2)
	beq	a5,zero,.L885
	li	s0,42
	j	.L886
.L1337:
	lw	a5,0(s2)
.L886:
	li	a0,8192
	jalr	a5
	lw	a5,0(s2)
	li	a0,0
	addi	s0,s0,-1
	jalr	a5
	bne	s0,zero,.L1337
.L885:
	la a5, GameHBIRQHook2; lw a5, 0(a5);
	beq	a5,zero,.L883
	jalr	a5
.L883:
	li	a0,69
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L889
	la a5, TempAddr; lw a5, 0(a5);
	la a4, RefreshAddr; sw a5, 0(a4);
	la a4, PPU_hook; lw a4, 0(a4);
	beq	a4,zero,.L889
	slli	a5,a5,18
	srli	a0,a5,18
	jalr	a4
.L889:
	lla	s10,XBuf
	lw	a0,0(s10)
	lla	s0,_ZL4kook
	la a5, _ZL10numsprites; sb zero, 0(a5);
	la a5, _ZL5spork; sw zero, 0(a5);
	call	_ZL7ResetRLPh
	lw	a5,0(s0)
	li	a0,16
	sub	a0,a0,a5
	call	_Z14X6502_RunDebugi
	lw	a3,0(s5)
	lw	a5,0(s0)
	li	a4,3
	lw	a3,8(a3)
	xori	a5,a5,1
	sw	a5,0(s0)
	beq	a3,a4,.L1338
	beq	s7,zero,.L892
	lbu	a5,2(s1)
	lla	s5,GameHBIRQHook
	lw	a4,0(s5)
	ori	a5,a5,32
	la s3, SPRAM; lbu s3, 0(s3);
	sb	a5,2(s1)
	addi	s3,s3,1
	beq	a4,zero,.L893
	li	a0,256
	call	_Z14X6502_RunDebugi
	lla	s2,scanline
	la a5, scanline; sw zero, 0(a5);
	li	s0,239
	j	.L897
.L895:
	li	a0,341
	bne	a5,s0,.L896
	li	a0,85
.L896:
	call	_Z14X6502_RunDebugi
	lw	a5,0(s2)
	addi	a5,a5,1
	sw	a5,0(s2)
	bgt	a5,s0,.L1332
.L897:
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L894
	lw	a5,0(s5)
	jalr	a5
.L894:
	lw	a5,0(s2)
	bne	a5,s3,.L895
	lbu	a4,1(s1)
	andi	a4,a4,16
	beq	a4,zero,.L895
	lbu	a4,2(s1)
	ori	a4,a4,64
	sb	a4,2(s1)
	j	.L895
.L1334:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 26
	lw	ra,124(sp)
	.cfi_restore 1
	lw	s7,92(sp)
	.cfi_restore 23
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	tail	_Z14FCEUX_PPU_Loopi
.L892:
	.cfi_def_cfa_offset 128
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 26, -48
	sw	s6,96(sp)
	lbu	a5,1(s1)
	lla	a4,DMC_7bit
	lbu	a3,0(a4)
	srli	a5,a5,5
	lla	a4,_ZL5deemp
	sb	a5,0(a4)
	lla	a4,normalscanlines
	lw	a4,0(a4)
	.cfi_offset 22, -32
	beq	a3,zero,.L902
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	beq	a3,zero,.L902
.L903:
	lla	a3,totalscanlines
	sw	a4,0(a3)
	la a3, scanline; sw zero, 0(a3);
	lla	s6,MMC5Hack
	ble	a4,zero,.L905
	li	a4,16777216
	addi	a4,a4,-1
	sw	s9,84(sp)
	sw	s8,88(sp)
	sw	s11,76(sp)
	li	a0,0
	lla	s2,scanline
	lla	s6,MMC5Hack
	.cfi_offset 25, -44
	.cfi_offset 24, -40
	.cfi_offset 27, -52
	lla	s9,_ZL10maxsprites
	lla	s5,SPRAM+256
	sw	a4,40(sp)
	sw	s7,44(sp)
	j	.L1061
.L1339:
	beq	a0,a5,.L1060
	lla	a4,DMC_7bit
	lbu	a4,0(a4)
	beq	a4,zero,.L1073
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	bne	a3,zero,.L1330
.L1059:
	la a3, overclocking; sb a4, 0(a3);
	bge	a0,a5,.L1330
	lla	a5,_ZL5deemp
	lbu	a5,0(a5)
.L1061:
	lla	a4,_ZL8deempcnt
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	li	a3,239
	addi	a4,a4,1
	sw	a4,0(a5)
	ble	a0,a3,.L906
	li	a0,325
	call	_Z14X6502_RunDebugi
	lw	a5,0(s2)
	li	a0,16
	addi	a5,a5,1
	sw	a5,0(s2)
	call	_Z14X6502_RunDebugi
.L907:
	lla	a5,normalscanlines
	lw	a4,0(a5)
	lw	a0,0(s2)
	lla	a5,totalscanlines
	lw	a5,0(a5)
	bge	a0,a4,.L1339
	li	a4,0
	j	.L1059
.L902:
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 27
	lbu	a2,0(s3)
	li	a3,0
	beq	a2,zero,.L904
	la a3, postrenderscanlines; lw a3, 0(a3);
.L904:
	add	a4,a4,a3
	j	.L903
.L906:
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	lw	s0,0(s10)
	lw	a5,0(s6)
	slli	a4,a0,8
	add	s0,s0,a4
	bne	a5,zero,.L1340
.L908:
	li	a0,256
	call	_Z14X6502_RunDebugi
	li	a0,272
	call	_ZL11RefreshLinei
	lla	a5,_ZL5tofix
	lw	a5,0(a5)
	bne	a5,zero,.L1341
.L909:
	li	a0,272
	call	_ZL14CheckSpriteHiti
	la a5, _ZL8renderbg; lbu a5, 0(a5);
	la a4, _ZL5Pline; sw zero, 0(a4);
	bne	a5,zero,.L914
	la a1, gNoBGFillColor; lbu a1, 0(a1);
	li	a5,255
	beq	a1,a5,.L1342
.L915:
	li	a2,256
	ori	a1,a1,64
	mv	a0,s0
	call	memset
.L914:
	lbu	a4,1(s1)
	andi	a5,a4,16
	bne	a5,zero,.L1343
.L918:
	andi	a3,a4,24
	addi	a5,s0,252
	beq	a3,zero,.L923
	andi	a3,a4,1
	beq	a3,zero,.L923
	li	a1,808464384
	mv	a4,a5
	addi	a1,a1,48
.L924:
	lw	a3,0(a4)
	mv	a2,a4
	addi	a4,a4,-4
	and	a3,a3,a1
	sw	a3,4(a4)
	bne	a2,s0,.L924
	lbu	a4,1(s1)
.L923:
	srli	a3,a4,5
	li	a2,7
	beq	a3,a2,.L1344
	li	a3,31
	bleu	a4,a3,.L929
	li	a2,1077952512
	addi	a2,a2,64
.L930:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	a3,s0,.L930
.L931:
	lbu	a5,1(s1)
	li	a4,256
	lla	a3,_ZL6sphitx
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s4,GameHBIRQHook
	bne	a5,zero,.L1345
.L928:
	li	a0,6
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L964
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, TempAddr; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L964:
	li	a0,63
	call	_Z14X6502_RunDebugi
	lw	a4,0(s4)
	lbu	a5,1(s1)
	beq	a4,zero,.L963
	andi	a3,a5,24
	beq	a3,zero,.L968
	lbu	a3,0(s1)
	li	a2,24
	andi	a3,a3,56
	beq	a3,a2,.L963
	jalr	a4
	lbu	a5,1(s1)
.L963:
	andi	a5,a5,16
	beq	a5,zero,.L968
	lla	s0,_ZL10numsprites
	lbu	a5,0(s0)
	la a4, _ZL5spork; sw zero, 0(a4);
	beq	a5,zero,.L968
	li	a1,128
	li	a2,256
	lla	a0,_ZL10sprlinebuf
	call	memset
	lbu	a0,0(s0)
	lla	a5,SPRBUF
	la t5, _ZL11SpriteBlurp; lbu t5, 0(t5);
	addi	a0,a0,-1
	andi	a0,a0,0xff
	slli	a1,a0,2
	sb	a0,0(s0)
	add	a1,a1,a5
	lla	t3,_ZL7ppulut1
	lla	t1,_ZL7ppulut2
	lla	t4,_ZL10sprlinebuf
	li	a7,-1
.L1056:
	lbu	a2,1(a1)
	lbu	a5,0(a1)
	lbu	t6,3(a1)
	slli	a3,a2,2
	slli	a4,a5,2
	add	a4,t3,a4
	add	a3,t1,a3
	or	a5,a5,a2
	lw	a4,0(a4)
	lw	a6,0(a3)
	lbu	a2,2(a1)
	beq	a5,zero,.L970
	slli	a3,a2,2
	andi	a3,a3,12
	slli	t0,a5,24
	or	a4,a4,a6
	andi	t2,a2,32
	add	a6,t6,t4
	addi	a3,a3,16
	andi	a2,a2,64
	srai	t0,t0,24
	beq	a0,zero,.L1346
.L971:
	beq	t2,zero,.L976
	bne	a2,zero,.L977
.L978:
	blt	t0,zero,.L1347
.L1002:
	andi	a2,a5,64
	beq	a2,zero,.L1005
	srli	a2,a4,4
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1007
	slli	a2,t0,24
	srai	a2,a2,24
.L1007:
	ori	a2,a2,64
	sb	a2,1(a6)
.L1005:
	andi	a2,a5,32
	beq	a2,zero,.L1008
	srli	a2,a4,8
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1010
	slli	a2,t0,24
	srai	a2,a2,24
.L1010:
	ori	a2,a2,64
	sb	a2,2(a6)
.L1008:
	andi	a2,a5,16
	beq	a2,zero,.L1011
	srli	a2,a4,12
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1013
	slli	a2,t0,24
	srai	a2,a2,24
.L1013:
	ori	a2,a2,64
	sb	a2,3(a6)
.L1011:
	andi	a2,a5,8
	beq	a2,zero,.L1014
	srli	a2,a4,16
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1016
	slli	a2,t0,24
	srai	a2,a2,24
.L1016:
	ori	a2,a2,64
	sb	a2,4(a6)
.L1014:
	andi	a2,a5,4
	beq	a2,zero,.L1017
	srli	a2,a4,20
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1019
	slli	a2,t0,24
	srai	a2,a2,24
.L1019:
	ori	a2,a2,64
	sb	a2,5(a6)
.L1017:
	andi	a2,a5,2
	beq	a2,zero,.L1020
	srli	a2,a4,24
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1022
	slli	a2,t0,24
	srai	a2,a2,24
.L1022:
	ori	a2,a2,64
	sb	a2,6(a6)
.L1020:
	andi	a5,a5,1
	beq	a5,zero,.L970
	srli	a4,a4,28
	or	a3,a4,a3
	lla	a5,PALRAM
	add	a5,a5,a3
	lbu	a4,1(s1)
	lbu	a3,0(a5)
	andi	a4,a4,1
	andi	a5,a3,48
	bne	a4,zero,.L1024
	slli	a5,a3,24
	srai	a5,a5,24
.L1024:
	ori	a5,a5,64
	sb	a5,7(a6)
.L970:
	addi	a0,a0,-1
	addi	a1,a1,-4
	bne	a0,a7,.L1056
	la a5, _ZL11SpriteBlurp; sb zero, 0(a5);
	li	a5,1
	la a4, _ZL5spork; sw a5, 0(a4);
.L968:
	la a4, GameHBIRQHook2; lw a4, 0(a4);
	beq	a4,zero,.L1057
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L1057
	jalr	a4
.L1057:
	lw	a5,0(s2)
	li	a4,239
	addi	a5,a5,1
	sw	a5,0(s2)
	ble	a5,a4,.L1348
.L1058:
	li	a0,16
	call	_Z14X6502_RunDebugi
	j	.L907
.L1346:
	beq	t5,zero,.L971
	lbu	ra,2(s1)
	andi	ra,ra,64
	bne	ra,zero,.L971
	lla	ra,_ZL9sphitdata
	lla	s0,_ZL6sphitx
	sw	t6,0(s0)
	sb	a5,0(ra)
	beq	a2,zero,.L972
	srli	a2,a5,1
	srli	s3,a5,3
	slli	t6,t0,5
	slli	s0,t0,3
	andi	s3,s3,4
	andi	s0,s0,32
	andi	a2,a2,8
	andi	t6,t6,64
	or	a2,a2,s3
	or	t6,t6,s0
	srli	s7,a5,7
	srli	s3,a5,5
	slli	s4,t0,7
	slli	s0,t0,1
	or	a2,a2,s7
	andi	s3,s3,2
	or	t6,t6,s4
	andi	s0,s0,16
	or	a2,a2,s3
	or	t6,t6,s0
	or	a2,a2,t6
	sb	a2,0(ra)
	beq	t2,zero,.L973
.L977:
	blt	t0,zero,.L1349
.L975:
	andi	a2,a5,64
	beq	a2,zero,.L981
	srli	a2,a4,4
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L983
	slli	a2,t0,24
	srai	a2,a2,24
.L983:
	ori	a2,a2,64
	sb	a2,6(a6)
.L981:
	andi	a2,a5,32
	beq	a2,zero,.L984
	srli	a2,a4,8
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L986
	slli	a2,t0,24
	srai	a2,a2,24
.L986:
	ori	a2,a2,64
	sb	a2,5(a6)
.L984:
	andi	a2,a5,16
	beq	a2,zero,.L987
	srli	a2,a4,12
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L989
	slli	a2,t0,24
	srai	a2,a2,24
.L989:
	ori	a2,a2,64
	sb	a2,4(a6)
.L987:
	andi	a2,a5,8
	beq	a2,zero,.L990
	srli	a2,a4,16
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L992
	slli	a2,t0,24
	srai	a2,a2,24
.L992:
	ori	a2,a2,64
	sb	a2,3(a6)
.L990:
	andi	a2,a5,4
	beq	a2,zero,.L993
	srli	a2,a4,20
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L995
	slli	a2,t0,24
	srai	a2,a2,24
.L995:
	ori	a2,a2,64
	sb	a2,2(a6)
.L993:
	andi	a2,a5,2
	beq	a2,zero,.L996
	srli	a2,a4,24
	andi	a2,a2,3
	lla	t0,PALRAM
	or	a2,a2,a3
	add	a2,t0,a2
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L998
	slli	a2,t0,24
	srai	a2,a2,24
.L998:
	ori	a2,a2,64
	sb	a2,1(a6)
.L996:
	andi	a5,a5,1
	beq	a5,zero,.L970
	srli	a4,a4,28
	or	a3,a4,a3
	lla	a5,PALRAM
	add	a5,a5,a3
	lbu	a4,1(s1)
	lbu	a3,0(a5)
	andi	a4,a4,1
	andi	a5,a3,48
	bne	a4,zero,.L1001
	slli	a5,a3,24
	srai	a5,a5,24
.L1001:
	ori	a5,a5,64
	sb	a5,0(a6)
	j	.L970
.L976:
	beq	a2,zero,.L1025
.L973:
	blt	t0,zero,.L1350
.L1026:
	andi	a2,a5,64
	beq	a2,zero,.L1028
	lbu	t6,1(s1)
	srli	a2,a4,4
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1029
	andi	t6,t6,48
.L1029:
	sb	t6,6(a6)
.L1028:
	andi	a2,a5,32
	beq	a2,zero,.L1030
	lbu	t6,1(s1)
	srli	a2,a4,8
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1031
	andi	t6,t6,48
.L1031:
	sb	t6,5(a6)
.L1030:
	andi	a2,a5,16
	beq	a2,zero,.L1032
	lbu	t6,1(s1)
	srli	a2,a4,12
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1033
	andi	t6,t6,48
.L1033:
	sb	t6,4(a6)
.L1032:
	andi	a2,a5,8
	beq	a2,zero,.L1034
	lbu	t6,1(s1)
	srli	a2,a4,16
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1035
	andi	t6,t6,48
.L1035:
	sb	t6,3(a6)
.L1034:
	andi	a2,a5,4
	beq	a2,zero,.L1036
	lbu	t6,1(s1)
	srli	a2,a4,20
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1037
	andi	t6,t6,48
.L1037:
	sb	t6,2(a6)
.L1036:
	andi	a2,a5,2
	beq	a2,zero,.L1038
	lbu	t6,1(s1)
	srli	a2,a4,24
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1039
	andi	t6,t6,48
.L1039:
	sb	t6,1(a6)
.L1038:
	andi	a5,a5,1
	beq	a5,zero,.L970
	lbu	a5,1(s1)
	srli	a4,a4,28
	or	a3,a4,a3
	lla	a4,PALRAM
	add	a4,a4,a3
	andi	a5,a5,1
	lbu	a4,0(a4)
	beq	a5,zero,.L1040
	andi	a4,a4,48
.L1040:
	sb	a4,0(a6)
	j	.L970
.L1344:
	li	a2,-1061109760
	addi	a2,a2,192
.L926:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	a3,s0,.L926
	lbu	a5,1(s1)
	li	a4,256
	lla	a3,_ZL6sphitx
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s4,GameHBIRQHook
	beq	a5,zero,.L928
.L1345:
	lbu	a7,0(s1)
	lla	s11,PPU_hook
	lw	a5,0(s11)
	xori	s7,a7,252
	srli	s7,s7,2
	and	s7,a7,s7
	srli	s4,a7,2
	srli	a6,a7,1
	slli	s7,s7,9
	andi	s4,s4,8
	andi	a6,a6,16
	li	a4,4096
	lw	t4,0(s2)
	and	s7,s7,a4
	addi	s4,s4,8
	addi	a6,a6,7
	beq	a5,zero,.L1351
	li	a1,4096
	li	s0,0
	lla	a4,SPRAM
	mv	a5,s6
	li	a2,63
	addi	a1,a1,-32
	mv	s6,a4
	mv	a3,s2
	mv	a4,s7
	mv	s2,s11
	mv	s7,s0
	sw	zero,32(sp)
	mv	s0,s4
	li	t3,63
	li	s8,7
	lla	s3,SPRBUF
	sw	a6,36(sp)
	mv	s11,a2
	sw	a1,28(sp)
	mv	s4,a5
	j	.L933
.L1354:
	lla	a2,MMC5SPRVPage
	add	a5,a2,a5
	lw	a5,0(a5)
	add	a5,a5,a7
.L955:
	lbu	t1,0(a5)
	sw	a7,12(sp)
	sb	t1,60(sp)
	bgtu	s7,s8,.L956
	lw	t1,0(s2)
	li	a0,8192
	sw	a3,24(sp)
	sw	a4,20(sp)
	sw	a5,16(sp)
	jalr	t1
	lw	a7,12(sp)
	lw	t1,0(s2)
	mv	a0,a7
	jalr	t1
	lbu	a0,2(s6)
	lw	a3,24(sp)
	lw	a4,20(sp)
	lw	a5,16(sp)
	li	t3,63
.L956:
	lbu	a7,8(a5)
	lbu	a5,3(s6)
	sb	a0,62(sp)
	sb	a7,61(sp)
	sb	a5,63(sp)
	lw	a0,60(sp)
	slli	a5,s7,2
	add	a5,a5,s3
	addi	s7,s7,1
	sw	a0,0(a5)
	andi	s7,s7,0xff
.L947:
	addi	s6,s6,4
	addi	s11,s11,-1
	beq	s6,s5,.L1352
.L933:
	lbu	a0,0(s6)
	lw	a5,0(a3)
	sub	a5,a5,a0
	bgeu	a5,s0,.L947
	lw	a0,0(s9)
	bge	s7,a0,.L948
	beq	s11,t3,.L1353
.L949:
	lbu	a0,1(s6)
	lbu	a7,0(s1)
	slli	t1,a0,4
	andi	a7,a7,32
	add	t4,a4,t1
	beq	a7,zero,.L951
	lw	a2,28(sp)
	slli	a0,a0,12
	li	a7,4096
	and	a0,a0,a7
	and	t1,t1,a2
	or	t4,a0,t1
.L951:
	lbu	a0,2(s6)
	andi	t1,a5,8
	add	a7,a5,t1
	slli	t5,a0,24
	srai	t5,t5,24
	add	a7,a7,t4
	bge	t5,zero,.L953
	lw	a2,36(sp)
	sub	a5,a2,a5
	sub	a5,a5,t1
	add	a7,a5,t4
.L953:
	lw	t1,0(s4)
	srli	a5,a7,10
	slli	a5,a5,2
	bne	t1,zero,.L1354
	lla	a2,VPage
	add	a5,a2,a5
	lw	a5,0(a5)
	add	a5,a5,a7
	j	.L955
.L1348:
	lw	a0,0(s10)
	slli	a5,a5,8
	add	a0,a0,a5
	call	_ZL7ResetRLPh
	j	.L1058
.L929:
	li	a1,1061109760
	li	a2,-2139062272
	addi	a1,a1,-193
	addi	a2,a2,128
.L932:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	and	a4,a4,a1
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	a3,s0,.L932
	j	.L931
.L1353:
	li	a2,1
	sw	a2,32(sp)
	j	.L949
.L1343:
	la a5, _ZL5spork; lw a5, 0(a5);
	beq	a5,zero,.L918
	la a5, _ZL5spork; sw zero, 0(a5);
	la a5, _ZL13rendersprites; lbu a5, 0(a5);
	beq	a5,zero,.L918
	lla	a5,_ZL10sprlinebuf
	mv	a3,s0
	lla	a1,_ZL10sprlinebuf+256
.L922:
	lbu	a4,0(a5)
	slli	a2,a4,24
	srai	a2,a2,24
	blt	a2,zero,.L920
	andi	a2,a4,64
	beq	a2,zero,.L921
	lbu	a2,0(a3)
	andi	a2,a2,64
	beq	a2,zero,.L920
.L921:
	sb	a4,0(a3)
.L920:
	addi	a5,a5,1
	addi	a3,a3,1
	bne	a1,a5,.L922
	lbu	a4,1(s1)
	j	.L918
.L1341:
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L909
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a2,28672
	li	a5,4096
	and	a1,a4,a2
	add	a5,a4,a5
	beq	a1,a2,.L1355
.L912:
	sw	a5,0(a3)
	j	.L909
.L1355:
	andi	a2,a4,992
	li	a0,928
	xor	a5,a4,a1
	beq	a2,a0,.L1356
	li	a1,992
	addi	a5,a5,32
	bne	a2,a1,.L912
	li	a5,28672
	addi	a5,a5,992
	xor	a5,a4,a5
	sw	a5,0(a3)
	j	.L909
.L1340:
	call	_Z7MMC5_hbi
	j	.L908
.L972:
	bne	t2,zero,.L978
.L1025:
	blt	t0,zero,.L1357
.L1041:
	andi	a2,a5,64
	beq	a2,zero,.L1043
	lbu	t6,1(s1)
	srli	a2,a4,4
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1044
	andi	t6,t6,48
.L1044:
	sb	t6,1(a6)
.L1043:
	andi	a2,a5,32
	beq	a2,zero,.L1045
	lbu	t6,1(s1)
	srli	a2,a4,8
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1046
	andi	t6,t6,48
.L1046:
	sb	t6,2(a6)
.L1045:
	andi	a2,a5,16
	beq	a2,zero,.L1047
	lbu	t6,1(s1)
	srli	a2,a4,12
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1048
	andi	t6,t6,48
.L1048:
	sb	t6,3(a6)
.L1047:
	andi	a2,a5,8
	beq	a2,zero,.L1049
	lbu	t6,1(s1)
	srli	a2,a4,16
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1050
	andi	t6,t6,48
.L1050:
	sb	t6,4(a6)
.L1049:
	andi	a2,a5,4
	beq	a2,zero,.L1051
	lbu	t6,1(s1)
	srli	a2,a4,20
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1052
	andi	t6,t6,48
.L1052:
	sb	t6,5(a6)
.L1051:
	andi	a2,a5,2
	beq	a2,zero,.L1053
	lbu	t6,1(s1)
	srli	a2,a4,24
	andi	a2,a2,3
	or	a2,a2,a3
	lla	t0,PALRAM
	add	t0,t0,a2
	andi	a2,t6,1
	lbu	t6,0(t0)
	beq	a2,zero,.L1054
	andi	t6,t6,48
.L1054:
	sb	t6,6(a6)
.L1053:
	andi	a5,a5,1
	beq	a5,zero,.L970
	lbu	a5,1(s1)
	srli	a4,a4,28
	or	a3,a4,a3
	lla	a4,PALRAM
	add	a4,a4,a3
	andi	a5,a5,1
	lbu	a4,0(a4)
	beq	a5,zero,.L1055
	andi	a4,a4,48
.L1055:
	sb	a4,7(a6)
	j	.L970
.L1073:
	li	a4,1
	j	.L1059
.L1342:
	lbu	a5,1(s1)
	la a1, PALRAM; lbu a1, 0(a1);
	andi	a5,a5,1
	beq	a5,zero,.L915
	andi	a1,a1,48
	j	.L915
.L948:
	lbu	a5,2(s1)
	mv	s0,s7
	mv	s11,s2
	ori	a5,a5,32
	mv	s7,a4
	mv	s6,s4
	mv	s2,a3
	sb	a5,2(s1)
.L957:
	li	a4,8
	bgtu	s0,a4,.L1065
	lw	a5,0(s11)
	beq	a5,zero,.L944
	sub	s8,a4,s0
	beq	a4,s0,.L1071
	li	s4,0
	j	.L961
.L1358:
	lw	a5,0(s11)
.L961:
	li	a0,8192
	jalr	a5
	lw	a5,0(s11)
	mv	a0,s7
	addi	s4,s4,1
	jalr	a5
	bne	s4,s8,.L1358
.L944:
	lw	a3,32(sp)
	lla	s4,GameHBIRQHook
	lw	a5,0(s4)
	la a4, _ZL10numsprites; sb s0, 0(a4);
	la a4, _ZL11SpriteBlurp; sb a3, 0(a4);
	beq	a5,zero,.L928
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L928
	lbu	a5,0(s1)
	li	a4,24
	andi	a5,a5,56
	beq	a5,a4,.L928
	li	a0,6
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,24
	beq	a5,zero,.L962
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, TempAddr; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L962:
	li	a0,4
	call	_Z14X6502_RunDebugi
	lw	a5,0(s4)
	jalr	a5
	li	a0,59
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	j	.L963
.L1359:
	li	a5,8
	bleu	s0,a5,.L944
.L1065:
	lbu	a5,2(s1)
	ori	a5,a5,32
	sb	a5,2(s1)
	j	.L944
.L1351:
	li	s8,4096
	lw	t6,0(s9)
	lw	ra,0(s6)
	sw	zero,32(sp)
	li	a1,63
	li	s0,0
	lla	a3,SPRAM
	li	t2,63
	andi	a7,a7,32
	lla	t0,SPRBUF
	lla	s11,VPage
	lla	t5,MMC5SPRVPage
	li	s3,4096
	addi	s8,s8,-32
	j	.L945
.L1361:
	add	a5,t5,a5
	lw	a5,0(a5)
	add	a4,a5,a4
.L942:
	lbu	a0,8(a4)
	lbu	a5,0(a4)
	lbu	a4,3(a3)
	slli	a0,a0,8
	or	a5,a5,a0
	lw	a0,40(sp)
	slli	a2,a2,16
	or	a5,a5,a2
	slli	a4,a4,24
	slli	a2,s0,2
	and	a5,a5,a0
	add	a2,a2,t0
	or	a5,a5,a4
	addi	s0,s0,1
	sw	a5,0(a2)
	andi	s0,s0,0xff
.L934:
	addi	a3,a3,4
	addi	a1,a1,-1
	beq	a3,s5,.L1359
.L945:
	lbu	a5,0(a3)
	sub	a5,t4,a5
	bgeu	a5,s4,.L934
	bge	s0,t6,.L935
	beq	a1,t2,.L1360
.L936:
	lbu	a4,1(a3)
	slli	a2,a4,4
	add	a0,s7,a2
	beq	a7,zero,.L938
	slli	a4,a4,12
	and	a4,a4,s3
	and	a2,a2,s8
	or	a0,a4,a2
.L938:
	lbu	a2,2(a3)
	andi	t1,a5,8
	add	a4,a5,t1
	slli	t3,a2,24
	srai	t3,t3,24
	add	a4,a4,a0
	bge	t3,zero,.L940
	sub	a5,a6,a5
	sub	a5,a5,t1
	add	a4,a5,a0
.L940:
	srli	a5,a4,10
	slli	a5,a5,2
	bne	ra,zero,.L1361
	add	a5,s11,a5
	lw	a5,0(a5)
	add	a4,a5,a4
	j	.L942
.L1360:
	li	a4,1
	sw	a4,32(sp)
	j	.L936
.L1060:
	lw	s7,44(sp)
	lw	s8,88(sp)
	.cfi_restore 24
	lw	s9,84(sp)
	.cfi_restore 25
	lw	s11,76(sp)
	.cfi_restore 27
	la a5, overclocking; sb zero, 0(a5);
.L905:
	lw	a5,0(s6)
	la a4, DMC_7bit; sb zero, 0(a4);
	bne	a5,zero,.L1362
.L1062:
	lla	a5,_ZL8deempcnt
	li	a2,0
	li	a4,1
	li	a1,7
.L1064:
	lw	a3,4(a5)
	ble	a3,a2,.L1063
	mv	a2,a3
	mv	s7,a4
.L1063:
	sw	zero,4(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bne	a4,a1,.L1064
	andi	a0,s7,0xff
	li	a1,0
	call	_Z21SetNESDeemph_OldHackyhi
	call	_Z7ShowFPSv
	lw	ra,124(sp)
	.cfi_restore 1
	lw	s0,120(sp)
	.cfi_restore 8
	li	s4,1
	lw	s1,116(sp)
	.cfi_restore 9
	lw	s2,112(sp)
	.cfi_restore 18
	lw	s3,108(sp)
	.cfi_restore 19
	lw	s5,100(sp)
	.cfi_restore 21
	lw	s6,96(sp)
	.cfi_restore 22
	lw	s10,80(sp)
	.cfi_restore 26
	lw	s7,92(sp)
	.cfi_restore 23
	mv	a0,s4
	lw	s4,104(sp)
	.cfi_restore 20
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
.L1338:
	.cfi_def_cfa_offset 128
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 26, -48
	la a0, normalscanlines; lw a0, 0(a0);
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
.L1332:
	lw	s1,116(sp)
	.cfi_restore 9
	lw	s2,112(sp)
	.cfi_restore 18
	lw	s3,108(sp)
	.cfi_restore 19
	lw	s5,100(sp)
	.cfi_restore 21
	lw	s10,80(sp)
	.cfi_restore 26
	j	.L877
.L935:
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	lbu	a5,2(s1)
	li	a4,8
	ori	a5,a5,32
	sb	a5,2(s1)
	bleu	s0,a4,.L944
	sb	a5,2(s1)
	j	.L944
.L1349:
	andi	t0,a4,3
	or	t0,t0,a3
	lla	a2,PALRAM
	add	a2,a2,t0
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L980
	slli	a2,t0,24
	srai	a2,a2,24
.L980:
	ori	a2,a2,64
	sb	a2,7(a6)
	j	.L975
.L1350:
	lbu	a2,1(s1)
	andi	t0,a4,3
	or	t0,t0,a3
	lla	t6,PALRAM
	add	t6,t6,t0
	andi	a2,a2,1
	lbu	t6,0(t6)
	beq	a2,zero,.L1027
	andi	t6,t6,48
.L1027:
	sb	t6,7(a6)
	j	.L1026
.L1352:
	mv	s0,s7
	mv	s11,s2
	mv	s7,a4
	mv	s6,s4
	mv	s2,a3
	j	.L957
.L1357:
	lbu	a2,1(s1)
	andi	t0,a4,3
	or	t0,t0,a3
	lla	t6,PALRAM
	add	t6,t6,t0
	andi	a2,a2,1
	lbu	t6,0(t6)
	beq	a2,zero,.L1042
	andi	t6,t6,48
.L1042:
	sb	t6,0(a6)
	j	.L1041
.L1347:
	andi	t0,a4,3
	or	t0,t0,a3
	lla	a2,PALRAM
	add	a2,a2,t0
	lbu	t6,1(s1)
	lbu	t0,0(a2)
	andi	t6,t6,1
	andi	a2,t0,48
	bne	t6,zero,.L1004
	slli	a2,t0,24
	srai	a2,a2,24
.L1004:
	ori	a2,a2,64
	sb	a2,0(a6)
	j	.L1002
.L1336:
	.cfi_restore 22
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 27
	call	_Z10TriggerNMIv
	j	.L879
.L893:
	li	a5,239
	bgt	s3,a5,.L898
	slli	a5,s3,2
	add	a5,a5,s3
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a0,a5,2
	add	a0,a0,s3
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s1)
	andi	a5,a5,16
	beq	a5,zero,.L899
	lbu	a5,2(s1)
	ori	a5,a5,64
	sb	a5,2(s1)
.L899:
	li	a0,240
	sub	a0,a0,s3
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	j	.L1333
.L898:
	li	a0,81920
	addi	a0,a0,-80
.L1333:
	call	_Z14X6502_RunDebugi
	call	_Z7ShowFPSv
	lw	s1,116(sp)
	.cfi_restore 9
	lw	s2,112(sp)
	.cfi_restore 18
	lw	s3,108(sp)
	.cfi_restore 19
	lw	s5,100(sp)
	.cfi_restore 21
	lw	s10,80(sp)
	.cfi_restore 26
	j	.L874
.L1362:
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 26, -48
	la a0, scanline; lw a0, 0(a0);
	call	_Z7MMC5_hbi
	j	.L1062
.L1356:
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 27, -52
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	sw	a5,0(a3)
	j	.L909
.L1071:
	li	s0,8
	j	.L944
.L1330:
	lw	s7,44(sp)
	lw	s8,88(sp)
	.cfi_restore 24
	lw	s9,84(sp)
	.cfi_restore 25
	lw	s11,76(sp)
	.cfi_restore 27
	j	.L905
.L1335:
	.cfi_restore 22
	.cfi_restore 26
	li	a2,1680
	lla	a1,.LC0
	lla	a0,.LC1
	sw	s6,96(sp)
	sw	s8,88(sp)
	sw	s9,84(sp)
	sw	s10,80(sp)
	sw	s11,76(sp)
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE124:
	.size	_Z12FCEUPPU_Loopi, .-_Z12FCEUPPU_Loopi
	.section	.text.startup._GLOBAL__sub_I_test,"ax",@progbits
	.align	2
	.type	_GLOBAL__sub_I_test, @function
_GLOBAL__sub_I_test:
.LFB133:
	.cfi_startproc
	lla	t3,bitrevlut
	li	a5,-32768
	sh	a5,0(t3)
	li	a7,7
	li	a2,2
	li	t1,128
	li	a6,1
.L1366:
	slli	a6,a6,1
	srai	t1,t1,1
	ble	a6,zero,.L1364
	andi	a0,t1,0xff
	lla	a5,bitrevlut
	add	a1,t3,a6
.L1365:
	lbu	a4,0(a5)
	add	a3,a5,a2
	addi	a5,a5,1
	add	a4,a0,a4
	sb	a4,0(a3)
	bne	a1,a5,.L1365
	add	a2,a2,a6
.L1364:
	addi	a7,a7,-1
	bne	a7,zero,.L1366
	ret
	.cfi_endproc
.LFE133:
	.size	_GLOBAL__sub_I_test, .-_GLOBAL__sub_I_test
	.section	.init_array,"aw"
	.align	2
	.word	_GLOBAL__sub_I_test
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE8oamcount,"aw",@nobits
	.align	2
	.type	_ZZ14FCEUX_PPU_LoopiE8oamcount, @object
	.size	_ZZ14FCEUX_PPU_LoopiE8oamcount, 4
_ZZ14FCEUX_PPU_LoopiE8oamcount:
	.zero	4
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE7oamslot,"aw",@nobits
	.align	2
	.type	_ZZ14FCEUX_PPU_LoopiE7oamslot, @object
	.size	_ZZ14FCEUX_PPU_LoopiE7oamslot, 4
_ZZ14FCEUX_PPU_LoopiE7oamslot:
	.zero	4
	.section	.sbss._ZZ14FCEUX_PPU_LoopiE9oamcounts,"aw",@nobits
	.align	2
	.type	_ZZ14FCEUX_PPU_LoopiE9oamcounts, @object
	.size	_ZZ14FCEUX_PPU_LoopiE9oamcounts, 8
_ZZ14FCEUX_PPU_LoopiE9oamcounts:
	.zero	8
	.section	.bss._ZZ14FCEUX_PPU_LoopiE4oams,"aw",@nobits
	.align	2
	.type	_ZZ14FCEUX_PPU_LoopiE4oams, @object
	.size	_ZZ14FCEUX_PPU_LoopiE4oams, 1024
_ZZ14FCEUX_PPU_LoopiE4oams:
	.zero	1024
	.hidden	framectr
	.globl	framectr
	.section	.sbss.framectr,"aw",@nobits
	.align	2
	.type	framectr, @object
	.size	framectr, 4
framectr:
	.zero	4
	.hidden	bgdata
	.globl	bgdata
	.section	.bss.bgdata,"aw",@nobits
	.align	2
	.type	bgdata, @object
	.size	bgdata, 204
bgdata:
	.zero	204
	.hidden	totpputime
	.globl	totpputime
	.section	.sbss.totpputime,"aw",@nobits
	.align	2
	.type	totpputime, @object
	.size	totpputime, 4
totpputime:
	.zero	4
	.hidden	pputime
	.globl	pputime
	.section	.sbss.pputime,"aw",@nobits
	.align	2
	.type	pputime, @object
	.size	pputime, 4
pputime:
	.zero	4
	.hidden	FCEU_NEWPPU_STATEINFO
	.globl	FCEU_NEWPPU_STATEINFO
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"IDLS"
	.align	2
.LC3:
	.string	"SR_0"
	.align	2
.LC4:
	.string	"SR_1"
	.align	2
.LC5:
	.string	"SR_2"
	.align	2
.LC6:
	.string	"SR_3"
	.align	2
.LC7:
	.string	"SRx0"
	.align	2
.LC8:
	.string	"SRx1"
	.align	2
.LC9:
	.string	"SRx2"
	.align	2
.LC10:
	.string	"SRx3"
	.align	2
.LC11:
	.string	"SRx4"
	.align	2
.LC12:
	.string	"SRx5"
	.align	2
.LC13:
	.string	"SRx6"
	.align	2
.LC14:
	.string	"SRx7"
	.align	2
.LC15:
	.string	"SR_4"
	.align	2
.LC16:
	.string	"SR_5"
	.align	2
.LC17:
	.string	"SR_6"
	.align	2
.LC18:
	.string	"PFVx"
	.align	2
.LC19:
	.string	"PVxx"
	.align	2
.LC20:
	.string	"PHxx"
	.align	2
.LC21:
	.string	"PVTx"
	.align	2
.LC22:
	.string	"PHTx"
	.align	2
.LC23:
	.string	"P_FV"
	.align	2
.LC24:
	.string	"P_Vx"
	.align	2
.LC25:
	.string	"P_Hx"
	.align	2
.LC26:
	.string	"P_VT"
	.align	2
.LC27:
	.string	"P_HT"
	.align	2
.LC28:
	.string	"PFHx"
	.align	2
.LC29:
	.string	"PSxx"
	.align	2
.LC30:
	.string	"PST0"
	.align	2
.LC31:
	.string	"PST1"
	.align	2
.LC32:
	.string	"PST2"
	.section	.data.FCEU_NEWPPU_STATEINFO,"aw"
	.align	2
	.type	FCEU_NEWPPU_STATEINFO, @object
	.size	FCEU_NEWPPU_STATEINFO, 384
FCEU_NEWPPU_STATEINFO:
	.word	idleSynch
	.word	1
	.word	.LC2
	.word	spr_read
	.word	-2147483644
	.word	.LC3
	.word	spr_read+4
	.word	-2147483644
	.word	.LC4
	.word	spr_read+8
	.word	-2147483644
	.word	.LC5
	.word	spr_read+12
	.word	-2147483644
	.word	.LC6
	.word	spr_read+16
	.word	-2147483644
	.word	.LC7
	.word	spr_read+16
	.word	-2147483644
	.word	.LC8
	.word	spr_read+16
	.word	-2147483644
	.word	.LC9
	.word	spr_read+16
	.word	-2147483644
	.word	.LC10
	.word	spr_read+16
	.word	-2147483644
	.word	.LC11
	.word	spr_read+16
	.word	-2147483644
	.word	.LC12
	.word	spr_read+16
	.word	-2147483644
	.word	.LC13
	.word	spr_read+16
	.word	-2147483644
	.word	.LC14
	.word	spr_read+48
	.word	-2147483644
	.word	.LC15
	.word	spr_read+52
	.word	-2147483644
	.word	.LC16
	.word	spr_read+56
	.word	-2147483644
	.word	.LC17
	.word	ppur
	.word	-2147483644
	.word	.LC18
	.word	ppur+4
	.word	-2147483644
	.word	.LC19
	.word	ppur+8
	.word	-2147483644
	.word	.LC20
	.word	ppur+12
	.word	-2147483644
	.word	.LC21
	.word	ppur+16
	.word	-2147483644
	.word	.LC22
	.word	ppur+20
	.word	-2147483644
	.word	.LC23
	.word	ppur+24
	.word	-2147483644
	.word	.LC24
	.word	ppur+28
	.word	-2147483644
	.word	.LC25
	.word	ppur+32
	.word	-2147483644
	.word	.LC26
	.word	ppur+36
	.word	-2147483644
	.word	.LC27
	.word	ppur+40
	.word	-2147483644
	.word	.LC28
	.word	ppur+44
	.word	-2147483644
	.word	.LC29
	.word	ppur+52
	.word	-2147483644
	.word	.LC30
	.word	ppur+56
	.word	-2147483644
	.word	.LC31
	.word	ppur+60
	.word	-2147483644
	.word	.LC32
	.word	0
	.zero	8
	.hidden	FCEUPPU_STATEINFO
	.globl	FCEUPPU_STATEINFO
	.section	.rodata.str1.4
	.align	2
.LC33:
	.string	"NTAR"
	.align	2
.LC34:
	.string	"PRAM"
	.align	2
.LC35:
	.string	"SPRA"
	.align	2
.LC36:
	.string	"PPUR"
	.align	2
.LC37:
	.string	"KOOK"
	.align	2
.LC38:
	.string	"DEAD"
	.align	2
.LC39:
	.string	"PSPL"
	.align	2
.LC40:
	.string	"XOFF"
	.align	2
.LC41:
	.string	"VTGL"
	.align	2
.LC42:
	.string	"RADD"
	.align	2
.LC43:
	.string	"TADD"
	.align	2
.LC44:
	.string	"VBUF"
	.align	2
.LC45:
	.string	"PGEN"
	.section	.data.FCEUPPU_STATEINFO,"aw"
	.align	2
	.type	FCEUPPU_STATEINFO, @object
	.size	FCEUPPU_STATEINFO, 168
FCEUPPU_STATEINFO:
	.word	NTARAM
	.word	2048
	.word	.LC33
	.word	PALRAM
	.word	32
	.word	.LC34
	.word	SPRAM
	.word	256
	.word	.LC35
	.word	PPU
	.word	4
	.word	.LC36
	.word	_ZL4kook
	.word	1
	.word	.LC37
	.word	_ZL7ppudead
	.word	1
	.word	.LC38
	.word	PPUSPL
	.word	1
	.word	.LC39
	.word	XOffset
	.word	1
	.word	.LC40
	.word	vtoggle
	.word	1
	.word	.LC41
	.word	_ZL12RefreshAddrT
	.word	-2147483646
	.word	.LC42
	.word	_ZL9TempAddrT
	.word	-2147483646
	.word	.LC43
	.word	VRAMBuffer
	.word	1
	.word	.LC44
	.word	PPUGenLatch
	.word	1
	.word	.LC45
	.word	0
	.zero	8
	.section	.sbss._ZL12RefreshAddrT,"aw",@nobits
	.align	1
	.type	_ZL12RefreshAddrT, @object
	.size	_ZL12RefreshAddrT, 2
_ZL12RefreshAddrT:
	.zero	2
	.section	.sbss._ZL9TempAddrT,"aw",@nobits
	.align	1
	.type	_ZL9TempAddrT, @object
	.size	_ZL9TempAddrT, 2
_ZL9TempAddrT:
	.zero	2
	.hidden	PPU_MASTER
	.globl	PPU_MASTER
	.section	.sdata.PPU_MASTER,"aw"
	.align	2
	.type	PPU_MASTER, @object
	.size	PPU_MASTER, 4
PPU_MASTER:
	.word	_Z12FCEUPPU_Loopi
	.section	.sbss._ZL11SpriteBlurp,"aw",@nobits
	.type	_ZL11SpriteBlurp, @object
	.size	_ZL11SpriteBlurp, 1
_ZL11SpriteBlurp:
	.zero	1
	.section	.sbss._ZL10numsprites,"aw",@nobits
	.type	_ZL10numsprites, @object
	.size	_ZL10numsprites, 1
_ZL10numsprites:
	.zero	1
	.section	.sbss._ZZL11RefreshLineiE7atlatch,"aw",@nobits
	.align	2
	.type	_ZZL11RefreshLineiE7atlatch, @object
	.size	_ZZL11RefreshLineiE7atlatch, 4
_ZZL11RefreshLineiE7atlatch:
	.zero	4
	.section	.sbss._ZZL11RefreshLineiE6pshift,"aw",@nobits
	.align	2
	.type	_ZZL11RefreshLineiE6pshift, @object
	.size	_ZZL11RefreshLineiE6pshift, 8
_ZZL11RefreshLineiE6pshift:
	.zero	8
	.section	.sbss._ZL5spork,"aw",@nobits
	.align	2
	.type	_ZL5spork, @object
	.size	_ZL5spork, 4
_ZL5spork:
	.zero	4
	.section	.sbss._ZL9sphitdata,"aw",@nobits
	.type	_ZL9sphitdata, @object
	.size	_ZL9sphitdata, 1
_ZL9sphitdata:
	.zero	1
	.section	.sbss._ZL6sphitx,"aw",@nobits
	.align	2
	.type	_ZL6sphitx, @object
	.size	_ZL6sphitx, 4
_ZL6sphitx:
	.zero	4
	.section	.sdata._ZL8renderbg,"aw"
	.type	_ZL8renderbg, @object
	.size	_ZL8renderbg, 1
_ZL8renderbg:
	.byte	1
	.section	.sdata._ZL13rendersprites,"aw"
	.type	_ZL13rendersprites, @object
	.size	_ZL13rendersprites, 1
_ZL13rendersprites:
	.byte	1
	.section	.bss._ZL10sprlinebuf,"aw",@nobits
	.align	2
	.type	_ZL10sprlinebuf, @object
	.size	_ZL10sprlinebuf, 264
_ZL10sprlinebuf:
	.zero	264
	.section	.sbss._ZL5tofix,"aw",@nobits
	.align	2
	.type	_ZL5tofix, @object
	.size	_ZL5tofix, 4
_ZL5tofix:
	.zero	4
	.hidden	linestartts
	.globl	linestartts
	.section	.sbss.linestartts,"aw",@nobits
	.align	2
	.type	linestartts, @object
	.size	linestartts, 4
linestartts:
	.zero	4
	.section	.sbss._ZL9firsttile,"aw",@nobits
	.align	2
	.type	_ZL9firsttile, @object
	.size	_ZL9firsttile, 4
_ZL9firsttile:
	.zero	4
	.section	.sbss._ZL6Plinef,"aw",@nobits
	.align	2
	.type	_ZL6Plinef, @object
	.size	_ZL6Plinef, 4
_ZL6Plinef:
	.zero	4
	.section	.sbss._ZL5Pline,"aw",@nobits
	.align	2
	.type	_ZL5Pline, @object
	.size	_ZL5Pline, 4
_ZL5Pline:
	.zero	4
	.hidden	newppu
	.globl	newppu
	.section	.sbss.newppu,"aw",@nobits
	.align	2
	.type	newppu, @object
	.size	newppu, 4
newppu:
	.zero	4
	.hidden	FFCEUX_PPUWrite
	.globl	FFCEUX_PPUWrite
	.section	.sbss.FFCEUX_PPUWrite,"aw",@nobits
	.align	2
	.type	FFCEUX_PPUWrite, @object
	.size	FFCEUX_PPUWrite, 4
FFCEUX_PPUWrite:
	.zero	4
	.hidden	FFCEUX_PPURead
	.globl	FFCEUX_PPURead
	.section	.sbss.FFCEUX_PPURead,"aw",@nobits
	.align	2
	.type	FFCEUX_PPURead, @object
	.size	FFCEUX_PPURead, 4
FFCEUX_PPURead:
	.zero	4
	.hidden	cdloggerVideoDataSize
	.globl	cdloggerVideoDataSize
	.section	.sbss.cdloggerVideoDataSize,"aw",@nobits
	.align	2
	.type	cdloggerVideoDataSize, @object
	.size	cdloggerVideoDataSize, 4
cdloggerVideoDataSize:
	.zero	4
	.hidden	cdloggervdata
	.globl	cdloggervdata
	.section	.sbss.cdloggervdata,"aw",@nobits
	.align	2
	.type	cdloggervdata, @object
	.size	cdloggervdata, 4
cdloggervdata:
	.zero	4
	.hidden	LogAddress
	.globl	LogAddress
	.section	.sdata.LogAddress,"aw"
	.align	2
	.type	LogAddress, @object
	.size	LogAddress, 4
LogAddress:
	.word	-1
	.hidden	undefinedvromcount
	.globl	undefinedvromcount
	.section	.sbss.undefinedvromcount,"aw",@nobits
	.align	2
	.type	undefinedvromcount, @object
	.size	undefinedvromcount, 4
undefinedvromcount:
	.zero	4
	.hidden	vromreadcount
	.globl	vromreadcount
	.section	.sbss.vromreadcount,"aw",@nobits
	.align	2
	.type	vromreadcount, @object
	.size	vromreadcount, 4
vromreadcount:
	.zero	4
	.hidden	rendercount
	.globl	rendercount
	.section	.sbss.rendercount,"aw",@nobits
	.align	2
	.type	rendercount, @object
	.size	rendercount, 4
rendercount:
	.zero	4
	.section	.sbss._ZL16PALcache_outdate,"aw",@nobits
	.align	2
	.type	_ZL16PALcache_outdate, @object
	.size	_ZL16PALcache_outdate, 4
_ZL16PALcache_outdate:
	.zero	4
	.section	.bss._ZL8PALcache,"aw",@nobits
	.align	2
	.type	_ZL8PALcache, @object
	.size	_ZL8PALcache, 512
_ZL8PALcache:
	.zero	512
	.hidden	UPALRAM
	.globl	UPALRAM
	.section	.sbss.UPALRAM,"aw",@nobits
	.align	2
	.type	UPALRAM, @object
	.size	UPALRAM, 3
UPALRAM:
	.zero	3
	.hidden	SPRBUF
	.globl	SPRBUF
	.section	.bss.SPRBUF,"aw",@nobits
	.align	2
	.type	SPRBUF, @object
	.size	SPRBUF, 256
SPRBUF:
	.zero	256
	.hidden	SPRAM
	.globl	SPRAM
	.section	.bss.SPRAM,"aw",@nobits
	.align	2
	.type	SPRAM, @object
	.size	SPRAM, 256
SPRAM:
	.zero	256
	.hidden	PALRAM
	.globl	PALRAM
	.section	.bss.PALRAM,"aw",@nobits
	.align	2
	.type	PALRAM, @object
	.size	PALRAM, 32
PALRAM:
	.zero	32
	.hidden	NTARAM
	.globl	NTARAM
	.section	.bss.NTARAM,"aw",@nobits
	.align	2
	.type	NTARAM, @object
	.size	NTARAM, 2048
NTARAM:
	.zero	2048
	.hidden	PPUSPL
	.globl	PPUSPL
	.section	.sbss.PPUSPL,"aw",@nobits
	.type	PPUSPL, @object
	.size	PPUSPL, 1
PPUSPL:
	.zero	1
	.hidden	PPU
	.globl	PPU
	.section	.sbss.PPU,"aw",@nobits
	.align	2
	.type	PPU, @object
	.size	PPU, 4
PPU:
	.zero	4
	.section	.sbss._ZL19scanlines_per_frame,"aw",@nobits
	.align	2
	.type	_ZL19scanlines_per_frame, @object
	.size	_ZL19scanlines_per_frame, 4
_ZL19scanlines_per_frame:
	.zero	4
	.hidden	g_rasterpos
	.globl	g_rasterpos
	.section	.sbss.g_rasterpos,"aw",@nobits
	.align	2
	.type	g_rasterpos, @object
	.size	g_rasterpos, 4
g_rasterpos:
	.zero	4
	.hidden	scanline
	.globl	scanline
	.section	.sbss.scanline,"aw",@nobits
	.align	2
	.type	scanline, @object
	.size	scanline, 4
scanline:
	.zero	4
	.section	.sdata._ZL10maxsprites,"aw"
	.align	2
	.type	_ZL10maxsprites, @object
	.size	_ZL10maxsprites, 4
_ZL10maxsprites:
	.word	8
	.hidden	NTRefreshAddr
	.globl	NTRefreshAddr
	.section	.sbss.NTRefreshAddr,"aw",@nobits
	.align	2
	.type	NTRefreshAddr, @object
	.size	NTRefreshAddr, 4
NTRefreshAddr:
	.zero	4
	.hidden	DummyRead
	.globl	DummyRead
	.section	.sbss.DummyRead,"aw",@nobits
	.align	2
	.type	DummyRead, @object
	.size	DummyRead, 4
DummyRead:
	.zero	4
	.hidden	RefreshAddr
	.globl	RefreshAddr
	.section	.sbss.RefreshAddr,"aw",@nobits
	.align	2
	.type	RefreshAddr, @object
	.size	RefreshAddr, 4
RefreshAddr:
	.zero	4
	.hidden	TempAddr
	.globl	TempAddr
	.section	.sbss.TempAddr,"aw",@nobits
	.align	2
	.type	TempAddr, @object
	.size	TempAddr, 4
TempAddr:
	.zero	4
	.hidden	SpriteDMA
	.globl	SpriteDMA
	.section	.sbss.SpriteDMA,"aw",@nobits
	.type	SpriteDMA, @object
	.size	SpriteDMA, 1
SpriteDMA:
	.zero	1
	.hidden	XOffset
	.globl	XOffset
	.section	.sbss.XOffset,"aw",@nobits
	.type	XOffset, @object
	.size	XOffset, 1
XOffset:
	.zero	1
	.hidden	vtoggle
	.globl	vtoggle
	.section	.sbss.vtoggle,"aw",@nobits
	.type	vtoggle, @object
	.size	vtoggle, 1
vtoggle:
	.zero	1
	.hidden	PPU_hook
	.globl	PPU_hook
	.section	.sbss.PPU_hook,"aw",@nobits
	.align	2
	.type	PPU_hook, @object
	.size	PPU_hook, 4
PPU_hook:
	.zero	4
	.hidden	GameHBIRQHook2
	.globl	GameHBIRQHook2
	.section	.sbss.GameHBIRQHook2,"aw",@nobits
	.align	2
	.type	GameHBIRQHook2, @object
	.size	GameHBIRQHook2, 4
GameHBIRQHook2:
	.zero	4
	.hidden	GameHBIRQHook
	.globl	GameHBIRQHook
	.section	.sbss.GameHBIRQHook,"aw",@nobits
	.align	2
	.type	GameHBIRQHook, @object
	.size	GameHBIRQHook, 4
GameHBIRQHook:
	.zero	4
	.section	.bss._ZL8deempcnt,"aw",@nobits
	.align	2
	.type	_ZL8deempcnt, @object
	.size	_ZL8deempcnt, 32
_ZL8deempcnt:
	.zero	32
	.section	.sbss._ZL5deemp,"aw",@nobits
	.type	_ZL5deemp, @object
	.size	_ZL5deemp, 1
_ZL5deemp:
	.zero	1
	.hidden	PPUCHRRAM
	.globl	PPUCHRRAM
	.section	.sbss.PPUCHRRAM,"aw",@nobits
	.type	PPUCHRRAM, @object
	.size	PPUCHRRAM, 1
PPUCHRRAM:
	.zero	1
	.hidden	PPUNTARAM
	.globl	PPUNTARAM
	.section	.sbss.PPUNTARAM,"aw",@nobits
	.type	PPUNTARAM, @object
	.size	PPUNTARAM, 1
PPUNTARAM:
	.zero	1
	.hidden	vnapage
	.globl	vnapage
	.section	.bss.vnapage,"aw",@nobits
	.align	2
	.type	vnapage, @object
	.size	vnapage, 16
vnapage:
	.zero	16
	.hidden	PPUGenLatch
	.globl	PPUGenLatch
	.section	.sbss.PPUGenLatch,"aw",@nobits
	.type	PPUGenLatch, @object
	.size	PPUGenLatch, 1
PPUGenLatch:
	.zero	1
	.hidden	VRAMBuffer
	.globl	VRAMBuffer
	.section	.sbss.VRAMBuffer,"aw",@nobits
	.type	VRAMBuffer, @object
	.size	VRAMBuffer, 1
VRAMBuffer:
	.zero	1
	.hidden	qtaintramreg
	.globl	qtaintramreg
	.section	.sbss.qtaintramreg,"aw",@nobits
	.type	qtaintramreg, @object
	.size	qtaintramreg, 1
qtaintramreg:
	.zero	1
	.hidden	QTAINTRAM
	.globl	QTAINTRAM
	.section	.bss.QTAINTRAM,"aw",@nobits
	.align	2
	.type	QTAINTRAM, @object
	.size	QTAINTRAM, 2048
QTAINTRAM:
	.zero	2048
	.hidden	QTAIHack
	.globl	QTAIHack
	.section	.sbss.QTAIHack,"aw",@nobits
	.align	2
	.type	QTAIHack, @object
	.size	QTAIHack, 4
QTAIHack:
	.zero	4
	.hidden	PEC586Hack
	.globl	PEC586Hack
	.section	.sbss.PEC586Hack,"aw",@nobits
	.align	2
	.type	PEC586Hack, @object
	.size	PEC586Hack, 4
PEC586Hack:
	.zero	4
	.hidden	MMC5HackSPPage
	.globl	MMC5HackSPPage
	.section	.sbss.MMC5HackSPPage,"aw",@nobits
	.type	MMC5HackSPPage, @object
	.size	MMC5HackSPPage, 1
MMC5HackSPPage:
	.zero	1
	.hidden	MMC5HackSPScroll
	.globl	MMC5HackSPScroll
	.section	.sbss.MMC5HackSPScroll,"aw",@nobits
	.type	MMC5HackSPScroll, @object
	.size	MMC5HackSPScroll, 1
MMC5HackSPScroll:
	.zero	1
	.hidden	MMC50x5130
	.globl	MMC50x5130
	.section	.sbss.MMC50x5130,"aw",@nobits
	.type	MMC50x5130, @object
	.size	MMC50x5130, 1
MMC50x5130:
	.zero	1
	.hidden	MMC5HackSPMode
	.globl	MMC5HackSPMode
	.section	.sbss.MMC5HackSPMode,"aw",@nobits
	.type	MMC5HackSPMode, @object
	.size	MMC5HackSPMode, 1
MMC5HackSPMode:
	.zero	1
	.hidden	MMC5HackCHRMode
	.globl	MMC5HackCHRMode
	.section	.sbss.MMC5HackCHRMode,"aw",@nobits
	.type	MMC5HackCHRMode, @object
	.size	MMC5HackCHRMode, 1
MMC5HackCHRMode:
	.zero	1
	.hidden	MMC5HackVROMPTR
	.globl	MMC5HackVROMPTR
	.section	.sbss.MMC5HackVROMPTR,"aw",@nobits
	.align	2
	.type	MMC5HackVROMPTR, @object
	.size	MMC5HackVROMPTR, 4
MMC5HackVROMPTR:
	.zero	4
	.hidden	MMC5HackExNTARAMPtr
	.globl	MMC5HackExNTARAMPtr
	.section	.sbss.MMC5HackExNTARAMPtr,"aw",@nobits
	.align	2
	.type	MMC5HackExNTARAMPtr, @object
	.size	MMC5HackExNTARAMPtr, 4
MMC5HackExNTARAMPtr:
	.zero	4
	.hidden	MMC5HackVROMMask
	.globl	MMC5HackVROMMask
	.section	.sbss.MMC5HackVROMMask,"aw",@nobits
	.align	2
	.type	MMC5HackVROMMask, @object
	.size	MMC5HackVROMMask, 4
MMC5HackVROMMask:
	.zero	4
	.hidden	MMC5Hack
	.globl	MMC5Hack
	.section	.sbss.MMC5Hack,"aw",@nobits
	.align	2
	.type	MMC5Hack, @object
	.size	MMC5Hack, 4
MMC5Hack:
	.zero	4
	.hidden	gNoBGFillColor
	.globl	gNoBGFillColor
	.section	.sdata.gNoBGFillColor,"aw"
	.type	gNoBGFillColor, @object
	.size	gNoBGFillColor, 1
gNoBGFillColor:
	.byte	-1
	.hidden	fceuindbg
	.globl	fceuindbg
	.section	.sbss.fceuindbg,"aw",@nobits
	.align	2
	.type	fceuindbg, @object
	.size	fceuindbg, 4
fceuindbg:
	.zero	4
	.section	.sbss._ZL4kook,"aw",@nobits
	.align	2
	.type	_ZL4kook, @object
	.size	_ZL4kook, 4
_ZL4kook:
	.zero	4
	.section	.sdata._ZL7ppudead,"aw"
	.align	2
	.type	_ZL7ppudead, @object
	.size	_ZL7ppudead, 4
_ZL7ppudead:
	.word	1
	.hidden	ppur
	.globl	ppur
	.section	.bss.ppur,"aw",@nobits
	.align	2
	.type	ppur, @object
	.size	ppur, 64
ppur:
	.zero	64
	.hidden	idleSynch
	.globl	idleSynch
	.section	.sdata.idleSynch,"aw"
	.type	idleSynch, @object
	.size	idleSynch, 1
idleSynch:
	.byte	1
	.hidden	spr_read
	.globl	spr_read
	.section	.bss.spr_read,"aw",@nobits
	.align	2
	.type	spr_read, @object
	.size	spr_read, 60
spr_read:
	.zero	60
	.hidden	ppuphase
	.globl	ppuphase
	.section	.sbss.ppuphase,"aw",@nobits
	.align	2
	.type	ppuphase, @object
	.size	ppuphase, 4
ppuphase:
	.zero	4
	.hidden	bitrevlut
	.globl	bitrevlut
	.section	.bss.bitrevlut,"aw",@nobits
	.align	2
	.type	bitrevlut, @object
	.size	bitrevlut, 256
bitrevlut:
	.zero	256
	.hidden	test
	.globl	test
	.section	.sbss.test,"aw",@nobits
	.align	2
	.type	test, @object
	.size	test, 4
test:
	.zero	4
	.section	.sbss._ZL13new_ppu_reset,"aw",@nobits
	.type	_ZL13new_ppu_reset, @object
	.size	_ZL13new_ppu_reset, 1
_ZL13new_ppu_reset:
	.zero	1
	.section	.bss._ZL7ppulut3,"aw",@nobits
	.align	2
	.type	_ZL7ppulut3, @object
	.size	_ZL7ppulut3, 512
_ZL7ppulut3:
	.zero	512
	.section	.bss._ZL7ppulut2,"aw",@nobits
	.align	2
	.type	_ZL7ppulut2, @object
	.size	_ZL7ppulut2, 1024
_ZL7ppulut2:
	.zero	1024
	.section	.bss._ZL7ppulut1,"aw",@nobits
	.align	2
	.type	_ZL7ppulut1, @object
	.size	_ZL7ppulut1, 1024
_ZL7ppulut1:
	.zero	1024
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
