#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"80.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL11M80RamWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M80RamWritejh, @function
_ZL11M80RamWritejh:
.LFB7:
	.cfi_startproc
	la a4, _ZL11wram_enable; lbu a4, 0(a4);
	li	a5,163
	beq	a4,a5,.L4
	ret
.L4:
	andi	a0,a0,255
	lla	a5,_ZL4wram
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL11M80RamWritejh, .-_ZL11M80RamWritejh
	.section	.text._ZL10M80RamReadj,"ax",@progbits
	.align	2
	.type	_ZL10M80RamReadj, @function
_ZL10M80RamReadj:
.LFB8:
	.cfi_startproc
	la a4, _ZL11wram_enable; lbu a4, 0(a4);
	li	a5,163
	beq	a4,a5,.L8
	li	a0,255
	ret
.L8:
	andi	a0,a0,255
	lla	a5,_ZL4wram
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL10M80RamReadj, .-_ZL10M80RamReadj
	.section	.text._ZL4Syncv,"ax",@progbits
	.align	2
	.type	_ZL4Syncv, @function
_ZL4Syncv:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s0,_ZL4preg
	lbu	a1,0(s0)
	li	a0,32768
	call	_Z7setprg8jj
	lbu	a1,1(s0)
	li	a0,40960
	call	_Z7setprg8jj
	lbu	a1,2(s0)
	li	a0,49152
	lla	s0,_ZL4creg
	call	_Z7setprg8jj
	li	a1,-1
	li	a0,57344
	call	_Z7setprg8jj
	lbu	a1,0(s0)
	li	a0,0
	srli	a1,a1,1
	andi	a1,a1,63
	call	_Z7setchr2jj
	lbu	a1,1(s0)
	li	a0,4096
	addi	a0,a0,-2048
	srli	a1,a1,1
	andi	a1,a1,63
	call	_Z7setchr2jj
	lbu	a1,2(s0)
	li	a0,4096
	call	_Z7setchr1jj
	lbu	a1,3(s0)
	li	a0,4096
	addi	a0,a0,1024
	call	_Z7setchr1jj
	lbu	a1,4(s0)
	li	a0,8192
	addi	a0,a0,-2048
	call	_Z7setchr1jj
	lbu	a1,5(s0)
	li	a0,8192
	addi	a0,a0,-1024
	call	_Z7setchr1jj
	la a5, _ZL8isExMirr; lbu a5, 0(a5);
	beq	a5,zero,.L10
	la a4, _ZL7lastppu; lw a4, 0(a4);
	lla	a5,_ZL6mcache
	add	a5,a5,a4
	lbu	a0,0(a5)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	a0,a0,2
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
.L10:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, _ZL4mirr; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE6:
	.size	_ZL4Syncv, .-_ZL4Syncv
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB15:
	.cfi_startproc
	tail	_ZL4Syncv
	.cfi_endproc
.LFE15:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL8M80Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M80Writejh, @function
_ZL8M80Writejh:
.LFB9:
	.cfi_startproc
	li	a5,-32768
	addi	a5,a5,272
	add	a0,a0,a5
	li	a5,15
	bgtu	a0,a5,.L14
	lla	a4,.L17
	slli	a0,a0,2
	add	a0,a0,a4
	lw	a5,0(a0)
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M80Writejh,"a",@progbits
	.align	2
	.align	2
.L17:
	.word	.L27-.L17
	.word	.L26-.L17
	.word	.L25-.L17
	.word	.L24-.L17
	.word	.L23-.L17
	.word	.L22-.L17
	.word	.L21-.L17
	.word	.L14-.L17
	.word	.L20-.L17
	.word	.L14-.L17
	.word	.L19-.L17
	.word	.L19-.L17
	.word	.L18-.L17
	.word	.L18-.L17
	.word	.L16-.L17
	.word	.L16-.L17
	.section	.text._ZL8M80Writejh
.L16:
	la a5, _ZL4preg+2; sb a1, 0(a5);
	tail	_ZL4Syncv
.L19:
	la a5, _ZL4preg; sb a1, 0(a5);
	tail	_ZL4Syncv
.L18:
	la a5, _ZL4preg+1; sb a1, 0(a5);
	tail	_ZL4Syncv
.L14:
	ret
.L24:
	srli	a5,a1,7
	la a4, _ZL4creg+3; sb a1, 0(a4);
	la a4, _ZL6mcache+5; sb a5, 0(a4);
	tail	_ZL4Syncv
