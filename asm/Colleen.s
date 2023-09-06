global main
extern printf
extern exit

; comment outside of main.

section .data
mystr: db "global main%1$cextern printf%1$cextern exit%1$c%1$c; comment outside of main.%1$c%1$csection .data%1$cmystr: db %2$c%3$s%2$c%1$c%1$csection .text%1$c%1$cdummy:%1$c	ret%1$c%1$cmain:%1$c	; comment in main.%1$c	call dummy%1$c	mov rcx, mystr%1$c	mov rdx, 34%1$c	mov rsi, 10%1$c	mov rdi, mystr%1$c	call printf%1$c%1$c	xor rdi, rdi%1$c	call exit%1$c"

section .text

dummy:
	ret

main:
	; comment in main.
	call dummy
	mov rcx, mystr
	mov rdx, 34
	mov rsi, 10
	mov rdi, mystr
	call printf

	xor rdi, rdi
	call exit
