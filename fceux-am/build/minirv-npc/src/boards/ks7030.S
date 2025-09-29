#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"ks7030.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._ZL14UNLKS7030Closev,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7030Closev, @function
_ZL14UNLKS7030Closev:
.LFB14:
	.cfi_startproc
	la a0, _ZL4WRAM; lw a0, 0(a0);
	beq	a0,zero,.L7
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z10FCEU_gfreePv
	lw	ra,8(sp)
	.cfi_restore 1
	la a5, _ZL4WRAM; sw zero, 0(a5);
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L7:
	la a5, _ZL4WRAM; sw zero, 0(a5);
	ret
	.cfi_endproc
.LFE14:
	.size	_ZL14UNLKS7030Closev, .-_ZL14UNLKS7030Closev
	.section	.text._ZL14UNLKS7030Powerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLKS7030Powerv, @function
_ZL14UNLKS7030Powerv:
.LFB13:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	li	a5,-1
	sw	s0,4(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lla	s0,_ZL4reg1
	lla	s1,_ZL4reg0
	li	a0,0
	sb	a5,0(s0)
	sb	a5,0(s1)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s1)
	li	a0,49152
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lbu	a1,0(s0)
	li	a0,53248
	addi	a0,a0,-2048
	addi	a1,a1,8
	call	_Z7setprg4jj
	li	s0,32768
	addi	a1,s0,-1
	lla	a2,_ZL17UNLKS7030RamRead0j
	li	a0,24576
	call	_Z14SetReadHandleriiPFhjE
	addi	a1,s0,-1
	lla	a2,_ZL18UNLKS7030RamWrite0jh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,65536
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,36864
	lla	a2,_ZL15UNLKS7030Write0jh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,40960
	lla	a2,_ZL15UNLKS7030Write1jh
	addi	a1,a1,-1
	li	a0,36864
	call	_Z15SetWriteHandleriiPFvjhE
	li	a1,53248
	li	a0,49152
	lla	a2,_ZL17UNLKS7030RamRead1j
	addi	a1,a1,2047
	addi	a0,a0,-2048
	call	_Z14SetReadHandleriiPFhjE
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	lw	s1,0(sp)
	.cfi_restore 9
	li	a1,53248
	li	a0,49152
	lla	a2,_ZL18UNLKS7030RamWrite1jh
	addi	a1,a1,2047
	addi	a0,a0,-2048
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE13:
	.size	_ZL14UNLKS7030Powerv, .-_ZL14UNLKS7030Powerv
	.section	.text._ZL17UNLKS7030RamRead1j,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7030RamRead1j, @function
_ZL17UNLKS7030RamRead1j:
.LFB10:
	.cfi_startproc
	li	a5,-45056
	addi	a5,a5,-2048
	add	a4,a0,a5
	li	a5,2047
	bleu	a4,a5,.L18
	li	a3,4096
	li	a5,-49152
	add	a5,a0,a5
	addi	a3,a3,-1025
	bleu	a5,a3,.L19
	li	a5,-53248
	addi	a5,a5,1024
	add	a5,a0,a5
	li	a0,0
	bleu	a5,a3,.L20
	ret
.L19:
	li	a5,4096
	addi	a5,a5,-1024
	add	a0,a0,a5
	tail	_Z6CartBRj
.L18:
	la a5, _ZL4WRAM; lw a5, 0(a5);
	add	a4,a5,a0
	li	a5,-45056
	add	a5,a5,a4
	lbu	a0,1024(a5)
	ret
.L20:
	la a5, _ZL4WRAM; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE10:
	.size	_ZL17UNLKS7030RamRead1j, .-_ZL17UNLKS7030RamRead1j
	.section	.text._ZL17UNLKS7030RamRead0j,"ax",@progbits
	.align	2
	.type	_ZL17UNLKS7030RamRead0j, @function
_ZL17UNLKS7030RamRead0j:
.LFB8:
	.cfi_startproc
	li	a3,4096
	li	a4,-24576
	add	a4,a0,a4
	addi	a3,a3,-1025
	mv	a5,a0
	li	a2,4096
	bleu	a4,a3,.L26
	li	a4,-28672
	addi	a4,a4,1024
	add	a4,a0,a4
	li	a3,1023
	bleu	a4,a3,.L27
	li	a4,-28672
	add	a4,a0,a4
	li	a0,0
	bltu	a4,a2,.L28
	ret
.L27:
	li	a0,24576
	addi	a0,a0,-1024
	add	a0,a5,a0
	tail	_Z6CartBRj
.L26:
	la a5, _ZL4WRAM; lw a5, 0(a5);
	add	a5,a5,a4
	lbu	a0,0(a5)
	ret
.L28:
	li	a0,20480
	addi	a0,a0,-2048
	add	a0,a5,a0
	tail	_Z6CartBRj
	.cfi_endproc
.LFE8:
	.size	_ZL17UNLKS7030RamRead0j, .-_ZL17UNLKS7030RamRead0j
	.section	.text._ZL18UNLKS7030RamWrite1jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLKS7030RamWrite1jh, @function
_ZL18UNLKS7030RamWrite1jh:
.LFB9:
	.cfi_startproc
	li	a5,-45056
	addi	a5,a5,-2048
	add	a5,a0,a5
	li	a3,2047
	bgtu	a5,a3,.L30
	la a5, _ZL4WRAM; lw a5, 0(a5);
	add	a3,a5,a0
	li	a5,-45056
	add	a5,a5,a3
	sb	a1,1024(a5)
	ret
.L30:
	li	a3,4096
	li	a2,-49152
	add	a2,a0,a2
	addi	a3,a3,-1025
	bleu	a2,a3,.L33
	li	a2,-53248
	addi	a2,a2,1024
	add	a0,a0,a2
	bgtu	a0,a3,.L29
	la a3, _ZL4WRAM; lw a3, 0(a3);
	add	a5,a3,a5
	sb	a1,0(a5)
