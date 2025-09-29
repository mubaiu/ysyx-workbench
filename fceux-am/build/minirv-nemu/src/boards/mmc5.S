#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc5.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL13mmc5_PPUWritejh,"ax",@progbits
	.align	2
	.type	_ZL13mmc5_PPUWritejh, @function
_ZL13mmc5_PPUWritejh:
.LFB15:
	.cfi_startproc
	li	a5,16384
	addi	a5,a5,-257
	bleu	a0,a5,.L2
	andi	a5,a0,3
	andi	a1,a1,63
	bne	a5,zero,.L3
	andi	a5,a0,12
	bne	a5,zero,.L4
	lla	a5,PALRAM
	sb	a1,12(a5)
	sb	a1,8(a5)
	sb	a1,4(a5)
	sb	a1,0(a5)
	sb	a1,28(a5)
	sb	a1,24(a5)
	sb	a1,20(a5)
	sb	a1,16(a5)
	ret
.L2:
	li	a4,8192
	srli	a5,a0,10
	bgeu	a0,a4,.L6
	la a4, PPUCHRRAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L1
	slli	a5,a5,2
	lla	a4,VPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
.L6:
	andi	a5,a5,3
	la a4, PPUNTARAM; lbu a4, 0(a4);
	sra	a4,a4,a5
	andi	a4,a4,1
	beq	a4,zero,.L1
	slli	a5,a5,2
	lla	a4,vnapage
	add	a5,a4,a5
	lw	a5,0(a5)
	andi	a0,a0,1023
	add	a5,a5,a0
	sb	a1,0(a5)
.L1:
	ret
.L3:
	andi	a0,a0,31
	lla	a5,PALRAM
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
.L4:
	srli	a0,a0,2
	andi	a0,a0,3
	lla	a5,UPALRAM
	add	a5,a5,a0
	sb	a1,-1(a5)
	ret
	.cfi_endproc
.LFE15:
	.size	_ZL13mmc5_PPUWritejh, .-_ZL13mmc5_PPUWritejh
	.section	.text._ZL12MMC5_ExRAMRdj,"ax",@progbits
	.align	2
	.type	_ZL12MMC5_ExRAMRdj, @function
_ZL12MMC5_ExRAMRdj:
.LFB27:
	.cfi_startproc
	andi	a0,a0,1023
	la a5, _ZL5ExRAM; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE27:
	.size	_ZL12MMC5_ExRAMRdj, .-_ZL12MMC5_ExRAMRdj
	.section	.text._ZL10Mapper5_SWjh,"ax",@progbits
	.align	2
	.type	_ZL10Mapper5_SWjh, @function
_ZL10Mapper5_SWjh:
.LFB34:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	lla	a5,GameExpSound
	sw	ra,12(sp)
	lla	a4,_Z12MMC5RunSoundi
	sw	a4,0(a5)
	lla	a4,_Z14MMC5RunSoundHQv
	sw	a4,8(a5)
	andi	a5,a0,24
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	mv	s1,a1
	andi	a0,a0,31
	bne	a5,zero,.L16
	li	a4,1
	sll	a5,a4,a0
	andi	a3,a5,136
	bne	a3,zero,.L17
	andi	a4,a5,68
	bne	a4,zero,.L18
	andi	a5,a5,17
	beq	a5,zero,.L15
	sw	s0,8(sp)
	la a5, _ZL4sfun; lw a5, 0(a5);
	.cfi_offset 8, -8
	srli	s0,a0,2
	beq	a5,zero,.L25
	mv	a0,s0
	jalr	a5
.L25:
	lla	a5,_ZL9MMC5Sound
	add	a5,a5,s0
	sb	s1,4(a5)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L16:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	li	a5,17
	beq	a0,a5,.L21
	li	a5,21
	beq	a0,a5,.L22
	li	a5,16
	bne	a0,a5,.L15
	la a5, _ZL5psfun; lw a5, 0(a5);
	beq	a5,zero,.L23
	jalr	a5
.L23:
	la a5, _ZL9MMC5Sound+9; sb s1, 0(a5);
.L15:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L22:
	.cfi_restore_state
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL4sfun
	lw	a5,0(s0)
	beq	a5,zero,.L27
	li	a0,0
	jalr	a5
	lw	a5,0(s0)
	li	a0,1
	jalr	a5
.L27:
	lla	a4,_ZL9MMC5Sound
	lbu	a5,7(a4)
	and	a5,s1,a5
	slli	a5,a5,8
	or	a1,s1,a5
	sh	a1,6(a4)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L17:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	lla	a2,_ZL9MMC5Sound
	srli	a0,a0,2
	lbu	a6,7(a2)
	slli	a3,a0,1
	add	a3,a2,a3
	lhu	a5,0(a3)
	sll	a4,a4,a0
	or	a4,a6,a4
	sb	a4,7(a2)
	slli	a1,a1,8
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a5,a5,-1793
	andi	a1,a1,1792
	or	a5,a5,a1
	sh	a5,0(a3)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	.cfi_restore_state
	sw	s0,8(sp)
	.cfi_offset 8, -8
	la a5, _ZL4sfun; lw a5, 0(a5);
	srli	s0,a0,2
	beq	a5,zero,.L26
	mv	a0,s0
	jalr	a5
.L26:
	lw	ra,12(sp)
	.cfi_restore 1
	slli	a0,s0,1
	lla	a5,_ZL9MMC5Sound
	lw	s0,8(sp)
	.cfi_restore 8
	add	a5,a5,a0
	sb	s1,0(a5)
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L21:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	la a5, _ZL5psfun; lw a5, 0(a5);
	beq	a5,zero,.L24
	jalr	a5
.L24:
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL9MMC5Sound+8; sb s1, 0(a5);
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE34:
	.size	_ZL10Mapper5_SWjh, .-_ZL10Mapper5_SWjh
	.section	.text._ZL5Do5SQi,"ax",@progbits
	.align	2
	.type	_ZL5Do5SQi, @function
_ZL5Do5SQi:
.LFB35:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE35:
	.size	_ZL5Do5SQi, .-_ZL5Do5SQi
	.section	.text._Z14MMC5RunSoundHQv,"ax",@progbits
	.align	2
	.globl	_Z14MMC5RunSoundHQv
	.hidden	_Z14MMC5RunSoundHQv
	.type	_Z14MMC5RunSoundHQv, @function
_Z14MMC5RunSoundHQv:
.LFB37:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE37:
	.size	_Z14MMC5RunSoundHQv, .-_Z14MMC5RunSoundHQv
	.section	.text._Z12MMC5RunSoundi,"ax",@progbits
	.align	2
	.globl	_Z12MMC5RunSoundi
	.hidden	_Z12MMC5RunSoundi
	.type	_Z12MMC5RunSoundi, @function
_Z12MMC5RunSoundi:
.LFB39:
	.cfi_startproc
	lla	a5,_ZL9MMC5Sound
	sw	a0,20(a5)
	sw	a0,24(a5)
	sw	a0,28(a5)
	ret
	.cfi_endproc
.LFE39:
	.size	_Z12MMC5RunSoundi, .-_Z12MMC5RunSoundi
	.section	.text._Z12mmc5_PPUReadj,"ax",@progbits
	.align	2
	.globl	_Z12mmc5_PPUReadj
	.hidden	_Z12mmc5_PPUReadj
	.type	_Z12mmc5_PPUReadj, @function
_Z12mmc5_PPUReadj:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, newppu; lw a5, 0(a5);
	mv	s0,a0
	beq	a5,zero,.L51
	la a5, MMC5HackSPMode; lbu a5, 0(a5);
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L89
.L51:
	li	a5,8192
	bgeu	s0,a5,.L90
.L73:
	li	a2,0
.L49:
	lla	a4,PPU
	lbu	a5,0(a4)
	la a3, ppuphase; lw a3, 0(a3);
	andi	a5,a5,32
	beq	a5,zero,.L58
	lbu	a5,1(a4)
	li	a4,2
	andi	a5,a5,24
	beq	a3,a4,.L91
	li	a4,1
	bne	a3,a4,.L60
	beq	a5,zero,.L60
	bne	a2,zero,.L92
	la a5, MMC5HackCHRMode; lbu a5, 0(a5);
	beq	a5,a3,.L87
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,MMC5BGVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L90:
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
.L55:
	li	a5,1
	andi	a3,s0,1023
	bne	a4,a5,.L68
	li	a5,959
	bleu	a3,a5,.L68
	la a4, NTRefreshAddr; lw a4, 0(a4);
	andi	a4,a4,1023
	la a5, _ZL5ExRAM; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	srli	a0,a0,6
	slli	a5,a0,2
	add	a0,a0,a5
	slli	a5,a0,4
	add	a0,a0,a5
	andi	a0,a0,0xff
	j	.L61
.L89:
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
	andi	a3,a4,2
	bne	a3,zero,.L52
	andi	a2,a5,64
	la a3, NTRefreshAddr; lw a3, 0(a3);
	andi	a5,a5,31
	andi	a3,a3,31
	bne	a2,zero,.L53
	ble	a5,a3,.L88
.L54:
	li	a5,8192
	bltu	s0,a5,.L72
	call	_Z19newppu_get_scanlinev
	addi	a0,a0,-1
	srai	a5,a0,31
	andi	a5,a5,7
	add	a5,a5,a0
	srai	a5,a5,3
	la a2, MMC5HackSPScroll; lbu a2, 0(a2);
	andi	a4,s0,1023
	li	a3,959
	add	a5,a5,a2
	bleu	a4,a3,.L67
	slli	a5,a5,1
	andi	a5,a5,56
	andi	s0,s0,967
	or	s0,s0,a5
	la a5, _ZL5ExRAM; lw a5, 0(a5);
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L52:
	li	a5,8192
	bltu	a0,a5,.L73
	andi	a3,a0,1023
