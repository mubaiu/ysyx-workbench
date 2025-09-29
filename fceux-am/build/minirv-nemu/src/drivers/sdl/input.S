#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._Z18InputUserActiveFixv,"ax",@progbits
	.align	2
	.globl	_Z18InputUserActiveFixv
	.hidden	_Z18InputUserActiveFixv
	.type	_Z18InputUserActiveFixv, @function
_Z18InputUserActiveFixv:
.LFB46:
	.cfi_startproc
	lla	a5,_ZL12UsrInputType
	lw	a2,4(a5)
	lw	a4,8(a5)
	lw	a3,0(a5)
	lla	a5,_ZL12CurInputType
	sw	a2,4(a5)
	sw	a3,0(a5)
	sw	a4,8(a5)
	ret
	.cfi_endproc
.LFE46:
	.size	_Z18InputUserActiveFixv, .-_Z18InputUserActiveFixv
	.section	.text._Z12ParseGIInputP6FCEUGI,"ax",@progbits
	.align	2
	.globl	_Z12ParseGIInputP6FCEUGI
	.hidden	_Z12ParseGIInputP6FCEUGI
	.type	_Z12ParseGIInputP6FCEUGI, @function
_Z12ParseGIInputP6FCEUGI:
.LFB47:
	.cfi_startproc
	lw	a4,8(a0)
	lw	a3,16(a0)
	lla	a5,_ZL12UsrInputType
	la a2, gametype; sw a4, 0(a2);
	lw	a1,0(a5)
	lw	a2,4(a5)
	lw	a4,8(a5)
	blt	a3,zero,.L4
	mv	a1,a3
.L4:
	lw	a3,20(a0)
	lla	a5,_ZL12CurInputType
	sw	a1,0(a5)
	blt	a3,zero,.L5
	mv	a2,a3
.L5:
	lw	a3,24(a0)
	sw	a2,4(a5)
	blt	a3,zero,.L6
	mv	a4,a3
.L6:
	sw	a4,8(a5)
	ret
	.cfi_endproc
.LFE47:
	.size	_Z12ParseGIInputP6FCEUGI, .-_Z12ParseGIInputP6FCEUGI
	.section	.text._Z11GetKeyboardv,"ax",@progbits
	.align	2
	.globl	_Z11GetKeyboardv
	.hidden	_Z11GetKeyboardv
	.type	_Z11GetKeyboardv, @function
_Z11GetKeyboardv:
.LFB48:
	.cfi_startproc
	lla	a0,_ZL10g_keyState
	ret
	.cfi_endproc
.LFE48:
	.size	_Z11GetKeyboardv, .-_Z11GetKeyboardv
	.section	.text._Z12GetMouseDataRA3_j,"ax",@progbits
	.align	2
	.globl	_Z12GetMouseDataRA3_j
	.hidden	_Z12GetMouseDataRA3_j
	.type	_Z12GetMouseDataRA3_j, @function
_Z12GetMouseDataRA3_j:
.LFB50:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE50:
	.size	_Z12GetMouseDataRA3_j, .-_Z12GetMouseDataRA3_j
	.section	.rodata._Z17FCEUD_UpdateInputv.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"/home/mubai/ysyx-workbench/fceux-am/src/drivers/sdl/input.cpp"
	.align	2
.LC1:
	.string	"Assertion fail at %s:%d\n"
	.section	.text._Z17FCEUD_UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_UpdateInputv
	.hidden	_Z17FCEUD_UpdateInputv
	.type	_Z17FCEUD_UpdateInputv, @function
