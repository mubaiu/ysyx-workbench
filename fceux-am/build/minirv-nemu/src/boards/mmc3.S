#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"mmc3.cpp"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text._ZL10GENNOMWRAPh,"ax",@progbits
	.align	2
	.type	_ZL10GENNOMWRAPh, @function
_ZL10GENNOMWRAPh:
.LFB20:
	.cfi_startproc
	la a5, A000B; sb a0, 0(a5);
	ret
	.cfi_endproc
.LFE20:
	.size	_ZL10GENNOMWRAPh, .-_ZL10GENNOMWRAPh
	.section	.text._ZL10MBWRAMMMC6jh,"ax",@progbits
	.align	2
	.type	_ZL10MBWRAMMMC6jh, @function
_ZL10MBWRAMMMC6jh:
.LFB21:
	.cfi_startproc
	la a5, WRAM; lw a5, 0(a5);
	andi	a0,a0,1023
	add	a5,a5,a0
	sb	a1,0(a5)
	ret
	.cfi_endproc
.LFE21:
	.size	_ZL10MBWRAMMMC6jh, .-_ZL10MBWRAMMMC6jh
	.section	.text._ZL10MAWRAMMMC6j,"ax",@progbits
	.align	2
	.type	_ZL10MAWRAMMMC6j, @function
_ZL10MAWRAMMMC6j:
.LFB22:
	.cfi_startproc
	andi	a0,a0,1023
	la a5, WRAM; lw a5, 0(a5);
	add	a5,a5,a0
	lbu	a0,0(a5)
	ret
	.cfi_endproc
.LFE22:
	.size	_ZL10MAWRAMMMC6j, .-_ZL10MAWRAMMMC6j
	.section	.text._ZL8M12Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M12Writejh, @function
_ZL8M12Writejh:
.LFB29:
	.cfi_startproc
	slli	a5,a1,4
	andi	a5,a5,256
	andi	a1,a1,1
	or	a1,a1,a5
	la a5, EXPREGS; sh a1, 0(a5);
	ret
	.cfi_endproc
.LFE29:
	.size	_ZL8M12Writejh, .-_ZL8M12Writejh
	.section	.text._ZL7M12Readj,"ax",@progbits
	.align	2
	.type	_ZL7M12Readj, @function
_ZL7M12Readj:
.LFB30:
	.cfi_startproc
	la a0, EXPREGS+2; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE30:
	.size	_ZL7M12Readj, .-_ZL7M12Readj
	.section	.text._ZL7M45Readj,"ax",@progbits
	.align	2
	.type	_ZL7M45Readj, @function
_ZL7M45Readj:
.LFB48:
	.cfi_startproc
	la a5, EXPREGS+5; lbu a5, 0(a5);
	addi	a5,a5,4
	li	a4,1
	sll	a4,a4,a5
	addi	a5,a4,-1
	or	a5,a5,a4
	and	a5,a5,a0
	la a0, X+24; lbu a0, 0(a0);
	beq	a5,zero,.L8
	ori	a0,a0,1
.L8:
	ret
	.cfi_endproc
.LFE48:
	.size	_ZL7M45Readj, .-_ZL7M45Readj
	.section	.text._ZL8GENMWRAPh,"ax",@progbits
	.align	2
	.type	_ZL8GENMWRAPh, @function
_ZL8GENMWRAPh:
.LFB19:
	.cfi_startproc
	mv	a5,a0
	not	a0,a0
	andi	a0,a0,1
	la a4, A000B; sb a5, 0(a4);
	tail	_Z9setmirrori
	.cfi_endproc
.LFE19:
	.size	_ZL8GENMWRAPh, .-_ZL8GENMWRAPh
	.section	.text._ZL6TKSPPUj,"ax",@progbits
	.align	2
	.type	_ZL6TKSPPUj, @function
_ZL6TKSPPUj:
.LFB85:
	.cfi_startproc
	srli	a5,a0,10
	andi	a5,a5,7
	lla	a4,_ZL6TKSMIR
	add	a4,a4,a5
	lbu	a0,0(a4)
	la a4, _ZL9PPUCHRBus; sb a5, 0(a4);
	addi	a0,a0,2
	tail	_Z9setmirrori
	.cfi_endproc
.LFE85:
	.size	_ZL6TKSPPUj, .-_ZL6TKSPPUj
	.section	.text._ZL12GenMMC3Closev,"ax",@progbits
	.align	2
	.type	_ZL12GenMMC3Closev, @function
_ZL12GenMMC3Closev:
.LFB24:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a0, CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L15
	call	_Z10FCEU_gfreePv
.L15:
	la a0, WRAM; lw a0, 0(a0);
	beq	a0,zero,.L16
	call	_Z10FCEU_gfreePv
.L16:
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, WRAM; sw zero, 0(a5);
	la a5, CHRRAM; sw zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	_ZL12GenMMC3Closev, .-_ZL12GenMMC3Closev
	.section	.text._ZL8GENCWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL8GENCWRAPjh, @function
_ZL8GENCWRAPjh:
.LFB17:
	.cfi_startproc
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE17:
	.size	_ZL8GENCWRAPjh, .-_ZL8GENCWRAPjh
	.section	.text._ZL5M12CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M12CWjh, @function
_ZL5M12CWjh:
.LFB28:
	.cfi_startproc
	srli	a5,a0,12
	andi	a5,a5,1
	lla	a4,EXPREGS
	add	a5,a4,a5
	lbu	a5,0(a5)
	slli	a5,a5,8
	add	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE28:
	.size	_ZL5M12CWjh, .-_ZL5M12CWjh
	.section	.text._ZL5M37CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M37CWjh, @function
_ZL5M37CWjh:
.LFB35:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a1,a1,127
	slli	a5,a5,6
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE35:
	.size	_ZL5M37CWjh, .-_ZL5M37CWjh
	.section	.text._ZL5M44CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M44CWjh, @function
_ZL5M44CWjh:
.LFB41:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	li	a4,5
	bgtu	a5,a4,.L28
	andi	a1,a1,127
.L28:
	slli	a5,a5,7
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE41:
	.size	_ZL5M44CWjh, .-_ZL5M44CWjh
	.section	.text._ZL5M47CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M47CWjh, @function
_ZL5M47CWjh:
.LFB53:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a1,a1,127
	slli	a5,a5,7
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE53:
	.size	_ZL5M47CWjh, .-_ZL5M47CWjh
	.section	.text._ZL5M49CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M49CWjh, @function
_ZL5M49CWjh:
.LFB58:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,1
	andi	a1,a1,127
	andi	a5,a5,384
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE58:
	.size	_ZL5M49CWjh, .-_ZL5M49CWjh
	.section	.text._ZL5M52CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M52CWjh, @function
_ZL5M52CWjh:
.LFB64:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	srli	a3,a5,4
	srli	a6,a5,6
	andi	a4,a3,2
	andi	a2,a5,4
	and	a3,a3,a6
	slli	a5,a5,1
	or	a4,a4,a2
	andi	a3,a3,1
	andi	a5,a5,128
	or	a4,a4,a3
	xori	a5,a5,255
	slli	a4,a4,7
	and	a1,a5,a1
	or	a1,a4,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE64:
	.size	_ZL5M52CWjh, .-_ZL5M52CWjh
	.section	.text._ZL6M115CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M115CWjh, @function
_ZL6M115CWjh:
.LFB80:
	.cfi_startproc
	la a5, EXPREGS+1; lbu a5, 0(a5);
	slli	a5,a5,8
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE80:
	.size	_ZL6M115CWjh, .-_ZL6M115CWjh
	.section	.text._ZL6M134CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M134CWjh, @function
_ZL6M134CWjh:
.LFB90:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,3
	andi	a5,a5,256
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE90:
	.size	_ZL6M134CWjh, .-_ZL6M134CWjh
	.section	.text._ZL11UNLMaliSBCWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLMaliSBCWjh, @function
_ZL11UNLMaliSBCWjh:
.LFB117:
	.cfi_startproc
	srli	a5,a1,4
	andi	a4,a1,-35
	andi	a5,a5,2
	slli	a1,a1,4
	or	a5,a5,a4
	andi	a1,a1,32
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE117:
	.size	_ZL11UNLMaliSBCWjh, .-_ZL11UNLMaliSBCWjh
	.section	.text._ZL6M205CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M205CWjh, @function
_ZL6M205CWjh:
.LFB126:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,3
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE126:
	.size	_ZL6M205CWjh, .-_ZL6M205CWjh
	.section	.text._ZL6M249CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M249CWjh, @function
_ZL6M249CWjh:
.LFB137:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L37
	srli	a5,a1,1
	srli	a3,a1,4
	slli	a4,a1,24
	srai	a4,a4,24
	andi	a3,a3,8
	andi	a5,a5,4
	andi	a2,a1,3
	or	a5,a5,a3
	srli	a1,a1,2
	slli	a3,a4,3
	slli	a4,a4,2
	andi	a1,a1,16
	or	a5,a5,a2
	andi	a3,a3,32
	andi	a4,a4,-64
	or	a5,a5,a1
	or	a4,a3,a4
	or	a5,a5,a4
	andi	a1,a5,0xff
.L37:
	tail	_Z7setchr1jj
	.cfi_endproc
.LFE137:
	.size	_ZL6M249CWjh, .-_ZL6M249CWjh
	.section	.text._ZL7TKSWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL7TKSWRAPjh, @function
_ZL7TKSWRAPjh:
.LFB86:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	lla	a5,_ZL6TKSMIR
	.cfi_offset 8, -8
	srli	s0,a0,10
	sw	s1,4(sp)
	add	a5,a5,s0
	sw	ra,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	srli	s1,a1,7
	andi	a1,a1,127
	sb	s1,0(a5)
	call	_Z7setchr1jj
	la a5, _ZL9PPUCHRBus; lbu a5, 0(a5);
	beq	s0,a5,.L44
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
.L44:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	a0,s1,2
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE86:
	.size	_ZL7TKSWRAPjh, .-_ZL7TKSWRAPjh
	.section	.text._ZL8GENPWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL8GENPWRAPjh, @function
_ZL8GENPWRAPjh:
.LFB18:
	.cfi_startproc
	la a5, kt_extra; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a5,a5,64
	andi	a1,a1,127
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE18:
	.size	_ZL8GENPWRAPjh, .-_ZL8GENPWRAPjh
	.section	.text._ZL5M37PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M37PWjh, @function
_ZL5M37PWjh:
.LFB34:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	li	a3,2
	andi	a4,a1,15
	beq	a5,a3,.L48
	andi	a4,a1,7
.L48:
	slli	a5,a5,3
	or	a1,a4,a5
	andi	a1,a1,0xff
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE34:
	.size	_ZL5M37PWjh, .-_ZL5M37PWjh
	.section	.text._ZL5M44PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M44PWjh, @function
_ZL5M44PWjh:
.LFB40:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	li	a3,5
	andi	a4,a1,15
	bleu	a5,a3,.L51
	andi	a4,a1,31
.L51:
	slli	a5,a5,4
	or	a1,a5,a4
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE40:
	.size	_ZL5M44PWjh, .-_ZL5M44PWjh
	.section	.text._ZL5M45PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M45PWjh, @function
_ZL5M45PWjh:
.LFB46:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	lbu	a3,1(a4)
	not	a5,a5
	and	a1,a1,a5
	andi	a1,a1,63
	la a5, UNIFchrrama; lw a5, 0(a5);
	or	a1,a1,a3
	beq	a5,zero,.L53
	lbu	a5,2(a4)
	slli	a5,a5,2
	andi	a5,a5,256
	or	a1,a1,a5
.L53:
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE46:
	.size	_ZL5M45PWjh, .-_ZL5M45PWjh
	.section	.text._ZL5M47PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M47PWjh, @function
_ZL5M47PWjh:
.LFB52:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a1,a1,15
	slli	a5,a5,4
	or	a1,a1,a5
	andi	a1,a1,0xff
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE52:
	.size	_ZL5M47PWjh, .-_ZL5M47PWjh
	.section	.text._ZL5M52PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M52PWjh, @function
_ZL5M52PWjh:
.LFB63:
	.cfi_startproc
	la a3, EXPREGS; lbu a3, 0(a3);
	srli	a5,a3,3
	and	a5,a3,a5
	slli	a4,a3,1
	andi	a5,a5,1
	andi	a3,a3,6
	andi	a4,a4,16
	or	a5,a5,a3
	xori	a4,a4,31
	slli	a5,a5,4
	and	a1,a4,a1
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE63:
	.size	_ZL5M52PWjh, .-_ZL5M52PWjh
	.section	.text._ZL6M134PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M134PWjh, @function
_ZL6M134PWjh:
.LFB89:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,4
	andi	a5,a5,32
	andi	a1,a1,31
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE89:
	.size	_ZL6M134PWjh, .-_ZL6M134PWjh
	.section	.text._ZL11UNLMaliSBPWjh,"ax",@progbits
	.align	2
	.type	_ZL11UNLMaliSBPWjh, @function
