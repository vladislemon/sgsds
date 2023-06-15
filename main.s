	.file	"main.c"
	.text
	.globl	SGSDSF_MemIntensive
	.def	SGSDSF_MemIntensive;	.scl	2;	.type	32;	.endef
	.seh_proc	SGSDSF_MemIntensive
SGSDSF_MemIntensive:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$4, %rax
	movl	$1, (%rax)
	movl	$1, -4(%rbp)
	movl	$2, -8(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-8(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jle	.L3
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	SGSDSF
	.def	SGSDSF;	.scl	2;	.type	32;	.endef
	.seh_proc	SGSDSF
SGSDSF:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cvtsi2ss	16(%rbp), %xmm0
	movss	.LC0(%rip), %xmm1
	call	powf
	movaps	%xmm0, %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$10, %eax
	movl	%eax, -12(%rbp)
	cvtsi2ss	16(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	call	powf
	movaps	%xmm0, %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$20, %eax
	movl	%eax, -16(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$1, -4(%rbp)
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movl	$1, (%rax)
	movq	-32(%rbp), %rax
	addq	$4, %rax
	movl	$1, (%rax)
	movl	$2, -8(%rbp)
	jmp	.L6
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-8(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltd
	idivl	-16(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltd
	idivl	-16(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.L7
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
.L7:
	addl	$1, -8(%rbp)
.L6:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jle	.L8
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	-4(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	SGSDSF_Optimized
	.def	SGSDSF_Optimized;	.scl	2;	.type	32;	.endef
	.seh_proc	SGSDSF_Optimized
SGSDSF_Optimized:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cvtsi2ss	16(%rbp), %xmm0
	movss	.LC0(%rip), %xmm1
	call	powf
	movaps	%xmm0, %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$10, %eax
	movl	%eax, -16(%rbp)
	cvtsi2ss	16(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	call	powf
	movaps	%xmm0, %xmm1
	movss	.LC1(%rip), %xmm0
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$20, %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$1, -4(%rbp)
	movq	-32(%rbp), %rax
	addq	$4, %rax
	movl	$1, (%rax)
	movq	-40(%rbp), %rax
	addq	$4, %rax
	movl	$1, (%rax)
	movl	$2, -8(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-8(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltd
	idivl	-20(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltd
	idivl	-20(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	addl	$1, -8(%rbp)
.L11:
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L12
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L13
.L14:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cltd
	idivl	-20(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltd
	idivl	-20(%rbp)
	movl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	addl	$1, -12(%rbp)
.L13:
	movl	-12(%rbp), %eax
	cmpl	16(%rbp), %eax
	jle	.L14
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	-4(%rbp), %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC3:
	.ascii "n=%d, f=%d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movl	$2000000000, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	SGSDSF_Optimized
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1058944319
	.align 4
.LC1:
	.long	1067072881
	.align 4
.LC2:
	.long	1053609165
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	powf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
