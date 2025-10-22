#include "/home/mubai/ysyx-workbench/abstract-machine/tools/minirv/inst-replace.h"
	.file	"disk.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.__am_disk_config,"ax",@progbits
	.align	2
	.globl	__am_disk_config
	.hidden	__am_disk_config
	.type	__am_disk_config, @function
__am_disk_config:
.LFB6:
	.cfi_startproc
	sb	zero,0(a0)
	ret
	.cfi_endproc
.LFE6:
	.size	__am_disk_config, .-__am_disk_config
	.section	.text.__am_disk_status,"ax",@progbits
	.align	2
	.globl	__am_disk_status
	.hidden	__am_disk_status
	.type	__am_disk_status, @function
__am_disk_status:
.LFB7:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE7:
	.size	__am_disk_status, .-__am_disk_status
	.section	.text.__am_disk_blkio,"ax",@progbits
	.align	2
	.globl	__am_disk_blkio
	.hidden	__am_disk_blkio
	.type	__am_disk_blkio, @function
__am_disk_blkio:
.LFB10:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE10:
	.size	__am_disk_blkio, .-__am_disk_blkio
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