_ZL11UNLMaliSBPWjh:
.LFB116:
	.cfi_startproc
	srli	a5,a1,1
	andi	a4,a1,3
	andi	a5,a5,4
	slli	a1,a1,1
	or	a5,a5,a4
	andi	a1,a1,8
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE116:
	.size	_ZL11UNLMaliSBPWjh, .-_ZL11UNLMaliSBPWjh
	.section	.text._ZL6M205PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M205PWjh, @function
_ZL6M205PWjh:
.LFB125:
	.cfi_startproc
	andi	a1,a1,15
	la a5, EXPREGS; lbu a5, 0(a5);
	or	a1,a1,a5
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE125:
	.size	_ZL6M205PWjh, .-_ZL6M205PWjh
	.section	.text._ZL6M245PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M245PWjh, @function
_ZL6M245PWjh:
.LFB133:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	slli	a5,a5,5
	andi	a5,a5,64
	andi	a1,a1,63
	or	a1,a5,a1
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE133:
	.size	_ZL6M245PWjh, .-_ZL6M245PWjh
	.section	.text._ZL6M249PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M249PWjh, @function
_ZL6M249PWjh:
.LFB136:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a5,a5,2
	beq	a5,zero,.L64
	li	a5,31
	bgtu	a1,a5,.L65
	srli	a5,a1,3
	srli	a4,a1,1
	andi	a5,a5,2
	andi	a4,a4,4
	andi	a3,a1,1
	or	a5,a5,a4
	slli	a1,a1,2
	or	a5,a5,a3
	andi	a1,a1,24
	or	a1,a5,a1
.L64:
	tail	_Z7setprg8jj
.L65:
	addi	a1,a1,-32
	andi	a1,a1,0xff
	srli	a5,a1,1
	srli	a3,a1,4
	slli	a4,a1,24
	srai	a4,a4,24
	andi	a3,a3,8
	andi	a5,a5,4
	or	a5,a5,a3
	andi	a2,a1,3
	slli	a3,a4,3
	srli	a1,a1,2
	slli	a4,a4,2
	andi	a1,a1,16
	or	a5,a5,a2
	andi	a3,a3,32
	andi	a4,a4,-64
	or	a5,a5,a1
	or	a4,a3,a4
	or	a5,a5,a4
	andi	a1,a5,0xff
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE136:
	.size	_ZL6M249PWjh, .-_ZL6M249PWjh
	.section	.text._ZL5M49PWjh,"ax",@progbits
	.align	2
	.type	_ZL5M49PWjh, @function
_ZL5M49PWjh:
.LFB57:
	.cfi_startproc
	la a5, EXPREGS; lbu a5, 0(a5);
	andi	a4,a5,1
	beq	a4,zero,.L70
	srli	a5,a5,2
	andi	a1,a1,15
	andi	a5,a5,48
	or	a1,a1,a5
	tail	_Z7setprg8jj
.L70:
	srli	a1,a5,4
	andi	a1,a1,3
	li	a0,32768
	tail	_Z8setprg32jj
	.cfi_endproc
.LFE57:
	.size	_ZL5M49PWjh, .-_ZL5M49PWjh
	.section	.text._ZL6TQWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL6TQWRAPjh, @function
_ZL6TQWRAPjh:
.LFB87:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	srli	a0,a2,2
	andi	a0,a0,16
	andi	a2,a2,63
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE87:
	.size	_ZL6TQWRAPjh, .-_ZL6TQWRAPjh
	.section	.text._ZL6M191CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M191CWjh, @function
_ZL6M191CWjh:
.LFB102:
	.cfi_startproc
	mv	a2,a1
	mv	a1,a0
	srli	a0,a2,3
	andi	a0,a0,16
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE102:
	.size	_ZL6M191CWjh, .-_ZL6M191CWjh
	.section	.text._ZL6M115PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M115PWjh, @function
_ZL6M115PWjh:
.LFB79:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	slli	a4,a5,24
	srai	a4,a4,24
	bge	a4,zero,.L74
	andi	a4,a5,32
	beq	a4,zero,.L75
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	srli	a1,a5,1
	andi	a1,a1,7
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg32jj
.L75:
	.cfi_restore_state
	andi	a1,a5,15
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	andi	a1,a1,15
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
.L74:
	.cfi_restore_state
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE79:
	.size	_ZL6M115PWjh, .-_ZL6M115PWjh
	.section	.text._ZL9MR254WRAMj,"ax",@progbits
	.align	2
	.type	_ZL9MR254WRAMj, @function
_ZL9MR254WRAMj:
.LFB145:
	.cfi_startproc
	lla	a4,EXPREGS
	la a5, WRAM; lw a5, 0(a5);
	lbu	a3,0(a4)
	add	a5,a5,a0
	li	a0,-24576
	add	a0,a0,a5
	lbu	a0,0(a0)
	bne	a3,zero,.L78
	lbu	a5,1(a4)
	xor	a0,a0,a5
.L78:
	ret
	.cfi_endproc
.LFE145:
	.size	_ZL9MR254WRAMj, .-_ZL9MR254WRAMj
	.section	.text._Z13MMC3_IRQWritejh,"ax",@progbits
	.align	2
	.globl	_Z13MMC3_IRQWritejh
	.hidden	_Z13MMC3_IRQWritejh
	.type	_Z13MMC3_IRQWritejh, @function
_Z13MMC3_IRQWritejh:
.LFB10:
	.cfi_startproc
	li	a5,57344
	addi	a5,a5,1
	li	a4,57344
	and	a0,a0,a5
	beq	a0,a4,.L80
	beq	a0,a5,.L81
	li	a5,49152
	beq	a0,a5,.L82
	addi	a5,a5,1
	bne	a0,a5,.L88
	li	a5,1
	la a4, IRQReload; sb a5, 0(a4);
	ret
.L81:
	li	a5,1
	la a4, IRQa; sb a5, 0(a4);
	ret
.L80:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, IRQa; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L82:
	la a5, IRQLatch; sb a1, 0(a5);
	ret
.L88:
	ret
	.cfi_endproc
.LFE10:
	.size	_Z13MMC3_IRQWritejh, .-_Z13MMC3_IRQWritejh
	.section	.text._ZL16ClockMMC3Counterv,"ax",@progbits
	.align	2
	.type	_ZL16ClockMMC3Counterv, @function
_ZL16ClockMMC3Counterv:
.LFB12:
	.cfi_startproc
	lla	a4,IRQCount
	lbu	a5,0(a4)
	beq	a5,zero,.L90
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L91
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L92:
	bne	a5,zero,.L89
.L100:
	la a5, IRQa; lbu a5, 0(a5);
	bne	a5,zero,.L99
.L89:
	ret
.L90:
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L92
	ret
.L91:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L89
	j	.L100
.L99:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE12:
	.size	_ZL16ClockMMC3Counterv, .-_ZL16ClockMMC3Counterv
	.section	.text._ZL5M45CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M45CWjh, @function
_ZL5M45CWjh:
.LFB45:
	.cfi_startproc
	la a5, UNIFchrrama; lw a5, 0(a5);
	mv	a3,a0
	mv	a4,a1
	beq	a5,zero,.L106
	tail	_Z7setchr1jj
.L106:
	lla	a2,EXPREGS
	lbu	a5,2(a2)
	andi	a1,a5,8
	beq	a1,zero,.L103
	andi	a0,a5,7
	addi	a0,a0,1
	li	a1,1
	sll	a1,a1,a0
	addi	a1,a1,-1
	and	a4,a4,a1
.L104:
	lbu	a1,0(a2)
	li	a2,4096
	slli	a5,a5,4
	addi	a2,a2,-256
	and	a5,a5,a2
	or	a1,a5,a1
	or	a1,a1,a4
	mv	a0,a3
	tail	_Z7setchr1jj
.L103:
	seqz	a1,a5
	neg	a1,a1
	and	a4,a4,a1
	j	.L104
	.cfi_endproc
.LFE45:
	.size	_ZL5M45CWjh, .-_ZL5M45CWjh
	.section	.text._ZL6M198PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M198PWjh, @function
_ZL6M198PWjh:
.LFB123:
	.cfi_startproc
	li	a4,79
	bleu	a1,a4,.L108
	andi	a1,a1,79
	tail	_Z7setprg8jj
.L108:
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE123:
	.size	_ZL6M198PWjh, .-_ZL6M198PWjh
	.section	.text._ZL6M196PWjh,"ax",@progbits
	.align	2
	.type	_ZL6M196PWjh, @function
_ZL6M196PWjh:
.LFB111:
	.cfi_startproc
	lla	a5,EXPREGS
	lbu	a4,0(a5)
	beq	a4,zero,.L110
	lbu	a1,1(a5)
	li	a0,32768
	tail	_Z8setprg32jj
.L110:
	tail	_Z7setprg8jj
	.cfi_endproc
.LFE111:
	.size	_ZL6M196PWjh, .-_ZL6M196PWjh
	.section	.text._ZL5M76CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M76CWjh, @function
_ZL5M76CWjh:
.LFB69:
	.cfi_startproc
	li	a5,4096
	bgeu	a0,a5,.L113
	ret
.L113:
	li	a5,8192
	slli	a0,a0,1
	addi	a5,a5,-2048
	and	a0,a0,a5
	tail	_Z7setchr2jj
	.cfi_endproc
.LFE69:
	.size	_ZL5M76CWjh, .-_ZL5M76CWjh
	.section	.text._ZL5M74CWjh,"ax",@progbits
	.align	2
	.type	_ZL5M74CWjh, @function
_ZL5M74CWjh:
.LFB71:
	.cfi_startproc
	addi	a5,a1,-8
	andi	a5,a5,0xff
	li	a4,1
	mv	a2,a1
	mv	a1,a0
	bleu	a5,a4,.L116
	li	a0,0
	tail	_Z8setchr1rijj
.L116:
	li	a0,16
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE71:
	.size	_ZL5M74CWjh, .-_ZL5M74CWjh
	.section	.text._ZL9M114PWRAPjh,"ax",@progbits
	.align	2
	.type	_ZL9M114PWRAPjh, @function
_ZL9M114PWRAPjh:
.LFB73:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,EXPREGS
	lbu	a5,0(s0)
	slli	a4,a5,24
	srai	a4,a4,24
	blt	a4,zero,.L120
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a1,a1,63
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setprg8jj
.L120:
	.cfi_restore_state
	andi	a1,a5,15
	li	a0,32768
	call	_Z8setprg16jj
	lbu	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,49152
	andi	a1,a1,15
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setprg16jj
	.cfi_endproc
.LFE73:
	.size	_ZL9M114PWRAPjh, .-_ZL9M114PWRAPjh
	.section	.text._ZL6M197CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M197CWjh, @function
_ZL6M197CWjh:
.LFB121:
	.cfi_startproc
	beq	a0,zero,.L126
	li	a4,4096
	beq	a0,a4,.L125
	li	a4,4096
	addi	a4,a4,1024
	beq	a0,a4,.L127
	ret
.L126:
	srli	a1,a1,1
	tail	_Z7setchr4jj
.L127:
	li	a0,8192
	addi	a0,a0,-2048
.L125:
	tail	_Z7setchr2jj
	.cfi_endproc
.LFE121:
	.size	_ZL6M197CWjh, .-_ZL6M197CWjh
	.section	.text._ZL8M115Readj,"ax",@progbits
	.align	2
	.type	_ZL8M115Readj, @function
_ZL8M115Readj:
.LFB191:
	.cfi_startproc
	la a0, EXPREGS+2; lbu a0, 0(a0);
	ret
	.cfi_endproc
.LFE191:
	.size	_ZL8M115Readj, .-_ZL8M115Readj
	.section	.text._ZL6M195CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M195CWjh, @function
_ZL6M195CWjh:
.LFB108:
	.cfi_startproc
	mv	a2,a1
	li	a5,3
	mv	a1,a0
	bgtu	a2,a5,.L130
	li	a0,16
	tail	_Z8setchr1rijj
.L130:
	li	a0,0
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE108:
	.size	_ZL6M195CWjh, .-_ZL6M195CWjh
	.section	.text._ZL6M192CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M192CWjh, @function
_ZL6M192CWjh:
.LFB104:
	.cfi_startproc
	addi	a5,a1,-8
	andi	a5,a5,0xff
	li	a4,3
	mv	a2,a1
	mv	a1,a0
	bgtu	a5,a4,.L132
	li	a0,16
	tail	_Z8setchr1rijj
.L132:
	li	a0,0
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE104:
	.size	_ZL6M192CWjh, .-_ZL6M192CWjh
	.section	.text._ZL6M194CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M194CWjh, @function
_ZL6M194CWjh:
.LFB106:
	.cfi_startproc
	mv	a2,a1
	li	a5,1
	mv	a1,a0
	bleu	a2,a5,.L135
	li	a0,0
	tail	_Z8setchr1rijj
.L135:
	li	a0,16
	tail	_Z8setchr1rijj
	.cfi_endproc
.LFE106:
	.size	_ZL6M194CWjh, .-_ZL6M194CWjh
	.section	.text._ZL9M165PPUFEv.part.0,"ax",@progbits
	.align	2
	.type	_ZL9M165PPUFEv.part.0, @function
