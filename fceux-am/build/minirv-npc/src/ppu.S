#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ppu.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	addi	sp,sp,-8
	.cfi_def_cfa_offset 8
	sw	s0,4(sp)
	.cfi_offset 8, -4
	lla	s0,_ZL6sphitx
	lw	a5,0(s0)
	li	a4,256
	beq	a5,a4,.L4
	addi	a0,a0,-16
	bge	a5,a0,.L4
	sw	s1,0(sp)
	.cfi_offset 9, -8
	la t0, _ZL9sphitdata; lbu t0, 0(t0);
	la t1, _ZL6Plinef; lw t1, 0(t1);
	li	a3,0
	li	a1,128
	li	s1,254
	li	t2,7
	j	.L7
.L15:
	addi	a3,a3,1
	beq	a0,a5,.L13
.L7:
	sra	a4,a1,a3
	and	a4,a4,t0
	add	a2,t1,a5
	beq	a4,zero,.L6
	lbu	a4,0(a2)
	andi	a4,a4,64
	bne	a4,zero,.L6
	ble	a5,s1,.L14
.L6:
	addi	a5,a5,1
	bne	a3,t2,.L15
.L13:
	lw	s1,0(sp)
	.cfi_restore 9
.L4:
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,8
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_def_cfa_offset 8
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	lla	a4,PPU
	lbu	a5,2(a4)
	li	a3,256
	sw	a3,0(s0)
	ori	a5,a5,64
	sb	a5,2(a4)
	lw	s1,0(sp)
	.cfi_restore 9
	j	.L4
	.cfi_endproc
.LFE110:
	.size	_ZL14CheckSpriteHiti, .-_ZL14CheckSpriteHiti
	.section	.text._ZL5B4014jh,"ax",@progbits
	.align	2
	.type	_ZL5B4014jh, @function
_ZL5B4014jh:
.LFB104:
	.cfi_startproc
	addi	sp,sp,-20
	.cfi_def_cfa_offset 20
	li	a5,8192
	sw	s0,12(sp)
	addi	a5,a5,4
	.cfi_offset 8, -8
	slli	s0,a1,8
	sw	s1,8(sp)
	sw	ra,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	sw	a1,4(sp)
	addi	s1,s0,256
	sw	a5,0(sp)
.L17:
	mv	a0,s0
	call	_Z9X6502_DMRj
	mv	a1,a0
	lw	a0,0(sp)
	addi	s0,s0,1
	call	_Z9X6502_DMWjh
	bne	s0,s1,.L17
	lw	a4,4(sp)
	lw	ra,16(sp)
	.cfi_restore 1
	lw	s0,12(sp)
	.cfi_restore 8
	la a5, SpriteDMA; sb a4, 0(a5);
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,20
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, PPU_hook; lw a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L21
	jalr	a5
.L21:
	li	a5,8192
	bltu	s0,a5,.L44
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L24
	srli	a4,s0,8
	andi	a4,a4,12
	lla	a5,vnapage
	add	a5,a5,a4
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	s0,a5,s0
	lbu	a0,0(s0)
.L23:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L24:
	.cfi_restore_state
	la a4, PPU+1; lbu a4, 0(a4);
	andi	a5,s0,3
	andi	a4,a4,1
	bne	a5,zero,.L25
	andi	a5,s0,12
	bne	a5,zero,.L26
	la a0, PALRAM; lbu a0, 0(a0);
	beq	a4,zero,.L23
	andi	a0,a0,48
.L45:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L44:
	.cfi_restore_state
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	add	a5,a5,s0
	lw	s0,4(sp)
	.cfi_restore 8
	lbu	a0,0(a5)
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L25:
	.cfi_restore_state
	andi	s0,s0,31
	lla	a5,PALRAM
	add	a5,a5,s0
	lbu	a0,0(a5)
	beq	a4,zero,.L23
	andi	a0,a0,48
	j	.L45
.L26:
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,UPALRAM
	add	a5,a5,s0
	lbu	a0,-1(a5)
	beq	a4,zero,.L23
	andi	a0,a0,48
	j	.L45
	.cfi_endproc
.LFE90:
	.size	_Z22FFCEUX_PPURead_Defaultj, .-_Z22FFCEUX_PPURead_Defaultj
	.section	.text._ZL5B2004jh,"ax",@progbits
	.align	2
	.type	_ZL5B2004jh, @function
_ZL5B2004jh:
.LFB100:
	.cfi_startproc
	lla	a3,PPU
	la a5, PPUGenLatch; sb a1, 0(a5);
	la a4, newppu; lw a4, 0(a4);
	lbu	a5,3(a3)
	beq	a4,zero,.L47
	andi	a4,a5,3
	li	a2,2
	beq	a4,a2,.L52
	lla	a4,SPRAM
	add	a4,a4,a5
	addi	a5,a5,1
	sb	a1,0(a4)
	sb	a5,3(a3)
	ret
.L47:
	lla	a2,PPUSPL
	lbu	a4,0(a2)
	li	a0,7
	bgtu	a4,a0,.L53
	lla	a0,SPRAM
	add	a0,a0,a4
	sb	a1,0(a0)
.L51:
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a5,3(a3)
	sb	a4,0(a2)
	ret
.L53:
	bleu	a5,a0,.L51
	lla	a0,SPRAM
	add	a0,a0,a5
	sb	a1,0(a0)
	addi	a5,a5,1
	addi	a4,a4,1
	sb	a5,3(a3)
	sb	a4,0(a2)
	ret
.L52:
	lla	a4,SPRAM
	add	a4,a4,a5
	andi	a1,a1,227
	addi	a5,a5,1
	sb	a1,0(a4)
	sb	a5,3(a3)
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
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	srai	a1,a0,3
	lla	a5,RefreshAddr
	sw	ra,60(sp)
	sw	a0,32(sp)
	la a4, _ZL6sphitx; lw a4, 0(a4);
	li	a3,256
	sw	a1,24(sp)
	lw	a5,0(a5)
	.cfi_offset 1, -4
	beq	a4,a3,.L55
	la a3, PPU+2; lbu a3, 0(a3);
	andi	a3,a3,64
	beq	a3,zero,.L118
.L55:
	lw	a3,24(sp)
	li	a4,34
	sw	a3,0(sp)
	ble	a3,a4,.L56
	sw	a4,0(sp)
