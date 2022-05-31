	.file	"two.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Argument %d: %s\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Command line has no additional arguments"
	.section	.rodata.str1.1
.LC2:
	.string	"r"
.LC3:
	.string	"Open error "
.LC4:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$280, %rsp
	.cfi_def_cfa_offset 320
	movl	%edi, %r13d
	movq	%rsi, %rbp
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %r12d
	movl	$0, %ebx
	jmp	.L3
.L11:
	movq	%rax, %rbx
.L3:
	movq	0(%rbp,%rbx,8), %rdx
	movl	%ebx, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	1(%rbx), %rax
	cmpq	%r12, %rbx
	jne	.L11
.L2:
	cmpl	$1, %r13d
	je	.L14
.L4:
	movq	8(%rbp), %rdi
	movl	$.LC2, %esi
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L15
.L7:
	movq	%rbx, %rdi
	call	feof
	testl	%eax, %eax
	jne	.L16
	movq	%rbx, %rdx
	movl	$126, %esi
	leaq	144(%rsp), %rdi
	call	fgets
	testq	%rax, %rax
	je	.L7
	leaq	144(%rsp), %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	jmp	.L7
.L14:
	movl	$.LC1, %edi
	call	puts
	jmp	.L4
.L15:
	movl	$.LC3, %edi
	call	puts
	jmp	.L7
.L16:
	movl	$0, %esi
	movq	0(%rbp), %rdi
	movl	$0, %eax
	call	open
	movl	%eax, %ebx
	movq	%rsp, %rdx
	movl	%eax, %esi
	movl	$1, %edi
	call	__fxstat
	movl	$0, %r9d
	movl	%ebx, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movq	48(%rsp), %rsi
	movl	$0, %edi
	call	mmap
	movl	$0, %eax
	addq	$280, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-13)"
	.section	.note.GNU-stack,"",@progbits