_ZL9M165PPUFEv.part.0:
.LFB174:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,DRegBuf
	lbu	a1,1(s0)
	bne	a1,zero,.L137
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a1,4(s0)
	bne	a1,zero,.L139
.L141:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setchr4rijj
.L137:
	.cfi_restore_state
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,4(s0)
	beq	a1,zero,.L141
.L139:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	srli	a1,a1,2
	li	a0,4096
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
	.cfi_endproc
.LFE174:
	.size	_ZL9M165PPUFEv.part.0, .-_ZL9M165PPUFEv.part.0
	.section	.text._ZL7M165CWMjh,"ax",@progbits
	.align	2
	.type	_ZL7M165CWMjh, @function
_ZL7M165CWMjh:
.LFB98:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a5,0(s0)
	andi	a4,a5,5
	beq	a4,zero,.L154
.L143:
	andi	a5,a5,7
	li	a4,18
	srl	a5,a4,a5
	andi	a5,a5,1
	beq	a5,zero,.L142
	la a4, EXPREGS; lbu a4, 0(a4);
	li	a5,254
	beq	a4,a5,.L155
.L142:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L154:
	.cfi_restore_state
	la a4, EXPREGS; lbu a4, 0(a4);
	li	a5,253
	bne	a4,a5,.L142
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,DRegBuf
	lbu	a1,0(s1)
	bne	a1,zero,.L146
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
.L147:
	lbu	a1,2(s1)
	bne	a1,zero,.L148
	li	a2,0
	li	a1,4096
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a5,0(s0)
	lw	s1,4(sp)
	.cfi_restore 9
	j	.L143
.L155:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_ZL9M165PPUFEv.part.0
.L148:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	srli	a1,a1,2
	li	a0,4096
	call	_Z7setchr4jj
	lbu	a5,0(s0)
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	j	.L143
.L146:
	.cfi_restore_state
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	j	.L147
	.cfi_endproc
.LFE98:
	.size	_ZL7M165CWMjh, .-_ZL7M165CWMjh
	.section	.text._ZL7M165PPUj,"ax",@progbits
	.align	2
	.type	_ZL7M165PPUj, @function
_ZL7M165PPUj:
.LFB99:
	.cfi_startproc
	li	a4,8192
	addi	a4,a4,-16
	li	a5,8192
	and	a0,a0,a4
	addi	a5,a5,-48
	beq	a0,a5,.L165
	li	a5,8192
	addi	a5,a5,-32
	beq	a0,a5,.L166
	ret
.L165:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,DRegBuf
	lbu	a1,0(s0)
	li	a5,-3
	la a4, EXPREGS; sb a5, 0(a4);
	beq	a1,zero,.L167
	srli	a1,a1,2
	li	a0,0
	call	_Z7setchr4jj
	lbu	a1,2(s0)
	bne	a1,zero,.L160
.L168:
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,0
	li	a1,4096
	li	a0,16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z8setchr4rijj
.L167:
	.cfi_restore_state
	li	a2,0
	li	a0,16
	call	_Z8setchr4rijj
	lbu	a1,2(s0)
	beq	a1,zero,.L168
.L160:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	srli	a1,a1,2
	li	a0,4096
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z7setchr4jj
.L166:
	li	a5,-2
	la a4, EXPREGS; sb a5, 0(a4);
	tail	_ZL9M165PPUFEv.part.0
	.cfi_endproc
.LFE99:
	.size	_ZL7M165PPUj, .-_ZL7M165PPUj
	.section	.text._ZL12M250IRQWritejh,"ax",@progbits
	.align	2
	.type	_ZL12M250IRQWritejh, @function
_ZL12M250IRQWritejh:
.LFB142:
	.cfi_startproc
	srli	a5,a0,10
	li	a4,57344
	andi	a5,a5,1
	and	a3,a0,a4
	or	a5,a5,a3
	beq	a5,a4,.L170
	addi	a4,a4,1
	beq	a5,a4,.L171
	li	a4,49152
	beq	a5,a4,.L172
	addi	a4,a4,1
	bne	a5,a4,.L178
	li	a5,1
	la a4, IRQReload; sb a5, 0(a4);
	ret
.L171:
	li	a5,1
	la a4, IRQa; sb a5, 0(a4);
	ret
.L170:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, IRQa; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L172:
	la a5, IRQLatch; sb a0, 0(a5);
	ret
.L178:
	ret
	.cfi_endproc
.LFE142:
	.size	_ZL12M250IRQWritejh, .-_ZL12M250IRQWritejh
	.section	.text._ZL7MMC3_hbv,"ax",@progbits
	.align	2
	.type	_ZL7MMC3_hbv, @function
_ZL7MMC3_hbv:
.LFB13:
	.cfi_startproc
	lla	a4,IRQCount
	lbu	a5,0(a4)
	beq	a5,zero,.L180
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L181
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L182:
	bne	a5,zero,.L179
.L190:
	la a5, IRQa; lbu a5, 0(a5);
	bne	a5,zero,.L189
.L179:
	ret
.L180:
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L182
	ret
.L181:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L179
	j	.L190
.L189:
	li	a0,1
	tail	_Z14X6502_IRQBegini
	.cfi_endproc
.LFE13:
	.size	_ZL7MMC3_hbv, .-_ZL7MMC3_hbv
	.section	.text._ZL22MMC3_hb_KickMasterHackv,"ax",@progbits
	.align	2
	.type	_ZL22MMC3_hb_KickMasterHackv, @function
_ZL22MMC3_hb_KickMasterHackv:
.LFB14:
	.cfi_startproc
	la a4, scanline; lw a4, 0(a4);
	li	a5,238
	beq	a4,a5,.L214
	lla	a4,IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L215
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L207
.L209:
	ret
.L215:
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L206
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L207:
	bne	a5,zero,.L209
.L217:
	la a5, IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L209
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L214:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL16ClockMMC3Counterv
	lla	a4,IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L216
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L195
.L191:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L206:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L209
	j	.L217
.L216:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L194
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L195:
	bne	a5,zero,.L191
	la a5, IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L191
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_IRQBegini
.L194:
	.cfi_restore_state
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	j	.L195
	.cfi_endproc
.LFE14:
	.size	_ZL22MMC3_hb_KickMasterHackv, .-_ZL22MMC3_hb_KickMasterHackv
	.section	.text._ZL23MMC3_hb_PALStarWarsHackv,"ax",@progbits
	.align	2
	.type	_ZL23MMC3_hb_PALStarWarsHackv, @function
_ZL23MMC3_hb_PALStarWarsHackv:
.LFB15:
	.cfi_startproc
	la a4, scanline; lw a4, 0(a4);
	li	a5,240
	beq	a4,a5,.L241
	lla	a4,IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L242
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L234
.L236:
	ret
.L242:
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L233
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L234:
	bne	a5,zero,.L236
.L244:
	la a5, IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L236
	li	a0,1
	tail	_Z14X6502_IRQBegini
.L241:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_ZL16ClockMMC3Counterv
	lla	a4,IRQCount
	lbu	a5,0(a4)
	bne	a5,zero,.L243
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
	la a4, _ZL6isRevB; lw a4, 0(a4);
	bne	a4,zero,.L222
.L218:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L233:
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	bne	a5,zero,.L236
	j	.L244
.L243:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	la a3, IRQReload; lbu a3, 0(a3);
	beq	a3,zero,.L221
	la a5, IRQLatch; lbu a5, 0(a5);
	sb	a5,0(a4)
	la a4, IRQReload; sb zero, 0(a4);
.L222:
	bne	a5,zero,.L218
	la a5, IRQa; lbu a5, 0(a5);
	beq	a5,zero,.L218
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14X6502_IRQBegini
.L221:
	.cfi_restore_state
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,0(a4)
	j	.L222
	.cfi_endproc
.LFE15:
	.size	_ZL23MMC3_hb_PALStarWarsHackv, .-_ZL23MMC3_hb_PALStarWarsHackv
	.section	.text._Z10FixMMC3PRGi,"ax",@progbits
	.align	2
	.globl	_Z10FixMMC3PRGi
	.hidden	_Z10FixMMC3PRGi
	.type	_Z10FixMMC3PRGi, @function
_Z10FixMMC3PRGi:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	lla	s0,pwrap
	lla	s1,DRegBuf
	andi	a0,a0,64
	lw	a5,0(s0)
	lbu	a1,6(s1)
	beq	a0,zero,.L246
	li	a0,49152
	jalr	a5
	lw	a5,0(s0)
	li	a1,254
	li	a0,32768
	jalr	a5
.L247:
	lw	a5,0(s0)
	lbu	a1,7(s1)
	li	a0,40960
	jalr	a5
	lw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	li	a1,255
	li	a0,57344
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L246:
	.cfi_restore_state
	li	a0,32768
	jalr	a5
	lw	a5,0(s0)
	li	a1,254
	li	a0,49152
	jalr	a5
	j	.L247
	.cfi_endproc
.LFE6:
	.size	_Z10FixMMC3PRGi, .-_Z10FixMMC3PRGi
	.section	.text._Z14KT008HackWritejh,"ax",@progbits
	.align	2
	.globl	_Z14KT008HackWritejh
	.hidden	_Z14KT008HackWritejh
	.type	_Z14KT008HackWritejh, @function
_Z14KT008HackWritejh:
.LFB11:
	.cfi_startproc
	andi	a0,a0,3
	bne	a0,zero,.L249
	addi	a5,a1,-39
	snez	a5,a5
	neg	a5,a5
	and	a1,a1,a5
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, kt_extra; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
.L249:
	ret
	.cfi_endproc
.LFE11:
	.size	_Z14KT008HackWritejh, .-_Z14KT008HackWritejh
	.section	.text._ZL11M114ExWritejh,"ax",@progbits
	.align	2
	.type	_ZL11M114ExWritejh, @function
_ZL11M114ExWritejh:
.LFB75:
	.cfi_startproc
	li	a5,32768
	bltu	a0,a5,.L254
	ret
.L254:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	la a5, EXPREGS; sb a1, 0(a5);
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE75:
	.size	_ZL11M114ExWritejh, .-_ZL11M114ExWritejh
	.section	.text._ZL9M115Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M115Writejh, @function
_ZL9M115Writejh:
.LFB81:
	.cfi_startproc
	li	a5,20480
	addi	a5,a5,128
	beq	a0,a5,.L259
	li	a5,24576
	beq	a0,a5,.L260
	li	a5,24576
	addi	a5,a5,1
	bne	a0,a5,.L257
	la a5, EXPREGS+1; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L260:
	la a5, EXPREGS; sb a1, 0(a5);
.L257:
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
.L259:
	la a5, EXPREGS+2; sb a1, 0(a5);
	la a0, MMC3_cmd; lbu a0, 0(a0);
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE81:
	.size	_ZL9M115Writejh, .-_ZL9M115Writejh
	.section	.text._ZL16Mapper196WriteLojh,"ax",@progbits
	.align	2
	.type	_ZL16Mapper196WriteLojh, @function
_ZL16Mapper196WriteLojh:
.LFB113:
	.cfi_startproc
	andi	a5,a1,15
	srli	a1,a1,4
	lla	a4,EXPREGS
	or	a5,a5,a1
	li	a3,1
	la a0, MMC3_cmd; lbu a0, 0(a0);
	sb	a3,0(a4)
	sb	a5,1(a4)
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE113:
	.size	_ZL16Mapper196WriteLojh, .-_ZL16Mapper196WriteLojh
	.section	.text._ZL6M245CWjh,"ax",@progbits
	.align	2
	.type	_ZL6M245CWjh, @function
_ZL6M245CWjh:
.LFB132:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	la a5, UNIFchrrama; lw a5, 0(a5);
	mv	s0,a1
	beq	a5,zero,.L265
.L263:
	la a5, EXPREGS; sb s0, 0(a5);
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a0, MMC3_cmd; lbu a0, 0(a0);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3PRGi
.L265:
	.cfi_restore_state
	andi	a1,a1,7
	call	_Z7setchr1jj
	j	.L263
	.cfi_endproc
.LFE132:
	.size	_ZL6M245CWjh, .-_ZL6M245CWjh
	.section	.text._Z10FixMMC3CHRi,"ax",@progbits
	.align	2
	.globl	_Z10FixMMC3CHRi
	.hidden	_Z10FixMMC3CHRi
	.type	_Z10FixMMC3CHRi, @function