.L56:
	lla	a4,_ZL9firsttile
	lw	a4,0(a4)
	lw	a3,0(sp)
	sw	a4,28(sp)
	sub	a4,a3,a4
	sw	a4,36(sp)
	ble	a4,zero,.L54
	sw	s0,56(sp)
	lla	a3,_ZL5Pline
	sw	s1,52(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	la a4, PPU_hook; lw a4, 0(a4);
	lw	s0,0(a3)
	li	a2,1119
	bne	a4,zero,.L117
	la a4, PEC586Hack; lw a4, 0(a4);
	bne	a4,zero,.L119
	la a4, MMC5Hack; lw a4, 0(a4);
	li	a2,1121
	bne	a4,zero,.L117
	la a0, QTAIHack; lw a0, 0(a0);
	li	a2,1122
	bne	a0,zero,.L117
	lla	a2,PPU
	lbu	a4,1(a2)
	lla	a3,PALRAM
	lbu	a2,0(a2)
	mv	a1,a4
	sw	a4,8(sp)
	lbu	a4,0(a3)
	sw	a2,12(sp)
	andi	a1,a1,1
	andi	a2,a4,48
	beq	a1,zero,.L120
	lw	a1,8(sp)
	ori	a2,a2,64
	andi	a2,a2,0xff
	andi	a1,a1,24
	sw	a2,40(sp)
	beq	a1,zero,.L121
.L65:
	la a2, _ZL16PALcache_outdate; lw a2, 0(a2);
	beq	a2,zero,.L67
	lbu	a1,8(a3)
	lbu	ra,12(a3)
	lbu	s1,4(a3)
	ori	t1,a1,64
	lla	t2,PALRAM
	ori	t0,s1,64
	sw	a1,4(sp)
	ori	a2,a4,64
	ori	a1,ra,64
	sb	t0,4(a3)
	sb	t1,8(a3)
	sb	a1,12(a3)
	sw	ra,16(sp)
	sb	a2,0(a3)
	lla	t0,_ZL8PALcache
	mv	a3,t2
	mv	t1,t2
	lla	a1,PALRAM+16
	li	ra,256
	sw	a4,20(sp)
	sw	s0,44(sp)
	sw	a5,48(sp)
.L68:
	lb	s0,0(t1)
	mv	a2,t0
	mv	a5,t2
	slli	s0,s0,8
.L69:
	lbu	a4,0(a5)
	addi	a2,a2,2
	addi	a5,a5,1
	or	a4,s0,a4
	sh	a4,-2(a2)
	bne	a1,a5,.L69
	addi	a0,a0,16
	addi	t1,t1,1
	addi	t0,t0,32
	bne	a0,ra,.L68
	lw	a2,4(sp)
	lw	a4,20(sp)
	lw	s0,44(sp)
	andi	a1,a2,63
	lw	a2,16(sp)
	lw	a5,48(sp)
	andi	a4,a4,63
	andi	a0,s1,63
	andi	a2,a2,63
	sb	a4,0(a3)
	sb	a0,4(a3)
	sb	a1,8(a3)
	sb	a2,12(a3)
	la a4, _ZL16PALcache_outdate; sw zero, 0(a4);
.L67:
	srli	a4,a5,8
	andi	a4,a4,12
	lla	a3,vnapage
	andi	t2,a5,3
	add	a4,a3,a4
	sw	t2,4(sp)
	lw	s1,0(a4)
	beq	t2,zero,.L71
	srli	a4,a5,2
	andi	a3,a4,0xff
	srli	a3,a3,2
	andi	a2,a3,56
	andi	a4,a4,7
	or	a4,a4,a2
	ori	a4,a4,960
	add	a4,s1,a4
	lbu	a4,0(a4)
	andi	a3,a3,4
	slli	a4,a4,2
	sra	a4,a4,a3
	sw	a4,4(sp)
.L71:
	lw	t0,28(sp)
	lw	a4,0(sp)
	bge	t0,a4,.L72
	lw	a4,12(sp)
	li	t1,4096
	lla	a1,_ZZL11RefreshLineiE7atlatch
	slli	a0,a4,8
	srli	a4,a5,12
	and	t1,a0,t1
	andi	a4,a4,7
	or	a4,t1,a4
	lw	a1,0(a1)
	la a0, XOffset; lbu a0, 0(a0);
	sw	a4,12(sp)
	li	a4,8
	lla	a2,_ZZL11RefreshLineiE6pshift
	sub	a4,a4,a0
	lw	a3,0(a2)
	sw	a0,20(sp)
	lw	a2,4(a2)
	mv	a0,t0
	sw	a4,16(sp)
	lla	t0,_ZL8PALcache
	mv	ra,a1
	sw	s1,8(sp)
	j	.L77
.L75:
	lw	a4,0(sp)
	addi	a0,a0,1
	addi	a5,a5,1
	beq	a4,a0,.L111
.L122:
	andi	t2,a5,3
.L77:
	li	a4,1
	ble	a0,a4,.L73
	lw	a4,16(sp)
	lw	s1,20(sp)
	addi	s0,s0,8
	srl	t1,a3,a4
	srl	a1,a2,a4
	andi	t1,t1,255
	slli	a4,ra,3
	or	a4,a4,s1
	andi	a1,a1,255
	lla	s1,_ZL7ppulut1
	slli	t1,t1,2
	add	t1,s1,t1
	slli	a1,a1,2
	lla	s1,_ZL7ppulut2
	add	a1,s1,a1
	slli	a4,a4,2
	lla	s1,_ZL7ppulut3
	lw	a1,0(a1)
	lw	t1,0(t1)
	add	a4,s1,a4
	lw	a4,0(a4)
	or	t1,t1,a1
	or	a4,t1,a4
	andi	a1,a4,255
	slli	a1,a1,1
	add	a1,a1,t0
	lhu	t1,0(a1)
	srli	a1,a4,7
	andi	a1,a1,510
	sh	t1,-8(s0)
	add	a1,a1,t0
	lhu	t1,0(a1)
	srli	a1,a4,15
	andi	a1,a1,510
	sh	t1,-6(s0)
	add	a1,a1,t0
	lhu	a1,0(a1)
	srli	a4,a4,24
	slli	a4,a4,1
	sh	a1,-4(s0)
	add	a4,a4,t0
	lhu	a4,0(a4)
	sh	a4,-2(s0)
.L73:
	lw	s1,8(sp)
	andi	a4,a5,1023
	add	a4,s1,a4
	lbu	a1,0(a4)
	lw	a4,12(sp)
	slli	a1,a1,4
	add	a1,a1,a4
	bne	t2,zero,.L74
	srli	a4,a5,2
	andi	t1,a4,0xff
	srli	t1,t1,2
	andi	t2,t1,56
	andi	a4,a4,7
	or	a4,a4,t2
	ori	a4,a4,960
	add	a4,s1,a4
	lbu	a4,0(a4)
	andi	t1,t1,4
	slli	a4,a4,2
	sra	a4,a4,t1
	sw	a4,4(sp)
.L74:
	srli	a4,a1,10
	lla	t1,VPage
	slli	a4,a4,2
	add	a4,t1,a4
	lw	t1,0(a4)
	lw	t2,4(sp)
	andi	a4,a5,2
	add	a1,t1,a1
	lbu	t1,8(a1)
	srl	a4,t2,a4
	lbu	t2,0(a1)
	andi	a4,a4,12
	srli	ra,ra,2
	slli	a3,a3,8
	slli	a2,a2,8
	or	ra,a4,ra
	andi	a1,a5,31
	li	a4,31
	or	a3,a3,t2
	or	a2,a2,t1
	bne	a1,a4,.L75
	xori	a5,a5,1055
	srli	a4,a5,8
	andi	a4,a4,12
	lla	a1,vnapage
	add	a4,a1,a4
	lw	a4,0(a4)
	addi	a0,a0,1
	sw	a4,8(sp)
	lw	a4,0(sp)
	bne	a4,a0,.L122
.L111:
	lla	a4,PPU
	lbu	a4,1(a4)
	sw	a4,8(sp)
	lla	a4,_ZZL11RefreshLineiE7atlatch
	sw	ra,0(a4)
	lla	a4,_ZZL11RefreshLineiE6pshift
	sw	a2,4(a4)
	sw	a3,0(a4)
.L72:
	lla	a4,RefreshAddr
	sw	a5,0(a4)
	lw	a4,28(sp)
	li	a5,2
	ble	a4,a5,.L78
	lw	a5,8(sp)
	andi	a5,a5,8
	bne	a5,zero,.L80
	addi	a5,a4,-2
	slli	a5,a5,3
	lla	a4,_ZL6Plinef
.L81:
	lw	a0,0(a4)
	lw	a4,36(sp)
	lw	a1,40(sp)
	add	a0,a0,a5
	slli	a2,a4,3
	call	memset
.L80:
	lw	a4,32(sp)
	li	a5,267
	ble	a4,a5,.L87
	la a5, _ZL5tofix; lw a5, 0(a5);
	bne	a5,zero,.L123
.L87:
	lw	a0,32(sp)
	call	_ZL14CheckSpriteHiti
	lla	a5,_ZL5Pline
	lw	a4,0(sp)
	sw	s0,0(a5)
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s0,56(sp)
	.cfi_restore 8
	lla	a5,_ZL9firsttile
	sw	a4,0(a5)
.L54:
	lw	ra,60(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L120:
	.cfi_def_cfa_offset 64
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	slli	a2,a4,24
	lw	a1,8(sp)
	srai	a2,a2,24
	ori	a2,a2,64
	andi	a2,a2,0xff
	andi	a1,a1,24
	sw	a2,40(sp)
	bne	a1,zero,.L65
	j	.L121
.L118:
	.cfi_restore 8
	.cfi_restore 9
	addi	a3,a0,-16
	bge	a4,a3,.L55
	addi	a3,a1,-2
	slli	a3,a3,3
	slt	a4,a4,a3
	seqz	a4,a4
	add	a4,a1,a4
	sw	a4,24(sp)
	j	.L55
.L121:
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	a5,36(sp)
	lw	a1,40(sp)
	mv	a0,s0
	slli	s1,a5,3
	mv	a2,s1
	call	memset
	lw	a4,0(sp)
	lla	a5,_ZL5Pline
	add	s1,s0,s1
	sw	s1,0(a5)
	lla	a5,_ZL9firsttile
	sw	a4,0(a5)
	lw	a4,32(sp)
	li	a5,267
	ble	a4,a5,.L115
	la a5, _ZL5tofix; lw a5, 0(a5);
	beq	a5,zero,.L115
	lw	s0,56(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	la a5, _ZL5tofix; sw zero, 0(a5);
	j	.L54
.L78:
	.cfi_restore_state
	lw	a4,24(sp)
	ble	a4,a5,.L82
	lw	a4,8(sp)
	andi	a4,a4,2
	bne	a4,zero,.L83
	lw	a2,40(sp)
	lla	a4,_ZL6Plinef
	lw	a1,0(a4)
	slli	a3,a2,8
	add	a3,a3,a2
	slli	a2,a3,16
	add	a3,a3,a2
	sw	a3,0(a1)
	lla	a2,PPU
	lbu	a2,1(a2)
	sw	a3,4(a1)
	andi	a2,a2,8
	bne	a2,zero,.L80
	lw	a3,28(sp)
	beq	a3,a5,.L116
	lw	a5,0(sp)
	addi	a5,a5,-2
	sw	a5,36(sp)
.L116:
	li	a5,0
	j	.L81
.L115:
	lw	s0,56(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s1,52(sp)
	.cfi_restore 9
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L82:
	.cfi_restore_state
	lw	a4,8(sp)
	andi	a4,a4,8
	bne	a4,zero,.L80
	lw	a4,28(sp)
	bne	a4,a5,.L80
	li	a5,0
	lla	a4,_ZL6Plinef
	j	.L81
.L123:
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L88
	lla	a5,RefreshAddr
	lw	a4,0(a5)
	li	a3,28672
	li	a5,4096
	and	a2,a4,a3
	add	a5,a4,a5
	beq	a2,a3,.L124
.L91:
	lla	a4,RefreshAddr
	sw	a5,0(a4)
.L88:
	la a5, _ZL5tofix; sw zero, 0(a5);
	j	.L87
.L83:
	lw	a4,8(sp)
	andi	a4,a4,8
	bne	a4,zero,.L80
	lw	a4,28(sp)
	beq	a4,a5,.L125
	lw	a5,0(sp)
	lla	a4,_ZL6Plinef
	addi	a5,a5,-2
	sw	a5,36(sp)
	li	a5,0
	j	.L81
.L124:
	andi	a3,a4,992
	li	a1,928
	xor	a5,a4,a2
	beq	a3,a1,.L126
	li	a2,992
	addi	a5,a5,32
	bne	a3,a2,.L91
	li	a5,28672
	addi	a5,a5,992
	xor	a5,a4,a5
	j	.L91
.L125:
	lla	a4,_ZL6Plinef
	li	a5,0
	j	.L81
.L126:
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	j	.L91
.L119:
	li	a2,1120
.L117:
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
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
	bne	a5,zero,.L136
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L136
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	la a4, linestartts; lw a4, 0(a4);
	slli	a5,a5,4
	sub	a5,a5,a4
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L130
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L130:
	call	_ZL11RefreshLinei
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, PPUGenLatch; lbu a0, 0(a0);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L136:
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	la a5, newppu; lw a5, 0(a5);
	bne	a5,zero,.L140
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L140
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L142
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L142:
	call	_ZL11RefreshLinei
.L140:
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
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a2,256
	li	a1,255
	sw	s0,4(sp)
	sw	ra,8(sp)
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
	bne	a5,zero,.L149
	beq	s0,zero,.L149
	neg	a5,a0
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L151
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L151:
	call	_ZL11RefreshLinei
.L149:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	li	a5,1
	la a4, _ZL5tofix; sw a5, 0(a4);
	addi	sp,sp,12
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, newppu; lw a5, 0(a5);
	mv	s0,a1
	bne	a5,zero,.L158
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L158
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L160
	li	a1,15
	mv	a0,a5
	call	__udivsi3
.L160:
	call	_ZL11RefreshLinei
.L158:
	la a5, paldeemphswap; lbu a5, 0(a5);
	beq	a5,zero,.L161
	srli	a5,s0,1
	andi	a4,s0,-97
	andi	a5,a5,32
	slli	s0,s0,1
	or	a5,a5,a4
	andi	s0,s0,64
	or	s0,a5,s0
.L161:
	la a5, PPUGenLatch; sb s0, 0(a5);
	la a5, PPU+1; sb s0, 0(a5);
	li	a5,31
	bleu	s0,a5,.L157
	srli	s0,s0,5
	la a5, _ZL5deemp; sb s0, 0(a5);
.L157:
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	addi	sp,sp,12
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
	bne	a4,zero,.L173
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
.L173:
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
	bne	a4,zero,.L176
	andi	a4,a0,12
	bne	a4,zero,.L177
	la a0, PALRAM; lbu a0, 0(a0);
	beq	a5,zero,.L179
	andi	a0,a0,48
.L179:
	ret
.L177:
	srli	a0,a0,2
	andi	a0,a0,3
	lla	a4,UPALRAM
	add	a4,a4,a0
	lbu	a0,-1(a4)
	beq	a5,zero,.L179
	andi	a0,a0,48
	ret
.L176:
	andi	a0,a0,31
	lla	a4,PALRAM
	add	a4,a4,a0
	lbu	a0,0(a4)
	beq	a5,zero,.L179
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
	la a5, MMC5Hack; lw a5, 0(a5);
	beq	a5,zero,.L193
	la a3, MMC5HackCHRMode; lbu a3, 0(a3);
	li	a5,1
	beq	a3,a5,.L196
	tail	_Z13MMC5BGVRAMADRj
.L196:
	andi	a1,a1,1023
	la a5, MMC5HackExNTARAMPtr; lw a5, 0(a5);
	add	a5,a5,a1
	lbu	a5,0(a5)
	la a3, MMC5HackVROMMask; lw a3, 0(a3);
	la a4, MMC50x5130; lbu a4, 0(a4);
	and	a5,a5,a3
	slli	a5,a5,12
	li	a3,258048
	slli	a0,a0,20
	and	a5,a5,a3
	srli	a0,a0,20
	li	a3,786432
	slli	a4,a4,18
	or	a5,a5,a0
	and	a4,a4,a3
	add	a5,a5,a4
	la a0, MMC5HackVROMPTR; lw a0, 0(a0);
	add	a0,a0,a5
	ret
.L193:
	srli	a3,a0,10
	slli	a3,a3,2
	lla	a5,VPage
	add	a5,a5,a3
	lw	a5,0(a5)
	add	a0,a5,a0
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
	srai	t0,a1,2
	andi	a4,a4,4
	andi	t1,a1,2
	la a3, MMC5Hack; lw a3, 0(a3);
	add	a5,a5,t0
	or	a4,a4,t1
	beq	a3,zero,.L198
	la t1, MMC5HackCHRMode; lbu t1, 0(t1);
	li	a3,1
	beq	t1,a3,.L203
.L198:
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
.L203:
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	la a5, PPU_hook; lw a5, 0(a5);
	mv	s0,a0
	mv	s1,a1
	beq	a5,zero,.L205
	jalr	a5
.L205:
	li	a5,8192
	bgeu	s0,a5,.L206
	srli	a4,s0,10
	la a5, PPUCHRRAM; lbu a5, 0(a5);
	sra	a5,a5,a4
	andi	a5,a5,1
	beq	a5,zero,.L204
	slli	a4,a4,2
	lla	a5,VPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,s0
	sb	s1,0(a5)
.L204:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L206:
	.cfi_restore_state
	li	a5,16384
	addi	a5,a5,-257
	bgtu	s0,a5,.L208
	srli	a5,s0,10
	la a4, QTAIHack; lw a4, 0(a4);
	andi	a5,a5,3
	beq	a4,zero,.L209
	la a4, qtaintramreg; lbu a4, 0(a4);
	andi	a3,a4,1
	beq	a3,zero,.L209
	srli	a4,a4,1
	srl	a5,a5,a4
	slli	a5,a5,10
	andi	a5,a5,1024
	andi	s0,s0,1023
	or	a5,a5,s0
	lla	a4,QTAINTRAM
	add	a5,a4,a5
	sb	s1,0(a5)
	j	.L204
.L208:
	andi	a5,s0,3
	andi	s1,s1,63
	bne	a5,zero,.L210
	andi	a5,s0,12
	bne	a5,zero,.L211
	lla	a5,PALRAM
	sb	s1,12(a5)
	sb	s1,8(a5)
	sb	s1,4(a5)
	sb	s1,0(a5)
	sb	s1,28(a5)
	sb	s1,24(a5)
	sb	s1,20(a5)
	sb	s1,16(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L204
.L209:
	la a4, PPUNTARAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L204
	slli	a5,a5,2
	lla	a4,vnapage
	add	a5,a4,a5
	lw	a5,0(a5)
	andi	s0,s0,1023
	add	a5,a5,s0
	sb	s1,0(a5)
	j	.L204
.L210:
	andi	s0,s0,31
	lla	a5,PALRAM
	add	a5,a5,s0
	sb	s1,0(a5)
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L211:
	.cfi_restore_state
	srli	s0,s0,2
	andi	s0,s0,3
	lla	a5,UPALRAM
	add	a5,a5,s0
	sb	s1,-1(a5)
	j	.L204
	.cfi_endproc
.LFE87:
	.size	_Z23FFCEUX_PPUWrite_Defaultjh, .-_Z23FFCEUX_PPUWrite_Defaultjh
	.section	.text._ZL5B2007jh,"ax",@progbits
	.align	2
	.type	_ZL5B2007jh, @function
_ZL5B2007jh:
.LFB103:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	sw	ra,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s1,RefreshAddr
	la a5, newppu; lw a5, 0(a5);
	lw	a3,0(s1)
	mv	a4,a1
	beq	a5,zero,.L229
	sw	s0,4(sp)
	.cfi_offset 8, -8
	lla	s0,ppur
	lw	a5,4(s0)
	lw	a2,8(s0)
	lw	t1,16(s0)
	lw	a3,12(s0)
	lw	a0,0(s0)
	slli	a5,a5,11
	slli	a2,a2,10
	or	a5,a5,a2
	or	a5,a5,t1
	slli	a3,a3,5
	or	a5,a5,a3
	slli	a0,a0,12
	or	a0,a0,a5
	slli	a0,a0,18
	srli	a0,a0,18
	la a5, PPUGenLatch; sb a1, 0(a5);
	sw	a0,0(s1)
	la a5, FFCEUX_PPUWrite; lw a5, 0(a5);
	beq	a5,zero,.L230
	jalr	a5
.L231:
	lw	a4,52(s0)
	li	a5,240
	lw	a2,12(s0)
	lw	a0,4(s0)
	lw	t1,0(s0)
	bleu	a4,a5,.L268
	lla	a5,PPU
.L232:
	lbu	a4,0(a5)
	lw	a1,16(s0)
	addi	a5,a2,1
	andi	a4,a4,4
	beq	a4,zero,.L271
.L238:
	lw	a4,8(s0)
	srli	a3,a5,5
	andi	a2,a5,31
	add	a3,a3,a4
	srli	a5,a3,1
	add	a5,a5,a0
	srli	a4,a5,1
	add	a4,a4,t1
	andi	a1,a1,31
	andi	a3,a3,1
	andi	a5,a5,1
	andi	a4,a4,7
	sw	a2,12(s0)
	sw	a1,16(s0)
	sw	a3,8(s0)
	sw	a5,4(s0)
	sw	a4,0(s0)
	slli	a2,a2,5
.L237:
	slli	a5,a5,11
	or	a2,a2,a1
	slli	a3,a3,10
	or	a5,a5,a2
	or	a5,a5,a3
	slli	a4,a4,12
	li	a3,12288
	and	a4,a4,a3
	lw	s0,4(sp)
	.cfi_restore 8
	or	a5,a5,a4
	sw	a5,0(s1)
.L228:
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L229:
	.cfi_restore_state
	la a2, PPUGenLatch; sb a1, 0(a2);
	slli	a5,a3,18
	slli	a2,a3,18
	srli	a5,a5,18
	blt	a2,zero,.L240
	srli	a1,a5,10
	la a2, PPUCHRRAM; lbu a2, 0(a2);
	sra	a2,a2,a1
	andi	a2,a2,1
	bne	a2,zero,.L272
.L242:
	la a5, PPU; lbu a5, 0(a5);
	andi	a5,a5,4
	addi	a0,a3,1
	beq	a5,zero,.L249
	addi	a0,a3,32
.L249:
	sw	a0,0(s1)
	la a5, PPU_hook; lw a5, 0(a5);
	beq	a5,zero,.L228
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	slli	a0,a0,18
	srli	a0,a0,18
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	a5
.L240:
	.cfi_restore_state
	li	a2,16384
	addi	a2,a2,-257
	bgtu	a5,a2,.L243
	srli	a5,a5,10
	la a2, QTAIHack; lw a2, 0(a2);
	andi	a5,a5,3
	beq	a2,zero,.L244
	la a2, qtaintramreg; lbu a2, 0(a2);
	andi	a1,a2,1
	beq	a1,zero,.L244
	srli	a2,a2,1
	srl	a5,a5,a2
	slli	a5,a5,10
	andi	a2,a3,1023
	andi	a5,a5,1024
	or	a5,a5,a2
	lla	a2,QTAINTRAM
	add	a5,a2,a5
	sb	a4,0(a5)
	j	.L242
.L268:
	.cfi_offset 8, -8
	lla	a5,PPU
	lbu	a4,1(a5)
	andi	a4,a4,24
	beq	a4,zero,.L232
	addi	t1,t1,1
	srli	a5,t1,3
	add	a2,a5,a2
	andi	a2,a2,31
	sw	a2,12(s0)
	li	a4,30
	beq	a2,a4,.L233
	slli	a2,a2,5
.L234:
	andi	a4,t1,7
	andi	a5,a0,1
	lw	a3,8(s0)
	lw	a1,16(s0)
	sw	a4,0(s0)
	sw	a5,4(s0)
	j	.L237
.L271:
	addi	a1,a1,1
	srli	a5,a1,5
	andi	a5,a5,1
	add	a5,a5,a2
	j	.L238
.L272:
	.cfi_restore 8
	slli	a1,a1,2
	lla	a3,VPage
	add	a3,a3,a1
	lw	a3,0(a3)
	add	a5,a3,a5
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L242
.L243:
	andi	a2,a3,3
	andi	a4,a1,63
	bne	a2,zero,.L246
	andi	a2,a3,12
	bne	a2,zero,.L247
	lla	a5,PALRAM
	sb	a4,12(a5)
	sb	a4,8(a5)
	sb	a4,4(a5)
	sb	a4,0(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L242
.L230:
	.cfi_offset 8, -8
	call	_Z23FFCEUX_PPUWrite_Defaultjh
	j	.L231
.L244:
	.cfi_restore 8
	la a2, PPUNTARAM; lbu a2, 0(a2);
	sra	a2,a2,a5
	andi	a2,a2,1
	beq	a2,zero,.L242
	slli	a5,a5,2
	lla	a2,vnapage
	add	a5,a2,a5
	lw	a5,0(a5)
	andi	a3,a3,1023
	add	a5,a5,a3
	sb	a4,0(a5)
	lw	a3,0(s1)
	j	.L242
.L246:
	andi	a2,a3,31
	lla	a5,PALRAM
	add	a5,a5,a2
	sb	a4,0(a5)
	li	a5,1
	la a4, _ZL16PALcache_outdate; sw a5, 0(a4);
	j	.L242
.L247:
	srli	a5,a5,2
	andi	a5,a5,3
	lla	a2,UPALRAM
	add	a5,a2,a5
	sb	a4,-1(a5)
	j	.L242
.L233:
	.cfi_offset 8, -8
	li	a4,1
	li	a2,960
	bne	a5,a4,.L234
	addi	a0,a0,1
	la a5, ppur+12; sw zero, 0(a5);
	li	a2,0
	j	.L234
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
	beq	a5,zero,.L274
	srai	a3,a0,10
	slli	a3,a3,2
	lla	a4,VPage
	add	a4,a4,a3
	lw	a4,0(a4)
	add	a4,a4,a0
	la a0, CHRptr; lw a0, 0(a0);
	sub	a0,a4,a0
	blt	a0,zero,.L276
	bge	a0,a5,.L276
.L273:
	ret
.L274:
	li	a5,8192
	blt	a0,a5,.L273
.L276:
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
	beq	a5,zero,.L281
	blt	a0,zero,.L283
	ble	a5,a0,.L283
.L280:
	ret
.L281:
	li	a5,8192
	bltu	a0,a5,.L280
.L283:
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
	beq	a5,zero,.L285
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
.L285:
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
	bge	a3,zero,.L284
	addi	a5,a5,240
	sw	a5,0(a1)
.L284:
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
	bne	a5,zero,.L291
	la a5, _ZL5Pline; lw a5, 0(a5);
	beq	a5,zero,.L291
	la a4, timestamp; lw a4, 0(a4);
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,4
	la a4, linestartts; lw a4, 0(a4);
	sub	a5,a5,a4
	la a4, PAL; lbu a4, 0(a4);
	srli	a0,a5,4
	beq	a4,zero,.L300
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a1,15
	mv	a0,a5
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	__udivsi3
	lw	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_ZL11RefreshLinei
.L291:
	ret
.L300:
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
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	s0,20(sp)
	sw	s1,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,newppu
	lla	s1,RefreshAddr
	lw	a3,0(s1)
	lw	a5,0(s0)
	li	a0,16384
	addi	a0,a0,-1
	sw	ra,24(sp)
	.cfi_offset 1, -4
	and	a2,a3,a0
	beq	a5,zero,.L304
	lla	s0,ppur
	lw	a5,4(s0)
	lw	t1,8(s0)
	lw	t0,16(s0)
	lw	a1,12(s0)
	slli	t1,t1,10
	lw	a4,0(s0)
	slli	a5,a5,11
	or	a5,a5,t1
	slli	a1,a1,5
	or	a5,a5,t0
	or	a5,a5,a1
	slli	a4,a4,12
	li	a1,12288
	and	a4,a4,a1
	or	a5,a5,a4
	li	a1,16384
	and	a0,a5,a0
	addi	a1,a1,-256
	lla	t1,VRAMBuffer
	sw	a0,0(s1)
	and	a5,a5,a1
	lbu	a4,0(t1)
	la t2, FFCEUX_PPURead; lw t2, 0(t2);
	beq	a5,a1,.L384
	sw	t1,4(sp)
	sw	a4,0(sp)
	jalr	t2
	lw	t1,4(sp)
	lw	a4,0(sp)
	lla	a1,PPU
.L312:
	lw	t0,52(s0)
	sb	a0,0(t1)
	li	a3,240
	lw	a2,12(s0)
	lw	a5,4(s0)
	lw	t1,0(s0)
	bgtu	t0,a3,.L313
	lbu	a3,1(a1)
	andi	a3,a3,24
	bne	a3,zero,.L385
.L313:
	lbu	a3,0(a1)
	lw	a0,16(s0)
	addi	a1,a2,1
	andi	a3,a3,4
	bne	a3,zero,.L319
	addi	a0,a0,1
	srli	a1,a0,5
	andi	a1,a1,1
	add	a1,a1,a2
.L319:
	lw	a3,8(s0)
	srli	a2,a1,5
	andi	a0,a0,31
	add	a2,a2,a3
	srli	a3,a2,1
	add	a5,a3,a5
	srli	a3,a5,1
	add	a3,a3,t1
	andi	a1,a1,31
	andi	a2,a2,1
	andi	a5,a5,1
	andi	a3,a3,7
	sw	a1,12(s0)
	sw	a0,16(s0)
	sw	a2,8(s0)
	sw	a5,4(s0)
	sw	a3,0(s0)
	slli	a1,a1,5
.L318:
	slli	a5,a5,11
	or	a1,a1,a0
	slli	a2,a2,10
	or	a5,a5,a1
	or	a5,a5,a2
	slli	a3,a3,12
	li	a2,12288
	and	a3,a3,a2
	or	a5,a5,a3
	sw	a5,0(s1)
.L320:
	lw	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,20(sp)
	.cfi_restore 8
	lw	s1,16(sp)
	.cfi_restore 9
	mv	a0,a4
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
.L384:
	.cfi_restore_state
	lla	a1,PPU
	lbu	a5,1(a1)
	andi	a4,a3,3
	andi	a5,a5,1
	bne	a4,zero,.L306
	andi	a3,a3,12
	bne	a3,zero,.L307
	la a4, PALRAM; lbu a4, 0(a4);
	beq	a5,zero,.L309
	andi	a4,a4,48
.L309:
	li	a5,-4096
	add	a0,a0,a5
	sw	t1,8(sp)
	sw	a1,4(sp)
	sw	a4,0(sp)
	jalr	t2
	lw	a4,0(sp)
	lw	a1,4(sp)
	lw	t1,8(sp)
	j	.L312
.L304:
	sw	a2,4(sp)
	sw	a3,0(sp)
	call	_Z18FCEUPPU_LineUpdatev
	lw	a2,4(sp)
	li	a5,16384
	addi	a5,a5,-257
	lw	a3,0(sp)
	bgtu	a2,a5,.L386
	lla	t1,VRAMBuffer
	lla	a5,PPU_hook
	lbu	a4,0(t1)
	lw	t2,0(a5)
	mv	a1,a4
	beq	t2,zero,.L329
	mv	a0,a2
	sw	t1,12(sp)
	sw	a4,8(sp)
	sw	a3,4(sp)
	sw	a2,0(sp)
	jalr	t2
	lw	t1,12(sp)
	lw	a4,8(sp)
	lw	a3,4(sp)
	lbu	a1,0(t1)
	lw	a2,0(sp)
	lla	a5,PPU_hook
.L329:
	la a0, PPUGenLatch; sb a1, 0(a0);
	slli	a1,a3,18
	blt	a1,zero,.L330
	la a3, MMC5Hack; lw a3, 0(a3);
	bne	a3,zero,.L387
.L331:
	srli	a1,a2,10
	slli	a1,a1,2
	lla	a3,VPage
	add	a3,a3,a1
	lw	a3,0(a3)
	lw	a5,0(a5)
	lla	a1,PPU
	add	a3,a3,a2
	lbu	a3,0(a3)
	sb	a3,0(t1)
.L328:
	lbu	a3,1(a1)
	lw	a2,0(s1)
	andi	a3,a3,24
	beq	a3,zero,.L332
.L389:
	la a0, scanline; lw a0, 0(a0);
	li	a3,239
	bgt	a0,a3,.L332
	li	a3,28672
	li	a0,4096
	and	a1,a2,a3
	add	a0,a2,a0
	beq	a1,a3,.L388
.L337:
	sw	a0,0(s1)
	beq	a5,zero,.L320
	slli	a0,a0,18
	srli	a0,a0,18
	sw	a4,0(sp)
	jalr	a5
	lw	a4,0(sp)
	lw	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,20(sp)
	.cfi_restore 8
	lw	s1,16(sp)
	.cfi_restore 9
	mv	a0,a4
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	jr	ra
.L385:
	.cfi_restore_state
	addi	t1,t1,1
	srli	a3,t1,3
	add	a1,a3,a2
	andi	a1,a1,31
	sw	a1,12(s0)
	li	a2,30
	beq	a1,a2,.L314
	slli	a1,a1,5
.L315:
	andi	a3,t1,7
	andi	a5,a5,1
	lw	a2,8(s0)
	lw	a0,16(s0)
	sw	a3,0(s0)
	sw	a5,4(s0)
	j	.L318
.L386:
	lla	a1,PPU
	lbu	a4,1(a1)
	andi	a5,a3,3
	andi	a0,a4,1
	bne	a5,zero,.L322
	andi	a5,a3,12
	bne	a5,zero,.L323
	la a4, PALRAM; lbu a4, 0(a4);
	bne	a0,zero,.L383
.L325:
	andi	a3,a3,1023
	la a5, vnapage+12; lw a5, 0(a5);
	add	a5,a5,a3
	lbu	a3,0(a5)
	lla	s0,PPU_hook
	lw	a5,0(s0)
	la a0, VRAMBuffer; sb a3, 0(a0);
	beq	a5,zero,.L328
	mv	a0,a2
	sw	a1,4(sp)
	sw	a4,0(sp)
	jalr	a5
	lw	a1,4(sp)
	lw	a5,0(s0)
	lw	a4,0(sp)
	lbu	a3,1(a1)
	lw	a2,0(s1)
	andi	a3,a3,24
	bne	a3,zero,.L389
.L332:
	lbu	a3,0(a1)
	addi	a0,a2,1
	andi	a3,a3,4
	beq	a3,zero,.L337
	addi	a0,a2,32
	j	.L337
.L306:
	andi	a3,a3,31
	lla	a4,PALRAM
	add	a4,a4,a3
	lbu	a4,0(a4)
	beq	a5,zero,.L309
	andi	a4,a4,48
	j	.L309
.L330:
	srli	a2,a2,8
	lla	a1,vnapage
	andi	a2,a2,12
	add	a2,a1,a2
	lw	a2,0(a2)
	andi	a3,a3,1023
	lw	a5,0(a5)
	add	a3,a2,a3
	lbu	a3,0(a3)
	lla	a1,PPU
	sb	a3,0(t1)
	j	.L328
.L322:
	andi	a4,a3,31
	lla	a5,PALRAM
	add	a5,a5,a4
	lbu	a4,0(a5)
	beq	a0,zero,.L325
.L383:
	andi	a4,a4,48
	j	.L325
.L307:
	srli	a2,a2,2
	andi	a2,a2,3
	lla	a4,UPALRAM
	add	a4,a4,a2
	lbu	a4,-1(a4)
	beq	a5,zero,.L309
	andi	a4,a4,48
	j	.L309
.L323:
	srli	a4,a2,2
	andi	a4,a4,3
	lla	a5,UPALRAM
	add	a5,a5,a4
	lbu	a4,-1(a5)
	beq	a0,zero,.L325
	andi	a4,a4,48
	j	.L325
.L387:
	lw	a3,0(s0)
	beq	a3,zero,.L331
	mv	a0,a2
	sw	t1,4(sp)
	sw	a4,0(sp)
	call	_Z13MMC5BGVRAMADRj
	lbu	a3,0(a0)
	lw	t1,4(sp)
	lla	a5,PPU_hook
	lw	a5,0(a5)
	lw	a4,0(sp)
	lla	a1,PPU
	sb	a3,0(t1)
	j	.L328
.L314:
	li	a2,1
	li	a1,960
	bne	a3,a2,.L315
	addi	a5,a5,1
	la a3, ppur+12; sw zero, 0(a3);
	li	a1,0
	j	.L315
.L388:
	andi	a3,a2,992
	li	a0,928
	xor	a1,a2,a1
	beq	a3,a0,.L390
	li	t1,992
	addi	a0,a1,32
	bne	a3,t1,.L337
	li	a0,28672
	addi	a0,a0,992
	xor	a0,a2,a0
	j	.L337
.L390:
	li	a0,32768
	addi	a0,a0,-1120
	xor	a0,a2,a0
	j	.L337
	.cfi_endproc
.LFE95:
	.size	_ZL5A2007j, .-_ZL5A2007j
	.section	.text._ZL5B2006jh,"ax",@progbits
	.align	2
	.type	_ZL5B2006jh, @function
_ZL5B2006jh:
.LFB102:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	s1,vtoggle
	call	_Z18FCEUPPU_LineUpdatev
	lbu	a4,0(s1)
	la a5, PPUGenLatch; sb s0, 0(a5);
	bne	a4,zero,.L392
	lla	a5,ppur
	li	a1,16384
	lw	t1,32(a5)
	lla	t0,TempAddr
	slli	a2,s0,8
	addi	a1,a1,-256
	lbu	t2,0(t0)
	slli	a3,s0,3
	and	a2,a2,a1
	srli	a0,s0,2
	srli	a1,s0,3
	xori	a4,a4,1
	srli	s0,s0,4
	sb	a4,0(s1)
	andi	s0,s0,3
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	s0,20(a5)
	andi	t1,t1,7
	lw	s0,4(sp)
	.cfi_restore 8
	andi	a3,a3,24
	or	a2,t2,a2
	or	a3,t1,a3
	andi	a0,a0,1
	andi	a1,a1,1
	sw	a2,0(t0)
	sw	a3,32(a5)
	sw	a0,28(a5)
	sw	a1,24(a5)
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L392:
	.cfi_restore_state
	lla	a3,TempAddr
	lw	a0,0(a3)
	li	a5,65536
	addi	a5,a5,-256
	and	a0,a0,a5
	or	a0,a0,s0
	la a5, RefreshAddr; sw a0, 0(a5);
	li	a5,1
	sw	a0,0(a3)
	la a3, DummyRead; sw a5, 0(a3);
	la a5, PPU_hook; lw a5, 0(a5);
	beq	a5,zero,.L394
	jalr	a5
	lbu	a4,0(s1)
.L394:
	lla	a5,ppur
	lw	a3,32(a5)
	xori	a4,a4,1
	sb	a4,0(s1)
	lw	a1,24(a5)
	lw	a2,28(a5)
	lw	a0,20(a5)
	srli	t1,s0,5
	andi	s0,s0,31
	lw	ra,8(sp)
	.cfi_restore 1
	sw	s0,36(a5)
	sw	s0,16(a5)
	andi	a3,a3,24
	lw	s0,4(sp)
	.cfi_restore 8
	or	a3,a3,t1
	sw	a3,32(a5)
	sw	a0,0(a5)
	sw	a1,4(a5)
	sw	a2,8(a5)
	sw	a3,12(a5)
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
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
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,TempAddr
	lw	a0,0(s1)
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a1
	sw	a0,0(sp)
	call	_Z18FCEUPPU_LineUpdatev
	lla	a3,vtoggle
	lbu	a4,0(a3)
	la a5, PPUGenLatch; sb s0, 0(a5);
	lw	a0,0(sp)
	srli	a1,s0,3
	andi	a2,s0,7
	bne	a4,zero,.L400
	li	a5,65536
	xori	a4,a4,1
	sb	a4,0(a3)
	addi	a5,a5,-32
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	and	a5,a0,a5
	lla	t1,ppur
	or	a5,a5,a1
	sw	a5,0(s1)
	la a0, XOffset; sb a2, 0(a0);
	sw	a1,36(t1)
	sw	a2,40(t1)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L400:
	.cfi_restore_state
	slli	a5,s0,2
	li	t0,28672
	li	t1,36864
	slli	s0,s0,12
	xori	a4,a4,1
	sb	a4,0(a3)
	and	s0,s0,t0
	addi	t1,t1,-993
	andi	a5,a5,-32
	lw	ra,12(sp)
	.cfi_restore 1
	or	a5,a5,s0
	and	a0,a0,t1
	lw	s0,8(sp)
	.cfi_restore 8
	lla	t0,ppur
	or	a5,a5,a0
	sw	a5,0(s1)
	sw	a1,32(t0)
	sw	a2,20(t0)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE101:
	.size	_ZL5B2005jh, .-_ZL5B2005jh
	.section	.text._ZL5A2004j,"ax",@progbits
	.align	2
	.type	_ZL5A2004j, @function
_ZL5A2004j:
.LFB93:
	.cfi_startproc
	addi	sp,sp,-56
	.cfi_def_cfa_offset 56
	sw	ra,52(sp)
	la a5, newppu; lw a5, 0(a5);
	.cfi_offset 1, -4
	beq	a5,zero,.L404
	lla	a4,ppur
	lw	a5,52(a4)
	lla	t2,PPU
	mv	a3,a5
	sw	a5,8(sp)
	li	a5,240
	bgt	a3,a5,.L405
	lbu	a5,1(t2)
	andi	a5,a5,24
	beq	a5,zero,.L405
	lw	a3,56(a4)
	li	a5,63
	bgt	a3,a5,.L406
	lw	ra,52(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,255
	la a4, spr_read+48; sw a5, 0(a4);
	li	a0,255
	addi	sp,sp,56
	.cfi_def_cfa_offset 0
	jr	ra
.L405:
	.cfi_restore_state
	lbu	a4,3(t2)
	lw	ra,52(sp)
	.cfi_remember_state
	.cfi_restore 1
	lla	a5,SPRAM
	add	a5,a5,a4
	lbu	a0,0(a5)
	addi	sp,sp,56
	.cfi_def_cfa_offset 0
	jr	ra
.L404:
	.cfi_restore_state
	call	_Z18FCEUPPU_LineUpdatev
	lw	ra,52(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a0, PPUGenLatch; lbu a0, 0(a0);
	addi	sp,sp,56
	.cfi_def_cfa_offset 0
	jr	ra
.L406:
	.cfi_restore_state
	sw	s0,48(sp)
	.cfi_offset 8, -8
	lla	s0,spr_read
	lw	a5,52(s0)
	beq	a3,a5,.L538
	lw	a4,0(s0)
	sw	s1,44(sp)
	.cfi_offset 9, -12
	lw	t0,12(s0)
	sw	a4,4(sp)
	lla	a4,SPRAM
	lbu	a0,252(a4)
	lw	s1,4(s0)
	lw	a4,8(s0)
	lw	a2,56(s0)
	sw	t2,20(sp)
	sw	t0,0(sp)
	sw	zero,16(sp)
	sw	zero,12(sp)
	sw	zero,32(sp)
	li	t1,0
	sw	zero,24(sp)
	sw	zero,28(sp)
	sw	t0,36(sp)
	mv	t2,a0
.L453:
	li	a0,255
	bgt	a5,a0,.L410
	li	a0,4
	bgtu	a2,a0,.L411
	lla	a0,.L413
	slli	a1,a2,2
	add	a1,a1,a0
	lw	a1,0(a1)
	add	a1,a1,a0
	jr	a1
	.section	.rodata._ZL5A2004j,"a",@progbits
	.align	2
	.align	2
.L413:
	.word	.L501-.L413
	.word	.L416-.L413
	.word	.L415-.L413
	.word	.L536-.L413
	.word	.L412-.L413
	.section	.text._ZL5A2004j
.L479:
	mv	a4,a2
	li	a2,1
	sw	a2,12(sp)
	sw	a2,24(sp)
	sw	a2,28(sp)
.L415:
	andi	t1,a5,1
	li	a2,2
	beq	t1,zero,.L430
	lw	a1,20(sp)
	slli	t0,s1,2
	lla	a0,SPRAM
	lbu	a1,0(a1)
	or	t0,t0,a4
	add	t0,a0,t0
	lw	a0,8(sp)
	lbu	t0,0(t0)
	andi	a1,a1,32
	seqz	a1,a1
	addi	a0,a0,-1
	slli	a1,a1,3
	sub	a0,a0,t0
	addi	a1,a1,-16
	and	a0,a0,a1
	beq	a0,zero,.L471
	addi	s1,s1,1
	li	a1,64
	bne	s1,a1,.L432
	li	a2,1
	sw	a2,28(sp)
	li	s1,0
	li	a2,4
.L432:
	li	a1,1
	addi	a4,a4,1
	andi	a4,a4,3
	sw	a1,12(sp)
	sw	a1,24(sp)
.L430:
	mv	a1,s1
	li	t1,1
	j	.L411
.L480:
	li	a2,1
	mv	a4,t1
	sw	a2,12(sp)
	sw	a2,32(sp)
	sw	a2,28(sp)
.L416:
	andi	a2,a5,1
	beq	a2,zero,.L465
	li	a0,1
	addi	a4,a4,1
	li	a1,4
	sw	a0,12(sp)
	beq	a4,a1,.L539
.L427:
	li	a0,1
	slli	a1,s1,2
	ble	s1,a0,.L428
.L429:
	or	a1,a1,a4
	lla	a0,SPRAM
	add	a1,a0,a1
	lbu	a1,0(a1)
	li	t1,1
.L411:
	addi	a5,a5,1
	bne	a3,a5,.L453
.L448:
	lw	a5,16(sp)
	beq	a5,zero,.L454
.L461:
	lw	a5,4(sp)
	sw	a5,0(s0)
.L454:
	lw	a5,12(sp)
	beq	a5,zero,.L455
.L462:
	sw	a4,8(s0)
.L455:
	lw	a5,32(sp)
	bne	a5,zero,.L540
.L456:
	beq	t1,zero,.L541
	sw	a1,48(s0)
.L458:
	lw	a5,24(sp)
	beq	a5,zero,.L459
	sw	s1,4(s0)
.L459:
	lw	a5,28(sp)
	beq	a5,zero,.L460
	sw	a2,56(s0)
.L460:
	lw	s1,44(sp)
	.cfi_restore 9
	andi	a0,a1,0xff
.L409:
	lw	ra,52(sp)
	.cfi_restore 1
	sw	a3,52(s0)
	lw	s0,48(sp)
	.cfi_restore 8
	addi	sp,sp,56
	.cfi_def_cfa_offset 0
	jr	ra
.L501:
	.cfi_def_cfa_offset 56
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lw	a1,0(sp)
	slli	t0,s1,2
	sw	a2,40(sp)
	addi	a0,a1,4
	slli	a0,a0,2
	add	a0,s0,a0
.L417:
	li	a2,1
	mv	a1,t0
	bgt	s1,a2,.L418
	lw	a2,20(sp)
	lbu	a1,3(a2)
	andi	a1,a1,248
	add	a1,t0,a1
.L418:
	lla	a2,SPRAM
	add	a2,a2,a1
	sw	a1,0(a0)
	andi	t1,a5,1
	lbu	a1,0(a2)
	beq	t1,zero,.L419
	lw	a2,20(sp)
	lw	t0,8(sp)
	lbu	a2,0(a2)
	addi	t0,t0,-1
	sub	t0,t0,a1
	andi	a2,a2,32
	seqz	a2,a2
	slli	a2,a2,3
	addi	a2,a2,-16
	and	t0,t0,a2
	beq	t0,zero,.L542
	addi	s1,s1,1
	li	a2,64
	beq	s1,a2,.L424
	lw	t1,0(sp)
	li	a2,8
	beq	t1,a2,.L543
	addi	a5,a5,1
	beq	a3,a5,.L484
	li	a2,256
	bne	a5,a2,.L485
	li	a1,1
	lw	a2,40(sp)
	sw	a1,24(sp)
	j	.L410
.L482:
	li	a1,1
	sw	a1,12(sp)
.L536:
	or	t1,s1,a4
.L414:
	lla	a1,SPRAM
	add	a1,a1,t1
	andi	a0,a5,1
	lbu	a1,0(a1)
	beq	a0,zero,.L433
	addi	a4,a4,1
	li	a0,4
	beq	a4,a0,.L544
	addi	a5,a5,1
	beq	a3,a5,.L481
	li	a1,256
	bne	a5,a1,.L482
	li	a1,1
	sw	a1,12(sp)
	j	.L410
.L477:
	li	a4,1
	sw	a4,24(sp)
	sw	a4,28(sp)
.L412:
	li	a2,256
.L451:
	andi	a4,a5,1
	beq	a4,zero,.L436
	addi	s1,s1,1
	li	a4,1
	andi	s1,s1,63
	sw	a4,24(sp)
.L436:
	lla	a1,SPRAM
	slli	a4,s1,2
	add	a4,a1,a4
	addi	a5,a5,1
	lbu	a1,0(a4)
	beq	a3,a5,.L545
	bne	a5,a2,.L451
	li	a4,1
	sw	a4,12(sp)
	li	a2,4
	li	a4,0
.L410:
	li	a1,319
	bgt	a5,a1,.L439
.L463:
	lw	a0,0(sp)
	srai	a1,a5,3
	andi	a1,a1,7
	blt	a1,a0,.L440
	lw	a1,4(sp)
	bne	a1,zero,.L473
	li	t1,1
	li	a1,255
	j	.L411
.L440:
	andi	a0,a5,4
	bne	a0,zero,.L441
	addi	a1,a1,4
	slli	a1,a1,2
	add	a1,s0,a1
	lw	a1,0(a1)
	addi	a0,a4,1
	or	a1,a4,a1
	lla	a4,SPRAM
	add	a1,a4,a1
	li	a4,4
	lbu	a1,0(a1)
	beq	a0,a4,.L474
	mv	a4,a0
	li	a0,1
	sw	a0,12(sp)
	li	t1,1
	j	.L411
.L473:
	li	a0,1
	mv	a1,t2
	sw	a0,16(sp)
	sw	zero,4(sp)
	li	t1,1
	j	.L411
.L441:
	ori	a1,a1,3
	addi	a1,a1,4
	slli	a1,a1,2
	add	a1,s0,a1
	lw	a1,0(a1)
	lla	a0,SPRAM
	li	t1,1
	add	a1,a0,a1
	lbu	a1,0(a1)
	j	.L411
.L433:
	addi	a5,a5,1
	beq	a3,a5,.L486
	li	a1,256
	bne	a5,a1,.L414
	j	.L410
.L419:
	addi	a5,a5,1
	beq	a3,a5,.L483
	li	a2,256
	bne	a5,a2,.L417
	li	a2,0
	j	.L410
.L465:
	li	a2,1
	j	.L427
.L474:
	li	a0,1
	li	a4,0
	sw	a0,12(sp)
	li	t1,1
	j	.L411
.L467:
	li	a0,1
	mv	a4,a2
	li	a1,0
	li	a2,4
	sw	a0,24(sp)
	sw	a0,28(sp)
	li	s1,0
.L428:
	lw	a0,20(sp)
	lbu	a0,3(a0)
	andi	a0,a0,248
	add	a1,a1,a0
	j	.L429
.L439:
	lw	a5,16(sp)
	lw	t0,36(sp)
	mv	a0,t2
	beq	a5,zero,.L442
	lw	a5,4(sp)
	sw	a5,0(s0)
.L442:
	lw	a5,12(sp)
	beq	a5,zero,.L443
	sw	a4,8(s0)
.L443:
	lw	a5,32(sp)
	bne	a5,zero,.L546
.L444:
	lw	a5,24(sp)
	beq	a5,zero,.L445
	sw	s1,4(s0)
.L445:
	lw	a5,28(sp)
	beq	a5,zero,.L446
	sw	a2,56(s0)
.L446:
	beq	t0,zero,.L537
	lw	a5,16(s0)
	lla	a4,SPRAM
	add	a5,a4,a5
	lbu	a0,0(a5)
.L537:
	lw	s1,44(sp)
	.cfi_remember_state
	.cfi_restore 9
	sw	a0,48(s0)
	j	.L409
.L471:
	.cfi_restore_state
	li	a2,1
	sw	a2,12(sp)
	sw	a2,28(sp)
	mv	a4,t1
	li	a2,3
	j	.L430
.L542:
	lw	a4,0(sp)
	addi	a5,a5,1
	addi	a4,a4,1
	sw	a4,0(sp)
	beq	a3,a5,.L547
	li	a4,256
	bne	a5,a4,.L480
	li	a5,1
	mv	a4,t1
	mv	a2,t1
	sw	a5,12(sp)
	sw	a5,32(sp)
.L449:
	li	a5,1
	sw	a5,28(sp)
	li	a5,256
	j	.L463
.L540:
	lw	a5,0(sp)
	sw	a5,12(s0)
	j	.L456
.L544:
	addi	s1,s1,1
	addi	a5,a5,1
	andi	s1,s1,63
	beq	a3,a5,.L548
	li	a2,256
	bne	a5,a2,.L477
	li	a5,1
	li	a2,4
	sw	a5,12(sp)
	sw	a5,24(sp)
	j	.L449
.L539:
	addi	s1,s1,1
	li	a4,64
	beq	s1,a4,.L467
	lw	a1,0(sp)
	li	a4,8
	beq	a1,a4,.L468
	mv	a4,a2
	li	a2,1
	sw	a2,24(sp)
	sw	a2,28(sp)
	li	a2,0
	j	.L427
.L424:
	addi	a5,a5,1
	lw	a2,40(sp)
	beq	a3,a5,.L475
	li	a1,256
	mv	s1,a2
	bne	a5,a1,.L477
	li	a5,1
	sw	a5,24(sp)
	li	a2,4
	j	.L449
.L538:
	.cfi_restore 9
	lbu	a0,48(s0)
	j	.L409
.L543:
	.cfi_offset 9, -12
	addi	a5,a5,1
	lw	a2,40(sp)
	beq	a3,a5,.L478
	li	a4,256
	bne	a5,a4,.L479
	li	a5,1
	mv	a4,a2
	sw	a5,12(sp)
	sw	a5,24(sp)
	li	a2,2
	j	.L449
.L545:
	li	a5,1
	sw	a5,12(sp)
	li	a4,0
	li	t1,1
	li	a2,4
	j	.L448
.L485:
	li	a2,1
	sw	a2,24(sp)
	slli	t0,s1,2
	j	.L417
.L546:
	lw	a5,0(sp)
	sw	a5,12(s0)
	mv	t0,a5
	j	.L444
.L468:
	li	a2,1
	sw	a2,24(sp)
	sw	a2,28(sp)
	li	a4,0
	li	a2,2
	j	.L427
.L483:
	li	a2,0
	li	t1,1
	j	.L448
.L486:
	li	t1,1
	j	.L448
.L541:
	lw	a1,48(s0)
	j	.L458
.L481:
	li	a5,1
	sw	a5,12(sp)
	li	t1,1
	j	.L448
.L547:
	mv	a4,t1
	lw	t1,16(sp)
	li	a5,1
	mv	a2,a4
	sw	a5,32(sp)
.L423:
	lw	a0,16(sp)
	sw	a0,28(sp)
	sw	a0,12(sp)
	bne	a0,zero,.L461
	li	a5,1
	sw	a5,28(sp)
	li	t1,1
	j	.L462
.L548:
	li	a5,1
	lw	t1,16(sp)
	li	a2,4
	sw	a5,24(sp)
	j	.L423
.L484:
	li	a5,1
	lw	a2,40(sp)
	li	t1,1
	sw	a5,24(sp)
	j	.L448
.L475:
	li	a5,1
	mv	s1,a2
	li	t1,1
	sw	a5,24(sp)
	sw	a5,28(sp)
	li	a2,4
	j	.L448
.L478:
	li	a5,1
	mv	a4,a2
	lw	t1,16(sp)
	sw	a5,24(sp)
	li	a2,2
	j	.L423
	.cfi_endproc
.LFE93:
	.size	_ZL5A2004j, .-_ZL5A2004j
	.section	.text._ZL5B2000jh,"ax",@progbits
	.align	2
	.type	_ZL5B2000jh, @function
_ZL5B2000jh:
.LFB96:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	sw	ra,8(sp)
	.cfi_offset 1, -4
	lla	s1,PPU
	call	_Z18FCEUPPU_LineUpdatev
	lb	a5,0(s1)
	la a4, PPUGenLatch; sb s0, 0(a4);
	blt	a5,zero,.L550
	slli	a5,s0,24
	srai	a5,a5,24
	blt	a5,zero,.L552
.L550:
	lla	a1,TempAddr
	lw	a5,0(a1)
	li	a3,61440
	li	a4,4096
	addi	a3,a3,1023
	slli	a0,s0,10
	addi	a4,a4,-1024
	sb	s0,0(s1)
	and	a0,a0,a4
	and	a5,a5,a3
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	srli	a2,s0,1
	srli	a3,s0,4
	or	a5,a5,a0
	andi	a0,s0,1
	lw	s0,4(sp)
	.cfi_restore 8
	lla	a4,ppur
	andi	a2,a2,1
	andi	a3,a3,1
	sw	a5,0(a1)
	sw	a0,28(a4)
	sw	a2,24(a4)
	sw	a3,44(a4)
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L552:
	.cfi_restore_state
	lb	a5,2(s1)
	bge	a5,zero,.L550
	call	_Z11TriggerNMI2v
	j	.L550
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
	beq	a0,zero,.L559
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
.L559:
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
	addi	sp,sp,-8
	.cfi_def_cfa_offset 8
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	lla	a2,_ZL7ppulut1
	lla	a3,_ZL7ppulut2
	li	a4,0
	li	t2,7
	li	t0,8
	li	t1,256
.L565:
	li	a5,0
	li	a1,0
.L564:
	sub	a0,t2,a1
	sra	a0,a4,a0
	slli	s0,a1,2
	andi	a0,a0,1
	sll	a0,a0,s0
	addi	a1,a1,1
	or	a5,a5,a0
	bne	a1,t0,.L564
	slli	a1,a5,1
	sw	a5,0(a2)
	sw	a1,0(a3)
	addi	a4,a4,1
	addi	a2,a2,4
	addi	a3,a3,4
	bne	a4,t1,.L565
	li	a5,0
	lla	s1,_ZL7ppulut3
	li	s0,34
	li	a3,16
.L566:
	slli	a2,a5,3
	li	a4,0
.L568:
	or	a0,a2,a4
	mv	t2,a4
	li	t1,2
	li	t0,0
.L567:
	srai	a1,t2,3
	slli	a1,a1,1
	sra	a1,a5,a1
	andi	a1,a1,3
	sll	a1,a1,t1
	addi	t1,t1,4
	or	t0,t0,a1
	addi	t2,t2,1
	bne	t1,s0,.L567
	slli	a1,a0,2
	add	a1,s1,a1
	sw	t0,0(a1)
	addi	a4,a4,1
	li	a1,8
	bne	a4,a1,.L568
	addi	a5,a5,1
	bne	a5,a3,.L566
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,8
	.cfi_def_cfa_offset 0
	jr	ra
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a2,a2,-2048
	li	a1,0
	lla	a0,NTARAM
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
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
.L578:
	mv	a0,s0
	mv	a1,s1
	call	_Z17SetOneReadHandleriPFhjE
	mv	a0,s0
	lla	a1,_ZL5B2000jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,1
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2001jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,2
	lla	a1,_ZL5A2002j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2002jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,3
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2003jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,4
	lla	a1,_ZL5A2004j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2004jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,5
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2005jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,6
	mv	a1,s1
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2006jh
	call	_Z18SetOneWriteHandleriPFvjhE
	addi	a0,s0,7
	lla	a1,_ZL5A2007j
	sw	a0,0(sp)
	call	_Z17SetOneReadHandleriPFhjE
	lw	a0,0(sp)
	lla	a1,_ZL5B2007jh
	addi	s0,s0,8
	call	_Z18SetOneWriteHandleriPFvjhE
	li	a5,16384
	bne	s0,a5,.L578
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,16384
	lla	a1,_ZL5B4014jh
	addi	a0,a0,20
	addi	sp,sp,16
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
	beq	a5,zero,.L584
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
.L584:
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lla	s1,ppur
	lw	a5,56(s1)
	lw	a1,60(s1)
	sw	s0,4(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	add	a0,a0,a5
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	__modsi3
	sw	a0,56(s1)
	la a5, _ZL13new_ppu_reset; lbu a5, 0(a5);
	beq	a5,zero,.L589
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L589:
	.cfi_restore_state
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,ppur
	lw	a3,8(s1)
	lw	a2,4(s1)
	lw	a1,16(s1)
	lw	a4,12(s1)
	slli	a2,a2,11
	slli	a3,a3,10
	or	a3,a3,a2
	or	a3,a3,a1
	slli	a4,a4,5
	lla	a5,PEC586Hack
	lw	a2,0(a5)
	or	a3,a3,a4
	li	a4,8192
	sw	s0,8(sp)
	or	a4,a3,a4
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	a5,RefreshAddr
	sw	a4,0(a5)
	la a1, NTRefreshAddr; sw a4, 0(a1);
	mv	s0,a0
	beq	a2,zero,.L591
	srli	a3,a4,9
	andi	a3,a3,1
	sw	a3,44(s1)
.L592:
	slli	a4,a4,3
	andi	a4,a4,8
	sb	a4,1(s0)
	lla	a5,FFCEUX_PPURead
	lw	a4,0(a5)
	lla	a5,RefreshAddr
	lw	a0,0(a5)
	jalr	a4
	sb	a0,0(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L631
.L593:
	lw	a0,4(s1)
	lw	a2,8(s1)
	lw	a3,16(s1)
	lw	a4,12(s1)
	slli	a2,a2,10
	slli	a0,a0,11
	srli	a3,a3,2
	or	a0,a0,a2
	andi	a3,a3,7
	slli	a4,a4,1
	or	a0,a0,a3
	andi	a4,a4,56
	lla	a5,FFCEUX_PPURead
	li	a3,8192
	or	a0,a0,a4
	addi	a3,a3,960
	lw	a4,0(a5)
	or	a0,a0,a3
	lla	a5,RefreshAddr
	sw	a0,0(a5)
	jalr	a4
	sb	a0,2(s0)
	lw	a4,12(s1)
	andi	a4,a4,2
	beq	a4,zero,.L594
	srli	a0,a0,4
	sb	a0,2(s0)
.L594:
	lw	a4,16(s1)
	andi	a4,a4,2
	beq	a4,zero,.L595
	srli	a0,a0,2
	andi	a0,a0,0xff
.L595:
	slli	a0,a0,2
	andi	a0,a0,12
	sb	a0,2(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,1
	sw	a1,0(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a3,0(a5)
	sw	a0,56(s1)
	lw	a1,0(sp)
	beq	a3,zero,.L632
.L596:
	la a4, PPU+1; lbu a4, 0(a4);
	andi	a4,a4,24
	beq	a4,zero,.L598
	lw	a4,16(s1)
	lw	t0,8(s1)
	li	t1,251
	addi	a4,a4,1
	srli	a2,a4,5
	add	a2,a2,t0
	andi	a4,a4,31
	andi	a2,a2,1
	sw	a4,16(s1)
	sw	a2,8(s1)
	beq	a0,t1,.L633
.L598:
	addi	a0,a0,1
	sw	a3,0(sp)
	call	__modsi3
	lw	a3,0(sp)
	sw	a0,56(s1)
	beq	a3,zero,.L634
.L601:
	lw	a0,44(s1)
	lbu	a4,0(s0)
	lw	a3,0(s1)
	lla	a5,PEC586Hack
	slli	a0,a0,12
	or	a0,a0,a3
	slli	a2,a4,4
	lw	a3,0(a5)
	or	a0,a0,a2
	lla	a5,RefreshAddr
	sw	a4,48(s1)
	sw	a0,0(a5)
	beq	a3,zero,.L602
	lla	a5,FFCEUX_PPURead
	lbu	a3,1(s0)
	lw	a4,0(a5)
	or	a0,a3,a0
	jalr	a4
	sb	a0,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L635
.L603:
	lla	a5,RefreshAddr
	lw	a3,0(a5)
	lbu	a0,1(s0)
	lla	a5,FFCEUX_PPURead
	lw	a4,0(a5)
	or	a0,a0,a3
.L630:
	jalr	a4
	sb	a0,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L604
.L590:
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
.L602:
	.cfi_restore_state
	la a4, QTAIHack; lw a4, 0(a4);
	beq	a4,zero,.L606
	lbu	a4,5(s0)
	andi	a4,a4,64
	bne	a4,zero,.L636
.L606:
	lla	a5,FFCEUX_PPURead
	lw	a4,0(a5)
	jalr	a4
	sb	a0,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	beq	a4,zero,.L637
.L609:
	lla	a5,RefreshAddr
	lw	a0,0(a5)
	lla	a4,FFCEUX_PPURead
	lw	a4,0(a4)
	ori	a0,a0,8
	sw	a0,0(a5)
	j	.L630
.L591:
	la a2, QTAIHack; lw a2, 0(a2);
	beq	a2,zero,.L592
	srli	a2,a4,10
	la a1, qtaintramreg; lbu a1, 0(a1);
	andi	a2,a2,3
	srli	a1,a1,1
	srl	a2,a2,a1
	slli	a2,a2,10
	andi	a2,a2,1024
	andi	a3,a3,1023
	or	a3,a2,a3
	lla	a2,QTAINTRAM
	add	a3,a2,a3
	lbu	a3,0(a3)
	sb	a3,5(a0)
	andi	a3,a3,63
	sw	a3,44(s1)
	j	.L592
.L639:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lla	a2,RefreshAddr
	lw	a4,0(a2)
	lla	a5,CHRptr
	lw	a3,0(a5)
	ori	a4,a4,8
	sw	a4,0(a2)
	add	a4,a3,a4
	lbu	a4,0(a4)
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sb	a4,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	sw	a5,0(sp)
	addi	a0,a0,2
	call	__modsi3
	lw	a5,0(sp)
	sw	a0,56(s1)
	bne	a5,zero,.L590
.L604:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,2
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_RunDebugi
.L634:
	.cfi_restore_state
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L601
.L632:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lla	a5,_ZL13new_ppu_reset
	lw	a0,56(s1)
	lw	a1,60(s1)
	lbu	a3,0(a5)
	j	.L596
.L631:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L593
.L635:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L603
.L633:
	lw	a4,0(s1)
	lw	a2,12(s1)
	li	t0,30
	addi	a4,a4,1
	srli	t1,a4,3
	add	a2,t1,a2
	andi	a2,a2,31
	sw	a2,12(s1)
	lw	t2,4(s1)
	beq	a2,t0,.L638
.L600:
	andi	a4,a4,7
	andi	t2,t2,1
	sw	a4,0(s1)
	sw	t2,4(s1)
	j	.L598
.L636:
	lla	a5,CHRptr
	lw	a4,0(a5)
	add	a4,a4,a0
	lbu	a4,0(a4)
	sb	a4,3(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	lla	a5,CHRptr
	beq	a4,zero,.L639
	lla	a2,RefreshAddr
	lw	a4,0(a2)
	lw	a3,0(a5)
	ori	a4,a4,8
	sw	a4,0(a2)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,4(s0)
	lw	a0,56(s1)
	lw	a1,60(s1)
	addi	a0,a0,2
	call	__modsi3
	sw	a0,56(s1)
	j	.L590
.L637:
	li	a0,2
	call	_Z14X6502_RunDebugi
	j	.L609
.L638:
	li	a2,1
	bne	t1,a2,.L600
	addi	t2,t2,1
	la a2, ppur+12; sw zero, 0(a2);
	j	.L600
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
	addi	sp,sp,-104
	.cfi_def_cfa_offset 104
	sw	ra,100(sp)
	sw	s0,96(sp)
	sw	s1,92(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	t0,ppur
	bne	a5,zero,.L641
	lla	s0,_ZL7ppudead
	lw	a5,0(s0)
	lw	a0,56(t0)
	lw	a1,60(t0)
	bne	a5,zero,.L844
.L643:
	lla	a3,PPU
	lbu	a5,2(a3)
	li	s1,0
	la a4, ppuphase; sw zero, 0(a4);
	ori	a5,a5,-128
	sb	a5,2(a3)
	la a5, PPUSPL; sb zero, 0(a5);
	la a5, PPU+3; sb zero, 0(a5);
	li	a5,241
	sw	a5,52(t0)
	li	s0,20
	mv	a5,s1
	mv	s1,t0
	j	.L650
.L648:
	addi	s0,s0,-1
	beq	s0,zero,.L649
.L845:
	lla	a5,_ZL13new_ppu_reset
	lw	a0,56(s1)
	lw	a1,60(s1)
	lbu	a5,0(a5)
.L650:
	addi	a0,a0,1
	sw	a5,0(sp)
	call	__modsi3
	lw	a5,0(sp)
	sw	a0,56(s1)
	bne	a5,zero,.L648
	li	a0,1
	addi	s0,s0,-1
	call	_Z14X6502_RunDebugi
	bne	s0,zero,.L845
.L649:
	lla	a5,PPU
	lb	a5,0(a5)
	mv	t0,s1
	blt	a5,zero,.L846
.L651:
	lla	a5,PAL
	lbu	a4,0(a5)
	li	s1,20
	sw	zero,4(sp)
	seqz	a4,a4
	neg	a4,a4
	andi	a5,a4,-50
	addi	a5,a5,70
	sw	a5,8(sp)
	li	s0,341
	mv	a5,s1
	mv	s1,t0
	j	.L654
.L653:
	addi	a5,a5,1
	beq	a5,s0,.L847
.L654:
	lw	a0,56(s1)
	lw	a1,60(s1)
	sw	a5,0(sp)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a4,0(a5)
	sw	a0,56(s1)
	lw	a5,0(sp)
	bne	a4,zero,.L653
	li	a0,1
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	addi	a5,a5,1
	bne	a5,s0,.L654
.L847:
	lw	a4,52(s1)
	lw	a5,4(sp)
	addi	a4,a4,1
	sw	a4,52(s1)
	lw	a4,8(sp)
	addi	a3,a5,1
	sw	a3,4(sp)
	li	a5,0
	bne	a4,a3,.L654
	lla	a5,normalscanlines
	lw	a5,0(a5)
	la a4, PPU+2; sb zero, 0(a4);
	mv	t0,s1
	ble	a5,zero,.L848
	li	a5,-1
	sw	a5,60(sp)
	lla	a5,MMC5Hack
	sw	zero,8(sp)
	sw	a5,88(sp)
	mv	s0,s1
.L656:
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
	li	a4,1
	lw	a3,8(sp)
	sw	a4,0(a2)
	sw	a4,8(a2)
	lla	a2,linestartts
	sw	a5,0(a2)
	lla	a5,ppuphase
	sw	a3,52(s0)
	sw	a4,0(a5)
	beq	a3,zero,.L659
	lw	a5,88(sp)
	lw	a5,0(a5)
	bne	a5,zero,.L849
.L659:
	lla	a1,_ZZ14FCEUX_PPU_LoopiE7oamslot
	lw	a5,60(sp)
	lw	a4,0(a1)
	sw	s0,72(sp)
	slli	a5,a5,8
	slli	ra,a4,2
	sw	a5,28(sp)
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	add	a5,a5,ra
	lw	a2,0(a5)
	slli	a3,a4,9
	xori	a5,a4,1
	slli	a4,a4,6
	sw	a5,0(a1)
	addi	a3,a3,2
	lla	a1,_ZZ14FCEUX_PPU_LoopiE8oamcount
	sw	a4,76(sp)
	lla	a4,_ZZ14FCEUX_PPU_LoopiE4oams
	sw	a2,0(a1)
	add	a4,a4,a3
	li	a1,0
	lla	a0,bgdata+12
	sw	a4,32(sp)
	sw	a5,84(sp)
	sw	ra,80(sp)
	mv	s0,a1
	j	.L689
.L660:
	lw	a4,8(sp)
	beq	a4,zero,.L662
	li	a5,240
	ble	a4,a5,.L850
.L662:
	addi	s0,s0,1
	li	a5,32
	addi	a0,a0,6
	beq	s0,a5,.L851
.L689:
	sw	a0,0(sp)
	call	_ZN6BGData6Record4ReadEv
	lla	a5,gNoBGFillColor
	lbu	a1,0(a5)
	li	a5,255
	lw	a0,0(sp)
	bne	a1,a5,.L660
	lla	a5,PPU
	lbu	a5,1(a5)
	lla	a4,PALRAM
	lbu	a1,0(a4)
	andi	a5,a5,1
	beq	a5,zero,.L660
	andi	a1,a1,48
	j	.L660
.L850:
	lw	a4,80(sp)
	lla	a5,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	lla	a3,_ZZ14FCEUX_PPU_LoopiE8oamcount
	add	a5,a5,a4
	lw	a5,0(a5)
	lla	a4,PPU
	lbu	t2,1(a4)
	sw	a5,4(sp)
	sw	a5,0(a3)
	la a5, XBuf; lw a5, 0(a5);
	slli	a2,s0,3
	sw	a5,16(sp)
	andi	a4,t2,16
	mv	s1,a2
	andi	a5,t2,8
	beq	a4,zero,.L663
	snez	a4,a5
	sw	a4,12(sp)
	li	a4,1
	sw	a4,0(sp)
	beq	s0,zero,.L852
.L667:
	lw	a5,4(sp)
	lw	a4,76(sp)
	lw	t0,72(sp)
	sw	s0,64(sp)
	add	a3,a5,a4
	la a5, _ZL8renderbg; lbu a5, 0(a5);
	slli	a3,a3,3
	sw	a5,20(sp)
	lla	a5,_ZZ14FCEUX_PPU_LoopiE4oams+2
	li	a4,16384
	add	a3,a3,a5
	addi	a5,a2,8
	sw	a5,24(sp)
	addi	a5,a4,-256
	sw	a5,52(sp)
	sw	a1,56(sp)
	sw	a0,68(sp)
	andi	s0,t2,24
	lw	a5,40(t0)
	bne	s0,zero,.L757
.L854:
	lw	a4,4(t0)
	lw	a2,8(t0)
	lw	a1,16(t0)
	lw	a0,12(t0)
	slli	a2,a2,10
	lw	t1,0(t0)
	slli	a4,a4,11
	or	a4,a4,a2
	or	a4,a4,a1
	slli	a2,a0,5
	or	a4,a4,a2
	slli	a1,t1,12
	li	a2,12288
	and	a1,a1,a2
	or	a4,a4,a1
	lw	a1,52(sp)
	li	a0,0
	and	a2,a4,a1
	bne	a2,a1,.L669
	andi	s0,a4,31
	mv	a0,s0
.L669:
	sw	t0,48(sp)
	sw	t2,44(sp)
	sw	a3,40(sp)
	sw	a5,36(sp)
	call	_Z19READPAL_MOTHEROFALLj
	lw	a5,36(sp)
	lw	a3,40(sp)
	lw	t2,44(sp)
	lw	t0,48(sp)
.L668:
	lw	a4,12(sp)
	beq	a4,zero,.L670
	add	a5,s1,a5
	srai	a2,a5,3
	slli	a4,a2,1
	add	a4,a4,a2
	slli	a4,a4,1
	addi	a2,a4,3
	lla	ra,bgdata
	add	a2,a2,ra
	lbu	t1,1(a2)
	lbu	a1,0(a2)
	not	a5,a5
	andi	a2,a5,7
	sra	a5,t1,a2
	add	a4,ra,a4
	lbu	a4,2(a4)
	slli	s0,a5,1
	sra	a1,a1,a2
	andi	s0,s0,2
	andi	a1,a1,1
	or	s0,s0,a1
	or	s0,s0,a4
.L670:
	lw	a5,20(sp)
	beq	a5,zero,.L671
	lla	a5,PALRAM
	add	a4,a5,s0
	andi	a5,t2,1
	lbu	a0,0(a4)
	beq	a5,zero,.L671
	andi	a0,a0,48
.L671:
	lw	a4,4(sp)
	lw	a5,32(sp)
	li	ra,0
	ble	a4,zero,.L684
.L683:
	lbu	a4,1(a5)
	bgt	a4,s1,.L674
	addi	a4,a4,7
	blt	a4,s1,.L674
	lbu	a2,3(a5)
	lbu	a4,2(a5)
	srli	t1,a2,1
	slli	t1,t1,8
	srli	a1,a4,1
	or	a1,a1,t1
	sh	a1,2(a5)
	lw	a1,0(sp)
	beq	a1,zero,.L674
	bne	ra,zero,.L746
	slli	a2,a2,1
	andi	a4,a4,1
	andi	a2,a2,2
	or	a4,a4,a2
	beq	a4,zero,.L674
	lbu	a1,4(a5)
	lbu	a2,0(a5)
	bne	a1,zero,.L677
	andi	a1,s0,3
	beq	a1,zero,.L681
	li	a1,255
	beq	s1,a1,.L680
	lla	t1,PPU
	lbu	a1,2(t1)
	ori	a1,a1,64
	sb	a1,2(t1)
.L680:
	andi	a1,a2,32
	beq	a1,zero,.L681
.L746:
	lw	ra,0(sp)
.L674:
	addi	a5,a5,8
	bne	a3,a5,.L683
.L684:
	srli	a5,t2,5
	li	a4,7
	beq	a5,a4,.L853
	li	a5,31
	bleu	t2,a5,.L687
	ori	a0,a0,64
	andi	a0,a0,0xff
.L686:
	lw	a5,28(sp)
	lw	a4,16(sp)
	add	a5,s1,a5
	add	a5,a4,a5
	sb	a0,0(a5)
	lla	a4,g_rasterpos
	lw	a5,0(a4)
	addi	s1,s1,1
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	a5,24(sp)
	beq	s1,a5,.L837
	lla	a5,PPU
	lbu	t2,1(a5)
	lw	a5,40(t0)
	andi	s0,t2,24
	beq	s0,zero,.L854
.L757:
	lw	a0,56(sp)
	li	s0,0
	j	.L668
.L677:
	andi	a1,a2,32
	beq	a1,zero,.L681
	andi	a1,s0,3
	lw	ra,0(sp)
	bne	a1,zero,.L674
.L681:
	lla	a1,_ZL13rendersprites
	lbu	ra,0(a1)
	beq	ra,zero,.L746
	slli	a2,a2,2
	andi	a2,a2,12
	or	a4,a4,a2
	lla	a2,PALRAM
	add	a4,a2,a4
	andi	a2,t2,1
	lbu	a0,16(a4)
	beq	a2,zero,.L674
	andi	a0,a0,48
	j	.L674
.L687:
	andi	a0,a0,63
	ori	a0,a0,128
	j	.L686
.L853:
	ori	a0,a0,-64
	andi	a0,a0,0xff
	j	.L686
.L837:
	lw	s0,64(sp)
	lw	a0,68(sp)
	li	a5,32
	addi	s0,s0,1
	addi	a0,a0,6
	bne	s0,a5,.L689
.L851:
	lla	a3,PPU
	lbu	t1,0(a3)
	lbu	a4,1(a3)
	lbu	a3,2(a3)
	lw	a5,84(sp)
	lw	s0,72(sp)
	sw	a3,0(sp)
	lla	a3,_ZL10maxsprites
	lw	a3,0(a3)
	andi	t1,t1,32
	slli	a2,a5,2
	seqz	t1,t1
	sw	a3,12(sp)
	lla	a3,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	add	a3,a3,a2
	neg	t1,t1
	sw	s0,24(sp)
	lw	s0,60(sp)
	sw	zero,0(a3)
	andi	a4,a4,24
	andi	t1,t1,-8
	la a3, _ZZ14FCEUX_PPU_LoopiE8oamcount; sw zero, 0(a3);
	sw	a4,4(sp)
	addi	t1,t1,16
	lla	a4,SPRAM
	slli	a0,a5,6
	li	a1,0
	li	a3,0
	sw	zero,16(sp)
	li	t2,0
	li	ra,7
	li	t0,64
	sw	a5,20(sp)
	sw	a2,28(sp)
.L695:
	add	a5,a0,a1
	lbu	a2,0(a4)
	slli	a5,a5,3
	lla	s1,_ZZ14FCEUX_PPU_LoopiE4oams
	add	a5,s1,a5
	sb	zero,7(a5)
	add	a5,a2,t1
	bgt	a2,s0,.L691
	add	a2,a1,a0
	slli	a2,a2,3
	add	a2,s1,a2
	ble	a5,s0,.L691
	ble	a1,ra,.L692
	lw	a5,4(sp)
	beq	a5,zero,.L692
	lw	a5,0(sp)
	li	s1,8
	ori	a5,a5,32
	sw	a5,0(sp)
	lw	a5,12(sp)
	beq	a5,s1,.L855
	li	a5,1
	sw	a5,16(sp)
.L692:
	lw	a5,0(a4)
	li	t2,1
	sb	t2,7(a2)
	sb	a3,6(a2)
	sw	a5,0(a2)
	addi	a1,a1,1
	li	t2,1
.L691:
	addi	a3,a3,1
	addi	a4,a4,4
	bne	a3,t0,.L695
	lw	a4,16(sp)
	lw	a5,20(sp)
	lw	s0,24(sp)
	lw	a2,28(sp)
	beq	a4,zero,.L696
	lw	a3,0(sp)
	lla	a4,PPU
	sb	a3,2(a4)
.L696:
	beq	t2,zero,.L763
	lla	a4,_ZZ14FCEUX_PPU_LoopiE8oamcount
	sw	a1,0(a4)
.L697:
	lla	a4,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	add	a2,a4,a2
	lla	a3,ppuphase
	li	a4,2
	sw	a4,0(a3)
	lw	a4,12(sp)
	sw	a1,0(a2)
	ble	a4,zero,.L698
.L694:
	lla	a4,_ZZ14FCEUX_PPU_LoopiE4oams
	slli	a5,a5,9
	add	a5,a4,a5
	addi	a3,t1,-1
	li	a4,0
	mv	s1,a5
	sw	a3,20(sp)
	mv	a5,a4
	beq	a5,a1,.L856
.L699:
	lbu	a0,0(s1)
	lw	a4,60(sp)
	lb	a3,2(s1)
	sub	a0,a4,a0
	bge	a3,zero,.L700
	lw	a4,20(sp)
	sub	a0,a4,a0
.L700:
	lbu	a3,7(s1)
	lbu	t1,1(s1)
	andi	a1,a0,7
	bne	a3,zero,.L701
	li	a1,0
	li	t1,0
	li	a0,0
.L701:
	lla	a4,PPU
	lbu	a3,0(a4)
	andi	t0,a3,32
	beq	t0,zero,.L702
	andi	a3,t1,-2
	srli	a0,a0,3
	or	a0,a0,a3
	slli	a3,t1,12
	li	t1,4096
	slli	a0,a0,4
	and	a3,a3,t1
	or	a3,a0,a3
.L703:
	lla	a4,PPU
	lbu	a0,1(a4)
	add	a3,a3,a1
	li	t1,2
	andi	a1,a0,24
	beq	a1,zero,.L704
	lw	a4,8(sp)
	beq	a4,zero,.L705
	li	a1,240
	bgt	a4,a1,.L704
	lw	a0,56(s0)
	li	a1,256
	beq	a0,a1,.L857
.L704:
	li	a1,7
	ble	a5,a1,.L858
	lla	t1,FFCEUX_PPURead
	lw	t2,0(t1)
	lla	a1,RefreshAddr
	sw	a3,0(a1)
	mv	a0,a3
	sw	a5,0(sp)
	jalr	t2
	lla	a1,RefreshAddr
	lw	a3,0(a1)
	lla	t1,FFCEUX_PPURead
	lw	t1,0(t1)
	sb	a0,4(s1)
	addi	a0,a3,8
	sw	a0,0(a1)
	jalr	t1
	lw	a5,0(sp)
	sb	a0,5(s1)
.L726:
	lbu	a3,2(s1)
	andi	a3,a3,64
	bne	a3,zero,.L732
	lbu	a1,5(s1)
	lbu	a0,4(s1)
	lla	a3,bitrevlut
	add	a1,a3,a1
	lbu	a1,0(a1)
	add	a3,a3,a0
	lbu	a3,0(a3)
	slli	a1,a1,8
	or	a3,a3,a1
	sh	a3,4(s1)
.L732:
	lla	a4,_ZL10maxsprites
	lw	a3,0(a4)
	addi	a5,a5,1
	addi	s1,s1,8
	ble	a3,a5,.L698
	lla	a4,_ZZ14FCEUX_PPU_LoopiE8oamcount
	lw	a1,0(a4)
	bne	a5,a1,.L699
.L856:
	li	a3,7
	ble	a5,a3,.L699
.L698:
	li	a5,1
	lla	a4,ppuphase
	lla	a0,bgdata
	sw	a5,0(a4)
	call	_ZN6BGData6Record4ReadEv
	lla	a0,bgdata+6
	call	_ZN6BGData6Record4ReadEv
	lw	a0,56(s0)
	lw	a1,60(s0)
	addi	a0,a0,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	s1,0(a5)
	sw	a0,56(s0)
	mv	a5,a0
	beq	s1,zero,.L859
	lw	a4,8(sp)
	beq	a4,zero,.L748
	addi	a0,a5,2
	li	a5,341
	li	a1,341
	sw	a5,60(s0)
	call	__modsi3
	sw	a0,56(s0)
.L739:
	lw	a0,56(s0)
	li	a1,341
	addi	a0,a0,1
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(s0)
	beq	a5,zero,.L860
.L740:
	lw	a4,8(sp)
	lw	a3,60(sp)
	lla	a5,normalscanlines
	lw	a5,0(a5)
	addi	a4,a4,1
	addi	a3,a3,1
	sw	a4,8(sp)
	sw	a3,60(sp)
	bgt	a5,a4,.L656
	mv	t0,s0
.L742:
	lw	a5,88(sp)
	la a4, DMC_7bit; sb zero, 0(a4);
	lw	a5,0(a5)
	bne	a5,zero,.L861
.L658:
	lw	a0,56(t0)
	lw	a1,60(t0)
	sw	t0,0(sp)
	addi	a0,a0,341
	call	__modsi3
	lw	t0,0(sp)
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	sw	a0,56(t0)
	beq	a5,zero,.L862
.L743:
.L647:
	lla	a4,framectr
	lw	a5,0(a4)
	lw	ra,100(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,96(sp)
	.cfi_restore 8
	addi	a5,a5,1
	sw	a5,0(a4)
	lw	s1,92(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,104
	.cfi_def_cfa_offset 0
	jr	ra
.L663:
	.cfi_restore_state
	sw	zero,0(sp)
	beq	a5,zero,.L842
	bne	s0,zero,.L756
.L666:
	srli	a5,t2,1
	andi	a5,a5,1
	sw	a5,12(sp)
	j	.L667
.L665:
	bne	a5,zero,.L754
	li	a5,1
	sw	a5,0(sp)
.L842:
	sw	zero,12(sp)
	j	.L667
.L702:
	slli	a3,a3,9
	li	a0,4096
	and	a3,a3,a0
	slli	t1,t1,4
	or	a3,a3,t1
	j	.L703
.L858:
	lw	a0,56(s0)
	lw	a1,60(s0)
	sw	a5,12(sp)
	add	a0,t1,a0
	sw	a3,4(sp)
	sw	t1,0(sp)
	sw	a1,16(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	t0,0(a5)
	sw	a0,56(s0)
	lw	t1,0(sp)
	lw	a3,4(sp)
	lw	a5,12(sp)
	beq	t0,zero,.L717
	lla	a4,PPU
	lbu	t1,0(a4)
	li	t0,24
	lw	a1,16(sp)
	andi	t1,t1,56
	beq	t1,t0,.L863
	li	t1,2
	beq	a5,t1,.L721
.L719:
	addi	a0,a0,2
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	__modsi3
	lw	a3,0(sp)
	lw	a5,4(sp)
	sw	a0,56(s0)
.L730:
	lla	t0,FFCEUX_PPURead
	lw	a1,0(t0)
	lla	t1,RefreshAddr
	sw	a3,0(t1)
	mv	a0,a3
	sw	a5,0(sp)
	jalr	a1
	lw	a3,56(s0)
	lw	a1,60(s0)
	sb	a0,4(s1)
	addi	a0,a3,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a3,0(a5)
	sw	a0,56(s0)
	lw	a5,0(sp)
	lla	t1,RefreshAddr
	lla	t0,FFCEUX_PPURead
	beq	a3,zero,.L864
.L731:
	lw	a0,0(t1)
	lw	a3,0(t0)
	sw	a5,0(sp)
	addi	a0,a0,8
	sw	a0,0(t1)
	jalr	a3
	lw	a3,56(s0)
	lw	a1,60(s0)
	sb	a0,5(s1)
	addi	a0,a3,2
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a3,0(a5)
	sw	a0,56(s0)
	lw	a5,0(sp)
	bne	a3,zero,.L726
	li	a0,2
	sw	a5,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	j	.L726
.L705:
	lw	a0,56(s0)
	li	a1,304
	bne	a0,a1,.L704
	lw	a1,60(s0)
	li	a0,305
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a1,0(a5)
	sw	a0,56(s0)
	lw	a3,0(sp)
	lw	a5,4(sp)
	beq	a1,zero,.L865
.L707:
	lw	ra,24(s0)
	lw	t2,28(s0)
	lw	t1,32(s0)
	lw	a1,36(s0)
	lw	t0,20(s0)
	sw	ra,4(s0)
	sw	t2,8(s0)
	sw	t0,0(s0)
	sw	t1,12(s0)
	sw	a1,16(s0)
.L709:
	lw	a1,60(s0)
	addi	a0,a0,1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	a1,0(a5)
	sw	a0,56(s0)
	lw	a3,0(sp)
	lw	a5,4(sp)
	beq	a1,zero,.L710
.L711:
	li	t1,0
	j	.L704
.L857:
	lw	a1,60(s0)
	li	a0,257
	sw	a5,12(sp)
	sw	a3,4(sp)
	sw	a1,0(sp)
	call	__modsi3
	lla	a5,_ZL13new_ppu_reset
	lbu	t1,0(a5)
	sw	a0,56(s0)
	lw	a1,0(sp)
	lw	a3,4(sp)
	lw	a5,12(sp)
	beq	t1,zero,.L866
.L712:
	lw	t2,36(s0)
	lw	t0,28(s0)
	sw	t2,16(s0)
	sw	t0,8(s0)
.L714:
	addi	a0,a0,1
	sw	a5,12(sp)
	sw	t1,4(sp)
	sw	a3,0(sp)
	call	__modsi3
	lw	t1,4(sp)
	sw	a0,56(s0)
	lw	a3,0(sp)
	lw	a5,12(sp)
	bne	t1,zero,.L711
.L710:
	li	a0,1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a3,0(sp)
	lw	a5,4(sp)
	li	t1,0
	j	.L704
.L717:
	mv	a0,t1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a1,0(a5)
	li	a0,24
	lw	a3,0(sp)
	andi	a1,a1,56
	lw	a5,4(sp)
	beq	a1,a0,.L867
	li	a1,2
	bne	a5,a1,.L843
.L721:
	lla	a4,PPU
	lbu	a1,1(a4)
	andi	a1,a1,24
	beq	a1,zero,.L843
	la a1, GameHBIRQHook; lw a1, 0(a1);
	beq	a1,zero,.L728
	sw	a5,4(sp)
	sw	a3,0(sp)
	jalr	a1
	lw	a5,4(sp)
	lw	a3,0(sp)
.L720:
	lla	a4,PPU
	lbu	a1,1(a4)
	andi	a1,a1,24
	beq	a1,zero,.L843
.L728:
	la a1, GameHBIRQHook2; lw a1, 0(a1);
	beq	a1,zero,.L843
	sw	a5,4(sp)
	sw	a3,0(sp)
	jalr	a1
	lla	a5,_ZL13new_ppu_reset
	lbu	t1,0(a5)
	lw	a0,56(s0)
	lw	a1,60(s0)
	lw	a5,4(sp)
	lw	a3,0(sp)
.L724:
	addi	a0,a0,2
	sw	a5,12(sp)
	sw	t1,4(sp)
	sw	a3,0(sp)
	call	__modsi3
	lw	t1,4(sp)
	sw	a0,56(s0)
	lw	a3,0(sp)
	lw	a5,12(sp)
	bne	t1,zero,.L730
	li	a0,2
	sw	a5,4(sp)
	call	_Z14X6502_RunDebugi
	lw	a3,0(sp)
	lw	a5,4(sp)
	j	.L730
.L867:
	li	a1,2
	beq	a5,a1,.L720
.L843:
	lla	a4,_ZL13new_ppu_reset
	lw	a0,56(s0)
	lw	a1,60(s0)
	lbu	t1,0(a4)
	j	.L724
.L864:
	li	a0,2
	sw	a5,0(sp)
	call	_Z14X6502_RunDebugi
	lw	a5,0(sp)
	lla	t1,RefreshAddr
	lla	t0,FFCEUX_PPURead
	j	.L731
.L852:
	andi	a4,t2,4
	bne	a4,zero,.L665
	sw	zero,0(sp)
	bne	a5,zero,.L666
	sw	zero,12(sp)
	j	.L667
.L863:
	li	t1,2
	bne	a5,t1,.L719
	j	.L720
.L748:
	lla	a4,idleSynch
	lbu	a5,0(a4)
	beq	a5,zero,.L736
	lla	a3,PPU
	lbu	a3,1(a3)
	andi	a3,a3,24
	beq	a3,zero,.L736
	lla	a3,PAL
	lbu	a3,0(a3)
	beq	a3,zero,.L737
.L736:
	xori	a5,a5,1
	li	a3,341
	li	a1,341
	addi	a0,a0,2
	sw	a3,60(s0)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s0)
	bne	s1,zero,.L739
.L738:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lw	a4,60(s0)
	li	a5,341
	bne	a4,a5,.L740
	j	.L739
.L756:
	li	a5,1
	sw	a5,12(sp)
	j	.L667
.L859:
	li	a0,2
	call	_Z14X6502_RunDebugi
	lla	a5,_ZL13new_ppu_reset
	lbu	s1,0(a5)
	lw	a5,8(sp)
	lw	a0,56(s0)
	beq	a5,zero,.L748
	li	a5,341
	li	a1,341
	addi	a0,a0,2
	sw	a5,60(s0)
	call	__modsi3
	sw	a0,56(s0)
	beq	s1,zero,.L738
	j	.L739
.L865:
	li	a0,1
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a1,1(a5)
	lw	a3,0(sp)
	lw	a5,4(sp)
	andi	a1,a1,24
	lw	a0,56(s0)
	beq	a1,zero,.L709
	j	.L707
.L855:
	lw	a3,0(sp)
	lw	a2,28(sp)
	lla	a4,PPU
	sb	a3,2(a4)
	lla	a4,_ZZ14FCEUX_PPU_LoopiE9oamcounts
	lw	a5,20(sp)
	lw	s0,24(sp)
	add	a4,a4,a2
	beq	t2,zero,.L868
	lla	a3,_ZZ14FCEUX_PPU_LoopiE8oamcount
	sw	a1,0(a3)
	sw	a1,0(a4)
	lla	a3,ppuphase
	li	a4,2
	sw	a4,0(a3)
	j	.L694
.L754:
	li	a5,1
	sw	a5,0(sp)
	j	.L666
.L849:
	lw	a0,60(sp)
	call	_Z7MMC5_hbi
	j	.L659
.L763:
	li	a1,0
	j	.L697
.L866:
	li	a0,1
	sw	a5,4(sp)
	sw	a3,0(sp)
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a1,1(a5)
	lw	a3,0(sp)
	lw	a5,4(sp)
	andi	a1,a1,24
	lw	a0,56(s0)
	bne	a1,zero,.L713
	lla	a4,_ZL13new_ppu_reset
	lw	a1,60(s0)
	lbu	t1,0(a4)
	j	.L714
.L641:
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
	sw	a5,60(t0)
	lla	s0,_ZL7ppudead
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
	lw	a5,0(s0)
	li	a1,341
	li	a0,0
	beq	a5,zero,.L643
.L844:
	li	a5,241
	sw	a5,52(t0)
	sw	t0,0(sp)
	la a5, PAL; lbu a5, 0(a5);
	bne	a5,zero,.L869
	li	s1,8192
	addi	s1,s1,-1372
.L841:
	add	a0,a0,s1
	call	__modsi3
	lw	t0,0(sp)
	mv	a5,a0
	mv	a0,s1
	sw	a5,56(t0)
	call	_Z14X6502_RunDebugi
	lw	t0,0(sp)
	lla	a5,_ZL13new_ppu_reset
	lbu	a5,0(a5)
	lw	a0,56(t0)
	lw	a1,60(t0)
	li	s1,81920
	addi	s1,s1,602
	add	a0,a0,s1
	sw	t0,4(sp)
	sw	a5,0(sp)
	la a4, ppur+52; sw zero, 0(a4);
	call	__modsi3
	lw	t0,4(sp)
	lw	a5,0(sp)
	sw	a0,56(t0)
	beq	a5,zero,.L870
.L646:
	lw	a5,0(s0)
	lw	ra,100(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,92(sp)
	.cfi_restore 9
	addi	a5,a5,-1
	sw	a5,0(s0)
	lw	s0,96(sp)
	.cfi_restore 8
	li	a0,0
	addi	sp,sp,104
	.cfi_def_cfa_offset 0
	jr	ra
.L737:
	.cfi_restore_state
	xori	a5,a5,1
	li	a3,340
	li	a1,340
	addi	a0,a0,2
	sw	a3,60(s0)
	sb	a5,0(a4)
	call	__modsi3
	sw	a0,56(s0)
	bne	s1,zero,.L740
	j	.L738
.L862:
	li	a0,341
	call	_Z14X6502_RunDebugi
	j	.L743
.L861:
	li	a0,240
	sw	t0,0(sp)
	call	_Z7MMC5_hbi
	lw	t0,0(sp)
	j	.L658
.L868:
	sw	zero,0(a4)
	lla	a3,ppuphase
	li	a4,2
	sw	a4,0(a3)
	li	a1,0
	j	.L694
.L860:
	li	a0,1
	call	_Z14X6502_RunDebugi
	j	.L740
.L869:
	li	s1,24576
	addi	s1,s1,-706
	j	.L841
.L846:
	sw	s1,0(sp)
	call	_Z10TriggerNMIv
	lw	t0,0(sp)
	j	.L651
.L870:
	mv	a0,s1
	call	_Z14X6502_RunDebugi
	j	.L646
.L848:
	lla	a5,MMC5Hack
	sw	a5,88(sp)
	j	.L742
.L713:
	lla	a4,_ZL13new_ppu_reset
	lw	a1,60(s0)
	lbu	t1,0(a4)
	j	.L712
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
	addi	sp,sp,-68
	.cfi_def_cfa_offset 68
	sw	ra,64(sp)
	la a5, newppu; lw a5, 0(a5);
	sw	a0,48(sp)
	.cfi_offset 1, -4
	beq	a5,zero,.L872
	la a5, GameInfo; lw a5, 0(a5);
	lw	a4,8(a5)
	li	a5,3
	bne	a4,a5,.L1327
.L872:
	sw	s1,56(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL7ppudead
	lw	a5,0(s1)
	sw	a5,0(sp)
	beq	a5,zero,.L873
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
	lw	a5,0(s1)
	addi	a5,a5,-1
	sw	a5,0(s1)
.L874:
	call	_Z7ShowFPSv
	lw	a5,48(sp)
	seqz	a5,a5
	sw	a5,0(sp)
.L871:
	lw	ra,64(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	a0,0(sp)
	lw	s1,56(sp)
	.cfi_restore 9
	addi	sp,sp,68
	.cfi_def_cfa_offset 0
	jr	ra
.L873:
	.cfi_restore_state
	li	a0,341
	sw	s0,60(sp)
	.cfi_offset 8, -8
	call	_Z14X6502_RunDebugi
	lla	a3,PPU
	lbu	a5,2(a3)
	li	a0,12
	la a4, PPUSPL; sb zero, 0(a4);
	ori	a5,a5,-128
	sb	a5,2(a3)
	la a5, PPU+3; sb zero, 0(a5);
	call	_Z14X6502_RunDebugi
	lla	a5,GameInfo
	lw	a4,0(a5)
	li	a5,3
	lw	a4,8(a4)
	beq	a4,a5,.L1328
	lla	a5,PPU
	lb	a5,0(a5)
	blt	a5,zero,.L1329
.L876:
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
	lla	a5,overclock_enabled
	lbu	a5,0(a5)
	beq	a5,zero,.L877
	la a4, vblankscanlines; lw a4, 0(a4);
	beq	a4,zero,.L877
	la a5, DMC_7bit; lbu a5, 0(a5);
	beq	a5,zero,.L878
	la a5, skip_7bit_overclocking; lbu a5, 0(a5);
	bne	a5,zero,.L877
.L878:
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
.L877:
	lla	a3,PPU
	lbu	a5,2(a3)
	li	a0,256
	mv	s0,a3
	andi	a5,a5,31
	sb	a5,2(a3)
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s0)
	andi	a5,a5,24
	beq	a5,zero,.L880
	la a4, GameHBIRQHook; lw a4, 0(a4);
	beq	a4,zero,.L881
	lbu	a5,0(s0)
	li	a3,24
	andi	a5,a5,56
	beq	a5,a3,.L881
	jalr	a4
.L881:
	lla	s0,PPU_hook
	lw	a4,0(s0)
	beq	a4,zero,.L882
	li	s1,42
	j	.L883
.L1330:
	lw	a4,0(s0)
.L883:
	li	a0,8192
	jalr	a4
	lw	a5,0(s0)
	li	a0,0
	addi	s1,s1,-1
	jalr	a5
	bne	s1,zero,.L1330
.L882:
	la a5, GameHBIRQHook2; lw a5, 0(a5);
	beq	a5,zero,.L880
	jalr	a5
.L880:
	li	a0,69
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L886
	la a5, TempAddr; lw a5, 0(a5);
	la a4, RefreshAddr; sw a5, 0(a4);
	la a4, PPU_hook; lw a4, 0(a4);
	beq	a4,zero,.L886
	slli	a5,a5,18
	srli	a0,a5,18
	jalr	a4
.L886:
	lla	a5,XBuf
	lw	a0,0(a5)
	la a5, _ZL10numsprites; sb zero, 0(a5);
	la a5, _ZL5spork; sw zero, 0(a5);
	call	_ZL7ResetRLPh
	lla	a5,_ZL4kook
	lw	a4,0(a5)
	li	a0,16
	sub	a0,a0,a4
	call	_Z14X6502_RunDebugi
	lla	a5,GameInfo
	lw	a2,0(a5)
	lla	a5,_ZL4kook
	lw	a4,0(a5)
	lw	a2,8(a2)
	li	a3,3
	xori	a4,a4,1
	sw	a4,0(a5)
	beq	a2,a3,.L1331
	lw	a5,48(sp)
	beq	a5,zero,.L889
	lla	a2,PPU
	lbu	a5,2(a2)
	lla	a4,GameHBIRQHook
	lw	a3,0(a4)
	ori	a5,a5,32
	la s1, SPRAM; lbu s1, 0(s1);
	sw	a4,4(sp)
	sb	a5,2(a2)
	addi	s1,s1,1
	beq	a3,zero,.L890
	li	a0,256
	call	_Z14X6502_RunDebugi
	lla	a4,scanline
	sw	s1,0(sp)
	la a5, scanline; sw zero, 0(a5);
	li	s0,239
	mv	s1,a4
	j	.L894
.L892:
	li	a0,341
	bne	a5,s0,.L893
	li	a0,85
.L893:
	call	_Z14X6502_RunDebugi
	lw	a5,0(s1)
	addi	a5,a5,1
	sw	a5,0(s1)
	bgt	a5,s0,.L1332
.L894:
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L891
	lw	a5,4(sp)
	lw	a5,0(a5)
	jalr	a5
.L891:
	lw	a5,0(s1)
	lw	a4,0(sp)
	bne	a5,a4,.L892
	lla	a4,PPU
	lbu	a3,1(a4)
	andi	a3,a3,16
	beq	a3,zero,.L892
	lbu	a3,2(a4)
	ori	a3,a3,64
	sb	a3,2(a4)
	j	.L892
.L1327:
	.cfi_restore 8
	.cfi_restore 9
	lw	ra,64(sp)
	.cfi_restore 1
	addi	sp,sp,68
	.cfi_def_cfa_offset 0
	tail	_Z14FCEUX_PPU_Loopi
.L889:
	.cfi_def_cfa_offset 68
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	a5,PPU
	lbu	a5,1(a5)
	lla	a4,DMC_7bit
	lbu	a3,0(a4)
	srli	a5,a5,5
	lla	a4,_ZL5deemp
	sb	a5,0(a4)
	lla	a4,normalscanlines
	lw	a4,0(a4)
	beq	a3,zero,.L899
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	beq	a3,zero,.L899
.L900:
	lla	a3,totalscanlines
	sw	a4,0(a3)
	la a3, scanline; sw zero, 0(a3);
	ble	a4,zero,.L1333
	lla	a4,scanline
	sw	a4,16(sp)
	lla	a4,MMC5Hack
	li	a0,0
	sw	a4,44(sp)
	j	.L1058
.L1334:
	beq	a0,a5,.L1057
	lla	a4,DMC_7bit
	lbu	a4,0(a4)
	beq	a4,zero,.L1070
	la a3, skip_7bit_overclocking; lbu a3, 0(a3);
	bne	a3,zero,.L902
.L1056:
	la a3, overclocking; sb a4, 0(a3);
	bge	a0,a5,.L902
	lla	a5,_ZL5deemp
	lbu	a5,0(a5)
.L1058:
	lla	a4,_ZL8deempcnt
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	li	a3,239
	addi	a4,a4,1
	sw	a4,0(a5)
	ble	a0,a3,.L903
	li	a0,325
	call	_Z14X6502_RunDebugi
	lw	a4,16(sp)
	li	a0,16
	lw	a5,0(a4)
	addi	a5,a5,1
	sw	a5,0(a4)
	call	_Z14X6502_RunDebugi
.L904:
	lw	a5,16(sp)
	lw	a0,0(a5)
	lla	a5,normalscanlines
	lw	a4,0(a5)
	lla	a5,totalscanlines
	lw	a5,0(a5)
	bge	a0,a4,.L1334
	li	a4,0
	j	.L1056
.L899:
	lla	a3,overclock_enabled
	lbu	a2,0(a3)
	li	a3,0
	beq	a2,zero,.L901
	la a3, postrenderscanlines; lw a3, 0(a3);
.L901:
	add	a4,a4,a3
	j	.L900
.L903:
	lla	a5,XBuf
	lw	s0,0(a5)
	lw	a5,44(sp)
	slli	a4,a0,8
	add	s0,s0,a4
	lw	a5,0(a5)
	bne	a5,zero,.L1335
.L905:
	li	a0,256
	call	_Z14X6502_RunDebugi
	li	a0,272
	call	_ZL11RefreshLinei
	lla	a5,_ZL5tofix
	lw	a5,0(a5)
	bne	a5,zero,.L1336
.L906:
	li	a0,272
	call	_ZL14CheckSpriteHiti
	la a5, _ZL8renderbg; lbu a5, 0(a5);
	la a4, _ZL5Pline; sw zero, 0(a4);
	bne	a5,zero,.L911
	la a1, gNoBGFillColor; lbu a1, 0(a1);
	li	a5,255
	beq	a1,a5,.L1337
.L912:
	li	a2,256
	ori	a1,a1,64
	mv	a0,s0
	call	memset
.L911:
	lla	a5,PPU
	lbu	a4,1(a5)
	andi	a5,a4,16
	bne	a5,zero,.L1338
.L915:
	andi	a3,a4,24
	addi	a5,s0,252
	beq	a3,zero,.L920
	andi	a3,a4,1
	beq	a3,zero,.L920
	li	a1,808464384
	mv	a4,a5
	addi	a1,a1,48
.L921:
	lw	a3,0(a4)
	mv	a2,a4
	addi	a4,a4,-4
	and	a3,a3,a1
	sw	a3,4(a4)
	bne	a2,s0,.L921
	lla	a4,PPU
	lbu	a4,1(a4)
.L920:
	srli	a3,a4,5
	li	a2,7
	beq	a3,a2,.L1339
	li	a3,31
	bleu	a4,a3,.L926
	li	a2,1077952512
	addi	a2,a2,64
.L927:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	a3,s0,.L927
.L928:
	lla	a5,PPU
	lbu	a5,1(a5)
	li	a4,256
	lla	a3,_ZL6sphitx
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s1,GameHBIRQHook
	bne	a5,zero,.L1340
.L925:
	li	a0,6
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L961
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, TempAddr; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L961:
	li	a0,63
	call	_Z14X6502_RunDebugi
	lw	a4,0(s1)
	beq	a4,zero,.L1341
	lla	s0,PPU
	lbu	a5,1(s0)
	andi	a3,a5,24
	beq	a3,zero,.L965
	lbu	a3,0(s0)
	li	a2,24
	andi	a3,a3,56
	beq	a3,a2,.L960
	jalr	a4
	lbu	a5,1(s0)
.L960:
	andi	a5,a5,16
	beq	a5,zero,.L965
	lla	s0,_ZL10numsprites
	lbu	a5,0(s0)
	la a4, _ZL5spork; sw zero, 0(a4);
	beq	a5,zero,.L965
	li	a2,256
	li	a1,128
	lla	a0,_ZL10sprlinebuf
	call	memset
	lbu	a5,0(s0)
	la a4, _ZL11SpriteBlurp; lbu a4, 0(a4);
	sw	a4,4(sp)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	slli	a3,a5,2
	lla	a4,SPRBUF
	sb	a5,0(s0)
	add	t2,a3,a4
	mv	s1,a5
	lla	ra,_ZL7ppulut2
	li	s0,-1
.L1053:
	lbu	a2,1(t2)
	lbu	a5,0(t2)
	lla	a0,_ZL7ppulut1
	slli	a4,a2,2
	slli	a3,a5,2
	add	a3,a0,a3
	add	a4,ra,a4
	or	a5,a5,a2
	lw	a0,0(a3)
	lbu	a1,3(t2)
	lw	a2,0(a4)
	lbu	a3,2(t2)
	beq	a5,zero,.L967
	slli	a4,a3,2
	or	t0,a0,a2
	andi	a0,a3,32
	andi	a4,a4,12
	lla	a2,_ZL10sprlinebuf
	sw	a0,0(sp)
	slli	a0,a5,24
	add	a2,a1,a2
	addi	a4,a4,16
	andi	a3,a3,64
	srai	a0,a0,24
	beq	s1,zero,.L1342
.L968:
	lw	a1,0(sp)
	beq	a1,zero,.L973
	bne	a3,zero,.L974
.L975:
	blt	a0,zero,.L1343
.L999:
	andi	a3,a5,64
	beq	a3,zero,.L1002
	srli	a3,t0,4
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1004
	slli	a3,a0,24
	srai	a3,a3,24
.L1004:
	ori	a3,a3,64
	sb	a3,1(a2)
.L1002:
	andi	a3,a5,32
	beq	a3,zero,.L1005
	srli	a3,t0,8
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1007
	slli	a3,a0,24
	srai	a3,a3,24
.L1007:
	ori	a3,a3,64
	sb	a3,2(a2)
.L1005:
	andi	a3,a5,16
	beq	a3,zero,.L1008
	srli	a3,t0,12
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1010
	slli	a3,a0,24
	srai	a3,a3,24
.L1010:
	ori	a3,a3,64
	sb	a3,3(a2)
.L1008:
	andi	a3,a5,8
	beq	a3,zero,.L1011
	srli	a3,t0,16
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1013
	slli	a3,a0,24
	srai	a3,a3,24
.L1013:
	ori	a3,a3,64
	sb	a3,4(a2)
.L1011:
	andi	a3,a5,4
	beq	a3,zero,.L1014
	srli	a3,t0,20
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1016
	slli	a3,a0,24
	srai	a3,a3,24
.L1016:
	ori	a3,a3,64
	sb	a3,5(a2)
.L1014:
	andi	a3,a5,2
	beq	a3,zero,.L1017
	srli	a3,t0,24
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1019
	slli	a3,a0,24
	srai	a3,a3,24
.L1019:
	ori	a3,a3,64
	sb	a3,6(a2)
.L1017:
	andi	a5,a5,1
	beq	a5,zero,.L967
	lla	a5,PPU
	srli	a3,t0,28
	or	a3,a3,a4
	lbu	a4,1(a5)
	lla	a5,PALRAM
	add	a5,a5,a3
	lbu	a3,0(a5)
	andi	a4,a4,1
	andi	a5,a3,48
	bne	a4,zero,.L1021
	slli	a5,a3,24
	srai	a5,a5,24
.L1021:
	ori	a5,a5,64
	sb	a5,7(a2)
.L967:
	addi	s1,s1,-1
	addi	t2,t2,-4
	bne	s1,s0,.L1053
	la a5, _ZL11SpriteBlurp; sb zero, 0(a5);
	li	a5,1
	la a4, _ZL5spork; sw a5, 0(a4);
.L965:
	la a4, GameHBIRQHook2; lw a4, 0(a4);
	beq	a4,zero,.L1054
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L1054
	jalr	a4
.L1054:
	lw	a3,16(sp)
	li	a4,239
	lw	a5,0(a3)
	addi	a5,a5,1
	sw	a5,0(a3)
	ble	a5,a4,.L1344
.L1055:
	li	a0,16
	call	_Z14X6502_RunDebugi
	j	.L904
.L1342:
	lw	t1,4(sp)
	beq	t1,zero,.L968
	lla	t1,PPU
	lbu	t1,2(t1)
	andi	t1,t1,64
	bne	t1,zero,.L968
	lla	t1,_ZL6sphitx
	sw	a1,0(t1)
	lla	t1,_ZL9sphitdata
	sb	a5,0(t1)
	beq	a3,zero,.L969
	srli	a3,a5,1
	andi	a3,a3,8
	mv	t1,a3
	slli	a3,a0,5
	andi	a3,a3,64
	srli	a1,a5,3
	sw	a3,12(sp)
	andi	a1,a1,4
	or	a1,t1,a1
	lw	t1,12(sp)
	slli	a3,a0,3
	sw	a1,8(sp)
	andi	a3,a3,32
	or	a3,t1,a3
	lw	t1,8(sp)
	srli	a1,a5,7
	sw	a3,12(sp)
	or	a1,t1,a1
	srli	t1,a5,5
	andi	t1,t1,2
	sw	t1,8(sp)
	lw	t1,12(sp)
	slli	a3,a0,7
	or	a3,t1,a3
	slli	t1,a0,1
	andi	t1,t1,16
	sw	t1,12(sp)
	lw	t1,8(sp)
	or	a1,a1,t1
	lw	t1,12(sp)
	or	a3,a3,t1
	or	a1,a1,a3
	lw	a3,0(sp)
	lla	t1,_ZL9sphitdata
	sb	a1,0(t1)
	beq	a3,zero,.L970
.L974:
	blt	a0,zero,.L1345
.L972:
	andi	a3,a5,64
	beq	a3,zero,.L978
	srli	a3,t0,4
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L980
	slli	a3,a0,24
	srai	a3,a3,24
.L980:
	ori	a3,a3,64
	sb	a3,6(a2)
.L978:
	andi	a3,a5,32
	beq	a3,zero,.L981
	srli	a3,t0,8
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L983
	slli	a3,a0,24
	srai	a3,a3,24
.L983:
	ori	a3,a3,64
	sb	a3,5(a2)
.L981:
	andi	a3,a5,16
	beq	a3,zero,.L984
	srli	a3,t0,12
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L986
	slli	a3,a0,24
	srai	a3,a3,24
.L986:
	ori	a3,a3,64
	sb	a3,4(a2)
.L984:
	andi	a3,a5,8
	beq	a3,zero,.L987
	srli	a3,t0,16
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L989
	slli	a3,a0,24
	srai	a3,a3,24
.L989:
	ori	a3,a3,64
	sb	a3,3(a2)
.L987:
	andi	a3,a5,4
	beq	a3,zero,.L990
	srli	a3,t0,20
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L992
	slli	a3,a0,24
	srai	a3,a3,24
.L992:
	ori	a3,a3,64
	sb	a3,2(a2)
.L990:
	andi	a3,a5,2
	beq	a3,zero,.L993
	srli	a3,t0,24
	andi	a3,a3,3
	lla	a0,PALRAM
	or	a3,a3,a4
	lla	a1,PPU
	add	a3,a0,a3
	lbu	a1,1(a1)
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L995
	slli	a3,a0,24
	srai	a3,a3,24
.L995:
	ori	a3,a3,64
	sb	a3,1(a2)
.L993:
	andi	a5,a5,1
	beq	a5,zero,.L967
	lla	a5,PPU
	srli	a3,t0,28
	or	a3,a3,a4
	lbu	a4,1(a5)
	lla	a5,PALRAM
	add	a5,a5,a3
	lbu	a3,0(a5)
	andi	a4,a4,1
	andi	a5,a3,48
	bne	a4,zero,.L998
	slli	a5,a3,24
	srai	a5,a5,24
.L998:
	ori	a5,a5,64
	sb	a5,0(a2)
	j	.L967
.L1339:
	li	a2,-1061109760
	addi	a2,a2,192
.L923:
	lw	a4,0(a5)
	mv	a3,a5
	addi	a5,a5,-4
	or	a4,a4,a2
	sw	a4,4(a5)
	bne	a3,s0,.L923
	lla	a5,PPU
	lbu	a5,1(a5)
	li	a4,256
	lla	a3,_ZL6sphitx
	sw	a4,0(a3)
	andi	a5,a5,24
	lla	s1,GameHBIRQHook
	beq	a5,zero,.L925
.L1340:
	lla	a5,PPU
	lbu	a5,0(a5)
	lw	a1,16(sp)
	lla	t2,PPU_hook
	xori	a4,a5,252
	srli	a4,a4,2
	and	a4,a5,a4
	lw	ra,0(a1)
	srli	a2,a5,1
	slli	a4,a4,9
	li	a1,4096
	and	a4,a4,a1
	andi	a2,a2,16
	lw	a3,0(t2)
	srli	t1,a5,2
	sw	a4,0(sp)
	addi	a4,a2,7
	andi	t1,t1,8
	sw	a4,36(sp)
	addi	t1,t1,8
	beq	a3,zero,.L1346
	sw	t1,4(sp)
	sw	t2,12(sp)
	lw	t1,16(sp)
	lw	t2,44(sp)
	sw	zero,40(sp)
	li	a3,63
	li	s0,0
	lla	s1,SPRAM
	lla	t0,_ZL10maxsprites
	j	.L930
.L1349:
	lla	a1,MMC5SPRVPage
	add	a1,a1,a5
	lw	a5,0(a1)
	add	a5,a5,a4
.L952:
	lbu	a0,0(a5)
	sw	a4,8(sp)
	li	a1,7
	sb	a0,52(sp)
	bgtu	s0,a1,.L953
	sw	a5,20(sp)
	lw	a5,12(sp)
	li	a0,8192
	sw	t1,32(sp)
	lw	a2,0(a5)
	sw	t2,28(sp)
	sw	a3,24(sp)
	jalr	a2
	lw	a5,12(sp)
	lw	a4,8(sp)
	lw	a2,0(a5)
	mv	a0,a4
	jalr	a2
	lbu	a2,2(s1)
	lw	t1,32(sp)
	lw	t2,28(sp)
	lw	a3,24(sp)
	lw	a5,20(sp)
	lla	t0,_ZL10maxsprites
.L953:
	lbu	a4,8(a5)
	lbu	a5,3(s1)
	sb	a2,54(sp)
	sb	a4,53(sp)
	sb	a5,55(sp)
	lla	a4,SPRBUF
	slli	a5,s0,2
	add	a5,a5,a4
	lw	a4,52(sp)
	addi	s0,s0,1
	andi	s0,s0,0xff
	sw	a4,0(a5)
.L944:
	addi	s1,s1,4
	lla	a5,SPRAM+256
	addi	a3,a3,-1
	beq	s1,a5,.L1347
.L930:
	lbu	a4,0(s1)
	lw	a5,0(t1)
	sub	a5,a5,a4
	lw	a4,4(sp)
	bgeu	a5,a4,.L944
	lw	a4,0(t0)
	bge	s0,a4,.L945
	li	a4,63
	beq	a3,a4,.L1348
.L946:
	lla	a2,PPU
	lbu	a0,0(a2)
	lbu	a4,1(s1)
	lw	a1,0(sp)
	andi	a0,a0,32
	slli	a2,a4,4
	add	a1,a1,a2
	beq	a0,zero,.L948
	li	a1,4096
	addi	a1,a1,-32
	slli	a4,a4,12
	li	a0,4096
	and	a4,a4,a0
	and	a2,a2,a1
	or	a1,a4,a2
.L948:
	lbu	a2,2(s1)
	andi	a0,a5,8
	add	a4,a5,a0
	slli	ra,a2,24
	srai	ra,ra,24
	add	a4,a4,a1
	bge	ra,zero,.L950
	lw	a4,36(sp)
	sub	a5,a4,a5
	sub	a5,a5,a0
	add	a4,a5,a1
.L950:
	lw	a1,0(t2)
	srli	a5,a4,10
	slli	a5,a5,2
	bne	a1,zero,.L1349
	lla	a1,VPage
	add	a1,a1,a5
	lw	a5,0(a1)
	add	a5,a5,a4
	j	.L952
.L1344:
	lla	a4,XBuf
	lw	a0,0(a4)
	slli	a5,a5,8
	add	a0,a0,a5
	call	_ZL7ResetRLPh
	j	.L1055
.L926:
	li	a1,1061109760
	li	a2,-2139062272
	mv	a4,a5
	addi	a1,a1,-193
	addi	a2,a2,128
.L929:
	lw	a5,0(a4)
	mv	a3,a4
	addi	a4,a4,-4
	and	a5,a5,a1
	or	a5,a5,a2
	sw	a5,4(a4)
	bne	a3,s0,.L929
	j	.L928
.L1348:
	li	a4,1
	sw	a4,40(sp)
	j	.L946
.L1338:
	la a5, _ZL5spork; lw a5, 0(a5);
	beq	a5,zero,.L915
	la a5, _ZL5spork; sw zero, 0(a5);
	la a5, _ZL13rendersprites; lbu a5, 0(a5);
	beq	a5,zero,.L915
	lla	a5,_ZL10sprlinebuf
	mv	a3,s0
	lla	a1,_ZL10sprlinebuf+256
.L919:
	lbu	a4,0(a5)
	slli	a2,a4,24
	srai	a2,a2,24
	blt	a2,zero,.L917
	andi	a2,a4,64
	beq	a2,zero,.L918
	lbu	a2,0(a3)
	andi	a2,a2,64
	beq	a2,zero,.L917
.L918:
	sb	a4,0(a3)
.L917:
	addi	a5,a5,1
	addi	a3,a3,1
	bne	a1,a5,.L919
	lla	a5,PPU
	lbu	a4,1(a5)
	j	.L915
.L1336:
	lla	a5,PPU
	lbu	a5,1(a5)
	andi	a5,a5,24
	beq	a5,zero,.L906
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a2,28672
	li	a5,4096
	and	a1,a4,a2
	add	a5,a4,a5
	beq	a1,a2,.L1350
.L909:
	sw	a5,0(a3)
	j	.L906
.L1350:
	andi	a2,a4,992
	li	a0,928
	xor	a5,a4,a1
	beq	a2,a0,.L1351
	li	a1,992
	addi	a5,a5,32
	bne	a2,a1,.L909
	li	a5,28672
	addi	a5,a5,992
	xor	a5,a4,a5
	sw	a5,0(a3)
	j	.L906
.L1335:
	call	_Z7MMC5_hbi
	j	.L905
.L973:
	beq	a3,zero,.L1022
.L970:
	blt	a0,zero,.L1352
.L1023:
	andi	a3,a5,64
	beq	a3,zero,.L1025
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,4
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1026
	andi	a3,a3,48
.L1026:
	sb	a3,6(a2)
.L1025:
	andi	a3,a5,32
	beq	a3,zero,.L1027
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,8
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1028
	andi	a3,a3,48
.L1028:
	sb	a3,5(a2)
.L1027:
	andi	a3,a5,16
	beq	a3,zero,.L1029
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,12
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1030
	andi	a3,a3,48
.L1030:
	sb	a3,4(a2)
.L1029:
	andi	a3,a5,8
	beq	a3,zero,.L1031
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,16
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1032
	andi	a3,a3,48
.L1032:
	sb	a3,3(a2)
.L1031:
	andi	a3,a5,4
	beq	a3,zero,.L1033
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,20
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1034
	andi	a3,a3,48
.L1034:
	sb	a3,2(a2)
.L1033:
	andi	a3,a5,2
	beq	a3,zero,.L1035
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,24
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1036
	andi	a3,a3,48
.L1036:
	sb	a3,1(a2)
.L1035:
	andi	a5,a5,1
	beq	a5,zero,.L967
	lla	a5,PPU
	lbu	a5,1(a5)
	srli	a3,t0,28
	or	a3,a3,a4
	lla	a4,PALRAM
	add	a4,a4,a3
	andi	a5,a5,1
	lbu	a4,0(a4)
	beq	a5,zero,.L1037
	andi	a4,a4,48
.L1037:
	sb	a4,0(a2)
	j	.L967
.L969:
	lw	a3,0(sp)
	bne	a3,zero,.L975
.L1022:
	blt	a0,zero,.L1353
.L1038:
	andi	a3,a5,64
	beq	a3,zero,.L1040
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,4
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1041
	andi	a3,a3,48
.L1041:
	sb	a3,1(a2)
.L1040:
	andi	a3,a5,32
	beq	a3,zero,.L1042
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,8
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1043
	andi	a3,a3,48
.L1043:
	sb	a3,2(a2)
.L1042:
	andi	a3,a5,16
	beq	a3,zero,.L1044
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,12
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1045
	andi	a3,a3,48
.L1045:
	sb	a3,3(a2)
.L1044:
	andi	a3,a5,8
	beq	a3,zero,.L1046
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,16
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1047
	andi	a3,a3,48
.L1047:
	sb	a3,4(a2)
.L1046:
	andi	a3,a5,4
	beq	a3,zero,.L1048
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,20
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1049
	andi	a3,a3,48
.L1049:
	sb	a3,5(a2)
.L1048:
	andi	a3,a5,2
	beq	a3,zero,.L1050
	lla	a3,PPU
	lbu	a1,1(a3)
	srli	a3,t0,24
	andi	a3,a3,3
	or	a3,a3,a4
	lla	a0,PALRAM
	add	a3,a0,a3
	andi	a1,a1,1
	lbu	a3,0(a3)
	beq	a1,zero,.L1051
	andi	a3,a3,48
.L1051:
	sb	a3,6(a2)
.L1050:
	andi	a5,a5,1
	beq	a5,zero,.L967
	lla	a5,PPU
	lbu	a5,1(a5)
	srli	a3,t0,28
	or	a3,a3,a4
	lla	a4,PALRAM
	add	a4,a4,a3
	andi	a5,a5,1
	lbu	a4,0(a4)
	beq	a5,zero,.L1052
	andi	a4,a4,48
.L1052:
	sb	a4,7(a2)
	j	.L967
.L1341:
	lla	a5,PPU
	lbu	a5,1(a5)
	j	.L960
.L1070:
	li	a4,1
	j	.L1056
.L1337:
	lla	a5,PPU
	lbu	a5,1(a5)
	la a1, PALRAM; lbu a1, 0(a1);
	andi	a5,a5,1
	beq	a5,zero,.L912
	andi	a1,a1,48
	j	.L912
.L945:
	lla	a4,PPU
	lbu	a5,2(a4)
	lw	t2,12(sp)
	ori	a5,a5,32
	sb	a5,2(a4)
.L954:
	li	a3,8
	bgtu	s0,a3,.L1062
	lw	a5,0(t2)
	beq	a5,zero,.L941
	sub	a4,a3,s0
	beq	a3,s0,.L1068
	sw	s0,8(sp)
	li	s1,0
	sw	a4,4(sp)
	mv	s0,t2
	j	.L958
.L1354:
	lw	a5,0(s0)
.L958:
	li	a0,8192
	jalr	a5
	lw	a5,0(s0)
	lw	a0,0(sp)
	addi	s1,s1,1
	jalr	a5
	lw	a5,4(sp)
	bne	s1,a5,.L1354
	lw	s0,8(sp)
.L941:
	lw	a3,40(sp)
	lla	s1,GameHBIRQHook
	lw	a5,0(s1)
	la a4, _ZL10numsprites; sb s0, 0(a4);
	la a4, _ZL11SpriteBlurp; sb a3, 0(a4);
	beq	a5,zero,.L925
	lla	s0,PPU
	lbu	a5,1(s0)
	andi	a5,a5,24
	beq	a5,zero,.L925
	lbu	a5,0(s0)
	li	a4,24
	andi	a5,a5,56
	beq	a5,a4,.L925
	li	a0,6
	call	_Z14X6502_RunDebugi
	lbu	a5,1(s0)
	andi	a5,a5,24
	beq	a5,zero,.L959
	lla	a3,RefreshAddr
	lw	a4,0(a3)
	li	a5,65536
	addi	a5,a5,-1056
	and	a4,a4,a5
	la a5, TempAddr; lw a5, 0(a5);
	andi	a5,a5,1055
	or	a5,a5,a4
	sw	a5,0(a3)
.L959:
	li	a0,4
	call	_Z14X6502_RunDebugi
	lw	a5,0(s1)
	jalr	a5
	li	a0,59
	call	_Z14X6502_RunDebugi
	lla	a5,PPU
	lbu	a5,1(a5)
	j	.L960
.L1355:
	li	a5,8
	bleu	s0,a5,.L941
.L1062:
	lla	a5,PPU
	lbu	a5,2(a5)
	ori	a5,a5,32
.L940:
	lla	a4,PPU
	sb	a5,2(a4)
	j	.L941
.L1346:
	lw	a4,44(sp)
	andi	a5,a5,32
	sw	a5,8(sp)
	lw	a4,0(a4)
	li	a5,16777216
	addi	a5,a5,-1
	sw	a4,4(sp)
	la s1, _ZL10maxsprites; lw s1, 0(s1);
	sw	zero,40(sp)
	li	a1,63
	li	s0,0
	lla	a3,SPRAM
	sw	a5,12(sp)
	j	.L942
.L1357:
	lla	a0,MMC5SPRVPage
	add	a0,a0,a4
	lw	a4,0(a0)
	add	a2,a4,a2
.L939:
	lbu	a4,8(a2)
	lbu	a0,0(a2)
	lbu	a2,3(a3)
	slli	a4,a4,8
	or	a4,a0,a4
	lw	a0,12(sp)
	slli	a5,a5,16
	or	a5,a4,a5
	and	a5,a5,a0
	slli	a4,s0,2
	slli	a2,a2,24
	lla	a0,SPRBUF
	add	a4,a4,a0
	or	a5,a5,a2
	addi	s0,s0,1
	sw	a5,0(a4)
	andi	s0,s0,0xff
.L931:
	addi	a3,a3,4
	lla	a5,SPRAM+256
	addi	a1,a1,-1
	beq	a3,a5,.L1355
.L942:
	lbu	a4,0(a3)
	sub	a4,ra,a4
	bgeu	a4,t1,.L931
	bge	s0,s1,.L932
	li	a5,63
	beq	a1,a5,.L1356
.L933:
	lbu	a5,1(a3)
	lw	a0,0(sp)
	lw	t0,8(sp)
	slli	a2,a5,4
	add	a0,a0,a2
	beq	t0,zero,.L935
	li	a0,4096
	addi	a0,a0,-32
	slli	a5,a5,12
	li	t0,4096
	and	a5,a5,t0
	and	a2,a2,a0
	or	a0,a5,a2
.L935:
	lbu	a5,2(a3)
	andi	t0,a4,8
	add	a2,a4,t0
	slli	t2,a5,24
	srai	t2,t2,24
	add	a2,a2,a0
	bge	t2,zero,.L937
	lw	a2,36(sp)
	sub	a4,a2,a4
	sub	a4,a4,t0
	add	a2,a4,a0
.L937:
	lw	a0,4(sp)
	srli	a4,a2,10
	slli	a4,a4,2
	bne	a0,zero,.L1357
	lla	a0,VPage
	add	a0,a0,a4
	lw	a4,0(a0)
	add	a2,a4,a2
	j	.L939
.L1356:
	li	a5,1
	sw	a5,40(sp)
	j	.L933
.L1057:
	la a5, overclocking; sb zero, 0(a5);
.L902:
	lw	a5,44(sp)
	la a4, DMC_7bit; sb zero, 0(a4);
	lw	a5,0(a5)
	bne	a5,zero,.L1358
.L1059:
	lw	a0,48(sp)
	lla	a5,_ZL8deempcnt
	li	a2,0
	li	a4,1
	li	a1,7
.L1061:
	lw	a3,4(a5)
	ble	a3,a2,.L1060
	mv	a2,a3
	mv	a0,a4
.L1060:
	sw	zero,4(a5)
	addi	a4,a4,1
	addi	a5,a5,4
	bne	a4,a1,.L1061
	andi	a0,a0,0xff
	li	a1,0
	call	_Z21SetNESDeemph_OldHackyhi
	call	_Z7ShowFPSv
	lw	ra,64(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,60(sp)
	.cfi_restore 8
	li	a5,1
	sw	a5,0(sp)
	lw	a0,0(sp)
	lw	s1,56(sp)
	.cfi_restore 9
	addi	sp,sp,68
	.cfi_def_cfa_offset 0
	jr	ra
.L932:
	.cfi_restore_state
	lla	a3,PPU
	lbu	a5,2(a3)
	li	a4,8
	ori	a5,a5,32
	sb	a5,2(a3)
	bleu	s0,a4,.L941
	j	.L940
.L1343:
	lla	a3,PPU
	andi	a0,t0,3
	lbu	a1,1(a3)
	or	a0,a0,a4
	lla	a3,PALRAM
	add	a3,a3,a0
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L1001
	slli	a3,a0,24
	srai	a3,a3,24
.L1001:
	ori	a3,a3,64
	sb	a3,0(a2)
	j	.L999
.L1345:
	lla	a3,PPU
	andi	a0,t0,3
	lbu	a1,1(a3)
	or	a0,a0,a4
	lla	a3,PALRAM
	add	a3,a3,a0
	lbu	a0,0(a3)
	andi	a1,a1,1
	andi	a3,a0,48
	bne	a1,zero,.L977
	slli	a3,a0,24
	srai	a3,a3,24
.L977:
	ori	a3,a3,64
	sb	a3,7(a2)
	j	.L972
.L1352:
	lla	a3,PPU
	lbu	a3,1(a3)
	andi	a0,t0,3
	or	a0,a0,a4
	lla	a1,PALRAM
	add	a1,a1,a0
	andi	a3,a3,1
	lbu	a1,0(a1)
	beq	a3,zero,.L1024
	andi	a1,a1,48
.L1024:
	sb	a1,7(a2)
	j	.L1023
.L1353:
	lla	a3,PPU
	lbu	a3,1(a3)
	andi	a0,t0,3
	or	a0,a0,a4
	lla	a1,PALRAM
	add	a1,a1,a0
	andi	a3,a3,1
	lbu	a1,0(a1)
	beq	a3,zero,.L1039
	andi	a1,a1,48
.L1039:
	sb	a1,0(a2)
	j	.L1038
.L1347:
	lw	t2,12(sp)
	j	.L954
.L1329:
	call	_Z10TriggerNMIv
	j	.L876
.L1331:
	la a0, normalscanlines; lw a0, 0(a0);
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	lw	s0,60(sp)
	.cfi_remember_state
	.cfi_restore 8
	j	.L874
.L890:
	.cfi_restore_state
	li	a5,239
	bgt	s1,a5,.L895
	slli	a5,s1,2
	add	a5,a5,s1
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a0,a5,2
	add	a0,a0,s1
	call	_Z14X6502_RunDebugi
	lla	a4,PPU
	lbu	a5,1(a4)
	andi	a5,a5,16
	beq	a5,zero,.L896
	lbu	a5,2(a4)
	ori	a5,a5,64
	sb	a5,2(a4)
.L896:
	li	a0,240
	sub	a0,a0,s1
	slli	a5,a0,2
	add	a5,a5,a0
	slli	a4,a5,4
	add	a5,a5,a4
	slli	a5,a5,2
	add	a0,a5,a0
	call	_Z14X6502_RunDebugi
	call	_Z7ShowFPSv
	lw	s0,60(sp)
	.cfi_remember_state
	.cfi_restore 8
	j	.L871
.L1332:
	.cfi_restore_state
	lw	s0,60(sp)
	.cfi_remember_state
	.cfi_restore 8
	j	.L874
.L895:
	.cfi_restore_state
	li	a0,81920
	addi	a0,a0,-80
	call	_Z14X6502_RunDebugi
	call	_Z7ShowFPSv
	lw	s0,60(sp)
	.cfi_remember_state
	.cfi_restore 8
	j	.L871
.L1358:
	.cfi_restore_state
	la a0, scanline; lw a0, 0(a0);
	call	_Z7MMC5_hbi
	j	.L1059
.L1351:
	li	a5,32768
	addi	a5,a5,-1120
	xor	a5,a4,a5
	sw	a5,0(a3)
	j	.L906
.L1068:
	li	s0,8
	j	.L941
.L1333:
	lla	a5,MMC5Hack
	sw	a5,44(sp)
	j	.L902
.L1328:
	li	a2,1680
	lla	a1,.LC0
	lla	a0,.LC1
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
	addi	sp,sp,-4
	.cfi_def_cfa_offset 4
	sw	s0,0(sp)
	.cfi_offset 8, -4
	li	a5,-32768
	lla	s0,bitrevlut
	sh	a5,0(s0)
	li	t0,7
	li	a2,2
	li	t2,128
	li	t1,1
.L1362:
	slli	t1,t1,1
	srai	t2,t2,1
	ble	t1,zero,.L1360
	andi	a0,t2,0xff
	lla	a5,bitrevlut
	add	a1,s0,t1
.L1361:
	lbu	a4,0(a5)
	add	a3,a5,a2
	addi	a5,a5,1
	add	a4,a0,a4
	sb	a4,0(a3)
	bne	a1,a5,.L1361
	add	a2,a2,t1
.L1360:
	addi	t0,t0,-1
	bne	t0,zero,.L1362
	lw	s0,0(sp)
	.cfi_restore 8
	addi	sp,sp,4
	.cfi_def_cfa_offset 0
	jr	ra
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
