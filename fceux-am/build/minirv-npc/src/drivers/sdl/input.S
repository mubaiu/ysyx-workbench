#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"input.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
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
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,_ZL10g_keyState
.L13:
	addi	a1,sp,12
	li	a0,8
	call	ioe_read
	lw	a5,16(sp)
	li	a3,255
	lbu	a4,12(sp)
	bgt	a5,a3,.L45
	add	a3,s0,a5
	sb	a4,0(a3)
	beq	a4,zero,.L11
	li	a4,1
	beq	a5,a4,.L12
	li	a4,29
	beq	a5,a4,.L12
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
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L14:
	.cfi_restore_state
	lla	a3,_ZZL13UpdateGamepadvE5rapid
	lw	a5,0(a3)
	sw	s1,20(sp)
	li	t2,0
	mv	a2,a5
	xori	a2,a2,1
	sw	a5,8(sp)
	li	a4,0
	lla	a5,GamePadConfig
	sw	a2,0(a3)
	li	t1,0
	.cfi_offset 9, -12
	li	s1,1
	li	t0,8
	sw	t2,0(sp)
.L16:
	mv	a1,a5
	li	t2,0
	sw	a5,4(sp)
.L33:
	lw	a0,16(a1)
	mv	a3,a1
	li	a5,0
	ble	a0,zero,.L21
.L19:
	add	a2,a1,a5
	lbu	a2,0(a2)
	bne	a2,zero,.L17
	lhu	a2,8(a3)
	add	a2,s0,a2
	lbu	a2,0(a2)
	bne	a2,zero,.L18
.L17:
	addi	a5,a5,1
	addi	a3,a3,2
	bne	a0,a5,.L19
.L21:
	addi	t2,t2,1
	addi	a1,a1,20
	bne	t2,t0,.L33
.L20:
	lw	a3,8(sp)
	lw	a5,4(sp)
	bne	a3,s1,.L46
.L22:
	lw	a3,0(sp)
	addi	a4,a4,200
	addi	a5,a5,200
	addi	a3,a3,8
	sw	a3,0(sp)
	li	a3,800
	bne	a4,a3,.L16
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	la a5, _ZL8JSreturn; sw t1, 0(a5);
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	.cfi_restore_state
	lw	a3,0(sp)
	sll	a5,s1,t2
	addi	t2,t2,1
	sll	a5,a5,a3
	or	t1,t1,a5
	addi	a1,a1,20
	bne	t2,t0,.L33
	j	.L20
.L46:
	lw	a0,176(a5)
	ble	a0,zero,.L23
	mv	a2,a5
	li	a3,0
.L25:
	add	a1,a5,a3
	lbu	a1,160(a1)
	bne	a1,zero,.L27
	lhu	a1,168(a2)
	add	a1,s0,a1
	lbu	a1,0(a1)
	bne	a1,zero,.L47
.L27:
	addi	a3,a3,1
	addi	a2,a2,2
	bne	a3,a0,.L25
.L23:
	lw	a0,196(a5)
	ble	a0,zero,.L22
	mv	a2,a5
	li	a3,0
	j	.L29
.L31:
	addi	a3,a3,1
	addi	a2,a2,2
	beq	a3,a0,.L22
.L29:
	add	a1,a5,a3
	lbu	a1,180(a1)
	bne	a1,zero,.L31
	lhu	a1,188(a2)
	add	a1,s0,a1
	lbu	a1,0(a1)
	beq	a1,zero,.L31
	lw	a2,0(sp)
	li	a3,2
	sll	a3,a3,a2
	or	t1,t1,a3
	j	.L22
.L47:
	lw	a2,0(sp)
	li	a3,1
	sll	a3,a3,a2
	or	t1,t1,a3
	j	.L23
.L12:
	.cfi_restore 9
	li	a0,0
	sw	s1,20(sp)
	.cfi_remember_state
	.cfi_offset 9, -12
	call	halt
.L45:
	.cfi_restore_state
	li	a2,109
	lla	a1,.LC0
	lla	a0,.LC1
	sw	s1,20(sp)
	.cfi_offset 9, -12
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
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
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
	sw	ra,8(sp)
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
	lw	s0,4(sp)
	.cfi_restore 8
	lw	ra,8(sp)
	.cfi_restore 1
	la a0, eoptions; lw a0, 0(a0);
	srli	a0,a0,5
	andi	a0,a0,1
	addi	sp,sp,12
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
	lla	t1,DefaultGamePad+200
	li	a1,1
.L55:
	addi	a4,a2,-40
	mv	a5,a0
.L56:
	lw	a3,0(a4)
	sb	zero,0(a5)
	sb	zero,4(a5)
	sh	a3,8(a5)
	sw	a1,16(a5)
	addi	a4,a4,4
	addi	a5,a5,20
	bne	a4,a2,.L56
	addi	a2,a4,40
	addi	a0,a0,200
	bne	a2,t1,.L55
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