_Z10FixMMC3CHRi:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	lla	s2,DRegBuf
	lla	s1,cwrap
	lbu	a1,0(s2)
	lw	a5,0(s1)
	slli	s0,a0,5
	li	s3,4096
	and	s0,s0,s3
	andi	a1,a1,254
	mv	a0,s0
	jalr	a5
	lbu	a1,0(s2)
	lw	a5,0(s1)
	ori	a0,s0,1024
	ori	a1,a1,1
	jalr	a5
	lbu	a1,1(s2)
	lw	a5,0(s1)
	li	a0,4096
	addi	a0,a0,-2048
	andi	a1,a1,254
	or	a0,s0,a0
	jalr	a5
	lbu	a1,1(s2)
	lw	a5,0(s1)
	li	a0,4096
	addi	a0,a0,-1024
	ori	a1,a1,1
	or	a0,s0,a0
	jalr	a5
	lw	a5,0(s1)
	lbu	a1,2(s2)
	xor	a0,s0,s3
	jalr	a5
	lw	a5,0(s1)
	lbu	a1,3(s2)
	li	a0,4096
	addi	a0,a0,1024
	xor	a0,s0,a0
	jalr	a5
	lw	a5,0(s1)
	lbu	a1,4(s2)
	li	a0,8192
	addi	a0,a0,-2048
	xor	a0,s0,a0
	jalr	a5
	lw	a5,0(s1)
	lbu	a1,5(s2)
	li	a0,8192
	addi	a0,a0,-1024
	xor	a0,s0,a0
	jalr	a5
	la a5, mwrap; lw a5, 0(a5);
	beq	a5,zero,.L266
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	la a0, A000B; lbu a0, 0(a0);
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	a5
.L266:
	.cfi_restore_state
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
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	_Z10FixMMC3CHRi, .-_Z10FixMMC3CHRi
	.section	.text._Z12MMC3RegResetv,"ax",@progbits
	.align	2
	.globl	_Z12MMC3RegResetv
	.hidden	_Z12MMC3RegResetv
	.type	_Z12MMC3RegResetv, @function
_Z12MMC3RegResetv:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,84148224
	li	a5,16777216
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a3,DRegBuf
	addi	a5,a5,1798
	addi	a4,a4,512
	li	a0,0
	sw	a5,4(a3)
	la a2, MMC3_cmd; sb zero, 0(a2);
	la a2, IRQa; sb zero, 0(a2);
	la a2, IRQLatch; sb zero, 0(a2);
	la a2, IRQCount; sb zero, 0(a2);
	sw	a4,0(a3)
	la a5, kt_extra; sb zero, 0(a5);
	call	_Z10FixMMC3PRGi
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE8:
	.size	_Z12MMC3RegResetv, .-_Z12MMC3RegResetv
	.section	.text._Z12GenMMC3Powerv,"ax",@progbits
	.align	2
	.globl	_Z12GenMMC3Powerv
	.hidden	_Z12GenMMC3Powerv
	.type	_Z12GenMMC3Powerv, @function
_Z12GenMMC3Powerv:
.LFB23:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,16(sp)
	la a5, UNIFchrrama; lw a5, 0(a5);
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	beq	a5,zero,.L272
	li	a0,0
	call	_Z7setchr8j
.L272:
	li	a1,49152
	lla	a2,_Z13MMC3_CMDWritejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	li	s0,65536
	addi	a1,s0,-1
	lla	a2,_Z13MMC3_IRQWritejh
	li	a0,49152
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lla	a2,_Z6CartBRj
	li	a0,32768
	call	_Z14SetReadHandleriiPFhjE
	li	a1,24576
	lla	a2,_Z14KT008HackWritejh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	li	a0,1
	la a5, A000B; sb zero, 0(a5);
	la a5, A001B; sb zero, 0(a5);
	lla	s0,mmc3opts
	call	_Z9setmirrori
	lbu	a5,0(s0)
	li	s2,24576
	andi	a5,a5,1
	beq	a5,zero,.L274
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lla	s1,WRAMSIZE
	lw	a0,0(s1)
	sw	s4,8(sp)
	li	a5,1024
	.cfi_offset 20, -24
	lla	s4,WRAM
	lw	a2,0(s4)
	beq	a0,a5,.L284
	li	a1,24576
	srli	a0,a0,10
	sw	s3,12(sp)
	.cfi_offset 19, -20
	call	_Z16FCEU_CheatAddRAMijPh
	lw	a1,0(s1)
	li	s3,8192
	addi	s3,s3,-1
	addi	a1,a1,-1
	and	a1,a1,s3
	lla	a2,_Z6CartBWjh
	add	a1,a1,s2
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	a1,0(s1)
	lla	a2,_Z6CartBRj
	li	a0,24576
	addi	a1,a1,-1
	and	a1,a1,s3
	add	a1,a1,s2
	call	_Z14SetReadHandleriiPFhjE
	li	a2,0
	li	a1,24576
	li	a0,16
	call	_Z8setprg8rijj
	lbu	a5,0(s0)
	lw	s3,12(sp)
	.cfi_restore 19
	andi	a5,a5,2
	beq	a5,zero,.L285
.L283:
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s4,8(sp)
	.cfi_restore 20
.L274:
	call	_Z12MMC3RegResetv
	la a0, CHRRAM; lw a0, 0(a0);
	beq	a0,zero,.L271
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s2,16(sp)
	.cfi_restore 18
	la a1, CHRRAMSIZE; lw a1, 0(a1);
	li	a2,1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	tail	_Z15FCEU_MemoryRandPhjb
.L271:
	.cfi_restore_state
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L284:
	.cfi_def_cfa_offset 32
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	li	a1,28672
	li	a0,1
	call	_Z16FCEU_CheatAddRAMijPh
	li	s2,32768
	lla	a2,_ZL10MAWRAMMMC6j
	addi	a1,s2,-1
	li	a0,28672
	call	_Z14SetReadHandleriiPFhjE
	lla	a2,_ZL10MBWRAMMMC6jh
	addi	a1,s2,-1
	li	a0,28672
	call	_Z15SetWriteHandleriiPFvjhE
	lbu	a5,0(s0)
	andi	a5,a5,2
	bne	a5,zero,.L283
.L285:
	lw	a1,0(s1)
	lw	a0,0(s4)
	li	a2,1
	call	_Z15FCEU_MemoryRandPhjb
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s4,8(sp)
	.cfi_restore 20
	j	.L274
	.cfi_endproc
.LFE23:
	.size	_Z12GenMMC3Powerv, .-_Z12GenMMC3Powerv
	.section	.text._ZL7M4Powerv,"ax",@progbits
	.align	2
	.type	_ZL7M4Powerv, @function
_ZL7M4Powerv:
.LFB26:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	la a0, _ZL6hackm4; lw a0, 0(a0);
	not	a5,a0
	lw	ra,12(sp)
	.cfi_restore 1
	andi	a5,a5,1
	la a4, A000B; sb a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z9setmirrori
	.cfi_endproc
.LFE26:
	.size	_ZL7M4Powerv, .-_ZL7M4Powerv
	.section	.text._ZL8M12Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M12Powerv, @function
_ZL8M12Powerv:
.LFB31:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	lla	a5,EXPREGS
	li	a4,1
	sh	zero,0(a5)
	sb	a4,2(a5)
	call	_Z12GenMMC3Powerv
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL8M12Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	li	a0,16384
	lla	a2,_ZL7M12Readj
	addi	a1,a1,-1
	addi	a0,a0,256
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE31:
	.size	_ZL8M12Powerv, .-_ZL8M12Powerv
	.section	.text._ZL8M37Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M37Powerv, @function
_ZL8M37Powerv:
.LFB38:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL8M37Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE38:
	.size	_ZL8M37Powerv, .-_ZL8M37Powerv
	.section	.text._ZL8M44Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M44Powerv, @function
_ZL8M44Powerv:
.LFB43:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,49152
	lla	a2,_ZL8M44Writejh
	addi	a1,a1,-1
	li	a0,40960
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE43:
	.size	_ZL8M44Powerv, .-_ZL8M44Powerv
	.section	.text._ZL8M45Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M45Powerv, @function
_ZL8M45Powerv:
.LFB50:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,32768
	lla	a5,EXPREGS
	lla	a2,_ZL8M45Writejh
	addi	a1,a1,-1
	li	a0,20480
	sh	zero,4(a5)
	sw	zero,0(a5)
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	lla	a2,_ZL7M45Readj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE50:
	.size	_ZL8M45Powerv, .-_ZL8M45Powerv
	.section	.text._ZL8M47Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M47Powerv, @function
_ZL8M47Powerv:
.LFB55:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL8M47Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE55:
	.size	_ZL8M47Powerv, .-_ZL8M47Powerv
	.section	.text._ZL9M114Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M114Powerv, @function
_ZL9M114Powerv:
.LFB76:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,65536
	lla	a2,_ZL9M114Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL11M114ExWritejh
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE76:
	.size	_ZL9M114Powerv, .-_ZL9M114Powerv
	.section	.text._ZL9M115Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M115Powerv, @function
_ZL9M115Powerv:
.LFB83:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a0,16384
	li	a1,32768
	lla	a2,_ZL9M115Writejh
	addi	a1,a1,-1
	addi	a0,a0,256
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	lla	a2,_ZL8M115Readj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE83:
	.size	_ZL9M115Powerv, .-_ZL9M115Powerv
	.section	.text._ZL9M134Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M134Powerv, @function
_ZL9M134Powerv:
.LFB92:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	addi	a1,a1,1
	lla	a2,_ZL9M134Writejh
	mv	a0,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE92:
	.size	_ZL9M134Powerv, .-_ZL9M134Powerv
	.section	.text._ZL9M165Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M165Powerv, @function
_ZL9M165Powerv:
.LFB100:
	.cfi_startproc
	li	a5,-3
	la a4, EXPREGS; sb a5, 0(a4);
	tail	_Z12GenMMC3Powerv
	.cfi_endproc
.LFE100:
	.size	_ZL9M165Powerv, .-_ZL9M165Powerv
	.section	.text._ZL9M195Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M195Powerv, @function
_ZL9M195Powerv:
.LFB109:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a2,2
	li	a1,20480
	li	a0,16
	call	_Z8setprg4rijj
	li	a1,24576
	lla	a2,_Z6CartBWjh
	addi	a1,a1,-1
	li	a0,20480
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,24576
	lla	a2,_Z6CartBRj
	addi	a1,a1,-1
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE109:
	.size	_ZL9M195Powerv, .-_ZL9M195Powerv
	.section	.text._ZL14Mapper196Powerv,"ax",@progbits
	.align	2
	.type	_ZL14Mapper196Powerv, @function
_ZL14Mapper196Powerv:
.LFB114:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,28672
	lla	a2,_ZL16Mapper196WriteLojh
	addi	a1,a1,-1
	li	a0,24576
	la a5, EXPREGS; sh zero, 0(a5);
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL14Mapper196Writejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE114:
	.size	_ZL14Mapper196Powerv, .-_ZL14Mapper196Powerv
	.section	.text._ZL14UNLMaliSBPowerv,"ax",@progbits
	.align	2
	.type	_ZL14UNLMaliSBPowerv, @function
_ZL14UNLMaliSBPowerv:
.LFB119:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL14UNLMaliSBWritejh
	addi	a1,a1,-1
	li	a0,32768
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE119:
	.size	_ZL14UNLMaliSBPowerv, .-_ZL14UNLMaliSBPowerv
	.section	.text._ZL9M205Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M205Powerv, @function
_ZL9M205Powerv:
.LFB130:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,28672
	lla	a2,_ZL10M205Write0jh
	addi	a1,a1,-1
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL10M205Write1jh
	addi	a1,a1,-1
	li	a0,28672
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE130:
	.size	_ZL9M205Powerv, .-_ZL9M205Powerv
	.section	.text._ZL9M245Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M245Powerv, @function
_ZL9M245Powerv:
.LFB134:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12GenMMC3Powerv
	.cfi_endproc
.LFE134:
	.size	_ZL9M245Powerv, .-_ZL9M245Powerv
	.section	.text._ZL9M249Powerv,"ax",@progbits
	.align	2
	.type	_ZL9M249Powerv, @function
_ZL9M249Powerv:
.LFB139:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sb zero, 0(a5);
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a2,_ZL9M249Writejh
	li	a1,20480
	li	a0,20480
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE139:
	.size	_ZL9M249Powerv, .-_ZL9M249Powerv
	.section	.text._ZL10M250_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10M250_Powerv, @function
_ZL10M250_Powerv:
.LFB143:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,49152
	lla	a2,_ZL9M250Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,65536
	lla	a2,_ZL12M250IRQWritejh
	addi	a1,a1,-1
	li	a0,49152
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE143:
	.size	_ZL10M250_Powerv, .-_ZL10M250_Powerv
	.section	.text._ZL10M254_Powerv,"ax",@progbits
	.align	2
	.type	_ZL10M254_Powerv, @function
_ZL10M254_Powerv:
.LFB147:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3Powerv
	li	a1,49152
	lla	a2,_ZL9M254Writejh
	addi	a1,a1,-1
	li	a0,32768
	call	_Z15SetWriteHandleriiPFvjhE
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL9MR254WRAMj
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE147:
	.size	_ZL10M254_Powerv, .-_ZL10M254_Powerv
	.section	.text._ZL8M12Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M12Resetv, @function
_ZL8M12Resetv:
.LFB32:
	.cfi_startproc
	lla	a5,EXPREGS
	lbu	a4,2(a5)
	sh	zero,0(a5)
	xori	a4,a4,1
	sb	a4,2(a5)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE32:
	.size	_ZL8M12Resetv, .-_ZL8M12Resetv
	.section	.text._ZL8M37Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M37Resetv, @function
_ZL8M37Resetv:
.LFB37:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE37:
	.size	_ZL8M37Resetv, .-_ZL8M37Resetv
	.section	.text._ZL8M45Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M45Resetv, @function
