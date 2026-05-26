	.file	"factorial.c"
	.text
	.p2align 4
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L4
	leal	1(%rdi), %esi
	andl	$1, %edi
	movl	$1, %eax
	movl	$1, %edx
	je	.L3
	movl	$2, %eax
	cmpq	%rsi, %rax
	je	.L1
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	imulq	%rax, %rdx
	leaq	1(%rax), %rcx
	addq	$2, %rax
	imulq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L3
.L1:
	movq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$1, %edx
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
