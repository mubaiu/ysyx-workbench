#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"sound.cpp"
	.option nopic
	.attribute arch, "rv32e1p9_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.text._Z17FCEU_SoundCPUHooki,"ax",@progbits
	.align	2
	.globl	_Z17FCEU_SoundCPUHooki
	.hidden	_Z17FCEU_SoundCPUHooki
	.type	_Z17FCEU_SoundCPUHooki, @function
_Z17FCEU_SoundCPUHooki:
.LFB6:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE6:
	.size	_Z17FCEU_SoundCPUHooki, .-_Z17FCEU_SoundCPUHooki
	.section	.text._Z13FCEUSND_Powerv,"ax",@progbits
	.align	2
	.globl	_Z13FCEUSND_Powerv
	.hidden	_Z13FCEUSND_Powerv
	.type	_Z13FCEUSND_Powerv, @function
_Z13FCEUSND_Powerv:
.LFB19:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE19:
	.size	_Z13FCEUSND_Powerv, .-_Z13FCEUSND_Powerv
	.section	.text._Z17FlushEmulateSoundv,"ax",@progbits
	.align	2
	.globl	_Z17FlushEmulateSoundv
	.hidden	_Z17FlushEmulateSoundv
	.type	_Z17FlushEmulateSoundv, @function
_Z17FlushEmulateSoundv:
.LFB8:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE8:
	.size	_Z17FlushEmulateSoundv, .-_Z17FlushEmulateSoundv
	.section	.text._Z17SetSoundVariablesv,"ax",@progbits
	.align	2
	.globl	_Z17SetSoundVariablesv
	.hidden	_Z17SetSoundVariablesv
	.type	_Z17SetSoundVariablesv, @function
_Z17SetSoundVariablesv:
.LFB9:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE9:
	.size	_Z17SetSoundVariablesv, .-_Z17SetSoundVariablesv
	.section	.text._Z11FCEUI_Soundi,"ax",@progbits
	.align	2
	.globl	_Z11FCEUI_Soundi
	.hidden	_Z11FCEUI_Soundi
	.type	_Z11FCEUI_Soundi, @function
_Z11FCEUI_Soundi:
.LFB10:
	.cfi_startproc
	la a5, FSettings+60; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE10:
	.size	_Z11FCEUI_Soundi, .-_Z11FCEUI_Soundi
	.section	.text._Z21FCEUI_SetSoundQualityi,"ax",@progbits
	.align	2
	.globl	_Z21FCEUI_SetSoundQualityi
	.hidden	_Z21FCEUI_SetSoundQualityi
	.type	_Z21FCEUI_SetSoundQualityi, @function
_Z21FCEUI_SetSoundQualityi:
.LFB11:
	.cfi_startproc
	la a5, FSettings+64; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE11:
	.size	_Z21FCEUI_SetSoundQualityi, .-_Z21FCEUI_SetSoundQualityi
	.section	.text._Z20FCEUI_SetSoundVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetSoundVolumej
	.hidden	_Z20FCEUI_SetSoundVolumej
	.type	_Z20FCEUI_SetSoundVolumej, @function
_Z20FCEUI_SetSoundVolumej:
.LFB12:
	.cfi_startproc
	la a5, FSettings+8; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE12:
	.size	_Z20FCEUI_SetSoundVolumej, .-_Z20FCEUI_SetSoundVolumej
	.section	.text._Z23FCEUI_SetTriangleVolumej,"ax",@progbits
	.align	2
	.globl	_Z23FCEUI_SetTriangleVolumej
	.hidden	_Z23FCEUI_SetTriangleVolumej
	.type	_Z23FCEUI_SetTriangleVolumej, @function
_Z23FCEUI_SetTriangleVolumej:
.LFB13:
	.cfi_startproc
	la a5, FSettings+12; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE13:
	.size	_Z23FCEUI_SetTriangleVolumej, .-_Z23FCEUI_SetTriangleVolumej
	.section	.text._Z22FCEUI_SetSquare1Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare1Volumej
	.hidden	_Z22FCEUI_SetSquare1Volumej
	.type	_Z22FCEUI_SetSquare1Volumej, @function
_Z22FCEUI_SetSquare1Volumej:
.LFB14:
	.cfi_startproc
	la a5, FSettings+16; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE14:
	.size	_Z22FCEUI_SetSquare1Volumej, .-_Z22FCEUI_SetSquare1Volumej
	.section	.text._Z22FCEUI_SetSquare2Volumej,"ax",@progbits
	.align	2
	.globl	_Z22FCEUI_SetSquare2Volumej
	.hidden	_Z22FCEUI_SetSquare2Volumej
	.type	_Z22FCEUI_SetSquare2Volumej, @function