_ZL8M45Resetv:
.LFB49:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,5(a4)
	sb	zero,4(a4)
	sw	zero,0(a4)
	addi	a5,a5,1
	andi	a5,a5,7
	sb	a5,5(a4)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE49:
	.size	_ZL8M45Resetv, .-_ZL8M45Resetv
	.section	.text._ZL8M49Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M49Powerv, @function
_ZL8M49Powerv:
.LFB61:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, EXPREGS; sb zero, 0(a5);
	li	s0,32768
	call	_Z12MMC3RegResetv
	call	_Z12GenMMC3Powerv
	addi	a1,s0,-1
	lla	a2,_ZL8M49Writejh
	li	a0,24576
	call	_Z15SetWriteHandleriiPFvjhE
	addi	a1,s0,-1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a2,0
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z14SetReadHandleriiPFhjE
	.cfi_endproc
.LFE61:
	.size	_ZL8M49Powerv, .-_ZL8M49Powerv
	.section	.text._ZL8M52Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M52Resetv, @function
_ZL8M52Resetv:
.LFB66:
	.cfi_startproc
	la a5, EXPREGS; sh zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE66:
	.size	_ZL8M52Resetv, .-_ZL8M52Resetv
	.section	.text._ZL8M52Powerv,"ax",@progbits
	.align	2
	.type	_ZL8M52Powerv, @function
_ZL8M52Powerv:
.LFB67:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	la a5, EXPREGS; sh zero, 0(a5);
	call	_Z12MMC3RegResetv
	call	_Z12GenMMC3Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	li	a1,32768
	lla	a2,_ZL8M52Writejh
	addi	a1,a1,-1
	li	a0,24576
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z15SetWriteHandleriiPFvjhE
	.cfi_endproc
.LFE67:
	.size	_ZL8M52Powerv, .-_ZL8M52Powerv
	.section	.text._ZL9M205Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M205Resetv, @function
_ZL9M205Resetv:
.LFB129:
	.cfi_startproc
	lla	a5,EXPREGS
	sb	zero,2(a5)
	sb	zero,0(a5)
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE129:
	.size	_ZL9M205Resetv, .-_ZL9M205Resetv
	.section	.text._ZL9M134Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M134Resetv, @function
_ZL9M134Resetv:
.LFB197:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE197:
	.size	_ZL9M134Resetv, .-_ZL9M134Resetv
	.section	.text._ZL9M114Resetv,"ax",@progbits
	.align	2
	.type	_ZL9M114Resetv, @function
_ZL9M114Resetv:
.LFB195:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE195:
	.size	_ZL9M114Resetv, .-_ZL9M114Resetv
	.section	.text._ZL8M49Resetv,"ax",@progbits
	.align	2
	.type	_ZL8M49Resetv, @function
_ZL8M49Resetv:
.LFB193:
	.cfi_startproc
	la a5, EXPREGS; sb zero, 0(a5);
	tail	_Z12MMC3RegResetv
	.cfi_endproc
.LFE193:
	.size	_ZL8M49Resetv, .-_ZL8M49Resetv
	.section	.text._Z13MMC3_CMDWritejh,"ax",@progbits
	.align	2
	.globl	_Z13MMC3_CMDWritejh
	.hidden	_Z13MMC3_CMDWritejh
	.type	_Z13MMC3_CMDWritejh, @function
_Z13MMC3_CMDWritejh:
.LFB9:
	.cfi_startproc
	li	a5,57344
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a5,a5,1
	sw	s0,8(sp)
	and	a0,a0,a5
	sw	ra,12(sp)
	li	a5,40960
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a1
	beq	a0,a5,.L333
	bgtu	a0,a5,.L334
	li	a5,32768
	beq	a0,a5,.L335
	addi	a5,a5,1
	bne	a0,a5,.L332
	la a3, MMC3_cmd; lbu a3, 0(a3);
	andi	a1,a3,7
	lla	a2,.L343
	slli	a5,a1,2
	add	a5,a5,a2
	lw	a5,0(a5)
	lla	a4,DRegBuf
	sw	s1,4(sp)
	add	a4,a4,a1
	.cfi_offset 9, -12
	slli	s1,a3,5
	add	a5,a5,a2
	li	a2,4096
	and	s1,s1,a2
	sb	s0,0(a4)
	jr	a5
	.section	.rodata._Z13MMC3_CMDWritejh,"a",@progbits
	.align	2
	.align	2
.L343:
	.word	.L341-.L343
	.word	.L349-.L343
	.word	.L348-.L343
	.word	.L347-.L343
	.word	.L346-.L343
	.word	.L345-.L343
	.word	.L344-.L343
	.word	.L342-.L343
	.section	.text._Z13MMC3_CMDWritejh
.L334:
	.cfi_restore 9
	li	a5,40960
	addi	a5,a5,1
	bne	a0,a5,.L332
	la a5, A001B; sb a1, 0(a5);
.L332:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L335:
	.cfi_restore_state
	sw	s1,4(sp)
	.cfi_offset 9, -12
	lla	s1,MMC3_cmd
	lbu	a5,0(s1)
	xor	a5,a1,a5
	andi	a4,a5,64
	bne	a4,zero,.L360
.L339:
	slli	a5,a5,24
	srai	a5,a5,24
	blt	a5,zero,.L361
.L340:
	sb	s0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L333:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, mwrap; lw a5, 0(a5);
	beq	a5,zero,.L332
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,a1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L360:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	a0,a1
	call	_Z10FixMMC3PRGi
	lbu	a5,0(s1)
	xor	a5,s0,a5
	j	.L339
.L361:
	mv	a0,s0
	call	_Z10FixMMC3CHRi
	j	.L340
.L342:
	lw	s1,4(sp)
	.cfi_restore 9
	mv	a1,s0
	li	a0,40960
	la a5, pwrap; lw a5, 0(a5);
.L359:
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L349:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,cwrap
	lw	a5,0(s2)
	li	a0,4096
	addi	a0,a0,-2048
	andi	a1,s0,254
	or	a0,s1,a0
	jalr	a5
	li	a0,4096
	lw	a5,0(s2)
	addi	a0,a0,-1024
	ori	a1,s0,1
	or	a0,s1,a0
.L358:
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	j	.L359
.L348:
	.cfi_offset 9, -12
	li	a0,4096
	xor	a0,s1,a0
	mv	a1,s0
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	la a5, cwrap; lw a5, 0(a5);
	j	.L359
.L347:
	.cfi_restore_state
	li	a0,4096
	addi	a0,a0,1024
	xor	a0,s1,a0
	mv	a1,s0
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	la a5, cwrap; lw a5, 0(a5);
	j	.L359
.L346:
	.cfi_restore_state
	li	a0,8192
	addi	a0,a0,-2048
	xor	a0,s1,a0
	mv	a1,s0
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	la a5, cwrap; lw a5, 0(a5);
	j	.L359
.L345:
	.cfi_restore_state
	li	a0,8192
	addi	a0,a0,-1024
	xor	a0,s1,a0
	mv	a1,s0
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	la a5, cwrap; lw a5, 0(a5);
	j	.L359
.L344:
	.cfi_restore_state
	andi	a3,a3,64
	la a5, pwrap; lw a5, 0(a5);
	mv	a1,s0
	beq	a3,zero,.L350
	lw	s1,4(sp)
	.cfi_remember_state
	.cfi_restore 9
	li	a0,49152
	j	.L359
.L341:
	.cfi_restore_state
	sw	s2,0(sp)
	.cfi_offset 18, -16
	lla	s2,cwrap
	lw	a5,0(s2)
	andi	a1,s0,254
	mv	a0,s1
	jalr	a5
	lw	a5,0(s2)
	ori	a1,s0,1
	ori	a0,s1,1024
	j	.L358
.L350:
	.cfi_restore 18
	lw	s1,4(sp)
	.cfi_restore 9
	li	a0,32768
	j	.L359
	.cfi_endproc
.LFE9:
	.size	_Z13MMC3_CMDWritejh, .-_Z13MMC3_CMDWritejh
	.section	.text._ZL14Mapper196Writejh,"ax",@progbits
	.align	2
	.type	_ZL14Mapper196Writejh, @function
_ZL14Mapper196Writejh:
.LFB112:
	.cfi_startproc
	srli	a5,a0,2
	srli	a3,a0,3
	li	a4,65536
	or	a5,a5,a3
	addi	a4,a4,-2
	andi	a5,a5,1
	and	a4,a0,a4
	li	a2,49152
	or	a5,a5,a4
	bltu	a0,a2,.L363
	li	a4,57344
	addi	a4,a4,1
	mv	a3,a1
	and	a5,a5,a4
	li	a1,57344
	beq	a5,a1,.L364
	beq	a5,a4,.L365
	beq	a5,a2,.L366
	li	a4,49152
	addi	a4,a4,1
	bne	a5,a4,.L372
	li	a5,1
	la a4, IRQReload; sb a5, 0(a4);
	ret
.L363:
	srli	a0,a0,1
	andi	a0,a0,1
	or	a0,a0,a5
	tail	_Z13MMC3_CMDWritejh
.L364:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, IRQa; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L366:
	la a5, IRQLatch; sb a3, 0(a5);
	ret
.L365:
	li	a5,1
	la a4, IRQa; sb a5, 0(a4);
	ret
.L372:
	ret
	.cfi_endproc
.LFE112:
	.size	_ZL14Mapper196Writejh, .-_ZL14Mapper196Writejh
	.section	.text._ZL14UNLMaliSBWritejh,"ax",@progbits
	.align	2
	.type	_ZL14UNLMaliSBWritejh, @function
_ZL14UNLMaliSBWritejh:
.LFB118:
	.cfi_startproc
	li	a5,65536
	addi	a5,a5,-2
	li	a6,49152
	and	a4,a0,a5
	srli	a2,a0,3
	bltu	a0,a6,.L374
	srli	a5,a0,2
	or	a5,a5,a2
	andi	a5,a5,1
	li	a2,57344
	or	a5,a5,a4
	addi	a2,a2,1
	li	a4,57344
	and	a5,a5,a2
	beq	a5,a4,.L375
	beq	a5,a2,.L376
	beq	a5,a6,.L377
	li	a4,49152
	addi	a4,a4,1
	bne	a5,a4,.L383
	li	a5,1
	la a4, IRQReload; sb a5, 0(a4);
	ret
.L374:
	andi	a0,a2,1
	or	a0,a0,a4
	tail	_Z13MMC3_CMDWritejh
.L375:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a0,1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, IRQa; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L377:
	la a5, IRQLatch; sb a1, 0(a5);
	ret
.L376:
	li	a5,1
	la a4, IRQa; sb a5, 0(a4);
	ret
.L383:
	ret
	.cfi_endproc
.LFE118:
	.size	_ZL14UNLMaliSBWritejh, .-_ZL14UNLMaliSBWritejh
	.section	.text._ZL9M250Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M250Writejh, @function
_ZL9M250Writejh:
.LFB141:
	.cfi_startproc
	srli	a4,a0,10
	li	a5,57344
	andi	a4,a4,1
	and	a5,a0,a5
	andi	a1,a0,0xff
	or	a0,a4,a5
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE141:
	.size	_ZL9M250Writejh, .-_ZL9M250Writejh
	.section	.text._ZL9M254Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M254Writejh, @function
_ZL9M254Writejh:
.LFB146:
	.cfi_startproc
	li	a5,32768
	beq	a0,a5,.L386
	li	a5,40960
	addi	a5,a5,1
	beq	a0,a5,.L387
	tail	_Z13MMC3_CMDWritejh
.L387:
	la a5, EXPREGS+1; sb a1, 0(a5);
	tail	_Z13MMC3_CMDWritejh
.L386:
	li	a5,-1
	la a4, EXPREGS; sb a5, 0(a4);
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE146:
	.size	_ZL9M254Writejh, .-_ZL9M254Writejh
	.section	.text._Z14GenMMC3Restorei,"ax",@progbits
	.align	2
	.globl	_Z14GenMMC3Restorei
	.hidden	_Z14GenMMC3Restorei
	.type	_Z14GenMMC3Restorei, @function
_Z14GenMMC3Restorei:
.LFB16:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE16:
	.size	_Z14GenMMC3Restorei, .-_Z14GenMMC3Restorei
	.section	.text._ZL8M37Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M37Writejh, @function
_ZL8M37Writejh:
.LFB36:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	srli	a1,a1,1
	andi	a1,a1,3
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE36:
	.size	_ZL8M37Writejh, .-_ZL8M37Writejh
	.section	.text._ZL8M44Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M44Writejh, @function
_ZL8M44Writejh:
.LFB42:
	.cfi_startproc
	andi	a4,a0,1
	beq	a4,zero,.L394
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a1,a1,7
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L394:
	tail	_Z13MMC3_CMDWritejh
	.cfi_endproc
.LFE42:
	.size	_ZL8M44Writejh, .-_ZL8M44Writejh
	.section	.text._ZL8M45Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M45Writejh, @function
_ZL8M45Writejh:
.LFB47:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a5,3(a4)
	andi	a5,a5,64
	beq	a5,zero,.L399
	la a4, WRAM; lw a4, 0(a4);
	add	a4,a4,a0
	li	a5,-24576
	add	a5,a5,a4
	sb	a1,0(a5)
	ret
