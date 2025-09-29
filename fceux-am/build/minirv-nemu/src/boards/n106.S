#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"n106.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL5AWRAMj,"ax",@progbits
	.align	2
	.type	_ZL5AWRAMj, @function
_ZL5AWRAMj:
.LFB6:
	.cfi_startproc
	lla	a5,_ZL4WRAM-24576
	add	a0,a0,a5
	lbu	a0,0(a0)
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL5AWRAMj, .-_ZL5AWRAMj
	.section	.text._ZL5BWRAMjh,"ax",@progbits
	.align	2
	.type	_ZL5BWRAMjh, @function
_ZL5BWRAMjh:
.LFB7:
	.cfi_startproc
	lla	a5,_ZL4WRAM-24576
	add	a0,a0,a5
	sb	a1,0(a0)
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL5BWRAMjh, .-_ZL5BWRAMjh
	.section	.text._ZL14Namco_Read4800j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read4800j, @function
_ZL14Namco_Read4800j:
.LFB11:
	.cfi_startproc
	lla	a3,_ZL5dopol
	lbu	a5,0(a3)
	lla	a4,_ZL4IRAM
	andi	a2,a5,127
	add	a4,a4,a2
	slli	a2,a5,24
	srai	a2,a2,24
	lbu	a0,0(a4)
	blt	a2,zero,.L6
	ret
.L6:
	addi	a5,a5,1
	ori	a5,a5,-128
	sb	a5,0(a3)
	ret
	.cfi_endproc
.LFE11:
	.size	_ZL14Namco_Read4800j, .-_ZL14Namco_Read4800j
	.section	.text._ZL14Namco_Read5000j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read5000j, @function
_ZL14Namco_Read5000j:
.LFB12:
	.cfi_startproc
	la a0, _ZL8IRQCount; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL14Namco_Read5000j, .-_ZL14Namco_Read5000j
	.section	.text._ZL14Namco_Read5800j,"ax",@progbits
	.align	2
	.type	_ZL14Namco_Read5800j, @function
_ZL14Namco_Read5800j:
.LFB13:
	.cfi_startproc
	la a0, _ZL8IRQCount; lhu a0, 0(a0);
	srli	a0,a0,8
	ret
	.cfi_endproc
.LFE13:
	.size	_ZL14Namco_Read5800j, .-_ZL14Namco_Read5800j
	.section	.text._ZL8FixCacheii,"ax",@progbits
	.align	2
	.type	_ZL8FixCacheii, @function
_ZL8FixCacheii:
.LFB19:
	.cfi_startproc
	srai	a5,a0,3
	li	a4,2
	andi	a0,a0,7
	andi	a5,a5,7
	beq	a0,a4,.L10
	li	a4,4
	beq	a0,a4,.L11
	beq	a0,zero,.L13
	ret
.L13:
	slli	a5,a5,2
	lla	a4,_ZL9FreqCache
	add	a4,a4,a5
	lw	a5,0(a4)
	andi	a5,a5,-256
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
.L11:
	slli	a5,a5,2
	lla	a4,_ZL9FreqCache
	add	a4,a4,a5
	lw	a5,0(a4)
	li	a3,-196608
	addi	a3,a3,-1
	and	a5,a5,a3
	slli	a1,a1,16
	li	a3,196608
	and	a1,a1,a3
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
.L10:
	slli	a5,a5,2
	lla	a4,_ZL9FreqCache
	add	a4,a4,a5
	lw	a5,0(a4)
	li	a3,-65536
	addi	a3,a3,255
	and	a5,a5,a3
	slli	a1,a1,8
	or	a5,a5,a1
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE19:
	.size	_ZL8FixCacheii, .-_ZL8FixCacheii
	.section	.text._ZL10NamcoSoundi,"ax",@progbits
	.align	2
	.type	_ZL10NamcoSoundi, @function
_ZL10NamcoSoundi:
.LFB22:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE22:
	.size	_ZL10NamcoSoundi, .-_ZL10NamcoSoundi
	.section	.text._ZL6SyncHQi,"ax",@progbits
	.align	2
	.type	_ZL6SyncHQi, @function