.L20:
	la a5, _ZL11wram_enable; sb a1, 0(a5);
	ret
.L23:
	srli	a5,a1,7
	la a4, _ZL4creg+4; sb a1, 0(a4);
	la a4, _ZL6mcache+6; sb a5, 0(a4);
	tail	_ZL4Syncv
.L22:
	srli	a5,a1,7
	la a4, _ZL4creg+5; sb a1, 0(a4);
	la a4, _ZL6mcache+7; sb a5, 0(a4);
	tail	_ZL4Syncv
.L21:
	andi	a1,a1,1
	la a5, _ZL4mirr; sb a1, 0(a5);
	tail	_ZL4Syncv
.L26:
	srli	a5,a1,7
	slli	a4,a5,8
	or	a5,a5,a4
	la a4, _ZL6mcache+2; sh a5, 0(a4);
	la a4, _ZL4creg+1; sb a1, 0(a4);
	tail	_ZL4Syncv
.L25:
	srli	a5,a1,7
	la a4, _ZL4creg+2; sb a1, 0(a4);
	la a4, _ZL6mcache+4; sb a5, 0(a4);
	tail	_ZL4Syncv
.L27:
	srli	a5,a1,7
	slli	a4,a5,8
	or	a5,a5,a4
	la a4, _ZL6mcache; sh a5, 0(a4);
	la a4, _ZL4creg; sb a1, 0(a4);
	tail	_ZL4Syncv
	.cfi_endproc
.LFE9:
	.size	_ZL8M80Writejh, .-_ZL8M80Writejh
	.section	.text._ZL8M80Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M80Powerv, @function
_ZL8M80Powerv:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a4, _ZL11wram_enable; sb a5, 0(a4);
	call	_ZL4Syncv
	li	s0,32768
	li	a0,32768
	addi	a1,s0,-1
	lla	a2,_ZL10M80RamReadj
	addi	a0,a0,-256
	call	_Z14SetReadHandleriiPFhjE
	li	a0,32768
	addi	a1,s0,-1
	lla	a2,_ZL11M80RamWritejh
	addi	a0,a0,-256
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,32768
	li	a0,32768
	lla	a2,_ZL8M80Writejh
	addi	a1,a1,-257
	addi	a0,a0,-272
	call	_Z15SetWriteHandleriiPFvjhE
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE12:
	.size	_ZL8M80Powerv, .-_ZL8M80Powerv
	.section	.text._ZL8M95Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M95Powerv, @function
_ZL8M95Powerv:
.LFB14:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL6mcache
	li	a4,-2
	li	s0,65536
	la a3, _ZL4preg+2; sb a4, 0(a3);
	sw	zero,0(a5)
	sw	zero,4(a5)
	call	_ZL4Syncv
	addi	a1,s0,-1
	lla	a2,_ZL8M95Writejh
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_Z6CartBRj
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE14:
	.size	_ZL8M95Powerv, .-_ZL8M95Powerv
	.section	.text._ZL9M207Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M207Powerv, @function
_ZL9M207Powerv:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,_ZL6mcache
	sw	zero,0(a5)
	sw	zero,4(a5)
	call	_ZL4Syncv
	li	a1,32768
	li	a0,32768
	lla	a2,_ZL8M80Writejh
	addi	a1,a1,-257
	addi	a0,a0,-272
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE13:
	.size	_ZL9M207Powerv, .-_ZL9M207Powerv
	.section	.text._ZL8M95Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M95Writejh, @function
_ZL8M95Writejh:
.LFB10:
	.cfi_startproc
	li	a5,61440
	addi	a5,a5,1
	and	a0,a0,a5
	li	a5,32768
	beq	a0,a5,.L35
	addi	a5,a5,1
	beq	a0,a5,.L36
	ret
.L36:
	la a5, _ZL3cmd; lbu a5, 0(a5);
	andi	a5,a5,7
	lla	a4,.L40
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a5,0(a5)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	add	a5,a5,a4
	jr	a5
	.section	.rodata._ZL8M95Writejh,"a",@progbits
	.align	2
	.align	2
.L40:
	.word	.L38-.L40
	.word	.L46-.L40
	.word	.L45-.L40
	.word	.L44-.L40
	.word	.L43-.L40
	.word	.L42-.L40
	.word	.L41-.L40
	.word	.L39-.L40
	.section	.text._ZL8M95Writejh
.L35:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	la a5, _ZL3cmd; sb a1, 0(a5);
	ret
.L39:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	la a5, _ZL4preg+1; sb a1, 0(a5);
	call	_ZL4Syncv