.L399:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lbu	a5,4(a4)
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	add	a5,a4,a5
	sb	a1,0(a5)
	lbu	a5,4(a4)
	addi	a5,a5,1
	andi	a5,a5,3
	sb	a5,4(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE47:
	.size	_ZL8M45Writejh, .-_ZL8M45Writejh
	.section	.text._ZL8M47Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M47Writejh, @function
_ZL8M47Writejh:
.LFB54:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a1,a1,1
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE54:
	.size	_ZL8M47Writejh, .-_ZL8M47Writejh
	.section	.text._ZL8M49Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M49Writejh, @function
_ZL8M49Writejh:
.LFB59:
	.cfi_startproc
	la a5, A001B; lb a5, 0(a5);
	blt	a5,zero,.L411
	ret
.L411:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE59:
	.size	_ZL8M49Writejh, .-_ZL8M49Writejh
	.section	.text._ZL8M52Writejh,"ax",@progbits
	.align	2
	.type	_ZL8M52Writejh, @function
_ZL8M52Writejh:
.LFB65:
	.cfi_startproc
	lla	a5,EXPREGS
	lbu	a4,1(a5)
	beq	a4,zero,.L413
	la a4, WRAM; lw a4, 0(a4);
	add	a4,a4,a0
	li	a5,-24576
	add	a5,a5,a4
	sb	a1,0(a5)
	ret
.L413:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a4,a1,-128
	slli	a4,a4,8
	or	a1,a1,a4
	sh	a1,0(a5)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE65:
	.size	_ZL8M52Writejh, .-_ZL8M52Writejh
	.section	.text._ZL9M134Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M134Writejh, @function
_ZL9M134Writejh:
.LFB91:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3CHRi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3PRGi
	.cfi_endproc
.LFE91:
	.size	_ZL9M134Writejh, .-_ZL9M134Writejh
	.section	.text._ZL10M205Write1jh,"ax",@progbits
	.align	2
	.type	_ZL10M205Write1jh, @function
_ZL10M205Write1jh:
.LFB128:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a3,2(a4)
	bne	a3,zero,.L421
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	andi	a1,a1,48
	sb	a1,0(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L421:
	tail	_Z6CartBWjh
	.cfi_endproc
.LFE128:
	.size	_ZL10M205Write1jh, .-_ZL10M205Write1jh
	.section	.text._ZL10M205Write0jh,"ax",@progbits
	.align	2
	.type	_ZL10M205Write0jh, @function
_ZL10M205Write0jh:
.LFB127:
	.cfi_startproc
	lla	a4,EXPREGS
	lbu	a3,2(a4)
	bne	a3,zero,.L426
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	mv	a5,a0
	lbu	a0,0(s0)
	andi	a3,a5,48
	andi	a5,a5,128
	sb	a3,0(a4)
	sb	a5,2(a4)
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
.L426:
	tail	_Z6CartBWjh
	.cfi_endproc
.LFE127:
	.size	_ZL10M205Write0jh, .-_ZL10M205Write0jh
	.section	.text._ZL9M249Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M249Writejh, @function
_ZL9M249Writejh:
.LFB138:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	lla	s0,MMC3_cmd
	lbu	a0,0(s0)
	la a5, EXPREGS; sb a1, 0(a5);
	call	_Z10FixMMC3PRGi
	lbu	a0,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10FixMMC3CHRi
	.cfi_endproc
.LFE138:
	.size	_ZL9M249Writejh, .-_ZL9M249Writejh
	.section	.text._ZL9M114Writejh,"ax",@progbits
	.align	2
	.type	_ZL9M114Writejh, @function
_ZL9M114Writejh:
.LFB74:
	.cfi_startproc
	li	a4,57344
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	addi	a4,a4,1
	sw	ra,12(sp)
	and	a5,a0,a4
	li	a3,49152
	.cfi_offset 1, -4
	beq	a5,a3,.L433
	bgtu	a5,a3,.L434
	li	a4,40960
	mv	a0,a1
	beq	a5,a4,.L435
	addi	a4,a4,1
	beq	a5,a4,.L436
	li	a4,32768
	addi	a4,a4,1
	bne	a5,a4,.L432
	la a5, mwrap; lw a5, 0(a5);
	beq	a5,zero,.L432
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	a5
.L434:
	.cfi_restore_state
	li	a2,57344
	beq	a5,a2,.L439
	beq	a5,a4,.L440
	li	a4,49152
	addi	a4,a4,1
	bne	a5,a4,.L432
	li	a5,1
	la a4, IRQReload; sb a5, 0(a4);
.L432:
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L436:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, IRQLatch; sb a1, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L440:
	.cfi_restore_state
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a5,1
	la a4, IRQa; sb a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L435:
	.cfi_restore_state
	andi	a4,a1,7
	lla	a5,m114_perm
	sw	s1,4(sp)
	add	a5,a5,a4
	sw	s0,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 8, -8
	lbu	s0,0(a5)
	lla	s1,MMC3_cmd
	lbu	a5,0(s1)
	andi	a1,a1,-64
	or	s0,s0,a1
	xor	a5,s0,a5
	andi	a4,a5,64
	bne	a4,zero,.L454
.L442:
	slli	a5,a5,24
	srai	a5,a5,24
	blt	a5,zero,.L455
.L443:
	sb	s0,0(s1)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	li	a5,1
	la a4, _ZL5cmdin; sb a5, 0(a4);
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L439:
	.cfi_def_cfa_offset 16
	.cfi_offset 1, -4
	li	a0,1
	call	_Z12X6502_IRQEndi
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	la a5, IRQa; sb zero, 0(a5);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L433:
	.cfi_restore_state
	la a5, _ZL5cmdin; lbu a5, 0(a5);
	beq	a5,zero,.L432
	li	a0,32768
	addi	a0,a0,1
	call	_Z13MMC3_CMDWritejh
	la a5, _ZL5cmdin; sb zero, 0(a5);
	j	.L432
.L455:
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	a0,s0
	call	_Z10FixMMC3CHRi
	j	.L443
.L454:
	mv	a0,s0
	call	_Z10FixMMC3PRGi
	lbu	a5,0(s1)
	xor	a5,s0,a5
	j	.L442
	.cfi_endproc
.LFE74:
	.size	_ZL9M114Writejh, .-_ZL9M114Writejh
	.section	.rodata._Z12GenMMC3_InitP8CartInfoiiii.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"WRAM"
	.align	2
.LC1:
	.string	"KTEX"
	.section	.text._Z12GenMMC3_InitP8CartInfoiiii,"ax",@progbits
	.align	2
	.globl	_Z12GenMMC3_InitP8CartInfoiiii
	.hidden	_Z12GenMMC3_InitP8CartInfoiiii
	.type	_Z12GenMMC3_InitP8CartInfoiiii, @function
_Z12GenMMC3_InitP8CartInfoiiii:
.LFB25:
	.cfi_startproc
	lla	a6,CHRmask2
	lw	t4,0(a6)
	lla	a7,CHRmask1
	lw	t5,0(a7)
	lla	t1,PRGmask8
	srai	a5,a2,10
	srai	a2,a2,11
	lw	t6,0(t1)
	addi	a2,a2,-1
	and	a2,a2,t4
	srai	a1,a1,13
	lla	t4,_ZL8GENPWRAPjh
	addi	a5,a5,-1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	and	a5,a5,t5
	addi	a1,a1,-1
	la t5, pwrap; sw t4, 0(t5);
	lla	t4,_ZL8GENCWRAPjh
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	slli	t3,a3,10
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	lla	s2,WRAMSIZE
	and	a1,a1,t6
	la t5, cwrap; sw t4, 0(t5);
	lla	t4,_ZL8GENMWRAPh
	la t5, mwrap; sw t4, 0(t5);
	sw	t3,0(s2)
	sw	a1,0(t1)
	sw	a5,0(a7)
	sw	a2,0(a6)
	mv	s0,a0
	mv	s1,a4
	bne	a3,zero,.L471
.L457:
	beq	s1,zero,.L458
	lla	a4,mmc3opts
	lbu	a5,0(a4)
	lw	a3,0(s2)
	ori	a5,a5,2
	sb	a5,0(a4)
	la a5, WRAM; lw a5, 0(a5);
	sw	a5,12(s0)
	sw	a3,28(s0)
.L458:
	lla	a3,.LC1
	li	a2,0
	li	a1,1
	lla	a0,kt_extra
	call	_Z10AddExStatePvjiPKc
	li	a3,0
	li	a2,0
	li	a1,-1
	lla	a0,_ZL14MMC3_StateRegs
	call	_Z10AddExStatePvjiPKc
	lla	a3,_Z12GenMMC3Powerv
	sw	a3,0(s0)
	lw	a4,92(s0)
	lla	a3,_Z12MMC3RegResetv
	li	a5,1359249408
	sw	a3,4(s0)
	lla	a3,_ZL12GenMMC3Closev
	sw	a3,8(s0)
	addi	a5,a5,830
	lla	a3,_ZL22MMC3_hb_KickMasterHackv
	beq	a4,a5,.L459
	li	a5,1516789760
	addi	a5,a5,241
	beq	a4,a5,.L459
	li	a5,-1373106176
	addi	a5,a5,-480
	beq	a4,a5,.L459
	li	a5,-52989952
	addi	a5,a5,747
	lla	a3,_ZL23MMC3_hb_PALStarWarsHackv
	beq	a4,a5,.L459
	lla	a3,_ZL7MMC3_hbv
.L459:
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	la a5, GameHBIRQHook; sw a3, 0(a5);
	lla	a5,_Z14GenMMC3Restorei
	la a4, GameStateRestore; sw a5, 0(a4);
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L471:
	.cfi_restore_state
	sw	s3,12(sp)
	.cfi_offset 19, -20
	lla	a4,mmc3opts
	lbu	a5,0(a4)
	mv	a0,t3
	lla	s3,WRAM
	ori	a5,a5,1
	sb	a5,0(a4)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s2)
	mv	a1,a0
	li	a3,1
	li	a0,16
	sw	a1,0(s3)
	call	_Z19SetupCartPRGMappingiPhji
	lw	a0,0(s3)
	lw	a1,0(s2)
	lla	a3,.LC0
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s3,12(sp)
	.cfi_restore 19
	j	.L457
	.cfi_endproc
.LFE25:
	.size	_Z12GenMMC3_InitP8CartInfoiiii, .-_Z12GenMMC3_InitP8CartInfoiiii
	.section	.rodata._Z12Mapper4_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"Low-G-Man can not work normally in the iNES format.\nThis game has been recognized by its CRC32 value, and the appropriate changes will be made so it will run.\nIf you wish to hack this game, you should use the UNIF format for your hack.\n\n"
	.section	.text._Z12Mapper4_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z12Mapper4_InitP8CartInfo
	.hidden	_Z12Mapper4_InitP8CartInfo
	.type	_Z12Mapper4_InitP8CartInfo, @function
_Z12Mapper4_InitP8CartInfo:
.LFB27:
	.cfi_startproc
	lw	a4,92(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a5,-1818685440
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	addi	a5,a5,1075
	mv	s0,a0
	beq	a4,a5,.L473
	li	a5,-1352290304
	addi	a5,a5,-1404
	li	a3,8
	beq	a4,a5,.L473
.L474:
	lw	a4,48(s0)
	mv	a0,s0
	li	a2,256
	li	a1,512
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	a5,44(s0)
	lla	a4,_ZL7M4Powerv
	sw	a4,0(s0)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	la a4, _ZL6hackm4; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L473:
	.cfi_restore_state
	lla	a0,.LC2
	call	printf
	li	a3,0
	j	.L474
	.cfi_endproc
.LFE27:
	.size	_Z12Mapper4_InitP8CartInfo, .-_Z12Mapper4_InitP8CartInfo
	.section	.rodata._Z13Mapper12_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"EXPR"
	.section	.text._Z13Mapper12_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper12_InitP8CartInfo
	.hidden	_Z13Mapper12_InitP8CartInfo
	.type	_Z13Mapper12_InitP8CartInfo, @function
_Z13Mapper12_InitP8CartInfo:
.LFB33:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M12CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL8M12Powerv
	sw	a5,0(s0)
	lla	a5,_ZL8M12Resetv
	sw	a5,4(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	la a5, _ZL6isRevB; sw zero, 0(a5);
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE33:
	.size	_Z13Mapper12_InitP8CartInfo, .-_Z13Mapper12_InitP8CartInfo
	.section	.text._Z13Mapper37_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper37_InitP8CartInfo
	.hidden	_Z13Mapper37_InitP8CartInfo
	.type	_Z13Mapper37_InitP8CartInfo, @function
_Z13Mapper37_InitP8CartInfo:
.LFB39:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M37PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL5M37CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL8M37Powerv
	sw	a5,0(s0)
	lla	a5,_ZL8M37Resetv
	sw	a5,4(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE39:
	.size	_Z13Mapper37_InitP8CartInfo, .-_Z13Mapper37_InitP8CartInfo
	.section	.text._Z13Mapper44_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper44_InitP8CartInfo
	.hidden	_Z13Mapper44_InitP8CartInfo
	.type	_Z13Mapper44_InitP8CartInfo, @function
_Z13Mapper44_InitP8CartInfo:
.LFB44:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M44CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL5M44PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL8M44Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE44:
	.size	_Z13Mapper44_InitP8CartInfo, .-_Z13Mapper44_InitP8CartInfo
	.section	.text._Z13Mapper45_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper45_InitP8CartInfo
	.hidden	_Z13Mapper45_InitP8CartInfo
	.type	_Z13Mapper45_InitP8CartInfo, @function
_Z13Mapper45_InitP8CartInfo:
.LFB51:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M45CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL5M45PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL8M45Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M45Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,5
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE51:
	.size	_Z13Mapper45_InitP8CartInfo, .-_Z13Mapper45_InitP8CartInfo
	.section	.text._Z13Mapper47_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper47_InitP8CartInfo
	.hidden	_Z13Mapper47_InitP8CartInfo
	.type	_Z13Mapper47_InitP8CartInfo, @function
_Z13Mapper47_InitP8CartInfo:
.LFB56:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M47PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL5M47CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL8M47Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE56:
	.size	_Z13Mapper47_InitP8CartInfo, .-_Z13Mapper47_InitP8CartInfo
	.section	.text._Z13Mapper49_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper49_InitP8CartInfo
	.hidden	_Z13Mapper49_InitP8CartInfo
	.type	_Z13Mapper49_InitP8CartInfo, @function
_Z13Mapper49_InitP8CartInfo:
.LFB62:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M49CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL5M49PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL8M49Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M49Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE62:
	.size	_Z13Mapper49_InitP8CartInfo, .-_Z13Mapper49_InitP8CartInfo
	.section	.text._Z13Mapper52_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper52_InitP8CartInfo
	.hidden	_Z13Mapper52_InitP8CartInfo
	.type	_Z13Mapper52_InitP8CartInfo, @function
_Z13Mapper52_InitP8CartInfo:
.LFB68:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,256
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL5M52CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL5M52PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL8M52Resetv
	sw	a5,4(s0)
	lla	a5,_ZL8M52Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE68:
	.size	_Z13Mapper52_InitP8CartInfo, .-_Z13Mapper52_InitP8CartInfo
	.section	.text._Z13Mapper76_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper76_InitP8CartInfo
	.hidden	_Z13Mapper76_InitP8CartInfo
	.type	_Z13Mapper76_InitP8CartInfo, @function
_Z13Mapper76_InitP8CartInfo:
.LFB70:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL5M76CWjh
	la a4, cwrap; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE70:
	.size	_Z13Mapper76_InitP8CartInfo, .-_Z13Mapper76_InitP8CartInfo
	.section	.rodata._Z13Mapper74_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC4:
	.string	"CHRR"
	.section	.text._Z13Mapper74_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z13Mapper74_InitP8CartInfo
	.hidden	_Z13Mapper74_InitP8CartInfo
	.type	_Z13Mapper74_InitP8CartInfo, @function
_Z13Mapper74_InitP8CartInfo:
.LFB72:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,CHRRAMSIZE
	lla	a5,_ZL5M74CWjh
	addi	a0,a0,-2048
	la a4, cwrap; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE72:
	.size	_Z13Mapper74_InitP8CartInfo, .-_Z13Mapper74_InitP8CartInfo
	.section	.rodata._Z14Mapper114_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"CMDI"
	.section	.text._Z14Mapper114_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper114_InitP8CartInfo
	.hidden	_Z14Mapper114_InitP8CartInfo
	.type	_Z14Mapper114_InitP8CartInfo, @function
_Z14Mapper114_InitP8CartInfo:
.LFB78:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	la a5, _ZL6isRevB; sw zero, 0(a5);
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL9M114PWRAPjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M114Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M114Resetv
	sw	a5,4(s0)
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC5
	li	a2,0
	li	a1,1
	lla	a0,_ZL5cmdin
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE78:
	.size	_Z14Mapper114_InitP8CartInfo, .-_Z14Mapper114_InitP8CartInfo
	.section	.text._Z14Mapper115_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper115_InitP8CartInfo
	.hidden	_Z14Mapper115_InitP8CartInfo
	.type	_Z14Mapper115_InitP8CartInfo, @function
_Z14Mapper115_InitP8CartInfo:
.LFB84:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,512
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M115CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6M115PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M115Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,3
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE84:
	.size	_Z14Mapper115_InitP8CartInfo, .-_Z14Mapper115_InitP8CartInfo
	.section	.text._Z14Mapper134_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper134_InitP8CartInfo
	.hidden	_Z14Mapper134_InitP8CartInfo
	.type	_Z14Mapper134_InitP8CartInfo, @function
_Z14Mapper134_InitP8CartInfo:
.LFB94:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,256
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M134PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M134CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M134Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M134Resetv
	sw	a5,4(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE94:
	.size	_Z14Mapper134_InitP8CartInfo, .-_Z14Mapper134_InitP8CartInfo
	.section	.text._Z14Mapper165_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper165_InitP8CartInfo
	.hidden	_Z14Mapper165_InitP8CartInfo
	.type	_Z14Mapper165_InitP8CartInfo, @function
_Z14Mapper165_InitP8CartInfo:
.LFB101:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,128
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7M165CWMjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL7M165PPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a5,_ZL9M165Powerv
	sw	a5,0(s0)
	li	a0,4096
	lla	s0,CHRRAMSIZE
	li	a5,4096
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	a0,0(s1)
	lla	a3,.LC4
	li	a2,0
	call	_Z10AddExStatePvjiPKc
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC3
	li	a2,0
	li	a1,4
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE101:
	.size	_Z14Mapper165_InitP8CartInfo, .-_Z14Mapper165_InitP8CartInfo
	.section	.text._Z14Mapper191_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper191_InitP8CartInfo
	.hidden	_Z14Mapper191_InitP8CartInfo
	.type	_Z14Mapper191_InitP8CartInfo, @function
_Z14Mapper191_InitP8CartInfo:
.LFB103:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,256
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,CHRRAMSIZE
	lla	a5,_ZL6M191CWjh
	addi	a0,a0,-2048
	la a4, cwrap; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE103:
	.size	_Z14Mapper191_InitP8CartInfo, .-_Z14Mapper191_InitP8CartInfo
	.section	.text._Z14Mapper192_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper192_InitP8CartInfo
	.hidden	_Z14Mapper192_InitP8CartInfo
	.type	_Z14Mapper192_InitP8CartInfo, @function
_Z14Mapper192_InitP8CartInfo:
.LFB105:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M192CWjh
	lla	s0,CHRRAMSIZE
	la a4, cwrap; sw a5, 0(a4);
	li	a0,4096
	li	a5,4096
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE105:
	.size	_Z14Mapper192_InitP8CartInfo, .-_Z14Mapper192_InitP8CartInfo
	.section	.text._Z14Mapper194_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper194_InitP8CartInfo
	.hidden	_Z14Mapper194_InitP8CartInfo
	.type	_Z14Mapper194_InitP8CartInfo, @function
_Z14Mapper194_InitP8CartInfo:
.LFB107:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z12GenMMC3_InitP8CartInfoiiii
	li	a0,4096
	lla	s0,CHRRAMSIZE
	lla	a5,_ZL6M194CWjh
	addi	a0,a0,-2048
	la a4, cwrap; sw a5, 0(a4);
	sw	a0,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE107:
	.size	_Z14Mapper194_InitP8CartInfo, .-_Z14Mapper194_InitP8CartInfo
	.section	.text._Z14Mapper195_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper195_InitP8CartInfo
	.hidden	_Z14Mapper195_InitP8CartInfo
	.type	_Z14Mapper195_InitP8CartInfo, @function
_Z14Mapper195_InitP8CartInfo:
.LFB110:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,16
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M195CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M195Powerv
	sw	a5,0(s0)
	li	a0,4096
	lla	s0,CHRRAMSIZE
	li	a5,4096
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE110:
	.size	_Z14Mapper195_InitP8CartInfo, .-_Z14Mapper195_InitP8CartInfo
	.section	.text._Z14Mapper196_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper196_InitP8CartInfo
	.hidden	_Z14Mapper196_InitP8CartInfo
	.type	_Z14Mapper196_InitP8CartInfo, @function
_Z14Mapper196_InitP8CartInfo:
.LFB115:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M196PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL14Mapper196Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE115:
	.size	_Z14Mapper196_InitP8CartInfo, .-_Z14Mapper196_InitP8CartInfo
	.section	.text._Z14UNLMaliSB_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14UNLMaliSB_InitP8CartInfo
	.hidden	_Z14UNLMaliSB_InitP8CartInfo
	.type	_Z14UNLMaliSB_InitP8CartInfo, @function
_Z14UNLMaliSB_InitP8CartInfo:
.LFB120:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,128
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL11UNLMaliSBPWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL11UNLMaliSBCWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL14UNLMaliSBPowerv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE120:
	.size	_Z14UNLMaliSB_InitP8CartInfo, .-_Z14UNLMaliSB_InitP8CartInfo
	.section	.text._Z14Mapper197_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper197_InitP8CartInfo
	.hidden	_Z14Mapper197_InitP8CartInfo
	.type	_Z14Mapper197_InitP8CartInfo, @function
_Z14Mapper197_InitP8CartInfo:
.LFB122:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,512
	li	a1,128
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a5,_ZL6M197CWjh
	la a4, cwrap; sw a5, 0(a4);
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE122:
	.size	_Z14Mapper197_InitP8CartInfo, .-_Z14Mapper197_InitP8CartInfo
	.section	.text._Z14Mapper198_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper198_InitP8CartInfo
	.hidden	_Z14Mapper198_InitP8CartInfo
	.type	_Z14Mapper198_InitP8CartInfo, @function
_Z14Mapper198_InitP8CartInfo:
.LFB124:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,16
	li	a2,0
	li	a1,1024
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M198PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M195Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE124:
	.size	_Z14Mapper198_InitP8CartInfo, .-_Z14Mapper198_InitP8CartInfo
	.section	.text._Z14Mapper205_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper205_InitP8CartInfo
	.hidden	_Z14Mapper205_InitP8CartInfo
	.type	_Z14Mapper205_InitP8CartInfo, @function
_Z14Mapper205_InitP8CartInfo:
.LFB131:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M205PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL6M205CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL9M205Powerv
	sw	a5,0(s0)
	lla	a5,_ZL9M205Resetv
	sw	a5,4(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE131:
	.size	_Z14Mapper205_InitP8CartInfo, .-_Z14Mapper205_InitP8CartInfo
	.section	.text._Z14Mapper245_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper245_InitP8CartInfo
	.hidden	_Z14Mapper245_InitP8CartInfo
	.type	_Z14Mapper245_InitP8CartInfo, @function
_Z14Mapper245_InitP8CartInfo:
.LFB135:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M245CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6M245PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M245Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE135:
	.size	_Z14Mapper245_InitP8CartInfo, .-_Z14Mapper245_InitP8CartInfo
	.section	.text._Z14Mapper249_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper249_InitP8CartInfo
	.hidden	_Z14Mapper249_InitP8CartInfo
	.type	_Z14Mapper249_InitP8CartInfo, @function
_Z14Mapper249_InitP8CartInfo:
.LFB140:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6M249CWjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL6M249PWjh
	la a4, pwrap; sw a5, 0(a4);
	lla	a5,_ZL9M249Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,1
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE140:
	.size	_Z14Mapper249_InitP8CartInfo, .-_Z14Mapper249_InitP8CartInfo
	.section	.text._Z14Mapper250_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper250_InitP8CartInfo
	.hidden	_Z14Mapper250_InitP8CartInfo
	.type	_Z14Mapper250_InitP8CartInfo, @function
_Z14Mapper250_InitP8CartInfo:
.LFB144:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10M250_Powerv
	lw	ra,12(sp)
	.cfi_restore 1
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE144:
	.size	_Z14Mapper250_InitP8CartInfo, .-_Z14Mapper250_InitP8CartInfo
	.section	.text._Z14Mapper254_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper254_InitP8CartInfo
	.hidden	_Z14Mapper254_InitP8CartInfo
	.type	_Z14Mapper254_InitP8CartInfo, @function
_Z14Mapper254_InitP8CartInfo:
.LFB148:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,128
	li	a1,128
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL10M254_Powerv
	sw	a5,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lla	a3,.LC3
	li	a2,0
	li	a1,2
	lla	a0,EXPREGS
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE148:
	.size	_Z14Mapper254_InitP8CartInfo, .-_Z14Mapper254_InitP8CartInfo
	.section	.text._Z10TBROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TBROM_InitP8CartInfo
	.hidden	_Z10TBROM_InitP8CartInfo
	.type	_Z10TBROM_InitP8CartInfo, @function
_Z10TBROM_InitP8CartInfo:
.LFB149:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,64
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE149:
	.size	_Z10TBROM_InitP8CartInfo, .-_Z10TBROM_InitP8CartInfo
	.section	.text._Z10TEROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TEROM_InitP8CartInfo
	.hidden	_Z10TEROM_InitP8CartInfo
	.type	_Z10TEROM_InitP8CartInfo, @function
_Z10TEROM_InitP8CartInfo:
.LFB150:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,32
	li	a1,32
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE150:
	.size	_Z10TEROM_InitP8CartInfo, .-_Z10TEROM_InitP8CartInfo
	.section	.text._Z10TFROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TFROM_InitP8CartInfo
	.hidden	_Z10TFROM_InitP8CartInfo
	.type	_Z10TFROM_InitP8CartInfo, @function
_Z10TFROM_InitP8CartInfo:
.LFB151:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE151:
	.size	_Z10TFROM_InitP8CartInfo, .-_Z10TFROM_InitP8CartInfo
	.section	.text._Z10TGROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TGROM_InitP8CartInfo
	.hidden	_Z10TGROM_InitP8CartInfo
	.type	_Z10TGROM_InitP8CartInfo, @function
_Z10TGROM_InitP8CartInfo:
.LFB152:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,0
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE152:
	.size	_Z10TGROM_InitP8CartInfo, .-_Z10TGROM_InitP8CartInfo
	.section	.text._Z10TKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TKROM_InitP8CartInfo
	.hidden	_Z10TKROM_InitP8CartInfo
	.type	_Z10TKROM_InitP8CartInfo, @function
_Z10TKROM_InitP8CartInfo:
.LFB153:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,8
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE153:
	.size	_Z10TKROM_InitP8CartInfo, .-_Z10TKROM_InitP8CartInfo
	.section	.text._Z10TLROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TLROM_InitP8CartInfo
	.hidden	_Z10TLROM_InitP8CartInfo
	.type	_Z10TLROM_InitP8CartInfo, @function
_Z10TLROM_InitP8CartInfo:
.LFB154:
	.cfi_startproc
	li	a4,0
	li	a3,0
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE154:
	.size	_Z10TLROM_InitP8CartInfo, .-_Z10TLROM_InitP8CartInfo
	.section	.text._Z10TSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TSROM_InitP8CartInfo
	.hidden	_Z10TSROM_InitP8CartInfo
	.type	_Z10TSROM_InitP8CartInfo, @function
_Z10TSROM_InitP8CartInfo:
.LFB155:
	.cfi_startproc
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE155:
	.size	_Z10TSROM_InitP8CartInfo, .-_Z10TSROM_InitP8CartInfo
	.section	.rodata._Z11TLSROM_InitP8CartInfo.str1.4,"aMS",@progbits,1
	.align	2
.LC6:
	.string	"PPUC"
	.section	.text._Z11TLSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11TLSROM_InitP8CartInfo
	.hidden	_Z11TLSROM_InitP8CartInfo
	.type	_Z11TLSROM_InitP8CartInfo, @function
_Z11TLSROM_InitP8CartInfo:
.LFB156:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7TKSWRAPjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10GENNOMWRAPh
	lw	ra,12(sp)
	.cfi_restore 1
	la a4, mwrap; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,_ZL9PPUCHRBus
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE156:
	.size	_Z11TLSROM_InitP8CartInfo, .-_Z11TLSROM_InitP8CartInfo
	.section	.text._Z11TKSROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z11TKSROM_InitP8CartInfo
	.hidden	_Z11TKSROM_InitP8CartInfo
	.type	_Z11TKSROM_InitP8CartInfo, @function
_Z11TKSROM_InitP8CartInfo:
.LFB157:
	.cfi_startproc
	lw	a4,48(a0)
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a3,8
	li	a2,256
	li	a1,512
	sw	ra,12(sp)
	.cfi_offset 1, -4
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL7TKSWRAPjh
	la a4, cwrap; sw a5, 0(a4);
	lla	a5,_ZL10GENNOMWRAPh
	lw	ra,12(sp)
	.cfi_restore 1
	la a4, mwrap; sw a5, 0(a4);
	lla	a5,_ZL6TKSPPUj
	la a4, PPU_hook; sw a5, 0(a4);
	lla	a3,.LC6
	li	a2,0
	li	a1,1
	lla	a0,_ZL9PPUCHRBus
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE157:
	.size	_Z11TKSROM_InitP8CartInfo, .-_Z11TKSROM_InitP8CartInfo
	.section	.text._Z10TQROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10TQROM_InitP8CartInfo
	.hidden	_Z10TQROM_InitP8CartInfo
	.type	_Z10TQROM_InitP8CartInfo, @function
_Z10TQROM_InitP8CartInfo:
.LFB158:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a4,0
	li	a3,0
	li	a2,64
	li	a1,512
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	call	_Z12GenMMC3_InitP8CartInfoiiii
	lla	a5,_ZL6TQWRAPjh
	lla	s0,CHRRAMSIZE
	la a4, cwrap; sw a5, 0(a4);
	li	a0,8192
	li	a5,8192
	sw	a5,0(s0)
	call	_Z12FCEU_gmallocj
	lw	a2,0(s0)
	mv	a1,a0
	lla	s1,CHRRAM
	li	a3,1
	li	a0,16
	sw	a1,0(s1)
	call	_Z19SetupCartCHRMappingiPhji
	lw	a1,0(s0)
	lw	s0,8(sp)
	.cfi_restore 8
	lw	a0,0(s1)
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lla	a3,.LC4
	li	a2,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	tail	_Z10AddExStatePvjiPKc
	.cfi_endproc
.LFE158:
	.size	_Z10TQROM_InitP8CartInfo, .-_Z10TQROM_InitP8CartInfo
	.section	.text._Z14Mapper119_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z14Mapper119_InitP8CartInfo
	.hidden	_Z14Mapper119_InitP8CartInfo
	.type	_Z14Mapper119_InitP8CartInfo, @function
_Z14Mapper119_InitP8CartInfo:
.LFB189:
	.cfi_startproc
	tail	_Z10TQROM_InitP8CartInfo
	.cfi_endproc
.LFE189:
	.size	_Z14Mapper119_InitP8CartInfo, .-_Z14Mapper119_InitP8CartInfo
	.section	.text._Z10HKROM_InitP8CartInfo,"ax",@progbits
	.align	2
	.globl	_Z10HKROM_InitP8CartInfo
	.hidden	_Z10HKROM_InitP8CartInfo
	.type	_Z10HKROM_InitP8CartInfo, @function
_Z10HKROM_InitP8CartInfo:
.LFB159:
	.cfi_startproc
	lw	a4,48(a0)
	li	a3,1
	li	a2,512
	li	a1,512
	tail	_Z12GenMMC3_InitP8CartInfoiiii
	.cfi_endproc
.LFE159:
	.size	_Z10HKROM_InitP8CartInfo, .-_Z10HKROM_InitP8CartInfo
	.section	.sbss._ZL6TKSMIR,"aw",@nobits
	.align	2
	.type	_ZL6TKSMIR, @object
	.size	_ZL6TKSMIR, 8
_ZL6TKSMIR:
	.zero	8
	.section	.sbss._ZL9PPUCHRBus,"aw",@nobits
	.type	_ZL9PPUCHRBus, @object
	.size	_ZL9PPUCHRBus, 1
_ZL9PPUCHRBus:
	.zero	1
	.hidden	m114_perm
	.globl	m114_perm
	.section	.sdata.m114_perm,"aw"
	.align	2
	.type	m114_perm, @object
	.size	m114_perm, 8
m114_perm:
	.string	""
	.ascii	"\003\001\005\006\007\002\004"
	.section	.sbss._ZL5cmdin,"aw",@nobits
	.type	_ZL5cmdin, @object
	.size	_ZL5cmdin, 1
_ZL5cmdin:
	.zero	1
	.section	.sbss._ZL6hackm4,"aw",@nobits
	.align	2
	.type	_ZL6hackm4, @object
	.size	_ZL6hackm4, 4
_ZL6hackm4:
	.zero	4
	.hidden	mwrap
	.globl	mwrap
	.section	.sbss.mwrap,"aw",@nobits
	.align	2
	.type	mwrap, @object
	.size	mwrap, 4
mwrap:
	.zero	4
	.hidden	cwrap
	.globl	cwrap
	.section	.sbss.cwrap,"aw",@nobits
	.align	2
	.type	cwrap, @object
	.size	cwrap, 4
cwrap:
	.zero	4
	.hidden	pwrap
	.globl	pwrap
	.section	.sbss.pwrap,"aw",@nobits
	.align	2
	.type	pwrap, @object
	.size	pwrap, 4
pwrap:
	.zero	4
	.section	.sdata._ZL6isRevB,"aw"
	.align	2
	.type	_ZL6isRevB, @object
	.size	_ZL6isRevB, 4
_ZL6isRevB:
	.word	1
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC7:
	.string	"REGS"
	.align	2
.LC8:
	.string	"CMD"
	.align	2
.LC9:
	.string	"A000"
	.align	2
.LC10:
	.string	"A001"
	.align	2
.LC11:
	.string	"IRQR"
	.align	2
.LC12:
	.string	"IRQC"
	.align	2
.LC13:
	.string	"IRQL"
	.align	2
.LC14:
	.string	"IRQA"
	.section	.data._ZL14MMC3_StateRegs,"aw"
	.align	2
	.type	_ZL14MMC3_StateRegs, @object
	.size	_ZL14MMC3_StateRegs, 108
_ZL14MMC3_StateRegs:
	.word	DRegBuf
	.word	8
	.word	.LC7
	.word	MMC3_cmd
	.word	1
	.word	.LC8
	.word	A000B
	.word	1
	.word	.LC9
	.word	A001B
	.word	1
	.word	.LC10
	.word	IRQReload
	.word	1
	.word	.LC11
	.word	IRQCount
	.word	1
	.word	.LC12
	.word	IRQLatch
	.word	1
	.word	.LC13
	.word	IRQa
	.word	1
	.word	.LC14
	.word	0
	.zero	8
	.hidden	IRQReload
	.globl	IRQReload
	.section	.sbss.IRQReload,"aw",@nobits
	.type	IRQReload, @object
	.size	IRQReload, 1
IRQReload:
	.zero	1
	.hidden	IRQa
	.globl	IRQa
	.section	.sbss.IRQa,"aw",@nobits
	.type	IRQa, @object
	.size	IRQa, 1
IRQa:
	.zero	1
	.hidden	IRQLatch
	.globl	IRQLatch
	.section	.sbss.IRQLatch,"aw",@nobits
	.type	IRQLatch, @object
	.size	IRQLatch, 1
IRQLatch:
	.zero	1
	.hidden	IRQCount
	.globl	IRQCount
	.section	.sbss.IRQCount,"aw",@nobits
	.type	IRQCount, @object
	.size	IRQCount, 1
IRQCount:
	.zero	1
	.hidden	mmc3opts
	.globl	mmc3opts
	.section	.sbss.mmc3opts,"aw",@nobits
	.type	mmc3opts, @object
	.size	mmc3opts, 1
mmc3opts:
	.zero	1
	.hidden	A001B
	.globl	A001B
	.section	.sbss.A001B,"aw",@nobits
	.type	A001B, @object
	.size	A001B, 1
A001B:
	.zero	1
	.hidden	A000B
	.globl	A000B
	.section	.sbss.A000B,"aw",@nobits
	.type	A000B, @object
	.size	A000B, 1
A000B:
	.zero	1
	.hidden	EXPREGS
	.globl	EXPREGS
	.section	.sbss.EXPREGS,"aw",@nobits
	.align	2
	.type	EXPREGS, @object
	.size	EXPREGS, 8
EXPREGS:
	.zero	8
	.hidden	DRegBuf
	.globl	DRegBuf
	.section	.sbss.DRegBuf,"aw",@nobits
	.align	2
	.type	DRegBuf, @object
	.size	DRegBuf, 8
DRegBuf:
	.zero	8
	.hidden	CHRRAMSIZE
	.globl	CHRRAMSIZE
	.section	.sbss.CHRRAMSIZE,"aw",@nobits
	.align	2
	.type	CHRRAMSIZE, @object
	.size	CHRRAMSIZE, 4
CHRRAMSIZE:
	.zero	4
	.hidden	CHRRAM
	.globl	CHRRAM
	.section	.sbss.CHRRAM,"aw",@nobits
	.align	2
	.type	CHRRAM, @object
	.size	CHRRAM, 4
CHRRAM:
	.zero	4
	.hidden	WRAMSIZE
	.globl	WRAMSIZE
	.section	.sbss.WRAMSIZE,"aw",@nobits
	.align	2
	.type	WRAMSIZE, @object
	.size	WRAMSIZE, 4
WRAMSIZE:
	.zero	4
	.hidden	WRAM
	.globl	WRAM
	.section	.sbss.WRAM,"aw",@nobits
	.align	2
	.type	WRAM, @object
	.size	WRAM, 4
WRAM:
	.zero	4
	.hidden	kt_extra
	.globl	kt_extra
	.section	.sbss.kt_extra,"aw",@nobits
	.type	kt_extra, @object
	.size	kt_extra, 1
kt_extra:
	.zero	1
	.hidden	MMC3_cmd
	.globl	MMC3_cmd
	.section	.sbss.MMC3_cmd,"aw",@nobits
	.type	MMC3_cmd, @object
	.size	MMC3_cmd, 1
MMC3_cmd:
	.zero	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