_ZL6SyncHQi:
.LFB23:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE23:
	.size	_ZL6SyncHQi, .-_ZL6SyncHQi
	.section	.text._ZL14DoNamcoSoundHQv,"ax",@progbits
	.align	2
	.type	_ZL14DoNamcoSoundHQv, @function
_ZL14DoNamcoSoundHQv:
.LFB25:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE25:
	.size	_ZL14DoNamcoSoundHQv, .-_ZL14DoNamcoSoundHQv
	.section	.text._ZL10SyncMirrorv,"ax",@progbits
	.align	2
	.type	_ZL10SyncMirrorv, @function
_ZL10SyncMirrorv:
.LFB8:
	.cfi_startproc
	la a5, _ZL5gorko; lbu a5, 0(a5);
	li	a4,2
	beq	a5,a4,.L18
	bgtu	a5,a4,.L19
	beq	a5,zero,.L20
	li	a0,1
	tail	_Z9setmirrori
.L19:
	li	a4,3
	bne	a5,a4,.L17
.L20:
	li	a0,2
	tail	_Z9setmirrori
.L17:
	ret
.L18:
	li	a0,0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE8:
	.size	_ZL10SyncMirrorv, .-_ZL10SyncMirrorv
	.section	.text._ZL12NamcoIRQHooki,"ax",@progbits
	.align	2
	.type	_ZL12NamcoIRQHooki, @function
_ZL12NamcoIRQHooki:
.LFB10:
	.cfi_startproc
	la a5, _ZL4IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L32
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL8IRQCount
	lhu	a5,0(s0)
	sw	ra,12(sp)
	.cfi_offset 1, -4
	li	a4,32768
	add	a0,a5,a0
	slli	a0,a0,16
	srli	a0,a0,16
	addi	a4,a4,-2
	sh	a0,0(s0)
	bgtu	a0,a4,.L35
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L32:
	ret
.L35:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	li	a0,1
	call	_Z14X6502_IRQBegini
	la a5, _ZL4IRQa; sb zero, 0(a5);
	li	a5,-32768
	xori	a5,a5,-1
	lw	ra,12(sp)
	.cfi_restore 1
	sh	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_ZL12NamcoIRQHooki, .-_ZL12NamcoIRQHooki
	.section	.text._ZL6FixCRRv,"ax",@progbits
	.align	2
	.type	_ZL6FixCRRv, @function
_ZL6FixCRRv:
.LFB17:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 1, -4
	lla	s1,_ZL3CHR
	li	s0,0
	lla	s3,_ZL6gorfus
	lla	s5,_ZL5is210
	li	s4,223
	li	s2,8
.L39:
	lbu	a5,0(s3)
	srai	a4,s0,2
	lw	a3,0(s5)
	addi	a4,a4,6
	sra	a5,a5,a4
	andi	a5,a5,1
	or	a5,a5,a3
	lbu	a1,0(s1)
	slli	a0,s0,10
	bne	a5,zero,.L37
	bgtu	a1,s4,.L38
.L37:
	call	_Z7setchr1jj
.L38:
	addi	s0,s0,1
	addi	s1,s1,1
	bne	s0,s2,.L39
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
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
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	_ZL6FixCRRv, .-_ZL6FixCRRv
	.section	.text._ZL18Mapper19C0D8_writejh,"ax",@progbits
	.align	2
	.type	_ZL18Mapper19C0D8_writejh, @function
_ZL18Mapper19C0D8_writejh:
.LFB18:
	.cfi_startproc
	li	a5,-49152
	add	a2,a0,a5
	srli	a2,a2,11
	lla	a5,_ZL7NTAPage
	add	a5,a5,a2
	sb	a1,0(a5)
	li	a5,223
	bleu	a1,a5,.L43
	slli	a1,a1,10
	andi	a5,a1,1024
	lla	a0,NTARAM
	li	a1,1
	add	a0,a0,a5
	tail	_Z9setntamemPhij
