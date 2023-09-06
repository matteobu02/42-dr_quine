global _start
extern creat
extern dprintf
extern exit
; my comment is here.

%macro CODE 0
_start:
	mov rsi, 0600o
	mov rdi, child
	call creat
	cmp rax, -1
	je .error

	mov r8, mystr
	mov rcx, 34
	mov rdx, 10
	mov rsi, mystr
	mov rdi, rax
	call dprintf

	xor rdi, rdi
	call exit

.error:
	mov rdi, 1
	call exit
%endmacro

section .data
child: db "Grace_kid.s", 0
mystr: db "global _start%1$cextern creat%1$cextern dprintf%1$cextern exit%1$c; my comment is here.%1$c%1$c%%macro CODE 0%1$c_start:%1$c	mov rsi, 0600o%1$c	mov rdi, child%1$c	call creat%1$c	cmp rax, -1%1$c	je .error%1$c%1$c	mov r8, mystr%1$c	mov rcx, 34%1$c	mov rdx, 10%1$c	mov rsi, mystr%1$c	mov rdi, rax%1$c	call dprintf%1$c%1$c	xor rdi, rdi%1$c	call exit%1$c%1$c.error:%1$c	mov rdi, 1%1$c	call exit%1$c%%endmacro%1$c%1$csection .data%1$cchild: db %2$cGrace_kid.s%2$c, 0%1$cmystr: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cCODE%1$c", 0

section .text
CODE
