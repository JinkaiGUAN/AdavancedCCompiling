	.arch armv8-a
	.file	"function.c"
	.text
	.global	nCompletionStatus
	.bss
	.align	2
	.type	nCompletionStatus, %object
	.size	nCompletionStatus, 4
nCompletionStatus:
	.zero	4
	.text
	.align	2
	.global	add
	.type	add, %function
add:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	s0, [sp, 12]
	str	s1, [sp, 8]
	ldr	s1, [sp, 12]
	ldr	s0, [sp, 8]
	fadd	s0, s1, s0
	str	s0, [sp, 28]
	ldr	s0, [sp, 28]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.align	2
	.global	add_and_multiply
	.type	add_and_multiply, %function
add_and_multiply:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	s0, [sp, 28]
	str	s1, [sp, 24]
	ldr	s1, [sp, 24]
	ldr	s0, [sp, 28]
	bl	add
	str	s0, [sp, 44]
	ldr	s1, [sp, 44]
	fmov	s0, 3.0e+0
	fmul	s0, s1, s0
	str	s0, [sp, 44]
	ldr	s0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	add_and_multiply, .-add_and_multiply
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