.L43:
	la a5, CHRmask1; lw a5, 0(a5);
	and	a1,a1,a5
	slli	a5,a1,10
	la a0, CHRptr; lw a0, 0(a0);
	li	a1,0
	add	a0,a0,a5
	tail	_Z9setntamemPhij
	.cfi_endproc
.LFE18:
	.size	_ZL18Mapper19C0D8_writejh, .-_ZL18Mapper19C0D8_writejh
	.section	.text._ZL5M19SCv,"ax",@progbits
	.align	2
	.type	_ZL5M19SCv, @function
_ZL5M19SCv:
.LFB27:
	.cfi_startproc
	la a5, FSettings+60; lw a5, 0(a5);
	bne	a5,zero,.L49
	ret
.L49:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,_ZL6vcount
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,32
	li	a1,0
	lla	a0,_ZL9PlayIndex
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	memset
	.cfi_endproc
.LFE27:
	.size	_ZL5M19SCv, .-_ZL5M19SCv
	.section	.text._ZL22Mapper210_StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL22Mapper210_StateRestorei, @function
_ZL22Mapper210_StateRestorei:
.LFB32:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL3PRG
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL6FixCRRv
	.cfi_endproc
.LFE32:
	.size	_ZL22Mapper210_StateRestorei, .-_ZL22Mapper210_StateRestorei
	.section	.text._ZL21Mapper19_StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL21Mapper19_StateRestorei, @function
_ZL21Mapper19_StateRestorei:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL3PRG
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	lbu	a1,0(s0)
	li	a0,32768
	lla	s1,_ZL7NTAPage
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	li	s4,223
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	li	s0,0
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
	lla	s6,CHRptr
	lla	s5,CHRmask1
	lla	s3,NTARAM
	li	s2,4
.L55:
	lbu	a5,0(s1)
	mv	a2,s0
	li	a1,1
	slli	a0,a5,10
	andi	a0,a0,1024
	add	a0,s3,a0
	bgtu	a5,s4,.L60
	lw	a4,0(s5)
	lw	a0,0(s6)
	li	a1,0
	and	a5,a5,a4
	slli	a5,a5,10
	add	a0,a0,a5
.L60:
	addi	s0,s0,1
	call	_Z9setntamemPhij
	addi	s1,s1,1
	bne	s0,s2,.L55
	lla	s0,_ZL4IRAM
	li	s1,64
	call	_ZL6FixCRRv
	lla	s2,_ZL4IRAM+64
	call	_ZL10SyncMirrorv
	sub	s1,s1,s0
.L56:
	lbu	a1,64(s0)
	add	a0,s1,s0
	addi	s0,s0,1
	call	_ZL8FixCacheii
	bne	s0,s2,.L56
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
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
	lw	s6,0(sp)
	.cfi_restore 22
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	_ZL21Mapper19_StateRestorei, .-_ZL21Mapper19_StateRestorei
	.section	.text._ZL10N106_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10N106_Powerv, @function
_ZL10N106_Powerv:
.LFB30:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	.cfi_offset 8, -8
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL14Mapper19_writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL14Mapper19_writejh
	addi	a1,a1,-1
	addi	a0,a0,32
	call	_Z15SetWriteHandleriiPFvjhE
	la s0, _ZL5is210; lw s0, 0(s0);
	beq	s0,zero,.L72
.L62:
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL5AWRAMj
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL5BWRAMjh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lla	a2,_ZL4WRAM
	li	a1,24576
	li	a0,8
	call	_Z16FCEU_CheatAddRAMijPh
	lla	s0,_ZL3PRG
	lbu	a1,0(s0)
	li	a5,-1
	li	a0,32768
	la a4, _ZL6gorfus; sb a5, 0(a4);
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	call	_Z7setprg8jj
	li	a1,63
	li	a0,57344
	call	_Z7setprg8jj
	call	_ZL6FixCRRv
	la a5, _ZL7battery; lw a5, 0(a5);
	beq	a5,zero,.L73
