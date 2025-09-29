#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sdl.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z8LoadGamePKc,"ax",@progbits
	.align	2
	.globl	_Z8LoadGamePKc
	.hidden	_Z8LoadGamePKc
	.type	_Z8LoadGamePKc, @function
_Z8LoadGamePKc:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s1,0(sp)
	.cfi_offset 9, -12
	lla	s1,isloaded
	lw	a5,0(s1)
	sw	s0,4(sp)
	sw	ra,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	bne	a5,zero,.L19
.L2:
	li	a2,0
	li	a1,1
	mv	a0,s0
	call	_Z14FCEUI_LoadGamePKcib
	beq	a0,zero,.L6
	lla	s0,GameInfo
	lw	a0,0(s0)
	call	_Z12ParseGIInputP6FCEUGI
	call	_Z18RefreshThrottleFPSv
	lw	a0,0(s0)
	call	_Z9InitVideoP6FCEUGI
	blt	a0,zero,.L6
	lla	s0,_ZL6inited
	lw	a5,0(s0)
	ori	a5,a5,4
	sw	a5,0(s0)
	call	_Z9InitSoundv
	beq	a0,zero,.L7
	lw	a5,0(s0)
	ori	a5,a5,1
	sw	a5,0(s0)
.L7:
	lla	a4,eoptions
	lw	a5,0(a4)
	andi	a5,a5,-33
	sw	a5,0(a4)
	call	_Z18InitInputInterfacev
	li	a0,0
	li	a1,1
	call	_Z15FCEUI_SetRegionii
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	li	a5,1
	sw	a5,0(s1)
	li	a0,1
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L6:
	.cfi_restore_state
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	li	a0,0
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L19:
	.cfi_restore_state
	call	_Z15FCEUI_CloseGamev
	la a5, _ZL6inited; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L20
.L3:
	la a5, _ZL6inited; sw zero, 0(a5);
	la a5, isloaded; sw zero, 0(a5);
	la a5, GameInfo; sw zero, 0(a5);
	call	_Z18InputUserActiveFixv
	j	.L2
.L20:
	call	_Z9KillVideov
	j	.L3
	.cfi_endproc
.LFE46:
	.size	_Z8LoadGamePKc, .-_Z8LoadGamePKc
	.section	.text._Z9CloseGamev,"ax",@progbits
	.align	2
	.globl	_Z9CloseGamev
	.hidden	_Z9CloseGamev
	.type	_Z9CloseGamev, @function
_Z9CloseGamev:
.LFB47:
	.cfi_startproc
	la a0, isloaded; lw a0, 0(a0);
	bne	a0,zero,.L34
	ret
.L34:
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	_Z15FCEUI_CloseGamev
	la a5, _ZL6inited; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L35