.L47:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL4Syncv
.L46:
	.cfi_restore_state
	srli	a5,a1,5
	andi	a5,a5,1
	slli	a4,a5,8
	or	a5,a5,a4
	andi	a1,a1,31
	la a4, _ZL4creg+1; sb a1, 0(a4);
	la a4, _ZL6mcache+2; sh a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L45:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, _ZL4creg+2; sb a1, 0(a4);
	la a4, _ZL6mcache+4; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L44:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, _ZL4creg+3; sb a1, 0(a4);
	la a4, _ZL6mcache+5; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L43:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, _ZL4creg+4; sb a1, 0(a4);
	la a4, _ZL6mcache+6; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L42:
	srli	a5,a1,5
	andi	a5,a5,1
	andi	a1,a1,31
	la a4, _ZL4creg+5; sb a1, 0(a4);
	la a4, _ZL6mcache+7; sb a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
.L41:
	la a5, _ZL4preg; sb a1, 0(a5);
	call	_ZL4Syncv
	j	.L47
.L38:
	srli	a5,a1,5
	andi	a5,a5,1
	slli	a4,a5,8
	or	a5,a5,a4
	andi	a1,a1,31
	la a4, _ZL4creg; sb a1, 0(a4);
	la a4, _ZL6mcache; sh a5, 0(a4);
	call	_ZL4Syncv
	j	.L47
	.cfi_endproc
.LFE10:
	.size	_ZL8M95Writejh, .-_ZL8M95Writejh
	.section	.text._ZL10MExMirrPPUj,"ax",@progbits
	.align	2
	.type	_ZL10MExMirrPPUj, @function
_ZL10MExMirrPPUj:
.LFB11:
	.cfi_startproc
	li	a5,8192
	bgeu	a0,a5,.L55
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	srli	a0,a0,10
	lla	a5,_ZL6mcache
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	add	a5,a5,a0
	lb	a5,0(a5)
	lla	s0,_ZZL10MExMirrPPUjE8lastmirr
	lb	a4,0(s0)
	lla	s1,_ZZL10MExMirrPPUjE7curmirr
	la a3, _ZL7lastppu; sw a0, 0(a3);
	sb	a5,0(s1)
	bne	a4,a5,.L58
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L55:
	ret
.L58:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	addi	a0,a5,2
	call	_Z9setmirrori
	lbu	a5,0(s1)
	sb	a5,0(s0)
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
.LFE11:
	.size	_ZL10MExMirrPPUj, .-_ZL10MExMirrPPUj
	.section	.text._Z13Mapper80_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper80_InitP8CartInfo
	.hidden	_Z13Mapper80_InitP8CartInfo
	.type	_Z13Mapper80_InitP8CartInfo, @function
_Z13Mapper80_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	lla	a4,_ZL8M80Powerv
	sw	a4,0(a0)
	lw	a5,48(a0)
	la a4, _ZL8isExMirr; sb zero, 0(a4);
	lla	a4,_ZL12StateRestorei
	la a3, GameStateRestore; sw a4, 0(a3);
	beq	a5,zero,.L60
	lla	a5,_ZL4wram
	sw	a5,12(a0)
	li	a5,256
	sw	a5,28(a0)
.L60:
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL11StateRegs80
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE16:
	.size	_Z13Mapper80_InitP8CartInfo, .-_Z13Mapper80_InitP8CartInfo
	.section	.text._Z13Mapper95_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper95_InitP8CartInfo
	.hidden	_Z13Mapper95_InitP8CartInfo
	.type	_Z13Mapper95_InitP8CartInfo, @function
_Z13Mapper95_InitP8CartInfo:
.LFB17:
	.cfi_startproc
	lla	a5,_ZL8M95Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, _ZL8isExMirr; sb a5, 0(a4);
	lla	a5,_ZL10MExMirrPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL11StateRegs95
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE17:
	.size	_Z13Mapper95_InitP8CartInfo, .-_Z13Mapper95_InitP8CartInfo
	.section	.text._Z14Mapper207_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper207_InitP8CartInfo
	.hidden	_Z14Mapper207_InitP8CartInfo
	.type	_Z14Mapper207_InitP8CartInfo, @function