.L66:
	lla	s0,_ZL4IRAM
	li	s1,64
	lla	s2,_ZL4IRAM+64
	sub	s1,s1,s0
.L67:
	lbu	a1,64(s0)
	add	a0,s1,s0
	addi	s0,s0,1
	call	_ZL8FixCacheii
	bne	s0,s2,.L67
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L72:
	.cfi_restore_state
	li	a1,57344
	lla	a2,_ZL18Mapper19C0D8_writejh
	addi	a1,a1,-1
	li	a0,49152
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL14Namco_Read4800j
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	li	a1,20480
	lla	a2,_ZL14Namco_Read5000j
	addi	a1,a1,2047
	li	a0,20480
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	li	a0,24576
	lla	a2,_ZL14Namco_Read5800j
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	lla	s1,_ZL7NTAPage
	li	a5,-1
	sw	a5,0(s1)
	li	s4,223
	lla	s6,CHRptr
	lla	s5,CHRmask1
	lla	s3,NTARAM
	li	s2,4
.L65:
	lbu	a5,0(s1)
	mv	a2,s0
	li	a1,1
	slli	a0,a5,10
	andi	a0,a0,1024
	add	a0,s3,a0
	bgtu	a5,s4,.L71
	lw	a4,0(s5)
	lw	a0,0(s6)
	li	a1,0
	and	a5,a5,a4
	slli	a5,a5,10
	add	a0,a0,a5
.L71:
	addi	s0,s0,1
	call	_Z9setntamemPhij
	addi	s1,s1,1
	bne	s0,s2,.L65
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	lw	s6,0(sp)
	.cfi_restore 22
	j	.L62
.L73:
	li	a2,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z15FCEU_MemoryRandPhjb
	li	a2,1
	li	a1,128
	lla	a0,_ZL4IRAM
	call	_Z15FCEU_MemoryRandPhjb
	j	.L66
	.cfi_endproc
.LFE30:
	.size	_ZL10N106_Powerv, .-_ZL10N106_Powerv
	.section	.text._ZL14Mapper19_writejh,"ax",@progbits
	.align	2
	.type	_ZL14Mapper19_writejh, @function
_ZL14Mapper19_writejh:
.LFB20:
	.cfi_startproc
	li	a4,65536
	addi	a4,a4,-2048
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	and	a0,a0,a4
	li	a3,16384
	li	a5,-32768
	sw	s0,8(sp)
	sw	ra,12(sp)
	add	a5,a0,a5
	addi	a3,a3,-2048
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a1
	bleu	a5,a3,.L103
	li	a5,57344
	beq	a0,a5,.L78
	bgtu	a0,a5,.L79
	li	a5,20480
	beq	a0,a5,.L80
	li	a5,24576
	addi	a5,a5,-2048
	beq	a0,a5,.L81
	li	a5,20480
	addi	a5,a5,-2048
	bne	a0,a5,.L74
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,_ZL5dopol
	lbu	a0,0(s1)
	andi	a5,a0,64
	beq	a5,zero,.L86
	la a5, FSettings+60; lw a5, 0(a5);
	beq	a5,zero,.L87
	lla	a5,GameExpSound
	lla	a4,_ZL10NamcoSoundi
	sw	a4,0(a5)
	lla	a4,_ZL14DoNamcoSoundHQv
	sw	a4,8(a5)
	lla	a4,_ZL6SyncHQi
	sw	a4,12(a5)
.L87:
	mv	a1,s0
	call	_ZL8FixCacheii
	lbu	a0,0(s1)