_Z17FCEUD_UpdateInputv:
.LFB53:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	ra,44(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	li	s1,255
	lla	s0,_ZL10g_keyState
	li	s3,1
	li	s2,29
.L13:
	addi	a1,sp,8
	li	a0,8
	call	ioe_read
	lw	a5,12(sp)
	lbu	a4,8(sp)
	bgt	a5,s1,.L44
	add	a3,s0,a5
	sb	a4,0(a3)
	beq	a4,zero,.L11
	beq	a5,s3,.L12
	beq	a5,s2,.L12
.L11:
	bne	a5,zero,.L13
	lla	a4,NoWaiting
	lw	a5,0(a4)
	lla	a3,_ZL12CurInputType
	lw	a2,0(a3)
	andi	a5,a5,-2
	sw	a5,0(a4)
	li	a5,1
	beq	a2,a5,.L14
	lw	a4,4(a3)
	beq	a4,a5,.L14
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
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_restore_state
	lla	a5,_ZZL13UpdateGamepadvE5rapid
	lw	t6,0(a5)
	lla	a6,GamePadConfig
	li	t5,0
	xori	a4,t6,1
	sw	a4,0(a5)
	li	t3,0
	li	a7,0
	li	t4,1
	li	t1,8
	li	t0,800
.L16:
	mv	a2,a6
	li	a0,0
.L33:
	lw	a1,16(a2)
	mv	a4,a2
	li	a5,0
	ble	a1,zero,.L21
.L19:
	add	a3,a2,a5
	lbu	a3,0(a3)
	bne	a3,zero,.L17
	lhu	a3,8(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	bne	a3,zero,.L18
.L17:
	addi	a5,a5,1
	addi	a4,a4,2
	bne	a1,a5,.L19
.L21:
	addi	a0,a0,1
	addi	a2,a2,20
	bne	a0,t1,.L33
.L20:
	bne	t6,t4,.L45
.L22:
	addi	t5,t5,200
	addi	t3,t3,8
	addi	a6,a6,200
	bne	t5,t0,.L16
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	la a5, _ZL8JSreturn; sw a7, 0(a5);
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	.cfi_restore_state
	sll	a5,t4,a0
	sll	a5,a5,t3
	addi	a0,a0,1
	or	a7,a7,a5
	addi	a2,a2,20
	bne	a0,t1,.L33
	j	.L20
.L45:
	lw	a2,176(a6)
	ble	a2,zero,.L23
	mv	a4,a6
	li	a5,0
.L25:
	add	a3,a6,a5
	lbu	a3,160(a3)
	bne	a3,zero,.L27
	lhu	a3,168(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	bne	a3,zero,.L46
.L27:
	addi	a5,a5,1
	addi	a4,a4,2
	bne	a5,a2,.L25
.L23:
	lw	a2,196(a6)
	ble	a2,zero,.L22
	mv	a4,a6
	li	a5,0
	j	.L29
.L31:
	addi	a5,a5,1
	addi	a4,a4,2
	beq	a5,a2,.L22
.L29:
	add	a3,a6,a5
	lbu	a3,180(a3)
	bne	a3,zero,.L31
	lhu	a3,188(a4)
	add	a3,s0,a3
	lbu	a3,0(a3)
	beq	a3,zero,.L31
	li	a5,2
	sll	a5,a5,t3
	or	a7,a7,a5
	j	.L22
.L46:
	li	a5,1
	sll	a5,a5,t3
	or	a7,a7,a5
	j	.L23
.L12:
	li	a0,0
	call	halt
.L44:
	li	a2,109
	lla	a1,.LC0
	lla	a0,.LC1
	call	printf
	li	a0,1
	call	halt
	.cfi_endproc
.LFE53:
	.size	_Z17FCEUD_UpdateInputv, .-_Z17FCEUD_UpdateInputv
	.section	.text._Z18InitInputInterfacev,"ax",@progbits
	.align	2
	.globl	_Z18InitInputInterfacev
	.hidden	_Z18InitInputInterfacev
	.type	_Z18InitInputInterfacev, @function
_Z18InitInputInterfacev:
.LFB54:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	lla	s0,_ZL12CurInputType
	lw	a1,0(s0)
	lla	a2,_ZL8JSreturn
	li	a3,0
	addi	a5,a1,-1
	seqz	a5,a5
	neg	a5,a5
	and	a2,a2,a5
	li	a0,0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z14FCEUI_SetInputi3ESIPvi
	lw	a1,4(s0)
	lla	a2,_ZL8JSreturn
	li	a3,0
	addi	a5,a1,-1
	seqz	a5,a5
	neg	a5,a5
	and	a2,a2,a5
	li	a0,1
	call	_Z14FCEUI_SetInputi3ESIPvi
	lw	a0,8(s0)
	li	a2,0
	li	a1,0
	call	_Z16FCEUI_SetInputFC5ESIFCPvi
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, eoptions; lw a0, 0(a0);
	srli	a0,a0,5
	andi	a0,a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z23FCEUI_SetInputFourscoreb
	.cfi_endproc
.LFE54:
	.size	_Z18InitInputInterfacev, .-_Z18InitInputInterfacev
	.section	.text._Z11UpdateInputv,"ax",@progbits
	.align	2
	.globl	_Z11UpdateInputv
	.hidden	_Z11UpdateInputv
	.type	_Z11UpdateInputv, @function
_Z11UpdateInputv:
.LFB55:
	.cfi_startproc
	lla	a5,_ZL12UsrInputType
	li	a4,1
	sw	a4,0(a5)
	sw	a4,4(a5)
	lla	a0,GamePadConfig
	la a5, _ZL12UsrInputType+8; sw zero, 0(a5);
	lla	a2,DefaultGamePad+40
	lla	a6,DefaultGamePad+200
	li	a1,1
.L54:
	addi	a4,a2,-40
	mv	a5,a0
.L55:
	lw	a3,0(a4)
	sb	zero,0(a5)
	sb	zero,4(a5)
	sh	a3,8(a5)
	sw	a1,16(a5)
	addi	a4,a4,4
	addi	a5,a5,20
	bne	a4,a2,.L55
	addi	a2,a4,40
	addi	a0,a0,200
	bne	a2,a6,.L54
	ret
	.cfi_endproc
.LFE55:
	.size	_Z11UpdateInputv, .-_Z11UpdateInputv
	.hidden	DefaultGamePad
	.globl	DefaultGamePad
	.section	.rodata.DefaultGamePad,"a"
	.align	2
	.type	DefaultGamePad, @object
	.size	DefaultGamePad, 160
DefaultGamePad:
	.word	49
	.word	50
	.word	35
	.word	36
	.word	30
	.word	44
	.word	43
	.word	45
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.hidden	DefaultGamePadDevice
	.globl	DefaultGamePadDevice
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"Keyboard"
	.align	2
.LC3:
	.string	"None"
	.section	.data.DefaultGamePadDevice,"aw"
	.align	2
	.type	DefaultGamePadDevice, @object
	.size	DefaultGamePadDevice, 16
DefaultGamePadDevice:
	.word	.LC2
	.word	.LC3
	.word	.LC3
	.word	.LC3
	.hidden	GamePadNames
	.globl	GamePadNames
	.section	.rodata.str1.4
	.align	2
.LC4:
	.string	"A"
	.align	2
.LC5:
	.string	"B"
	.align	2
.LC6:
	.string	"Select"
	.align	2
.LC7:
	.string	"Start"
	.align	2
.LC8:
	.string	"Up"
	.align	2
.LC9:
	.string	"Down"
	.align	2
.LC10:
	.string	"Left"
	.align	2
.LC11:
	.string	"Right"
	.align	2
.LC12:
	.string	"TurboA"
	.align	2
.LC13:
	.string	"TurboB"
	.section	.data.GamePadNames,"aw"
	.align	2
	.type	GamePadNames, @object
	.size	GamePadNames, 40
GamePadNames:
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.section	.sbss._ZZL13UpdateGamepadvE5rapid,"aw",@nobits
	.align	2
	.type	_ZZL13UpdateGamepadvE5rapid, @object
	.size	_ZZL13UpdateGamepadvE5rapid, 4
_ZZL13UpdateGamepadvE5rapid:
	.zero	4
	.hidden	GamePadConfig
	.globl	GamePadConfig
	.section	.data.GamePadConfig,"aw"
	.align	2
	.type	GamePadConfig, @object
	.size	GamePadConfig, 800
GamePadConfig:
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	49
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	50
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	35
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	36
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	30
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	44
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	43
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	45
	.zero	6
	.word	1
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.string	""
	.string	""
	.zero	2
	.string	""
	.string	""
	.zero	2
	.half	0
	.zero	6
	.word	0
	.zero	120
	.section	.bss._ZL10g_keyState,"aw",@nobits
	.align	2
	.type	_ZL10g_keyState, @object
	.size	_ZL10g_keyState, 256
_ZL10g_keyState:
	.zero	256
	.section	.sbss._ZL8JSreturn,"aw",@nobits
	.align	2
	.type	_ZL8JSreturn, @object
	.size	_ZL8JSreturn, 4
_ZL8JSreturn:
	.zero	4
	.section	.bss._ZL12CurInputType,"aw",@nobits
	.align	2
	.type	_ZL12CurInputType, @object
	.size	_ZL12CurInputType, 12
_ZL12CurInputType:
	.zero	12
	.section	.bss._ZL12UsrInputType,"aw",@nobits
	.align	2
	.type	_ZL12UsrInputType, @object
	.size	_ZL12UsrInputType, 12
_ZL12UsrInputType:
	.zero	12
	.hidden	NoWaiting
	.globl	NoWaiting
	.section	.sdata.NoWaiting,"aw"
	.align	2
	.type	NoWaiting, @object
	.size	NoWaiting, 4
NoWaiting:
	.word	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