_Z14Mapper207_InitP8CartInfo:
.LFB18:
	.cfi_startproc
	lla	a5,_ZL9M207Powerv
	sw	a5,0(a0)
	li	a5,1
	la a4, _ZL8isExMirr; sb a5, 0(a4);
	lla	a5,_ZL10MExMirrPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL12StateRestorei
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL12StateRegs207
	la a4, GameStateRestore; sw a5, 0(a4);
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE18:
	.size	_Z14Mapper207_InitP8CartInfo, .-_Z14Mapper207_InitP8CartInfo
	.section	.sbss._ZZL10MExMirrPPUjE7curmirr,"aw",@nobits
	.type	_ZZL10MExMirrPPUjE7curmirr, @object
	.size	_ZZL10MExMirrPPUjE7curmirr, 1
_ZZL10MExMirrPPUjE7curmirr:
	.zero	1
	.section	.sdata._ZZL10MExMirrPPUjE8lastmirr,"aw"
	.type	_ZZL10MExMirrPPUjE8lastmirr, @object
	.size	_ZZL10MExMirrPPUjE8lastmirr, 1
_ZZL10MExMirrPPUjE8lastmirr:
	.byte	-1
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"PREG"
	.align	2
.LC1:
	.string	"CREG"
	.align	2
.LC2:
	.string	"MCCH"
	.align	2
.LC3:
	.string	"LPPU"
	.section	.data._ZL12StateRegs207,"aw"
	.align	2
	.type	_ZL12StateRegs207, @object
	.size	_ZL12StateRegs207, 60
_ZL12StateRegs207:
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL6mcache
	.word	8
	.word	.LC2
	.word	_ZL7lastppu
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.rodata.str1.4
	.align	2
.LC4:
	.string	"CMDR"
	.section	.data._ZL11StateRegs95,"aw"
	.align	2
	.type	_ZL11StateRegs95, @object
	.size	_ZL11StateRegs95, 72
_ZL11StateRegs95:
	.word	_ZL3cmd
	.word	1
	.word	.LC4
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL6mcache
	.word	8
	.word	.LC2
	.word	_ZL7lastppu
	.word	4
	.word	.LC3
	.word	0
	.zero	8
	.section	.rodata.str1.4
	.align	2
.LC5:
	.string	"WRAM"
	.align	2
.LC6:
	.string	"MIRR"
	.align	2
.LC7:
	.string	"WRME"
	.section	.data._ZL11StateRegs80,"aw"
	.align	2
	.type	_ZL11StateRegs80, @object
	.size	_ZL11StateRegs80, 72
_ZL11StateRegs80:
	.word	_ZL4preg
	.word	3
	.word	.LC0
	.word	_ZL4creg
	.word	6
	.word	.LC1
	.word	_ZL4wram
	.word	256
	.word	.LC5
	.word	_ZL4mirr
	.word	1
	.word	.LC6
	.word	_ZL11wram_enable
	.word	1
	.word	.LC7
	.word	0
	.zero	8
	.section	.sbss._ZL7lastppu,"aw",@nobits
	.align	2
	.type	_ZL7lastppu, @object
	.size	_ZL7lastppu, 4
_ZL7lastppu:
	.zero	4
	.section	.sbss._ZL6mcache,"aw",@nobits
	.align	2
	.type	_ZL6mcache, @object
	.size	_ZL6mcache, 8
_ZL6mcache:
	.zero	8
	.section	.bss._ZL4wram,"aw",@nobits
	.align	2
	.type	_ZL4wram, @object
	.size	_ZL4wram, 256
_ZL4wram:
	.zero	256
	.section	.sbss._ZL11wram_enable,"aw",@nobits
	.type	_ZL11wram_enable, @object
	.size	_ZL11wram_enable, 1
_ZL11wram_enable:
	.zero	1
	.section	.sbss._ZL3cmd,"aw",@nobits
	.type	_ZL3cmd, @object
	.size	_ZL3cmd, 1
_ZL3cmd:
	.zero	1
	.section	.sbss._ZL4mirr,"aw",@nobits
	.type	_ZL4mirr, @object
	.size	_ZL4mirr, 1
_ZL4mirr:
	.zero	1
	.section	.sbss._ZL8isExMirr,"aw",@nobits
	.type	_ZL8isExMirr, @object
	.size	_ZL8isExMirr, 1
_ZL8isExMirr:
	.zero	1
	.section	.sbss._ZL4creg,"aw",@nobits
	.align	2
	.type	_ZL4creg, @object
	.size	_ZL4creg, 6
_ZL4creg:
	.zero	6
	.section	.sbss._ZL4preg,"aw",@nobits
	.align	2
	.type	_ZL4preg, @object
	.size	_ZL4preg, 3
_ZL4preg:
	.zero	3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