.L29:
	ret
.L33:
	li	a5,4096
	addi	a5,a5,-1024
	add	a0,a0,a5
	tail	_Z6CartBWjh
	.cfi_endproc
.LFE9:
	.size	_ZL18UNLKS7030RamWrite1jh, .-_ZL18UNLKS7030RamWrite1jh
	.section	.text._ZL18UNLKS7030RamWrite0jh,"ax",@progbits
	.align	2
	.type	_ZL18UNLKS7030RamWrite0jh, @function
_ZL18UNLKS7030RamWrite0jh:
.LFB7:
	.cfi_startproc
	li	a4,4096
	li	a5,-24576
	add	a5,a0,a5
	addi	a4,a4,-1025
	li	a2,4096
	bgtu	a5,a4,.L35
	la a4, _ZL4WRAM; lw a4, 0(a4);
	add	a5,a4,a5
	sb	a1,0(a5)
	ret
.L35:
	li	a5,-28672
	addi	a5,a5,1024
	add	a5,a0,a5
	li	a4,1023
	bleu	a5,a4,.L38
	li	a5,-28672
	add	a5,a0,a5
	bltu	a5,a2,.L39
	ret
.L38:
	li	a5,24576
	addi	a5,a5,-1024
	add	a0,a0,a5
	tail	_Z6CartBWjh
.L39:
	li	a5,20480
	addi	a5,a5,-2048
	add	a0,a0,a5
	tail	_Z6CartBWjh
	.cfi_endproc
.LFE7:
	.size	_ZL18UNLKS7030RamWrite0jh, .-_ZL18UNLKS7030RamWrite0jh
	.section	.text._ZL12StateRestorei,"ax",@progbits
	.align	2
	.type	_ZL12StateRestorei, @function
_ZL12StateRestorei:
.LFB15:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	li	a0,0
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,49152
	la a1, _ZL4reg0; lbu a1, 0(a1);
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lw	ra,8(sp)
	.cfi_restore 1
	la a1, _ZL4reg1; lbu a1, 0(a1);
	li	a0,53248
	addi	a1,a1,8
	addi	a0,a0,-2048
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg4jj
	.cfi_endproc
.LFE15:
	.size	_ZL12StateRestorei, .-_ZL12StateRestorei
	.section	.text._ZL15UNLKS7030Write0jh,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7030Write0jh, @function
_ZL15UNLKS7030Write0jh:
.LFB11:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a5,a0,7
	lla	s0,_ZL4reg0
	li	a0,0
	sb	a5,0(s0)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	lbu	a1,0(s0)
	li	a0,49152
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a1, _ZL4reg1; lbu a1, 0(a1);
	li	a0,53248
	addi	a1,a1,8
	addi	a0,a0,-2048
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg4jj
	.cfi_endproc
.LFE11:
	.size	_ZL15UNLKS7030Write0jh, .-_ZL15UNLKS7030Write0jh
	.section	.text._ZL15UNLKS7030Write1jh,"ax",@progbits
	.align	2
	.type	_ZL15UNLKS7030Write1jh, @function
_ZL15UNLKS7030Write1jh:
.LFB12:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	andi	a5,a0,15
	lla	s0,_ZL4reg1
	li	a0,0
	sb	a5,0(s0)
	call	_Z7setchr8j
	li	a1,-1
	li	a0,32768
	call	_Z8setprg32jj
	li	a0,49152
	la a1, _ZL4reg0; lbu a1, 0(a1);
	addi	a0,a0,-2048
	call	_Z7setprg4jj
	lbu	a1,0(s0)
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a0,53248
	addi	a0,a0,-2048
	addi	a1,a1,8
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z7setprg4jj
	.cfi_endproc
.LFE12:
	.size	_ZL15UNLKS7030Write1jh, .-_ZL15UNLKS7030Write1jh
	.section	.rodata._Z14UNLKS7030_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.section	.text._Z14UNLKS7030_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLKS7030_InitP8CartInfo
	.hidden	_Z14UNLKS7030_InitP8CartInfo
	.type	_Z14UNLKS7030_InitP8CartInfo, @function
_Z14UNLKS7030_InitP8CartInfo:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	sw	s0,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	a5,_ZL14UNLKS7030Powerv
	sw	a5,0(a0)
	lla	a5,_ZL14UNLKS7030Closev
	sw	a5,8(a0)
	lla	a5,_ZL12StateRestorei
	lla	s0,_ZL8WRAMSIZE
	la a4, GameStateRestore; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a1,0(s0)
	lla	a3,.LC0
	li	a2,0
	la a4, _ZL4WRAM; sw a0, 0(a4);
	call	_Z10AddExStatePvjiPKc
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL9StateRegs
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE16:
	.size	_Z14UNLKS7030_InitP8CartInfo, .-_Z14UNLKS7030_InitP8CartInfo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"REG0"
	.align	2
.LC2:
	.string	"REG1"
	.section	.data._ZL9StateRegs,"aw"
	.align	2
	.type	_ZL9StateRegs, @object
	.size	_ZL9StateRegs, 36
_ZL9StateRegs:
	.word	_ZL4reg0
	.word	1
	.word	.LC1
	.word	_ZL4reg1
	.word	1
	.word	.LC2
	.word	0
	.zero	8
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
	.section	.sbss._ZL4reg1,"aw",@nobits
	.type	_ZL4reg1, @object
	.size	_ZL4reg1, 1
_ZL4reg1:
	.zero	1
	.section	.sbss._ZL4reg0,"aw",@nobits
	.type	_ZL4reg0, @object
	.size	_ZL4reg0, 1
_ZL4reg0:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