.L68:
	srli	s0,s0,8
	andi	s0,s0,12
	lla	a5,vnapage
	add	a5,a5,s0
	lw	a5,0(a5)
	add	a5,a5,a3
	lbu	a0,0(a5)
.L61:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L58:
	.cfi_restore_state
	li	a5,1
	bne	a3,a5,.L65
	lbu	a5,1(a4)
	andi	a5,a5,8
	beq	a5,zero,.L65
	bne	a2,zero,.L93
	la a5, MMC5HackCHRMode; lbu a5, 0(a5);
	beq	a5,a3,.L87
.L65:
	srli	a4,s0,10
	slli	a4,a4,2
	lla	a5,MMC5SPRVPage
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
.L91:
	.cfi_restore_state
	bne	a5,zero,.L65
.L60:
	srli	a5,s0,10
	la a4, mmc5ABMode; lbu a4, 0(a4);
	slli	a5,a5,2
	bne	a4,zero,.L64
	lla	a4,MMC5SPRVPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L53:
	ble	a5,a3,.L54
.L88:
	li	a5,8192
	bltu	s0,a5,.L73
	j	.L55
.L64:
	lla	a4,MMC5BGVPage
	add	a5,a4,a5
	lw	a5,0(a5)
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L67:
	slli	a5,a5,5
	andi	a5,a5,992
	andi	s0,s0,31
	or	s0,s0,a5
	la a5, _ZL5ExRAM; lw a5, 0(a5);
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L72:
	li	a2,1
	j	.L49
.L87:
	la a1, NTRefreshAddr; lw a1, 0(a1);
	mv	a0,s0
	call	_Z14FCEUPPU_GetCHRjj
	lbu	a0,0(a0)
	j	.L61
.L93:
	la a4, MMC5HackSPPage; lbu a4, 0(a4);
	slli	s0,s0,20
	slli	a4,a4,12
	la a5, MMC5HackVROMPTR; lw a5, 0(a5);
	srli	s0,s0,20
	add	a5,a5,a4
	add	a5,a5,s0
	lbu	a0,0(a5)
	j	.L61
.L92:
	la a3, MMC5HackSPPage; lbu a3, 0(a3);
	slli	a4,s0,20
	slli	a3,a3,12
	la a5, MMC5HackVROMPTR; lw a5, 0(a5);
	srli	a4,a4,20
	add	a5,a5,a3
	add	a5,a5,a4
	lbu	a0,0(a5)
	j	.L61
	.cfi_endproc
.LFE16:
	.size	_Z12mmc5_PPUReadj, .-_Z12mmc5_PPUReadj
	.section	.text._Z11Mapper5_ESIv,"ax",@progbits
	.align	2
	.globl	_Z11Mapper5_ESIv
	.hidden	_Z11Mapper5_ESIv
	.type	_Z11Mapper5_ESIv, @function
_Z11Mapper5_ESIv:
.LFB40:
	.cfi_startproc
	lla	a5,FSettings
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lw	a4,60(a5)
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,GameExpSound
	lla	a3,_Z11Mapper5_ESIv
	sw	a3,16(s0)
	beq	a4,zero,.L96
	lw	a3,64(a5)
	lla	a4,_ZL7Do5SQHQi
	lla	a5,_ZL8Do5PCMHQv
	ble	a3,zero,.L99