.L86:
	andi	a4,a0,127
	lla	a5,_ZL4IRAM
	add	a5,a5,a4
	sb	s0,0(a5)
	slli	a5,a0,24
	srai	a5,a5,24
	blt	a5,zero,.L104
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L74
.L79:
	li	a5,61440
	beq	a0,a5,.L83
	beq	a0,a4,.L84
	addi	a5,a5,-2048
	bne	a0,a5,.L74
	andi	a5,a1,-64
	sw	s1,4(sp)
	la a4, _ZL6gorfus; sb a5, 0(a4);
	.cfi_offset 9, -12
	lla	s1,_ZL3PRG
	call	_ZL6FixCRRv
	lbu	a1,0(s1)
	andi	s0,s0,63
	li	a0,32768
	sb	s0,1(s1)
.L102:
	call	_Z7setprg8jj
	lbu	a1,1(s1)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s1)
	li	a0,49152
	call	_Z7setprg8jj
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,63
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L103:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	srli	a0,a5,11
	srai	a4,a0,2
	addi	a4,a4,6
	la a5, _ZL6gorfus; lbu a5, 0(a5);
	sra	a5,a5,a4
	lla	a4,_ZL3CHR
	add	a4,a4,a0
	andi	a5,a5,1
	sb	a1,0(a4)
	la a4, _ZL5is210; lw a4, 0(a4);
	or	a5,a5,a4
	bne	a5,zero,.L76
	li	a5,223
	bleu	a1,a5,.L76
.L74:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L76:
	.cfi_restore_state
	mv	a1,s0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	slli	a0,a0,10
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr1jj
.L81:
	.cfi_restore_state
	lla	a2,_ZL8IRQCount
	lbu	a5,0(a2)
	li	a3,32768
	slli	a4,a1,8
	addi	a3,a3,-256
	and	a4,a4,a3
	or	a5,a5,a4
	andi	s0,a1,-128
	sh	a5,0(a2)
	li	a0,1
	la a5, _ZL4IRQa; sb s0, 0(a5);
.L101:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z12X6502_IRQEndi
.L84:
	.cfi_restore_state
	la a5, _ZL5dopol; sb a1, 0(a5);
	j	.L74
.L80:
	li	a0,1
	la a5, _ZL8IRQCount; sb a1, 0(a5);
	j	.L101
.L83:
	sw	s1,4(sp)
	andi	s0,s0,63
	.cfi_remember_state
	.cfi_offset 9, -12
	lla	s1,_ZL3PRG
	lbu	a1,0(s1)
	li	a0,32768
	sb	s0,2(s1)
	j	.L102
.L78:
	.cfi_restore_state
	sw	s1,4(sp)
	.cfi_offset 9, -12
	andi	a1,a1,63
	lla	s1,_ZL3PRG
	sb	a1,0(s1)
	la a5, _ZL5is210; lw a5, 0(a5);
	bne	a5,zero,.L105
	li	a0,32768
	j	.L102
.L104:
	addi	a0,a0,1
	ori	a0,a0,-128
	sb	a0,0(s1)
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L74
.L105:
	.cfi_restore_state
	srli	s0,s0,6
	la a5, _ZL5gorko; sb s0, 0(a5);
	call	_ZL10SyncMirrorv
	lbu	a1,0(s1)
	li	a0,32768
	j	.L102
	.cfi_endproc
.LFE20:
	.size	_ZL14Mapper19_writejh, .-_ZL14Mapper19_writejh
	.section	.text._Z12Mapper19_ESIv,"ax",@progbits
	.align	2
	.globl	_Z12Mapper19_ESIv
	.hidden	_Z12Mapper19_ESIv
	.type	_Z12Mapper19_ESIv, @function
_Z12Mapper19_ESIv:
.LFB28:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,_ZL6vcount
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,32
	li	a1,0
	lla	a0,_ZL9PlayIndex
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	memset
	.cfi_endproc
.LFE28:
	.size	_Z12Mapper19_ESIv, .-_Z12Mapper19_ESIv
	.section	.text._Z12NSFN106_Initv,"ax",@progbits
	.align	2
	.globl	_Z12NSFN106_Initv
	.hidden	_Z12NSFN106_Initv
	.type	_Z12NSFN106_Initv, @function