_Z22FCEUI_SetSquare2Volumej:
.LFB15:
	.cfi_startproc
	la a5, FSettings+20; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE15:
	.size	_Z22FCEUI_SetSquare2Volumej, .-_Z22FCEUI_SetSquare2Volumej
	.section	.text._Z20FCEUI_SetNoiseVolumej,"ax",@progbits
	.align	2
	.globl	_Z20FCEUI_SetNoiseVolumej
	.hidden	_Z20FCEUI_SetNoiseVolumej
	.type	_Z20FCEUI_SetNoiseVolumej, @function
_Z20FCEUI_SetNoiseVolumej:
.LFB16:
	.cfi_startproc
	la a5, FSettings+24; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE16:
	.size	_Z20FCEUI_SetNoiseVolumej, .-_Z20FCEUI_SetNoiseVolumej
	.section	.text._Z18FCEUI_SetPCMVolumej,"ax",@progbits
	.align	2
	.globl	_Z18FCEUI_SetPCMVolumej
	.hidden	_Z18FCEUI_SetPCMVolumej
	.type	_Z18FCEUI_SetPCMVolumej, @function
_Z18FCEUI_SetPCMVolumej:
.LFB17:
	.cfi_startproc
	la a5, FSettings+28; sw a0, 0(a5);
	ret
	.cfi_endproc
.LFE17:
	.size	_Z18FCEUI_SetPCMVolumej, .-_Z18FCEUI_SetPCMVolumej
	.hidden	soundtsi
	.globl	soundtsi
	.section	.sbss.soundtsi,"aw",@nobits
	.align	2
	.type	soundtsi, @object
	.size	soundtsi, 4
soundtsi:
	.zero	4
	.hidden	soundtsinc
	.globl	soundtsinc
	.section	.sbss.soundtsinc,"aw",@nobits
	.align	2
	.type	soundtsinc, @object
	.size	soundtsinc, 4
soundtsinc:
	.zero	4
	.hidden	nesincsize
	.globl	nesincsize
	.section	.sbss.nesincsize,"aw",@nobits
	.align	2
	.type	nesincsize, @object
	.size	nesincsize, 4
nesincsize:
	.zero	4
	.hidden	soundtsoffs
	.globl	soundtsoffs
	.section	.sbss.soundtsoffs,"aw",@nobits
	.align	2
	.type	soundtsoffs, @object
	.size	soundtsoffs, 4
soundtsoffs:
	.zero	4
	.hidden	EnvUnits
	.globl	EnvUnits
	.section	.bss.EnvUnits,"aw",@nobits
	.align	2
	.type	EnvUnits, @object
	.size	EnvUnits, 24
EnvUnits:
	.zero	24
	.hidden	DMC_7bit
	.globl	DMC_7bit
	.section	.sbss.DMC_7bit,"aw",@nobits
	.type	DMC_7bit, @object
	.size	DMC_7bit, 1
DMC_7bit:
	.zero	1
	.hidden	InitialRawDALatch
	.globl	InitialRawDALatch
	.section	.sbss.InitialRawDALatch,"aw",@nobits
	.type	InitialRawDALatch, @object
	.size	InitialRawDALatch, 1
InitialRawDALatch:
	.zero	1
	.hidden	IRQFrameMode
	.globl	IRQFrameMode
	.section	.sbss.IRQFrameMode,"aw",@nobits
	.type	IRQFrameMode, @object
	.size	IRQFrameMode, 1
IRQFrameMode:
	.zero	1
	.hidden	EnabledChannels
	.globl	EnabledChannels
	.section	.sbss.EnabledChannels,"aw",@nobits
	.type	EnabledChannels, @object
	.size	EnabledChannels, 1
EnabledChannels:
	.zero	1
	.hidden	DMCSizeLatch
	.globl	DMCSizeLatch
	.section	.sbss.DMCSizeLatch,"aw",@nobits
	.type	DMCSizeLatch, @object
	.size	DMCSizeLatch, 1
DMCSizeLatch:
	.zero	1
	.hidden	DMCAddressLatch
	.globl	DMCAddressLatch
	.section	.sbss.DMCAddressLatch,"aw",@nobits
	.type	DMCAddressLatch, @object
	.size	DMCAddressLatch, 1
DMCAddressLatch:
	.zero	1
	.hidden	RawDALatch
	.globl	RawDALatch
	.section	.sbss.RawDALatch,"aw",@nobits
	.type	RawDALatch, @object
	.size	RawDALatch, 1
RawDALatch:
	.zero	1
	.hidden	DMCFormat
	.globl	DMCFormat
	.section	.sbss.DMCFormat,"aw",@nobits
	.type	DMCFormat, @object
	.size	DMCFormat, 1
DMCFormat:
	.zero	1
	.hidden	PSG
	.globl	PSG
	.section	.bss.PSG,"aw",@nobits
	.align	2
	.type	PSG, @object
	.size	PSG, 16
PSG:
	.zero	16
	.hidden	GameExpSound
	.globl	GameExpSound
	.section	.bss.GameExpSound,"aw",@nobits
	.align	2
	.type	GameExpSound, @object
	.size	GameExpSound, 24
GameExpSound:
	.zero	24
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