.L95:
	li	a2,12
	li	a1,0
	lla	a0,_ZL9MMC5Sound+20
	la a3, _ZL4sfun; sw a4, 0(a3);
	la a4, _ZL5psfun; sw a5, 0(a4);
	call	memset
	li	a2,8
	li	a1,0
	lla	a0,_ZL9MMC5Sound+32
	call	memset
	lla	a5,_Z10MMC5HiSynci
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	sw	a5,12(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L96:
	.cfi_restore_state
	li	a4,0
	li	a5,0
	j	.L95
.L99:
	lla	a4,_ZL5Do5SQi
	lla	a5,_ZL6Do5PCMv
	j	.L95
	.cfi_endproc
.LFE40:
	.size	_Z11Mapper5_ESIv, .-_Z11Mapper5_ESIv
	.section	.rodata._ZL12GenMMC5_InitP8CartInfoii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"ERAM"
	.align	2
.LC2:
	.string	"SPLM"
	.align	2
.LC3:
	.string	"SPLS"
	.align	2
.LC4:
	.string	"SPLP"
	.align	2
.LC5:
	.string	"5130"
	.section	.text._ZL12GenMMC5_InitP8CartInfoii,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC5_InitP8CartInfoii, @function
_ZL12GenMMC5_InitP8CartInfoii:
.LFB44:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	sw	s3,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 19, -20
	mv	s2,a1
	mv	s0,a0
	mv	s1,a2
	bne	a1,zero,.L150
.L101:
	li	a0,1024
	call	_Z12FCEU_gmallocj
	mv	a5,a0
	lla	s3,_ZL8MMC5fill
	li	a0,1024
	sw	a5,0(s3)
	call	_Z12FCEU_gmallocj
	lw	a3,0(s3)
	lla	s3,_ZL5ExRAM
	sw	a0,0(s3)
	lbu	a4,960(a3)
	lbu	a1,0(a3)
	addi	a2,a3,956
	andi	a5,a4,3
	slli	a7,a5,2
	slli	a6,a1,8
	add	a6,a6,a1
	mv	a4,a5
	add	a1,a5,a7
	slli	a5,a5,4
	or	a1,a1,a5
	slli	a4,a4,6
	slli	a5,a6,16
	add	a6,a6,a5
	or	a1,a1,a4
	mv	a5,a2
.L102:
	sw	a6,0(a5)
	mv	a4,a5
	addi	a5,a5,-4
	bne	a3,a4,.L102
	slli	a5,a1,8
	add	a5,a5,a1
	slli	a4,a5,16
	add	a5,a5,a4
	addi	a3,a3,1020
.L103:
	sw	a5,0(a3)
	addi	a3,a3,-4
	bne	a2,a3,.L103
	lla	a3,.LC1
	li	a2,0
	li	a1,1024
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC2
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPMode
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPScroll
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC4
	li	a2,0
	li	a1,1
	lla	a0,MMC5HackSPPage
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,MMC50x5130
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a1,-1
	lla	a0,_ZL14MMC5_StateRegs
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	srai	a1,s2,31
	andi	a1,a1,7
	add	a1,a1,s2
	srai	a1,a1,3
	andi	a6,a1,0xff
	lla	a3,_ZL13MMC5WRAMIndex
	slli	a7,a6,2
	lla	t1,.L106
	la a5, _ZL12MMC5WRAMsize; sb a6, 0(a5);
	mv	a4,a3
	li	t3,0
	li	a5,0
	li	a0,8
	add	a7,a7,t1
.L114:
	bgtu	a6,a0,.L104
	lw	a2,0(a7)
	add	a2,a2,t1
	jr	a2
	.section	.rodata._ZL12GenMMC5_InitP8CartInfoii,"a",@progbits
	.align	2
	.align	2
.L106:
	.word	.L127-.L106
	.word	.L134-.L106
	.word	.L135-.L106
	.word	.L104-.L106
	.word	.L136-.L106
	.word	.L104-.L106
	.word	.L104-.L106
	.word	.L104-.L106
	.word	.L137-.L106
	.section	.text._ZL12GenMMC5_InitP8CartInfoii
.L104:
	andi	a2,a5,0xff
	li	t3,1
.L110:
	sb	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a0,.L114
.L111:
	beq	t3,zero,.L115
	andi	a2,a1,255
	lla	a4,_ZL13MMC5WRAMIndex
	li	a5,0
	li	a0,128
	beq	a2,zero,.L119
.L116:
	sb	a5,0(a4)
	addi	a5,a5,1
	beq	a5,a0,.L118
	addi	a4,a4,1
	bne	a5,a2,.L116
.L118:
	andi	a1,a1,128
	bne	a1,zero,.L122
.L119:
	lla	a5,_ZL13MMC5WRAMIndex
	sub	a3,a2,a3
	li	a0,127
.L117:
	lbu	a1,0(a5)
	add	a4,a5,a2
	addi	a5,a5,1
	sb	a1,0(a4)
	add	a4,a3,a5
	ble	a4,a0,.L117
.L122:
	lla	a5,_Z17MMC5_StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL12GenMMC5Resetv
	sw	a5,0(s0)
	beq	s1,zero,.L121
	lw	a5,52(s0)
	la a4, _ZL4WRAM; lw a4, 0(a4);
	sw	a4,12(s0)
	beq	a5,zero,.L124
	lw	a5,64(s0)
	sw	a5,28(s0)
.L121:
	lw	a5,0(s3)
	la a4, CHRmask4; lw a4, 0(a4);
	la a3, MMC5HackVROMMask; sw a4, 0(a3);
	la a4, MMC5HackExNTARAMPtr; sw a5, 0(a4);
	li	a5,1
	la a4, MMC5Hack; sw a5, 0(a4);
	la a5, CHRptr; lw a5, 0(a5);
	la a4, MMC5HackVROMPTR; sw a5, 0(a4);
	la a5, MMC5HackCHRMode; sb zero, 0(a5);
	la a5, MMC5HackSPPage; sb zero, 0(a5);
	la a5, MMC5HackSPScroll; sb zero, 0(a5);
	la a5, MMC5HackSPMode; sb zero, 0(a5);
	call	_Z11Mapper5_ESIv
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lla	a5,_Z12mmc5_PPUReadj
	la a4, FFCEUX_PPURead; sw a5, 0(a4);
	lla	a5,_ZL13mmc5_PPUWritejh
	la a4, FFCEUX_PPUWrite; sw a5, 0(a4);
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L127:
	.cfi_restore_state
	li	a2,255
	j	.L110
.L115:
	li	a2,8
	lla	a0,_ZL13MMC5WRAMIndex+120
	lla	a4,_ZL13MMC5WRAMIndex
	sub	a2,a2,a3
.L123:
	add	a5,a2,a4
	andi	a5,a5,7
	add	a5,a3,a5
	lbu	a5,0(a5)
	addi	a4,a4,1
	sb	a5,7(a4)
	bne	a0,a4,.L123
	j	.L122
.L124:
	li	a5,16
	ble	s2,a5,.L151
	li	a5,64
	beq	s2,a5,.L152
	li	a5,32768
	sw	a5,28(s0)
	j	.L121
.L150:
	slli	s3,a1,10
	mv	a0,s3
	sw	s4,8(sp)
	.cfi_offset 20, -24
	call	_Z12FCEU_gmallocj
	mv	a1,a0
	lla	s4,_ZL4WRAM
	li	a3,1
	mv	a2,s3
	li	a0,16
	sw	a1,0(s4)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a0,0(s4)
	lla	a3,.LC0
	li	a2,0
	mv	a1,s3
	call	_Z10AddExStatePvjiPKc
	lw	s4,8(sp)
	.cfi_restore 20
	j	.L101
.L137:
	li	a2,8
.L105:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a2,.L105
	j	.L111
.L135:
	li	a0,8
.L108:
	srai	a2,a5,2
	sb	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a0,.L108
	j	.L111
.L134:
	li	a0,8
.L109:
	slti	a2,a5,4
	addi	a2,a2,-1
	sb	a2,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a0,.L109
	j	.L111
.L151:
	li	a5,8192
	sw	a5,28(s0)
	j	.L121
.L136:
	li	a2,3
	li	a6,-1
	li	a0,8
.L107:
	bgt	a5,a2,.L112
.L153:
	sb	a5,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	ble	a5,a2,.L153
.L112:
	sb	a6,0(a4)
	addi	a5,a5,1
	addi	a4,a4,1
	bne	a5,a0,.L107
	j	.L111
.L152:
	li	a5,65536
	sw	a5,28(s0)
	j	.L121
	.cfi_endproc
.LFE44:
	.size	_ZL12GenMMC5_InitP8CartInfoii, .-_ZL12GenMMC5_InitP8CartInfoii
	.section	.text._ZL15MMC5_ReadROMRAMj,"ax",@progbits
	.align	2
	.type	_ZL15MMC5_ReadROMRAMj, @function
_ZL15MMC5_ReadROMRAMj:
.LFB24:
	.cfi_startproc
	li	a5,-24576
	add	a5,a0,a5
	srli	a5,a5,13
	lla	a4,_ZL9MMC5MemIn
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L155
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
.L155:
	la a0, X+24; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE24:
	.size	_ZL15MMC5_ReadROMRAMj, .-_ZL15MMC5_ReadROMRAMj
	.section	.text._ZL16MMC5_WriteROMRAMjh,"ax",@progbits
	.align	2
	.type	_ZL16MMC5_WriteROMRAMjh, @function
_ZL16MMC5_WriteROMRAMjh:
.LFB25:
	.cfi_startproc
	li	a5,32768
	bltu	a0,a5,.L158
	sub	a5,a0,a5
	srli	a5,a5,13
	lla	a4,_ZL16MMC5ROMWrProtect
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L157
.L158:
	li	a5,-24576
	add	a5,a0,a5
	srli	a5,a5,13
	lla	a4,_ZL9MMC5MemIn
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L157
	lla	a4,_ZL14WRAMMaskEnable
	lbu	a5,1(a4)
	lbu	a4,0(a4)
	li	a3,6
	slli	a5,a5,2
	andi	a5,a5,12
	andi	a4,a4,3
	or	a5,a5,a4
	beq	a5,a3,.L163
.L157:
	ret
.L163:
	srli	a4,a0,11
	slli	a4,a4,2
	lla	a5,Page
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE25:
	.size	_ZL16MMC5_WriteROMRAMjh, .-_ZL16MMC5_WriteROMRAMjh
	.section	.text._ZL12MMC5_ExRAMWrjh,"ax",@progbits
	.align	2
	.type	_ZL12MMC5_ExRAMWrjh, @function
_ZL12MMC5_ExRAMWrjh:
.LFB26:
	.cfi_startproc
	la a4, MMC5HackCHRMode; lbu a4, 0(a4);
	li	a5,3
	beq	a4,a5,.L164
	andi	a0,a0,1023
	la a5, _ZL5ExRAM; lw a5, 0(a5);
	add	a5,a5,a0
	sb	a1,0(a5)
.L164:
	ret
	.cfi_endproc
.LFE26:
	.size	_ZL12MMC5_ExRAMWrjh, .-_ZL12MMC5_ExRAMWrjh
	.section	.text._ZL8MMC5WRAMjj,"ax",@progbits
	.align	2
	.type	_ZL8MMC5WRAMjj, @function
_ZL8MMC5WRAMjj:
.LFB21:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a5,_ZL13MMC5WRAMIndex
	sw	s0,8(sp)
	add	a1,a5,a1
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	lbu	s1,0(a1)
	li	s0,-24576
	add	s0,a0,s0
	li	a5,255
	srli	s0,s0,13
	li	a4,0
	beq	s1,a5,.L167
	mv	a2,s1
	mv	a1,a0
	li	a0,16
	call	_Z8setprg8rijj
	la a2, _ZL8WRAMSIZE; lw a2, 0(a2);
	addi	a2,a2,-1
	slli	s1,s1,13
	la a5, _ZL4WRAM; lw a5, 0(a5);
	and	a2,a2,s1
	add	a2,a5,a2
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	li	a4,1
.L167:
	lla	a5,_ZL9MMC5MemIn
	add	a5,a5,s0
	sb	a4,0(a5)
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
.LFE21:
	.size	_ZL8MMC5WRAMjj, .-_ZL8MMC5WRAMjj
	.section	.text._ZL7MMC5PRGv,"ax",@progbits
	.align	2
	.type	_ZL7MMC5PRGv, @function
_ZL7MMC5PRGv:
.LFB22:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	.cfi_offset 8, -8
	la s0, _ZL9mmc5psize; lbu s0, 0(s0);
	sw	ra,44(sp)
	sw	s1,36(sp)
	andi	s0,s0,3
	li	a5,2
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	beq	s0,a5,.L172
	li	a5,3
	beq	s0,a5,.L173
	li	s1,1
	beq	s0,s1,.L174
	la a1, _ZL8PRGBanks+1; lbu a1, 0(a1);
	srli	a1,a1,2
	li	a5,16842752
	addi	a5,a5,257
	andi	a1,a1,31
	li	a0,32768
	la a4, _ZL16MMC5ROMWrProtect; sw a5, 0(a4);
	call	_Z8setprg32jj
	lla	a5,_ZL9MMC5MemIn
	li	a4,257
	sb	s1,1(a5)
	sh	a4,2(a5)
	sb	s1,4(a5)
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L173:
	.cfi_restore_state
	sw	s2,32(sp)
	sw	s5,20(sp)
	lla	s1,_ZL8PRGBanks
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	lla	s5,_ZL16MMC5ROMWrProtect
	lla	s2,_ZL9MMC5MemIn
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	s9,4(sp)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	mv	s4,s1
	mv	s3,s5
	mv	s6,s2
	li	s0,32768
	li	s9,1
	li	s8,8192
	li	s7,57344
.L184:
	lbu	a5,0(s4)
	mv	a0,s0
	slli	a4,a5,24
	srai	a4,a4,24
	andi	a1,a5,127
	blt	a4,zero,.L189
	mv	a1,a5
	sb	zero,0(s3)
	call	_ZL8MMC5WRAMjj
.L183:
	add	s0,s0,s8
	addi	s4,s4,1
	addi	s3,s3,1
	addi	s6,s6,1
	bne	s0,s7,.L184
	li	a5,1
	sb	a5,4(s2)
	sb	a5,3(s5)
	lbu	a1,3(s1)
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
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
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	li	a0,57344
	andi	a1,a1,127
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L189:
	.cfi_restore_state
	sb	s9,0(s3)
	call	_Z7setprg8jj
	sb	s9,1(s6)
	j	.L183
.L172:
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	sw	s2,32(sp)
	sw	s5,20(sp)
	lla	s1,_ZL8PRGBanks
	lbu	a1,1(s1)
	slli	a5,a1,24
	srai	a5,a5,24
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	blt	a5,zero,.L190
	andi	a1,a1,126
	li	a0,32768
	la a5, _ZL16MMC5ROMWrProtect; sh zero, 0(a5);
	call	_ZL8MMC5WRAMjj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s5,_ZL16MMC5ROMWrProtect
	andi	a1,a1,126
	addi	a1,a1,1
	call	_ZL8MMC5WRAMjj
	lbu	a1,2(s1)
	lla	s2,_ZL9MMC5MemIn
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L191
.L180:
	li	a0,49152
	la a5, _ZL16MMC5ROMWrProtect+2; sb zero, 0(a5);
	call	_ZL8MMC5WRAMjj
.L181:
	li	a5,1
	sb	a5,4(s2)
	sb	a5,3(s5)
	lbu	a1,3(s1)
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	li	a0,57344
	andi	a1,a1,127
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L174:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	sw	s2,32(sp)
	sw	s5,20(sp)
	.cfi_offset 18, -16
	.cfi_offset 21, -28
	lla	s1,_ZL8PRGBanks
	lbu	a1,1(s1)
	slli	a5,a1,24
	srai	a5,a5,24
	blt	a5,zero,.L192
	andi	a1,a1,126
	li	a0,32768
	la a5, _ZL16MMC5ROMWrProtect; sh zero, 0(a5);
	call	_ZL8MMC5WRAMjj
	lbu	a1,1(s1)
	li	a0,40960
	lla	s5,_ZL16MMC5ROMWrProtect
	andi	a1,a1,126
	addi	a1,a1,1
	call	_ZL8MMC5WRAMjj
	lla	s2,_ZL9MMC5MemIn
.L177:
	li	a5,1
	sb	a5,4(s2)
	sb	a5,3(s2)
	li	a5,257
	sh	a5,2(s5)
	lbu	a1,3(s1)
	lw	s0,40(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s5,20(sp)
	.cfi_restore 21
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s1,36(sp)
	.cfi_restore 9
	srli	a1,a1,1
	andi	a1,a1,63
	li	a0,49152
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L192:
	.cfi_restore_state
	li	a5,257
	lla	s2,_ZL9MMC5MemIn
	lla	s5,_ZL16MMC5ROMWrProtect
	srli	a1,a1,1
	li	a0,32768
	sh	a5,0(s5)
	call	_Z8setprg16jj
	sb	s0,2(s2)
	sb	s0,1(s2)
	j	.L177
.L190:
	li	a5,1
	lla	s2,_ZL9MMC5MemIn
	srli	a1,a1,1
	andi	a1,a1,63
	sb	a5,2(s2)
	sb	a5,1(s2)
	lla	s5,_ZL16MMC5ROMWrProtect
	li	a5,257
	li	a0,32768
	sh	a5,0(s5)
	call	_Z8setprg16jj
	lbu	a1,2(s1)
	slli	a5,a1,24
	srai	a5,a5,24
	bge	a5,zero,.L180
.L191:
	li	a5,1
	andi	a1,a1,127
	li	a0,49152
	sb	a5,2(s5)
	sb	a5,3(s2)
	call	_Z7setprg8jj
	j	.L181
	.cfi_endproc
.LFE22:
	.size	_ZL7MMC5PRGv, .-_ZL7MMC5PRGv
	.globl	__mulsi3
	.section	.text._ZL9MMC5_readj,"ax",@progbits
	.align	2
	.type	_ZL9MMC5_readj, @function
_ZL9MMC5_readj:
.LFB28:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,20480
	sw	ra,12(sp)
	.cfi_offset 1, -4
	addi	a5,a5,517
	beq	a0,a5,.L194
	li	a5,20480
	addi	a5,a5,518
	beq	a0,a5,.L195
	li	a5,20480
	addi	a5,a5,516
	bne	a0,a5,.L196
	li	a0,1
	call	_Z12X6502_IRQEndi
	lla	a5,_ZL8MMC5IRQR
	lbu	a0,0(a5)
	andi	a4,a0,64
	sb	a4,0(a5)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L195:
	.cfi_restore_state
	lla	a5,_ZL3mul
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	srai	a0,a0,8
	andi	a0,a0,0xff
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L194:
	.cfi_restore_state
	lla	a5,_ZL3mul
	lbu	a1,1(a5)
	lbu	a0,0(a5)
	call	__mulsi3
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	andi	a0,a0,0xff
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L196:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, X+24; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	_ZL9MMC5_readj, .-_ZL9MMC5_readj
	.section	.text._ZL7Do5SQHQi,"ax",@progbits
	.align	2
	.type	_ZL7Do5SQHQi, @function
_ZL7Do5SQHQi:
.LFB62:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE62:
	.size	_ZL7Do5SQHQi, .-_ZL7Do5SQHQi
	.section	.text._ZL6Do5PCMv,"ax",@progbits
	.align	2
	.type	_ZL6Do5PCMv, @function
_ZL6Do5PCMv:
.LFB58:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE58:
	.size	_ZL6Do5PCMv, .-_ZL6Do5PCMv
	.section	.text._ZL8Do5PCMHQv,"ax",@progbits
	.align	2
	.type	_ZL8Do5PCMHQv, @function
_ZL8Do5PCMHQv:
.LFB60:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE60:
	.size	_ZL8Do5PCMHQv, .-_ZL8Do5PCMHQv
	.section	.text._Z10MMC5HiSynci,"ax",@progbits
	.align	2
	.globl	_Z10MMC5HiSynci
	.hidden	_Z10MMC5HiSynci
	.type	_Z10MMC5HiSynci, @function
_Z10MMC5HiSynci:
.LFB56:
	.cfi_startproc
	lla	a5,_ZL9MMC5Sound
	sw	a0,20(a5)
	sw	a0,24(a5)
	sw	a0,28(a5)
	ret
	.cfi_endproc
.LFE56:
	.size	_Z10MMC5HiSynci, .-_Z10MMC5HiSynci
	.section	.text._ZL8MMC5CHRBv,"ax",@progbits
	.align	2
	.type	_ZL8MMC5CHRBv, @function
_ZL8MMC5CHRBv:
.LFB20:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	la a5, _ZL9mmc5vsize; lbu a5, 0(a5);
	sw	ra,44(sp)
	sw	s0,40(sp)
	andi	a5,a5,3
	li	a4,2
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	beq	a5,a4,.L204
	li	a4,3
	beq	a5,a4,.L205
	li	a4,1
	lla	s0,_ZL9CHRBanksB
	beq	a5,a4,.L206
	lhu	a0,6(s0)
	call	_Z7setchr8j
	la a5, CHRptr; lw a5, 0(a5);
	lhu	a4,6(s0)
	beq	a5,zero,.L203
	la a3, CHRmask8; lw a3, 0(a3);
	and	a4,a4,a3
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	slli	a4,a4,13
	add	a5,a5,a4
	lla	a4,MMC5BGVPage
	sw	a5,28(a4)
	sw	a5,24(a4)
	sw	a5,20(a4)
	sw	a5,16(a4)
	sw	a5,12(a4)
	sw	a5,8(a4)
	sw	a5,4(a4)
	sw	a5,0(a4)
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L205:
	.cfi_restore_state
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	lla	s6,MMC5BGVPage
	li	s1,0
	lla	s4,_ZL9CHRBanksB
	lla	s3,CHRptr
	lla	s5,CHRmask1
	li	s2,8
.L210:
	andi	s0,s1,3
	slli	s0,s0,1
	add	s0,s4,s0
	lhu	a1,0(s0)
	slli	s7,s1,10
	mv	a0,s7
	call	_Z7setchr1jj
	lw	a4,0(s3)
	addi	s1,s1,1
	beq	a4,zero,.L209
	lhu	a5,0(s0)
	lw	a3,0(s5)
	and	a5,a5,a3
	slli	a5,a5,10
	sub	a5,a5,s7
	add	a4,a4,a5
	sw	a4,0(s6)
.L209:
	addi	s6,s6,4
	bne	s1,s2,.L210
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
.L203:
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L204:
	.cfi_restore_state
	lla	s0,_ZL9CHRBanksB
	lhu	a1,2(s0)
	li	a0,0
	call	_Z7setchr2jj
	lhu	a1,6(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lhu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lhu	a1,6(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,2(s0)
	beq	a4,zero,.L203
	lhu	a3,6(s0)
	la a2, CHRmask2; lw a2, 0(a2);
	and	a5,a5,a2
	and	a3,a3,a2
	li	a2,-4096
	slli	a3,a3,11
	slli	a5,a5,11
	addi	a2,a2,-2048
	li	a1,4096
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	addi	a0,a3,-2048
	sub	a1,a5,a1
	add	a2,a3,a2
	add	a5,a4,a5
	lla	a3,MMC5BGVPage
	add	a0,a4,a0
	add	a1,a4,a1
	add	a4,a4,a2
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a0,12(a3)
	sw	a0,8(a3)
	sw	a1,20(a3)
	sw	a1,16(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L206:
	.cfi_restore_state
	lhu	a1,6(s0)
	li	a0,0
	call	_Z7setchr4jj
	lhu	a1,6(s0)
	li	a0,4096
	call	_Z7setchr4jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,6(s0)
	beq	a4,zero,.L203
	la a3, CHRmask4; lw a3, 0(a3);
	and	a5,a5,a3
	slli	a5,a5,12
	li	a2,-4096
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	add	a2,a5,a2
	lla	a3,MMC5BGVPage
	add	a5,a4,a5
	add	a4,a4,a2
	sw	a5,12(a3)
	sw	a5,8(a3)
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	sw	a4,20(a3)
	sw	a4,16(a3)
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	_ZL8MMC5CHRBv, .-_ZL8MMC5CHRBv
	.section	.text._ZL8MMC5CHRAv,"ax",@progbits
	.align	2
	.type	_ZL8MMC5CHRAv, @function
_ZL8MMC5CHRAv:
.LFB19:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	la a5, _ZL9mmc5vsize; lbu a5, 0(a5);
	sw	ra,28(sp)
	sw	s0,24(sp)
	andi	a5,a5,3
	li	a4,2
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	beq	a5,a4,.L226
	li	a4,3
	beq	a5,a4,.L227
	li	a4,1
	lla	s0,_ZL9CHRBanksA
	beq	a5,a4,.L228
	lhu	a0,14(s0)
	call	_Z7setchr8j
	la a5, CHRptr; lw a5, 0(a5);
	lhu	a4,14(s0)
	beq	a5,zero,.L225
	la a3, CHRmask8; lw a3, 0(a3);
	and	a4,a4,a3
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	slli	a4,a4,13
	add	a5,a5,a4
	lla	a4,MMC5SPRVPage
	sw	a5,28(a4)
	sw	a5,24(a4)
	sw	a5,20(a4)
	sw	a5,16(a4)
	sw	a5,12(a4)
	sw	a5,8(a4)
	sw	a5,4(a4)
	sw	a5,0(a4)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L227:
	.cfi_restore_state
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	lla	s1,_ZL9CHRBanksA
	lla	s2,MMC5SPRVPage
	li	s0,0
	lla	s4,CHRptr
	lla	s5,CHRmask1
	li	s3,8192
.L232:
	lhu	a1,0(s1)
	mv	a0,s0
	call	_Z7setchr1jj
	lw	a4,0(s4)
	beq	a4,zero,.L231
	lhu	a5,0(s1)
	lw	a3,0(s5)
	and	a5,a5,a3
	slli	a5,a5,10
	sub	a5,a5,s0
	add	a4,a4,a5
	sw	a4,0(s2)
.L231:
	addi	s0,s0,1024
	addi	s1,s1,2
	addi	s2,s2,4
	bne	s0,s3,.L232
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
.L225:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L226:
	.cfi_restore_state
	lla	s0,_ZL9CHRBanksA
	lhu	a1,2(s0)
	li	a0,0
	call	_Z7setchr2jj
	lhu	a1,6(s0)
	li	a0,4096
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	lhu	a1,10(s0)
	li	a0,4096
	call	_Z7setchr2jj
	lhu	a1,14(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr2jj
	la a3, CHRptr; lw a3, 0(a3);
	lhu	a2,2(s0)
	beq	a3,zero,.L225
	lhu	a4,6(s0)
	lhu	a5,10(s0)
	lhu	a0,14(s0)
	la a1, CHRmask2; lw a1, 0(a1);
	and	a4,a4,a1
	and	a5,a5,a1
	and	a0,a0,a1
	li	a6,-4096
	and	a2,a2,a1
	slli	a4,a4,11
	li	a1,4096
	slli	a5,a5,11
	slli	a0,a0,11
	addi	a6,a6,-2048
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	sub	a5,a5,a1
	slli	a2,a2,11
	addi	a4,a4,-2048
	add	a0,a0,a6
	lla	a1,MMC5SPRVPage
	add	a2,a3,a2
	add	a4,a3,a4
	add	a5,a3,a5
	add	a3,a3,a0
	sw	a2,4(a1)
	sw	a2,0(a1)
	sw	a4,12(a1)
	sw	a4,8(a1)
	sw	a5,20(a1)
	sw	a5,16(a1)
	sw	a3,28(a1)
	sw	a3,24(a1)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L228:
	.cfi_restore_state
	lhu	a1,6(s0)
	li	a0,0
	call	_Z7setchr4jj
	lhu	a1,14(s0)
	li	a0,4096
	call	_Z7setchr4jj
	la a4, CHRptr; lw a4, 0(a4);
	lhu	a5,6(s0)
	beq	a4,zero,.L225
	lhu	a2,14(s0)
	la a3, CHRmask4; lw a3, 0(a3);
	and	a5,a5,a3
	and	a2,a2,a3
	slli	a2,a2,12
	li	a3,-4096
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	add	a2,a2,a3
	slli	a5,a5,12
	lla	a3,MMC5SPRVPage
	add	a5,a4,a5
	add	a4,a4,a2
	sw	a5,12(a3)
	sw	a5,8(a3)
	sw	a5,4(a3)
	sw	a5,0(a3)
	sw	a4,28(a3)
	sw	a4,24(a3)
	sw	a4,20(a3)
	sw	a4,16(a3)
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	_ZL8MMC5CHRAv, .-_ZL8MMC5CHRAv
	.section	.text._ZL13Mapper5_writejh,"ax",@progbits
	.align	2
	.type	_ZL13Mapper5_writejh, @function
_ZL13Mapper5_writejh:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,20480
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	addi	a5,a5,304
	mv	s0,a1
	bgtu	a0,a5,.L248
	li	a5,20480
	addi	a5,a5,255
	bleu	a0,a5,.L247
	li	a5,-20480
	addi	a5,a5,-256
	add	a5,a0,a5
	li	a4,48
	bgtu	a5,a4,.L247
	lla	a4,.L260
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL13Mapper5_writejh,"a",@progbits
	.align	2
	.align	2
.L260:
	.word	.L272-.L260
	.word	.L271-.L260
	.word	.L270-.L260
	.word	.L269-.L260
	.word	.L268-.L260
	.word	.L267-.L260
	.word	.L266-.L260
	.word	.L265-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L264-.L260
	.word	.L263-.L260
	.word	.L263-.L260
	.word	.L263-.L260
	.word	.L263-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L262-.L260
	.word	.L261-.L260
	.word	.L261-.L260
	.word	.L261-.L260
	.word	.L261-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L247-.L260
	.word	.L259-.L260
	.section	.text._ZL13Mapper5_writejh
.L252:
	la a5, _ZL3mul+1; sb s0, 0(a5);
.L247:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L248:
	.cfi_restore_state
	li	a5,-20480
	addi	a5,a5,-512
	add	a5,a0,a5
	li	a4,6
	bgtu	a5,a4,.L247
	li	a5,-20480
	addi	a5,a5,-513
	add	a0,a0,a5
	li	a5,5
	bgtu	a0,a5,.L251
	lla	a4,.L253
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL13Mapper5_writejh
	.align	2
	.align	2
.L253:
	.word	.L258-.L253
	.word	.L257-.L253
	.word	.L256-.L253
	.word	.L255-.L253
	.word	.L254-.L253
	.word	.L252-.L253
	.section	.text._ZL13Mapper5_writejh
.L262:
	la a4, MMC50x5130; lbu a4, 0(a4);
	andi	a5,a0,7
	slli	a4,a4,8
	slli	a5,a5,1
	andi	a4,a4,768
	lla	a3,_ZL9CHRBanksA
	add	a3,a3,a5
	or	a5,a4,a1
	sh	a5,0(a3)
	la a4, mmc5ABMode; sb zero, 0(a4);
.L292:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL8MMC5CHRAv
.L261:
	.cfi_restore_state
	la a4, MMC50x5130; lbu a4, 0(a4);
	andi	a5,a0,3
	slli	a4,a4,8
	slli	a5,a5,1
	andi	a4,a4,768
	lla	a3,_ZL9CHRBanksB
	add	a3,a3,a5
	or	a5,a4,a1
	li	a4,1
	la a2, mmc5ABMode; sb a4, 0(a2);
	sh	a5,0(a3)
.L293:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL8MMC5CHRBv
.L263:
	.cfi_restore_state
	andi	a0,a0,3
	lla	a5,_ZL8PRGBanks
	add	a5,a5,a0
	sb	a1,0(a5)
.L291:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL7MMC5PRGv
.L256:
	.cfi_restore_state
	li	a0,1
	call	_Z12X6502_IRQEndi
	la a5, _ZL11IRQScanline; sb s0, 0(a5);
	j	.L247
.L255:
	li	a0,1
	andi	s0,s0,-128
	call	_Z12X6502_IRQEndi
	la a5, _ZL9IRQEnable; sb s0, 0(a5);
	j	.L247
.L254:
	la a5, _ZL3mul; sb s0, 0(a5);
	j	.L247
.L258:
	srli	s0,s0,3
	la a5, MMC5HackSPScroll; sb s0, 0(a5);
	j	.L247
.L257:
	andi	s0,s0,63
	la a5, MMC5HackSPPage; sb s0, 0(a5);
	j	.L247
.L269:
	la a5, _ZL14WRAMMaskEnable+1; sb a1, 0(a5);
	j	.L247
.L268:
	andi	a5,a1,3
	la a4, _ZL7CHRMode; sb a1, 0(a4);
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	j	.L247
.L267:
	lla	t3,PPUNTARAM
	lbu	a3,0(t3)
	la t0, _ZL5ExRAM; lw t0, 0(t0);
	la t6, _ZL8MMC5fill; lw t6, 0(t6);
	lla	a2,vnapage
	li	a4,0
	li	a0,1
	li	a7,2
	li	t1,3
	lla	t5,NTARAM+1024
	lla	t4,NTARAM
	li	a6,4
.L279:
	slli	a5,a4,1
	sra	a5,s0,a5
	andi	a5,a5,3
	sll	a1,a0,a4
	beq	a5,a7,.L275
	beq	a5,t1,.L276
	or	a3,a3,a1
	andi	a3,a3,0xff
	beq	a5,a0,.L277
	mv	a5,t4
.L278:
	sw	a5,0(a2)
	addi	a4,a4,1
	addi	a2,a2,4
	bne	a4,a6,.L279
	sb	a3,0(t3)
	la a5, _ZL12NTAMirroring; sb s0, 0(a5);
	j	.L247
.L266:
	lla	a1,_ZL6NTFill
	lbu	a5,0(a1)
	beq	a5,s0,.L282
	slli	a3,s0,8
	add	a3,a3,s0
	slli	a5,a3,16
	la a2, _ZL8MMC5fill; lw a2, 0(a2);
	add	a3,a3,a5
	addi	a5,a2,956
.L281:
	sw	a3,0(a5)
	mv	a4,a5
	addi	a5,a5,-4
	bne	a2,a4,.L281
.L282:
	sb	s0,0(a1)
	j	.L247
.L265:
	lla	a2,_ZL6ATFill
	lbu	a5,0(a2)
	beq	a5,a1,.L285
	slli	a4,a1,24
	srai	a4,a4,24
	slli	a3,a4,4
	slli	a5,a4,2
	or	a5,a5,a3
	or	a5,a4,a5
	slli	a4,a4,6
	or	a5,a5,a4
	andi	a5,a5,0xff
	slli	a4,a5,8
	add	a4,a4,a5
	la a3, _ZL8MMC5fill; lw a3, 0(a3);
	slli	a5,a4,16
	add	a4,a4,a5
	addi	a5,a3,1020
	addi	a3,a3,956
.L284:
	sw	a4,0(a5)
	addi	a5,a5,-4
	bne	a5,a3,.L284
.L285:
	sb	s0,0(a2)
	j	.L247
.L264:
	la a5, _ZL8WRAMPage; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a1,a1,127
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL8MMC5WRAMjj
.L259:
	.cfi_restore_state
	la a5, MMC50x5130; sb a1, 0(a5);
	j	.L247
.L271:
	la a5, _ZL9mmc5vsize; sb a1, 0(a5);
	la a5, mmc5ABMode; lbu a5, 0(a5);
	bne	a5,zero,.L274
	call	_ZL8MMC5CHRBv
	j	.L292
.L270:
	la a5, _ZL14WRAMMaskEnable; sb a1, 0(a5);
	j	.L247
.L272:
	la a5, _ZL9mmc5psize; sb a1, 0(a5);
	j	.L291
.L276:
	not	a1,a1
	and	a3,a3,a1
	mv	a5,t6
	j	.L278
.L275:
	or	a3,a3,a1
	andi	a3,a3,0xff
	mv	a5,t0
	j	.L278
.L277:
	mv	a5,t5
	j	.L278
.L251:
	la a5, MMC5HackSPMode; sb s0, 0(a5);
	j	.L247
.L274:
	call	_ZL8MMC5CHRAv
	j	.L293
	.cfi_endproc
.LFE23:
	.size	_ZL13Mapper5_writejh, .-_ZL13Mapper5_writejh
	.section	.text._Z13MMC5BGVRAMADRj,"ax",@progbits
	.align	2
	.globl	_Z13MMC5BGVRAMADRj
	.hidden	_Z13MMC5BGVRAMADRj
	.type	_Z13MMC5BGVRAMADRj, @function
_Z13MMC5BGVRAMADRj:
.LFB14:
	.cfi_startproc
	lla	a3,PPU
	lbu	a5,0(a3)
	la a2, newppu; lw a2, 0(a2);
	srli	a4,a0,10
	andi	a5,a5,32
	beq	a2,zero,.L295
	beq	a5,zero,.L296
	lbu	a5,1(a3)
	li	a2,2
	la a3, ppuphase; lw a3, 0(a3);
	andi	a5,a5,24
	beq	a3,a2,.L313
	li	a2,1
	bne	a3,a2,.L312
.L295:
	bne	a5,zero,.L301
.L312:
	la a5, mmc5ABMode; lbu a5, 0(a5);
	slli	a4,a4,2
	bne	a5,zero,.L309
	lla	a5,MMC5SPRVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
.L301:
	slli	a4,a4,2
.L309:
	lla	a5,MMC5BGVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
.L313:
	beq	a5,zero,.L312
.L296:
	slli	a4,a4,2
	lla	a5,MMC5SPRVPage
	add	a5,a5,a4
	lw	a5,0(a5)
	add	a0,a5,a0
	ret
	.cfi_endproc
.LFE14:
	.size	_Z13MMC5BGVRAMADRj, .-_Z13MMC5BGVRAMADRj
	.section	.rodata._Z18DetectMMC5WRAMSizej.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	" >8KB external WRAM present.  Use UNIF if you hack the ROM image.\n"
	.section	.text._Z18DetectMMC5WRAMSizej,"ax",@progbits
	.align	2
	.globl	_Z18DetectMMC5WRAMSizej
	.hidden	_Z18DetectMMC5WRAMSizej
	.type	_Z18DetectMMC5WRAMSizej, @function
_Z18DetectMMC5WRAMSizej:
.LFB17:
	.cfi_startproc
	lla	a1,MMC5CartList
	mv	a4,a1
	li	a5,0
	li	a2,26
	j	.L318
.L315:
	addi	a5,a5,1
	beq	a5,a2,.L324
.L318:
	lw	a3,0(a4)
	addi	a4,a4,8
	bne	a3,a0,.L315
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	slli	a5,a5,3
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	add	s0,a1,a5
	lbu	a0,4(s0)
	li	a5,1
	bgtu	a0,a5,.L325
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	slli	a0,a0,3
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L325:
	.cfi_restore_state
	lla	a0,.LC6
	call	printf
	lbu	a0,4(s0)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	slli	a0,a0,3
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L324:
	li	a0,64
	ret
	.cfi_endproc
.LFE17:
	.size	_Z18DetectMMC5WRAMSizej, .-_Z18DetectMMC5WRAMSizej
	.section	.text._Z9MMC5Syncov,"ax",@progbits
	.align	2
	.globl	_Z9MMC5Syncov
	.hidden	_Z9MMC5Syncov
	.type	_Z9MMC5Syncov, @function
_Z9MMC5Syncov:
.LFB29:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	call	_ZL7MMC5PRGv
	lla	t4,PPUNTARAM
	lla	s0,_ZL8MMC5fill
	lbu	a3,0(t4)
	lw	ra,0(s0)
	la t1, _ZL12NTAMirroring; lbu t1, 0(t1);
	la t2, _ZL5ExRAM; lw t2, 0(t2);
	lla	a2,vnapage
	li	a4,0
	li	a0,1
	li	a7,2
	li	t3,3
	lla	t0,NTARAM+1024
	lla	t6,NTARAM
	li	a6,4
.L331:
	slli	a5,a4,1
	sra	a5,t1,a5
	andi	a5,a5,3
	sll	a1,a0,a4
	beq	a5,a7,.L327
	beq	a5,t3,.L328
	or	t5,a3,a1
	beq	a5,a0,.L329
	andi	a3,t5,0xff
	mv	a5,t6
.L330:
	sw	a5,0(a2)
	addi	a4,a4,1
	addi	a2,a2,4
	bne	a4,a6,.L331
	la a1, _ZL8WRAMPage; lbu a1, 0(a1);
	andi	a1,a1,127
	li	a0,24576
	sb	a3,0(t4)
	call	_ZL8MMC5WRAMjj
	la a5, mmc5ABMode; lbu a5, 0(a5);
	bne	a5,zero,.L332
	call	_ZL8MMC5CHRBv
	call	_ZL8MMC5CHRAv
.L333:
	la a5, _ZL6NTFill; lbu a5, 0(a5);
	lw	a3,0(s0)
	slli	a2,a5,8
	add	a2,a2,a5
	slli	a5,a2,16
	addi	a1,a3,956
	add	a2,a2,a5
	mv	a5,a1
.L334:
	sw	a2,0(a5)
	mv	a4,a5
	addi	a5,a5,-4
	bne	a3,a4,.L334
	la a5, _ZL6ATFill; lb a5, 0(a5);
	slli	a4,a5,2
	slli	a2,a5,4
	or	a4,a4,a2
	or	a4,a5,a4
	slli	a5,a5,6
	or	a4,a4,a5
	andi	a4,a4,0xff
	slli	a5,a4,8
	add	a5,a5,a4
	slli	a4,a5,16
	add	a5,a5,a4
	addi	a3,a3,1020
.L335:
	sw	a5,0(a3)
	addi	a3,a3,-4
	bne	a1,a3,.L335
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	la a5, _ZL7CHRMode; lbu a5, 0(a5);
	andi	a5,a5,3
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L329:
	.cfi_restore_state
	andi	a3,t5,0xff
	mv	a5,t0
	j	.L330
.L328:
	not	a1,a1
	mv	a5,ra
	and	a3,a3,a1
	j	.L330
.L327:
	or	a3,a3,a1
	andi	a3,a3,0xff
	mv	a5,t2
	j	.L330
.L332:
	call	_ZL8MMC5CHRAv
	call	_ZL8MMC5CHRBv
	j	.L333
	.cfi_endproc
.LFE29:
	.size	_Z9MMC5Syncov, .-_Z9MMC5Syncov
	.section	.text._Z17MMC5_StateRestorei,"ax",@progbits
	.align	2
	.globl	_Z17MMC5_StateRestorei
	.hidden	_Z17MMC5_StateRestorei
	.type	_Z17MMC5_StateRestorei, @function
_Z17MMC5_StateRestorei:
.LFB31:
	.cfi_startproc
	tail	_Z9MMC5Syncov
	.cfi_endproc
.LFE31:
	.size	_Z17MMC5_StateRestorei, .-_Z17MMC5_StateRestorei
	.section	.text._ZL12GenMMC5Resetv,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC5Resetv, @function
_ZL12GenMMC5Resetv:
.LFB43:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1
	lla	a4,_ZL9CHRBanksA
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a3,3
	lla	a2,_ZL9CHRBanksB
	sw	a5,0(a4)
	sw	a5,4(a4)
	sw	a5,8(a4)
	sw	a5,12(a4)
	la a1, _ZL8PRGBanks; sw a5, 0(a1);
	sw	a5,0(a2)
	sw	a5,4(a2)
	la a4, _ZL14WRAMMaskEnable; sh a5, 0(a4);
	la a4, _ZL9mmc5vsize; sb a3, 0(a4);
	la a4, _ZL9mmc5psize; sb a3, 0(a4);
	la a4, _ZL6ATFill; sb a5, 0(a4);
	la a4, _ZL6NTFill; sb a5, 0(a4);
	la a4, _ZL12NTAMirroring; sb a5, 0(a4);
	la a4, _ZL7CHRMode; sb zero, 0(a4);
	call	_Z9MMC5Syncov
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL13Mapper5_writejh
	addi	a1,a1,-1025
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL9MMC5_readj
	addi	a1,a1,-1025
	addi	a0,a0,32
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL12MMC5_ExRAMWrjh
	addi	a1,a1,-1
	addi	a0,a0,-1024
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL12MMC5_ExRAMRdj
	addi	a1,a1,-1
	addi	a0,a0,-1024
	call	_Z14SetReadHandleriiPFhjE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_ZL16MMC5_WriteROMRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_ZL15MMC5_ReadROMRAMj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	lla	a2,_ZL10Mapper5_SWjh
	addi	a1,a1,21
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL13Mapper5_writejh
	addi	a1,a1,518
	addi	a0,a0,517
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL9MMC5_readj
	addi	a1,a1,518
	addi	a0,a0,517
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	la a2, _ZL5ExRAM; lw a2, 0(a2);
	addi	a1,a1,-1024
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z16FCEU_CheatAddRAMijPh
	.cfi_endproc
.LFE43:
	.size	_ZL12GenMMC5Resetv, .-_ZL12GenMMC5Resetv
	.section	.text._Z7MMC5_hbi,"ax",@progbits
	.align	2
	.globl	_Z7MMC5_hbi
	.hidden	_Z7MMC5_hbi
	.type	_Z7MMC5_hbi, @function
_Z7MMC5_hbi:
.LFB30:
	.cfi_startproc
	la a5, PPU+1; lbu a5, 0(a5);
	lla	a3,_ZL8MMC5IRQR
	andi	a4,a5,24
	lbu	a5,0(a3)
	beq	a4,zero,.L344
	li	a4,239
	bgt	a0,a4,.L344
	andi	a4,a5,64
	beq	a4,zero,.L353
	lla	a2,_ZL15MMC5LineCounter
	lbu	a4,0(a2)
	la a1, _ZL11IRQScanline; lbu a1, 0(a1);
	addi	a4,a4,1
	andi	a4,a4,0xff
	sb	a4,0(a2)
	beq	a1,a4,.L354
.L343:
	ret
.L344:
	andi	a5,a5,63
	sb	a5,0(a3)
	li	a0,1
	la a5, _ZL15MMC5LineCounter; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L353:
	andi	a5,a5,127
	ori	a5,a5,64
	sb	a5,0(a3)
	li	a0,1
	la a5, _ZL15MMC5LineCounter; sb zero, 0(a5);
	tail	_Z12X6502_IRQEndi
.L354:
	ori	a5,a5,-128
	sb	a5,0(a3)
	la a5, _ZL9IRQEnable; lb a5, 0(a5);
	bge	a5,zero,.L343
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE30:
	.size	_Z7MMC5_hbi, .-_Z7MMC5_hbi
	.section	.text._Z12NSFMMC5_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFMMC5_Initv
	.hidden	_Z12NSFMMC5_Initv
	.type	_Z12NSFMMC5_Initv, @function
_Z12NSFMMC5_Initv:
.LFB41:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,40
	li	a1,0
	lla	a0,_ZL9MMC5Sound
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	memset
	li	a0,1024
	la a5, _ZL3mul; sh zero, 0(a5);
	call	_Z12FCEU_gmallocj
	la a5, _ZL5ExRAM; sw a0, 0(a5);
	call	_Z11Mapper5_ESIv
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL12MMC5_ExRAMWrjh
	addi	a1,a1,-17
	addi	a0,a0,-1024
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL12MMC5_ExRAMRdj
	addi	a1,a1,-17
	addi	a0,a0,-1024
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	li	a5,2
	lla	a2,_ZL10Mapper5_SWjh
	addi	a1,a1,21
	li	a0,20480
	la a4, MMC5HackCHRMode; sb a5, 0(a4);
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL13Mapper5_writejh
	addi	a1,a1,518
	addi	a0,a0,517
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL9MMC5_readj
	addi	a1,a1,518
	addi	a0,a0,517
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE41:
	.size	_Z12NSFMMC5_Initv, .-_Z12NSFMMC5_Initv
	.section	.text._Z13NSFMMC5_Closev,"ax",@progbits
	.align	2
	.globl	_Z13NSFMMC5_Closev
	.hidden	_Z13NSFMMC5_Closev
	.type	_Z13NSFMMC5_Closev, @function
_Z13NSFMMC5_Closev:
.LFB42:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L358
	call	_Z10FCEU_gfreePv
.L358:
	la a0, _ZL5ExRAM; lw a0, 0(a0);
	la a5, _ZL4WRAM; sw zero, 0(a5);
	call	_Z10FCEU_gfreePv
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL5ExRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	_Z13NSFMMC5_Closev, .-_Z13NSFMMC5_Closev
	.section	.text._Z12Mapper5_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper5_InitP8CartInfo
	.hidden	_Z12Mapper5_InitP8CartInfo
	.type	_Z12Mapper5_InitP8CartInfo, @function
_Z12Mapper5_InitP8CartInfo:
.LFB45:
	.cfi_startproc
	lw	a5,52(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	beq	a5,zero,.L364
	lw	a5,60(a0)
	lw	a4,64(a0)
	add	a5,a5,a4
	srai	a1,a5,31
	andi	a1,a1,1023
	add	a1,a1,a5
	srai	a1,a1,10
	mv	a5,a1
.L365:
	lw	a2,48(s0)
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a4, _ZL8WRAMSIZE; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL12GenMMC5_InitP8CartInfoii
.L364:
	.cfi_restore_state
	lw	a2,92(a0)
	lla	a0,MMC5CartList
	mv	a4,a0
	li	a1,26
	j	.L369
.L366:
	addi	a5,a5,1
	beq	a5,a1,.L372
.L369:
	lw	a3,0(a4)
	addi	a4,a4,8
	bne	a2,a3,.L366
	slli	a5,a5,3
	sw	s1,4(sp)
	.cfi_offset 9, -12
	add	s1,a0,a5
	lbu	a1,4(s1)
	li	a5,1
	bleu	a1,a5,.L367
	lla	a0,.LC6
	call	printf
	lbu	a1,4(s1)
.L367:
	slli	a1,a1,3
	lw	s1,4(sp)
	.cfi_restore 9
	mv	a5,a1
	j	.L365
.L372:
	li	a5,64
	li	a1,64
	j	.L365
	.cfi_endproc
.LFE45:
	.size	_Z12Mapper5_InitP8CartInfo, .-_Z12Mapper5_InitP8CartInfo
	.section	.text._Z10ELROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ELROM_InitP8CartInfo
	.hidden	_Z10ELROM_InitP8CartInfo
	.type	_Z10ELROM_InitP8CartInfo, @function
_Z10ELROM_InitP8CartInfo:
.LFB46:
	.cfi_startproc
	li	a2,0
	li	a1,0
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.cfi_endproc
.LFE46:
	.size	_Z10ELROM_InitP8CartInfo, .-_Z10ELROM_InitP8CartInfo
	.section	.text._Z10EKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10EKROM_InitP8CartInfo
	.hidden	_Z10EKROM_InitP8CartInfo
	.type	_Z10EKROM_InitP8CartInfo, @function
_Z10EKROM_InitP8CartInfo:
.LFB47:
	.cfi_startproc
	lw	a2,48(a0)
	li	a1,8
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.cfi_endproc
.LFE47:
	.size	_Z10EKROM_InitP8CartInfo, .-_Z10EKROM_InitP8CartInfo
	.section	.text._Z10ETROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10ETROM_InitP8CartInfo
	.hidden	_Z10ETROM_InitP8CartInfo
	.type	_Z10ETROM_InitP8CartInfo, @function
_Z10ETROM_InitP8CartInfo:
.LFB48:
	.cfi_startproc
	lw	a2,48(a0)
	li	a1,16
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.cfi_endproc
.LFE48:
	.size	_Z10ETROM_InitP8CartInfo, .-_Z10ETROM_InitP8CartInfo
	.section	.text._Z10EWROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10EWROM_InitP8CartInfo
	.hidden	_Z10EWROM_InitP8CartInfo
	.type	_Z10EWROM_InitP8CartInfo, @function
_Z10EWROM_InitP8CartInfo:
.LFB49:
	.cfi_startproc
	lw	a2,48(a0)
	li	a1,32
	tail	_ZL12GenMMC5_InitP8CartInfoii
	.cfi_endproc
.LFE49:
	.size	_Z10EWROM_InitP8CartInfo, .-_Z10EWROM_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"PRGB"
	.align	2
.LC8:
	.string	"CHRA"
	.align	2
.LC9:
	.string	"CHRB"
	.align	2
.LC10:
	.string	"WRMP"
	.align	2
.LC11:
	.string	"WRME"
	.align	2
.LC12:
	.string	"ABMD"
	.align	2
.LC13:
	.string	"IRQS"
	.align	2
.LC14:
	.string	"IRQE"
	.align	2
.LC15:
	.string	"CHRM"
	.align	2
.LC16:
	.string	"NTAM"
	.align	2
.LC17:
	.string	"NTFL"
	.align	2
.LC18:
	.string	"ATFL"
	.align	2
.LC19:
	.string	"IRQR"
	.align	2
.LC20:
	.string	"LCTR"
	.align	2
.LC21:
	.string	"PSIZ"
	.align	2
.LC22:
	.string	"VSIZ"
	.align	2
.LC23:
	.string	"MUL2"
	.align	2
.LC24:
	.string	"WRPR"
	.align	2
.LC25:
	.string	"MEMI"
	.align	2
.LC26:
	.string	"SDW0"
	.align	2
.LC27:
	.string	"SDW1"
	.align	2
.LC28:
	.string	"SDEV"
	.align	2
.LC29:
	.string	"SDEN"
	.align	2
.LC30:
	.string	"SDRU"
	.align	2
.LC31:
	.string	"SDRW"
	.align	2
.LC32:
	.string	"SDRC"
	.align	2
.LC33:
	.string	"DCT0"
	.align	2
.LC34:
	.string	"DCT1"
	.align	2
.LC35:
	.string	"BC00"
	.align	2
.LC36:
	.string	"BC01"
	.align	2
.LC37:
	.string	"BC02"
	.align	2
.LC38:
	.string	"VCT0"
	.align	2
.LC39:
	.string	"VCT1"
	.section	.data._ZL14MMC5_StateRegs,"aw"
	.align	2
	.type	_ZL14MMC5_StateRegs, @object
	.size	_ZL14MMC5_StateRegs, 408
_ZL14MMC5_StateRegs:
	.word	_ZL8PRGBanks
	.word	4
	.word	.LC7
	.word	_ZL9CHRBanksA
	.word	16
	.word	.LC8
	.word	_ZL9CHRBanksB
	.word	8
	.word	.LC9
	.word	_ZL8WRAMPage
	.word	1
	.word	.LC10
	.word	_ZL14WRAMMaskEnable
	.word	2
	.word	.LC11
	.word	mmc5ABMode
	.word	1
	.word	.LC12
	.word	_ZL11IRQScanline
	.word	1
	.word	.LC13
	.word	_ZL9IRQEnable
	.word	1
	.word	.LC14
	.word	_ZL7CHRMode
	.word	1
	.word	.LC15
	.word	_ZL12NTAMirroring
	.word	1
	.word	.LC16
	.word	_ZL6NTFill
	.word	1
	.word	.LC17
	.word	_ZL6ATFill
	.word	1
	.word	.LC18
	.word	_ZL8MMC5IRQR
	.word	1
	.word	.LC19
	.word	_ZL15MMC5LineCounter
	.word	1
	.word	.LC20
	.word	_ZL9mmc5psize
	.word	1
	.word	.LC21
	.word	_ZL9mmc5vsize
	.word	1
	.word	.LC22
	.word	_ZL3mul
	.word	2
	.word	.LC23
	.word	_ZL16MMC5ROMWrProtect
	.word	4
	.word	.LC24
	.word	_ZL9MMC5MemIn
	.word	5
	.word	.LC25
	.word	_ZL9MMC5Sound
	.word	-2147483646
	.word	.LC26
	.word	_ZL9MMC5Sound+2
	.word	-2147483646
	.word	.LC27
	.word	_ZL9MMC5Sound+4
	.word	2
	.word	.LC28
	.word	_ZL9MMC5Sound+6
	.word	1
	.word	.LC29
	.word	_ZL9MMC5Sound+7
	.word	1
	.word	.LC30
	.word	_ZL9MMC5Sound+8
	.word	1
	.word	.LC31
	.word	_ZL9MMC5Sound+9
	.word	1
	.word	.LC32
	.word	_ZL9MMC5Sound+12
	.word	-2147483644
	.word	.LC33
	.word	_ZL9MMC5Sound+16
	.word	-2147483644
	.word	.LC34
	.word	_ZL9MMC5Sound+20
	.word	-2147483644
	.word	.LC35
	.word	_ZL9MMC5Sound+24
	.word	-2147483644
	.word	.LC36
	.word	_ZL9MMC5Sound+28
	.word	-2147483644
	.word	.LC37
	.word	_ZL9MMC5Sound+32
	.word	-2147483644
	.word	.LC38
	.word	_ZL9MMC5Sound+36
	.word	-2147483644
	.word	.LC39
	.word	0
	.zero	8
	.section	.bss._ZL9MMC5Sound,"aw",@nobits
	.align	2
	.type	_ZL9MMC5Sound, @object
	.size	_ZL9MMC5Sound, 40
_ZL9MMC5Sound:
	.zero	40
	.hidden	MMC5CartList
	.globl	MMC5CartList
	.section	.data.MMC5CartList,"aw"
	.align	2
	.type	MMC5CartList, @object
	.size	MMC5CartList, 208
MMC5CartList:
	.word	1867399954
	.byte	4
	.zero	3
	.word	368995599
	.byte	2
	.zero	3
	.word	1730093992
	.byte	0
	.zero	3
	.word	-850496464
	.byte	0
	.zero	3
	.word	-316381762
	.byte	0
	.zero	3
	.word	-30111535
	.byte	2
	.zero	3
	.word	247906339
	.byte	1
	.zero	3
	.word	184236382
	.byte	0
	.zero	3
	.word	485296239
	.byte	2
	.zero	3
	.word	-1665475547
	.byte	1
	.zero	3
	.word	1670822280
	.byte	2
	.zero	3
	.word	-1676118485
	.byte	2
	.zero	3
	.word	-1337455895
	.byte	0
	.zero	3
	.word	-1267507284
	.byte	0
	.zero	3
	.word	-180328581
	.byte	4
	.zero	3
	.word	-286677374
	.byte	2
	.zero	3
	.word	-105634801
	.byte	2
	.zero	3
	.word	-1931183909
	.byte	2
	.zero	3
	.word	-267262832
	.byte	4
	.zero	3
	.word	-1132397742
	.byte	1
	.zero	3
	.word	407642404
	.byte	4
	.zero	3
	.word	-292657837
	.byte	4
	.zero	3
	.word	-718083697
	.byte	1
	.zero	3
	.word	972213835
	.byte	2
	.zero	3
	.word	-1149271398
	.byte	0
	.zero	3
	.word	-1398712765
	.byte	2
	.zero	3
	.section	.sbss._ZL9MMC5MemIn,"aw",@nobits
	.align	2
	.type	_ZL9MMC5MemIn, @object
	.size	_ZL9MMC5MemIn, 5
_ZL9MMC5MemIn:
	.zero	5
	.section	.sbss._ZL16MMC5ROMWrProtect,"aw",@nobits
	.align	2
	.type	_ZL16MMC5ROMWrProtect, @object
	.size	_ZL16MMC5ROMWrProtect, 4
_ZL16MMC5ROMWrProtect:
	.zero	4
	.section	.bss._ZL13MMC5WRAMIndex,"aw",@nobits
	.align	2
	.type	_ZL13MMC5WRAMIndex, @object
	.size	_ZL13MMC5WRAMIndex, 128
_ZL13MMC5WRAMIndex:
	.zero	128
	.section	.sbss._ZL12MMC5WRAMsize,"aw",@nobits
	.type	_ZL12MMC5WRAMsize, @object
	.size	_ZL12MMC5WRAMsize, 1
_ZL12MMC5WRAMsize:
	.zero	1
	.section	.sbss._ZL5ExRAM,"aw",@nobits
	.align	2
	.type	_ZL5ExRAM, @object
	.size	_ZL5ExRAM, 4
_ZL5ExRAM:
	.zero	4
	.section	.sbss._ZL8MMC5fill,"aw",@nobits
	.align	2
	.type	_ZL8MMC5fill, @object
	.size	_ZL8MMC5fill, 4
_ZL8MMC5fill:
	.zero	4
	.section	.sbss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 4
_ZL4WRAM:
	.zero	4
	.section	.sbss._ZL8WRAMSIZE,"aw",@nobits
	.align	2
	.type	_ZL8WRAMSIZE, @object
	.size	_ZL8WRAMSIZE, 4
_ZL8WRAMSIZE:
	.zero	4
	.section	.sbss._ZL3mul,"aw",@nobits
	.align	2
	.type	_ZL3mul, @object
	.size	_ZL3mul, 2
_ZL3mul:
	.zero	2
	.section	.sbss._ZL9mmc5vsize,"aw",@nobits
	.type	_ZL9mmc5vsize, @object
	.size	_ZL9mmc5vsize, 1
_ZL9mmc5vsize:
	.zero	1
	.section	.sbss._ZL9mmc5psize,"aw",@nobits
	.type	_ZL9mmc5psize, @object
	.size	_ZL9mmc5psize, 1
_ZL9mmc5psize:
	.zero	1
	.section	.sbss._ZL15MMC5LineCounter,"aw",@nobits
	.type	_ZL15MMC5LineCounter, @object
	.size	_ZL15MMC5LineCounter, 1
_ZL15MMC5LineCounter:
	.zero	1
	.section	.sbss._ZL8MMC5IRQR,"aw",@nobits
	.type	_ZL8MMC5IRQR, @object
	.size	_ZL8MMC5IRQR, 1
_ZL8MMC5IRQR:
	.zero	1
	.section	.sbss._ZL6ATFill,"aw",@nobits
	.type	_ZL6ATFill, @object
	.size	_ZL6ATFill, 1
_ZL6ATFill:
	.zero	1
	.section	.sbss._ZL6NTFill,"aw",@nobits
	.type	_ZL6NTFill, @object
	.size	_ZL6NTFill, 1
_ZL6NTFill:
	.zero	1
	.section	.sbss._ZL12NTAMirroring,"aw",@nobits
	.type	_ZL12NTAMirroring, @object
	.size	_ZL12NTAMirroring, 1
_ZL12NTAMirroring:
	.zero	1
	.section	.sbss._ZL7CHRMode,"aw",@nobits
	.type	_ZL7CHRMode, @object
	.size	_ZL7CHRMode, 1
_ZL7CHRMode:
	.zero	1
	.section	.sbss._ZL9IRQEnable,"aw",@nobits
	.type	_ZL9IRQEnable, @object
	.size	_ZL9IRQEnable, 1
_ZL9IRQEnable:
	.zero	1
	.section	.sbss._ZL11IRQScanline,"aw",@nobits
	.type	_ZL11IRQScanline, @object
	.size	_ZL11IRQScanline, 1
_ZL11IRQScanline:
	.zero	1
	.hidden	mmc5ABMode
	.globl	mmc5ABMode
	.section	.sbss.mmc5ABMode,"aw",@nobits
	.type	mmc5ABMode, @object
	.size	mmc5ABMode, 1
mmc5ABMode:
	.zero	1
	.section	.sbss._ZL14WRAMMaskEnable,"aw",@nobits
	.align	2
	.type	_ZL14WRAMMaskEnable, @object
	.size	_ZL14WRAMMaskEnable, 2
_ZL14WRAMMaskEnable:
	.zero	2
	.section	.sbss._ZL9CHRBanksB,"aw",@nobits
	.align	2
	.type	_ZL9CHRBanksB, @object
	.size	_ZL9CHRBanksB, 8
_ZL9CHRBanksB:
	.zero	8
	.section	.bss._ZL9CHRBanksA,"aw",@nobits
	.align	2
	.type	_ZL9CHRBanksA, @object
	.size	_ZL9CHRBanksA, 16
_ZL9CHRBanksA:
	.zero	16
	.section	.sbss._ZL8WRAMPage,"aw",@nobits
	.type	_ZL8WRAMPage, @object
	.size	_ZL8WRAMPage, 1
_ZL8WRAMPage:
	.zero	1
	.section	.sbss._ZL8PRGBanks,"aw",@nobits
	.align	2
	.type	_ZL8PRGBanks, @object
	.size	_ZL8PRGBanks, 4
_ZL8PRGBanks:
	.zero	4
	.section	.sbss._ZL5psfun,"aw",@nobits
	.align	2
	.type	_ZL5psfun, @object
	.size	_ZL5psfun, 4
_ZL5psfun:
	.zero	4
	.section	.sbss._ZL4sfun,"aw",@nobits
	.align	2
	.type	_ZL4sfun, @object
	.size	_ZL4sfun, 4
_ZL4sfun:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