_Z12NSFN106_Initv:
.LFB29:
	.cfi_startproc
	li	a0,65536
	li	a1,65536
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a2,_ZL14Mapper19_writejh
	addi	a1,a1,-1
	addi	a0,a0,-2048
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL14Mapper19_writejh
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,20480
	li	a0,20480
	lla	a2,_ZL14Namco_Read4800j
	addi	a1,a1,-1
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	li	a2,32
	li	a1,0
	lla	a5,_ZL5M19SCv
	lla	a0,_ZL6vcount
	la a4, GameExpSound+16; sw a5, 0(a4);
	call	memset
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,32
	li	a1,0
	lla	a0,_ZL9PlayIndex
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	memset
	.cfi_endproc
.LFE29:
	.size	_Z12NSFN106_Initv, .-_Z12NSFN106_Initv
	.section	.rodata._Z13Mapper19_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"IRAM"
	.section	.text._Z13Mapper19_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper19_InitP8CartInfo
	.hidden	_Z13Mapper19_InitP8CartInfo
	.type	_Z13Mapper19_InitP8CartInfo, @function
_Z13Mapper19_InitP8CartInfo:
.LFB31:
	.cfi_startproc
	lw	a5,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a4,_ZL10N106_Powerv
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	sw	a4,0(a0)
	la a4, _ZL7battery; sw a5, 0(a4);
	lla	a5,_ZL12NamcoIRQHooki
	la a4, MapIRQHook; sw a5, 0(a4);
	lla	a5,_ZL21Mapper19_StateRestorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL5M19SCv
	la a4, GameExpSound+16; sw a5, 0(a4);
	la a4, _ZL5is210; sw zero, 0(a4);
	la a5, FSettings+60; lw a5, 0(a5);
	mv	s0,a0
	bne	a5,zero,.L120
.L111:
	li	a2,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z15FCEU_MemoryRandPhjb
	li	a2,1
	li	a1,128
	lla	a0,_ZL4IRAM
	call	_Z15FCEU_MemoryRandPhjb
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z10AddExStatePvjiPKc
	lla	a3,.LC1
	li	a2,0
	li	a1,128
	lla	a0,_ZL4IRAM
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL14N106_StateRegs
	call	_Z10AddExStatePvjiPKc
	lw	a5,48(s0)
	beq	a5,zero,.L110
	lla	a5,_ZL4WRAM
	sw	a5,12(s0)
	li	a5,8192
	sw	a5,28(s0)
	lla	a5,_ZL4IRAM
	sw	a5,16(s0)
	li	a5,128
	sw	a5,32(s0)
.L110:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L120:
	.cfi_restore_state
	li	a2,32
	li	a1,0
	lla	a0,_ZL6vcount
	call	memset
	li	a2,32
	li	a1,0
	lla	a0,_ZL9PlayIndex
	call	memset
	j	.L111
	.cfi_endproc
.LFE31:
	.size	_Z13Mapper19_InitP8CartInfo, .-_Z13Mapper19_InitP8CartInfo
	.section	.text._Z14Mapper210_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper210_InitP8CartInfo
	.hidden	_Z14Mapper210_InitP8CartInfo
	.type	_Z14Mapper210_InitP8CartInfo, @function