.L23:
	la a5, _ZL6inited; sw zero, 0(a5);
	la a5, isloaded; sw zero, 0(a5);
	la a5, GameInfo; sw zero, 0(a5);
	call	_Z18InputUserActiveFixv
	lw	ra,8(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
.L35:
	.cfi_restore_state
	call	_Z9KillVideov
	j	.L23
	.cfi_endproc
.LFE47:
	.size	_Z9CloseGamev, .-_Z9CloseGamev
	.globl	__divsi3
	.section	.text._Z12FCEUD_UpdatePhPii,"ax",@progbits
	.align	2
	.globl	_Z12FCEUD_UpdatePhPii
	.hidden	_Z12FCEUD_UpdatePhPii
	.type	_Z12FCEUD_UpdatePhPii, @function
_Z12FCEUD_UpdatePhPii:
.LFB51:
	.cfi_startproc
	addi	sp,sp,-28
	.cfi_def_cfa_offset 28
	sw	ra,24(sp)
	sw	a0,4(sp)
	sw	a1,0(sp)
	.cfi_offset 1, -4
	bne	a2,zero,.L85
	la a5, NoWaiting; lw a5, 0(a5);
	bne	a5,zero,.L60
	la a5, eoptions; lw a5, 0(a5);
	andi	a5,a5,64
	beq	a5,zero,.L58
	j	.L86
.L61:
	call	_Z17FCEUD_UpdateInputv
.L58:
	call	_Z13SpeedThrottlev
	bne	a0,zero,.L61
.L60:
	lw	a5,4(sp)
	beq	a5,zero,.L45
	la a5, _ZL6inited; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L87
.L45:
	lw	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	tail	_Z17FCEUD_UpdateInputv
.L85:
	.cfi_restore_state
	sw	s1,16(sp)
	sw	s0,20(sp)
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	mv	s1,a2
	call	_Z13GetWriteSoundv
	sw	a0,8(sp)
	call	_Z11GetMaxSoundv
	lw	a4,8(sp)
	bgt	a0,a4,.L38
	li	a5,1
	la a3, _ZZ12FCEUD_UpdatePhPiiE5uflow; sw a5, 0(a3);
.L38:
	blt	s1,a4,.L62
	la a5, _ZZ12FCEUD_UpdatePhPiiE5uflow; sw zero, 0(a5);
.L39:
	lw	a0,0(sp)
	mv	a1,a4
	sw	a4,8(sp)
	call	_Z10WriteSoundPii
	call	_Z13GetWriteSoundv
	slli	a3,s1,3
	add	a5,a3,s1
	mv	s0,a0
	li	a1,10
	mv	a0,a5
	sw	a5,12(sp)
	call	__divsi3
	ble	a0,s0,.L40
	la a3, _ZZ12FCEUD_UpdatePhPiiE5uflow; lw a3, 0(a3);
	bne	a3,zero,.L41
	lw	a4,8(sp)
	lw	a5,0(sp)
	slli	a3,a4,2
	add	a5,a5,a3
	sw	a5,0(sp)
	lw	a5,4(sp)
	sub	s0,s1,a4
	beq	a5,zero,.L42
	la a3, _ZL6inited; lw a3, 0(a3);
	andi	a3,a3,4
	beq	a3,zero,.L42
	la a3, NoWaiting; lw a3, 0(a3);
	andi	a3,a3,2
	beq	a3,zero,.L88
	beq	a4,s1,.L82
.L46:
	call	_Z13GetWriteSoundv
	mv	a1,a0
	ble	a0,s0,.L49
	mv	a1,s0
.L49:
	lw	a0,0(sp)
	call	_Z10WriteSoundPii
	lw	s0,20(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,16(sp)
	.cfi_restore 9
	j	.L45
.L62:
	.cfi_restore_state
	mv	a4,s1
	j	.L39
.L87:
	.cfi_restore 8
	.cfi_restore 9
	lw	a0,4(sp)
	call	_Z10BlitScreenPh
	lw	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	tail	_Z17FCEUD_UpdateInputv
.L88:
	.cfi_def_cfa_offset 28
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	a0,a5
	call	_Z10BlitScreenPh
.L42:
	beq	s0,zero,.L82
	la a4, NoWaiting; lw a4, 0(a4);
	bne	a4,zero,.L46
.L84:
	ble	s0,zero,.L82
	lw	a0,0(sp)
	mv	a1,s1
	ble	s1,s0,.L50
	mv	a1,s0
.L50:
	call	_Z10WriteSoundPii
	sub	s0,s0,s1
	j	.L84
.L41:
	la a4, NoWaiting; lw a4, 0(a4);
	bne	a4,zero,.L82
.L51:
	ble	s1,s0,.L52
.L89:
	mv	s1,s0
.L52:
	ble	s0,zero,.L82
.L54:
	lw	a0,0(sp)
	mv	a1,s1
	ble	s1,s0,.L53
	mv	a1,s0
.L53:
	sub	s0,s0,s1
	call	_Z10WriteSoundPii
	bgt	s0,zero,.L54
.L82:
	lw	s0,20(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	s1,16(sp)
	.cfi_restore 9
	lw	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,28
	.cfi_def_cfa_offset 0
	tail	_Z17FCEUD_UpdateInputv
.L40:
	.cfi_restore_state
	la a4, NoWaiting; lw a4, 0(a4);
	bne	a4,zero,.L82
	la a4, _ZZ12FCEUD_UpdatePhPiiE5uflow; lw a4, 0(a4);
	bne	a4,zero,.L51
	lw	a0,12(sp)
	li	a1,5
	call	__divsi3
	bgt	a0,s0,.L82
	ble	s1,s0,.L52
	j	.L89
.L86:
	.cfi_restore 8
	.cfi_restore 9
	call	_Z21FCEUI_EmulationPausedv
	bne	a0,zero,.L58
	j	.L60
	.cfi_endproc
.LFE51:
	.size	_Z12FCEUD_UpdatePhPii, .-_Z12FCEUD_UpdatePhPii
	.section	.text._Z18FCEUD_UTF8_fstreamPKcS0_,"ax",@progbits
	.align	2
	.globl	_Z18FCEUD_UTF8_fstreamPKcS0_
	.hidden	_Z18FCEUD_UTF8_fstreamPKcS0_
	.type	_Z18FCEUD_UTF8_fstreamPKcS0_, @function
_Z18FCEUD_UTF8_fstreamPKcS0_:
.LFB52:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	sw	s0,4(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	li	a0,36
	sw	ra,8(sp)
	sw	s1,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	mv	s1,a1
	call	malloc
	mv	a2,s1
	mv	a1,s0
	mv	s0,a0
	call	_ZN12EMUFILE_FILE4openEPKcS1_
	lw	ra,8(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,4(sp)
	.cfi_restore 8
	lw	s1,0(sp)
	.cfi_restore 9
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	_Z18FCEUD_UTF8_fstreamPKcS0_, .-_Z18FCEUD_UTF8_fstreamPKcS0_
	.section	.text._Z22FCEUD_TraceInstructionv,"ax",@progbits
	.align	2
	.globl	_Z22FCEUD_TraceInstructionv
	.hidden	_Z22FCEUD_TraceInstructionv
	.type	_Z22FCEUD_TraceInstructionv, @function
_Z22FCEUD_TraceInstructionv:
.LFB54:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE54:
	.size	_Z22FCEUD_TraceInstructionv, .-_Z22FCEUD_TraceInstructionv
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"ROM is %s\n"
	.align	2
.LC1:
	.string	"Starting FCEUX 2.2.3-interim git...\n"
	.align	2
.LC2:
	.string	"%s"
	.globl	__modsi3
	.section	.text.startup.main,"ax",@progbits
	.align	2
	.globl	main
	.hidden	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	ra,20(sp)
	sw	s0,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	mv	s0,a0
	call	ioe_init
	mv	a1,s0
	lla	a0,.LC0
	call	printf
	lla	a1,.LC1
	lla	a0,.LC2
	call	printf
	call	_Z16FCEUI_Initializev
	beq	a0,zero,.L94
	call	_Z11UpdateInputv
	li	a2,72
	li	a1,56
	li	a0,0
	call	_Z15FCEUI_SetNTSCTHbii
	li	a1,1
	li	a0,0
	call	_Z15FCEUI_SetRegionii
	li	a0,1
	call	_Z29FCEUI_DisableSpriteLimitationi
	li	a3,239
	li	a2,0
	li	a1,231
	li	a0,8
	call	_Z22FCEUI_SetRenderedLinesiiii
	mv	a0,s0
	call	_Z8LoadGamePKc
	li	a5,1
	bne	a0,a5,.L95
	lla	a5,GameInfo
	lw	a5,0(a5)
	beq	a5,zero,.L97
	sw	s1,12(sp)
	.cfi_offset 9, -12
	lla	s0,_ZZL5DoFuniiE6fskipc
	lla	s1,_ZZL5DoFuniiE6opause
.L96:
	lw	a0,0(s0)
	li	a1,3
	sw	zero,8(sp)
	addi	a0,a0,1
	call	__modsi3
	lla	a5,NoWaiting
	lw	a5,0(a5)
	mv	a3,a0
	sw	a3,0(s0)
	addi	a2,sp,8
	addi	a1,sp,4
	mv	a0,sp
	beq	a5,zero,.L100
	sw	zero,0(sp)
.L100:
	call	_Z13FCEUI_EmulatePPhPPiS1_i
	lw	a2,8(sp)
	lw	a1,4(sp)
	lw	a0,0(sp)
	call	_Z12FCEUD_UpdatePhPii
	call	_Z21FCEUI_EmulationPausedv
	lw	a5,0(s1)
	beq	a0,a5,.L101
	call	_Z21FCEUI_EmulationPausedv
	sw	a0,0(s1)
.L101:
	lla	a5,GameInfo
	lw	a5,0(a5)
	bne	a5,zero,.L96
	lw	s1,12(sp)
	.cfi_restore 9
.L97:
	call	_Z9CloseGamev
	call	_Z10FCEUI_Killv
	li	a0,0
.L93:
	lw	ra,20(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
.L95:
	.cfi_restore_state
	la a5, _ZL6inited; lw a5, 0(a5);
	andi	a5,a5,4
	bne	a5,zero,.L114
.L98:
	la a5, _ZL6inited; sw zero, 0(a5);
.L94:
	li	a0,-1
	j	.L93
.L114:
	call	_Z9KillVideov
	j	.L98
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.globl	__udivdi3
	.section	.text._Z13FCEUD_GetTimev,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_GetTimev
	.hidden	_Z13FCEUD_GetTimev
	.type	_Z13FCEUD_GetTimev, @function
_Z13FCEUD_GetTimev:
.LFB56:
	.cfi_startproc
	addi	sp,sp,-24
	.cfi_def_cfa_offset 24
	sw	s0,16(sp)
	.cfi_offset 8, -8
	addi	s0,sp,7
	andi	s0,s0,-8
	mv	a1,s0
	li	a0,6
	sw	ra,20(sp)
	.cfi_offset 1, -4
	call	ioe_read
	lw	a0,0(s0)
	lw	a1,4(s0)
	li	a2,1000
	li	a3,0
	call	__udivdi3
	lw	ra,20(sp)
	.cfi_restore 1
	lw	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,24
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE56:
	.size	_Z13FCEUD_GetTimev, .-_Z13FCEUD_GetTimev
	.section	.text._Z17FCEUD_GetTimeFreqv,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_GetTimeFreqv
	.hidden	_Z17FCEUD_GetTimeFreqv
	.type	_Z17FCEUD_GetTimeFreqv, @function
_Z17FCEUD_GetTimeFreqv:
.LFB57:
	.cfi_startproc
	li	a0,1000
	ret
	.cfi_endproc
.LFE57:
	.size	_Z17FCEUD_GetTimeFreqv, .-_Z17FCEUD_GetTimeFreqv
	.section	.text._Z13FCEUD_MessagePKc,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_MessagePKc
	.hidden	_Z13FCEUD_MessagePKc
	.type	_Z13FCEUD_MessagePKc, @function
_Z13FCEUD_MessagePKc:
.LFB58:
	.cfi_startproc
	mv	a1,a0
	lla	a0,.LC2
	tail	printf
	.cfi_endproc
.LFE58:
	.size	_Z13FCEUD_MessagePKc, .-_Z13FCEUD_MessagePKc
	.section	.rodata._Z16FCEUD_PrintErrorPKc.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"%s\n"
	.section	.text._Z16FCEUD_PrintErrorPKc,"ax",@progbits
	.align	2
	.globl	_Z16FCEUD_PrintErrorPKc
	.hidden	_Z16FCEUD_PrintErrorPKc
	.type	_Z16FCEUD_PrintErrorPKc, @function
_Z16FCEUD_PrintErrorPKc:
.LFB59:
	.cfi_startproc
	mv	a1,a0
	lla	a0,.LC3
	tail	printf
	.cfi_endproc
.LFE59:
	.size	_Z16FCEUD_PrintErrorPKc, .-_Z16FCEUD_PrintErrorPKc
	.section	.rodata._Z20FCEUD_HideMenuTogglev.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"FCEUD_HideMenuToggle"
	.align	2
.LC5:
	.string	"Not implemented.\n"
	.section	.text._Z20FCEUD_HideMenuTogglev,"ax",@progbits
	.align	2
	.globl	_Z20FCEUD_HideMenuTogglev
	.hidden	_Z20FCEUD_HideMenuTogglev
	.type	_Z20FCEUD_HideMenuTogglev, @function
_Z20FCEUD_HideMenuTogglev:
.LFB60:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a1,.LC4
	lla	a0,.LC3
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE60:
	.size	_Z20FCEUD_HideMenuTogglev, .-_Z20FCEUD_HideMenuTogglev
	.section	.rodata._Z21FCEUD_MovieReplayFromv.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"FCEUD_MovieReplayFrom"
	.section	.text._Z21FCEUD_MovieReplayFromv,"ax",@progbits
	.align	2
	.globl	_Z21FCEUD_MovieReplayFromv
	.hidden	_Z21FCEUD_MovieReplayFromv
	.type	_Z21FCEUD_MovieReplayFromv, @function
_Z21FCEUD_MovieReplayFromv:
.LFB61:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a1,.LC6
	lla	a0,.LC3
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE61:
	.size	_Z21FCEUD_MovieReplayFromv, .-_Z21FCEUD_MovieReplayFromv
	.section	.rodata._Z22FCEUD_ToggleStatusIconv.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"FCEUD_ToggleStatusIcon"
	.section	.text._Z22FCEUD_ToggleStatusIconv,"ax",@progbits
	.align	2
	.globl	_Z22FCEUD_ToggleStatusIconv
	.hidden	_Z22FCEUD_ToggleStatusIconv
	.type	_Z22FCEUD_ToggleStatusIconv, @function
_Z22FCEUD_ToggleStatusIconv:
.LFB62:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a1,.LC7
	lla	a0,.LC3
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE62:
	.size	_Z22FCEUD_ToggleStatusIconv, .-_Z22FCEUD_ToggleStatusIconv
	.section	.rodata._Z17FCEUD_AviRecordTov.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"FCEUD_AviRecordTo"
	.section	.text._Z17FCEUD_AviRecordTov,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_AviRecordTov
	.hidden	_Z17FCEUD_AviRecordTov
	.type	_Z17FCEUD_AviRecordTov, @function
_Z17FCEUD_AviRecordTov:
.LFB63:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a1,.LC8
	lla	a0,.LC3
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE63:
	.size	_Z17FCEUD_AviRecordTov, .-_Z17FCEUD_AviRecordTov
	.section	.rodata._Z13FCEUD_AviStopv.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"FCEUD_AviStop"
	.section	.text._Z13FCEUD_AviStopv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_AviStopv
	.hidden	_Z13FCEUD_AviStopv
	.type	_Z13FCEUD_AviStopv, @function
_Z13FCEUD_AviStopv:
.LFB64:
	.cfi_startproc
	addi	sp,sp,-12
	.cfi_def_cfa_offset 12
	lla	a1,.LC9
	lla	a0,.LC3
	sw	ra,8(sp)
	.cfi_offset 1, -4
	call	printf
	lw	ra,8(sp)
	.cfi_restore 1
	lla	a0,.LC5
	addi	sp,sp,12
	.cfi_def_cfa_offset 0
	tail	printf
	.cfi_endproc
.LFE64:
	.size	_Z13FCEUD_AviStopv, .-_Z13FCEUD_AviStopv
	.section	.text._Z20FCEUI_AviVideoUpdatePKh,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_AviVideoUpdatePKh
	.hidden	_Z20FCEUI_AviVideoUpdatePKh
	.type	_Z20FCEUI_AviVideoUpdatePKh, @function
_Z20FCEUI_AviVideoUpdatePKh:
.LFB65:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE65:
	.size	_Z20FCEUI_AviVideoUpdatePKh, .-_Z20FCEUI_AviVideoUpdatePKh
	.section	.text._Z20FCEUD_ShowStatusIconv,"ax",@progbits
	.align	2
	.globl	_Z20FCEUD_ShowStatusIconv
	.hidden	_Z20FCEUD_ShowStatusIconv
	.type	_Z20FCEUD_ShowStatusIconv, @function
_Z20FCEUD_ShowStatusIconv:
.LFB66:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE66:
	.size	_Z20FCEUD_ShowStatusIconv, .-_Z20FCEUD_ShowStatusIconv
	.section	.text._Z20FCEUI_AviIsRecordingv,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_AviIsRecordingv
	.hidden	_Z20FCEUI_AviIsRecordingv
	.type	_Z20FCEUI_AviIsRecordingv, @function
_Z20FCEUI_AviIsRecordingv:
.LFB67:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE67:
	.size	_Z20FCEUI_AviIsRecordingv, .-_Z20FCEUI_AviIsRecordingv
	.section	.text._Z20FCEUI_UseInputPreseti,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_UseInputPreseti
	.hidden	_Z20FCEUI_UseInputPreseti
	.type	_Z20FCEUI_UseInputPreseti, @function
_Z20FCEUI_UseInputPreseti:
.LFB68:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE68:
	.size	_Z20FCEUI_UseInputPreseti, .-_Z20FCEUI_UseInputPreseti
	.section	.text._Z24FCEUD_PauseAfterPlaybackv,"ax",@progbits
	.align	2
	.globl	_Z24FCEUD_PauseAfterPlaybackv
	.hidden	_Z24FCEUD_PauseAfterPlaybackv
	.type	_Z24FCEUD_PauseAfterPlaybackv, @function
_Z24FCEUD_PauseAfterPlaybackv:
.LFB76:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE76:
	.size	_Z24FCEUD_PauseAfterPlaybackv, .-_Z24FCEUD_PauseAfterPlaybackv
	.section	.text._Z13FCEUD_TurboOnv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUD_TurboOnv
	.hidden	_Z13FCEUD_TurboOnv
	.type	_Z13FCEUD_TurboOnv, @function
_Z13FCEUD_TurboOnv:
.LFB70:
	.cfi_startproc
	lla	a4,NoWaiting
	lw	a5,0(a4)
	ori	a5,a5,1
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE70:
	.size	_Z13FCEUD_TurboOnv, .-_Z13FCEUD_TurboOnv
	.section	.text._Z14FCEUD_TurboOffv,"ax",@progbits
	.align	2
	.globl	_Z14FCEUD_TurboOffv
	.hidden	_Z14FCEUD_TurboOffv
	.type	_Z14FCEUD_TurboOffv, @function
_Z14FCEUD_TurboOffv:
.LFB71:
	.cfi_startproc
	lla	a4,NoWaiting
	lw	a5,0(a4)
	andi	a5,a5,-2
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE71:
	.size	_Z14FCEUD_TurboOffv, .-_Z14FCEUD_TurboOffv
	.section	.text._Z17FCEUD_TurboTogglev,"ax",@progbits
	.align	2
	.globl	_Z17FCEUD_TurboTogglev
	.hidden	_Z17FCEUD_TurboTogglev
	.type	_Z17FCEUD_TurboTogglev, @function
_Z17FCEUD_TurboTogglev:
.LFB72:
	.cfi_startproc
	lla	a4,NoWaiting
	lw	a5,0(a4)
	xori	a5,a5,1
	sw	a5,0(a4)
	ret
	.cfi_endproc
.LFE72:
	.size	_Z17FCEUD_TurboTogglev, .-_Z17FCEUD_TurboTogglev
	.hidden	KillFCEUXonFrame
	.globl	KillFCEUXonFrame
	.section	.sbss.KillFCEUXonFrame,"aw",@nobits
	.align	2
	.type	KillFCEUXonFrame, @object
	.size	KillFCEUXonFrame, 4
KillFCEUXonFrame:
	.zero	4
	.hidden	noGui
	.globl	noGui
	.section	.sdata.noGui,"aw"
	.align	2
	.type	noGui, @object
	.size	noGui, 4
noGui:
	.word	1
	.section	.sbss._ZZ12FCEUD_UpdatePhPiiE5uflow,"aw",@nobits
	.align	2
	.type	_ZZ12FCEUD_UpdatePhPiiE5uflow, @object
	.size	_ZZ12FCEUD_UpdatePhPiiE5uflow, 4
_ZZ12FCEUD_UpdatePhPiiE5uflow:
	.zero	4
	.section	.sbss._ZZL5DoFuniiE6opause,"aw",@nobits
	.align	2
	.type	_ZZL5DoFuniiE6opause, @object
	.size	_ZZL5DoFuniiE6opause, 4
_ZZL5DoFuniiE6opause:
	.zero	4
	.section	.sbss._ZZL5DoFuniiE6fskipc,"aw",@nobits
	.align	2
	.type	_ZZL5DoFuniiE6fskipc, @object
	.size	_ZZL5DoFuniiE6fskipc, 4
_ZZL5DoFuniiE6fskipc:
	.zero	4
	.hidden	swapDuty
	.globl	swapDuty
	.section	.sbss.swapDuty,"aw",@nobits
	.type	swapDuty, @object
	.size	swapDuty, 1
swapDuty:
	.zero	1
	.hidden	dendy
	.globl	dendy
	.section	.sbss.dendy,"aw",@nobits
	.align	2
	.type	dendy, @object
	.size	dendy, 4
dendy:
	.zero	4
	.hidden	pal_emulation
	.globl	pal_emulation
	.section	.sbss.pal_emulation,"aw",@nobits
	.align	2
	.type	pal_emulation, @object
	.size	pal_emulation, 4
pal_emulation:
	.zero	4
	.hidden	gametype
	.globl	gametype
	.section	.sbss.gametype,"aw",@nobits
	.align	2
	.type	gametype, @object
	.size	gametype, 4
gametype:
	.zero	4
	.section	.sbss._ZL6inited,"aw",@nobits
	.align	2
	.type	_ZL6inited, @object
	.size	_ZL6inited, 4
_ZL6inited:
	.zero	4
	.hidden	eoptions
	.globl	eoptions
	.section	.sbss.eoptions,"aw",@nobits
	.align	2
	.type	eoptions, @object
	.size	eoptions, 4
eoptions:
	.zero	4
	.hidden	turbo
	.globl	turbo
	.section	.sbss.turbo,"aw",@nobits
	.type	turbo, @object
	.size	turbo, 1
turbo:
	.zero	1
	.hidden	isloaded
	.globl	isloaded
	.section	.sbss.isloaded,"aw",@nobits
	.align	2
	.type	isloaded, @object
	.size	isloaded, 4
isloaded:
	.zero	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