_Z14Mapper210_InitP8CartInfo:
.LFB33:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	lla	a5,_ZL22Mapper210_StateRestorei
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a4, GameStateRestore; sw a5, 0(a4);
	lla	a5,_ZL10N106_Powerv
	sw	a5,0(a0)
	li	a2,1
	li	a5,1
	li	a1,8192
	lla	a0,_ZL4WRAM
	la a4, _ZL5is210; sw a5, 0(a4);
	call	_Z15FCEU_MemoryRandPhjb
	lla	a3,.LC0
	li	a2,0
	li	a1,8192
	lla	a0,_ZL4WRAM
	call	_Z10AddExStatePvjiPKc
	lw	ra,12(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL14N106_StateRegs
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE33:
	.size	_Z14Mapper210_InitP8CartInfo, .-_Z14Mapper210_InitP8CartInfo
	.section	.sbss._ZL7battery,"aw",@nobits
	.align	2
	.type	_ZL7battery, @object
	.size	_ZL7battery, 4
_ZL7battery:
	.zero	4
	.section	.bss._ZL6vcount,"aw",@nobits
	.align	2
	.type	_ZL6vcount, @object
	.size	_ZL6vcount, 32
_ZL6vcount:
	.zero	32
	.section	.bss._ZL9PlayIndex,"aw",@nobits
	.align	2
	.type	_ZL9PlayIndex, @object
	.size	_ZL9PlayIndex, 32
_ZL9PlayIndex:
	.zero	32
	.section	.bss._ZL9FreqCache,"aw",@nobits
	.align	2
	.type	_ZL9FreqCache, @object
	.size	_ZL9FreqCache, 32
_ZL9FreqCache:
	.zero	32
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"PRG"
	.align	2
.LC3:
	.string	"CHR"
	.align	2
.LC4:
	.string	"NTA"
	.align	2
.LC5:
	.string	"GORF"
	.align	2
.LC6:
	.string	"DOPO"
	.align	2
.LC7:
	.string	"GORK"
	.section	.data._ZL14N106_StateRegs,"aw"
	.align	2
	.type	_ZL14N106_StateRegs, @object
	.size	_ZL14N106_StateRegs, 84
_ZL14N106_StateRegs:
	.word	_ZL3PRG
	.word	3
	.word	.LC2
	.word	_ZL3CHR
	.word	8
	.word	.LC3
	.word	_ZL7NTAPage
	.word	4
	.word	.LC4
	.word	_ZL6gorfus
	.word	1
	.word	.LC5
	.word	_ZL5dopol
	.word	1
	.word	.LC6
	.word	_ZL5gorko
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL3CHR,"aw",@nobits
	.align	2
	.type	_ZL3CHR, @object
	.size	_ZL3CHR, 8
_ZL3CHR:
	.zero	8
	.section	.sbss._ZL3PRG,"aw",@nobits
	.align	2
	.type	_ZL3PRG, @object
	.size	_ZL3PRG, 3
_ZL3PRG:
	.zero	3
	.section	.sbss._ZL5is210,"aw",@nobits
	.align	2
	.type	_ZL5is210, @object
	.size	_ZL5is210, 4
_ZL5is210:
	.zero	4
	.section	.sbss._ZL5gorko,"aw",@nobits
	.type	_ZL5gorko, @object
	.size	_ZL5gorko, 1
_ZL5gorko:
	.zero	1
	.section	.sbss._ZL6gorfus,"aw",@nobits
	.type	_ZL6gorfus, @object
	.size	_ZL6gorfus, 1
_ZL6gorfus:
	.zero	1
	.section	.sbss._ZL5dopol,"aw",@nobits
	.type	_ZL5dopol, @object
	.size	_ZL5dopol, 1
_ZL5dopol:
	.zero	1
	.section	.sbss._ZL7NTAPage,"aw",@nobits
	.align	2
	.type	_ZL7NTAPage, @object
	.size	_ZL7NTAPage, 4
_ZL7NTAPage:
	.zero	4
	.section	.bss._ZL4IRAM,"aw",@nobits
	.align	2
	.type	_ZL4IRAM, @object
	.size	_ZL4IRAM, 128
_ZL4IRAM:
	.zero	128
	.section	.bss._ZL4WRAM,"aw",@nobits
	.align	2
	.type	_ZL4WRAM, @object
	.size	_ZL4WRAM, 8192
_ZL4WRAM:
	.zero	8192
	.section	.sbss._ZL4IRQa,"aw",@nobits
	.type	_ZL4IRQa, @object
	.size	_ZL4IRQa, 1
_ZL4IRQa:
	.zero	1
	.section	.sbss._ZL8IRQCount,"aw",@nobits
	.align	1
	.type	_ZL8IRQCount, @object
	.size	_ZL8IRQCount, 2
_ZL8IRQCount:
	.zero	2
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
