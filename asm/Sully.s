global _start
extern sprintf
extern dprintf
extern open
extern creat
extern system
extern exit

section .bss
final_filename: resb 32
final_exec: resb 32
final_cmd: resb 256

section .data
i: dd 5
mystr: db "global _start%1$cextern sprintf%1$cextern dprintf%1$cextern open%1$cextern creat%1$cextern system%1$cextern exit%1$c%1$csection .bss%1$cfinal_filename: resb 32%1$cfinal_exec: resb 32%1$cfinal_cmd: resb 256%1$c%1$csection .data%1$ci: dd %3$d%1$cmystr: db %2$c%4$s%2$c,0%1$cfilename_patt: db %2$cSully_%%d.s%2$c,0%1$cexec_patt: db %2$cSully_%%d%2$c,0%1$ccmd_patt: db %2$cnasm -felf64 %%1$s && ld --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc %%2$s.o -o %%2$s && ./%%2$s%2$c,0%1$c%1$csection .text%1$c_start:%1$c	cmp DWORD [i], 0%1$c	jng .endprog%1$c%1$c	mov edx, [i]%1$c	mov rsi, filename_patt%1$c	mov rdi, final_filename%1$c	call sprintf%1$c%1$c	mov rsi, 0%1$c	mov rdi, final_filename%1$c	call open%1$c	cmp eax, -1%1$c	je .file_ready%1$c%1$c	sub [i], DWORD 1%1$c	mov edx, DWORD [i]%1$c	mov rsi, filename_patt%1$c	mov rdi, final_filename%1$c	call sprintf%1$c%1$c.file_ready:%1$c	mov rsi, 0600o%1$c	mov rdi, final_filename%1$c	call creat%1$c	cmp eax, -1%1$c	je .error%1$c%1$c	mov r9, mystr%1$c	mov r8, [i]%1$c	mov rcx, 34%1$c	mov rdx, 10%1$c	mov rsi, mystr%1$c	mov rdi, rax%1$c	call dprintf%1$c%1$c	mov rdx, [i]%1$c	mov rsi, exec_patt%1$c	mov rdi, final_exec%1$c	call sprintf%1$c%1$c	mov rcx, final_exec%1$c	mov rdx, final_filename%1$c	mov rsi, cmd_patt%1$c	mov rdi, final_cmd%1$c	call sprintf%1$c%1$c	mov rdi, final_cmd%1$c	call system%1$c%1$c.endprog:%1$c	xor rdi, rdi%1$c	call exit wrt ..plt%1$c%1$c.error:%1$c	mov rdi, 1%1$c	call exit wrt ..plt%1$c",0
filename_patt: db "Sully_%d.s",0
exec_patt: db "Sully_%d",0
cmd_patt: db "nasm -felf64 %1$s && ld --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc %2$s.o -o %2$s && ./%2$s",0

section .text
_start:
	cmp DWORD [i], 0
	jng .endprog

	mov edx, [i]
	mov rsi, filename_patt
	mov rdi, final_filename
	call sprintf

	mov rsi, 0
	mov rdi, final_filename
	call open
	cmp eax, -1
	je .file_ready

	sub [i], DWORD 1
	mov edx, DWORD [i]
	mov rsi, filename_patt
	mov rdi, final_filename
	call sprintf

.file_ready:
	mov rsi, 0600o
	mov rdi, final_filename
	call creat
	cmp eax, -1
	je .error

	mov r9, mystr
	mov r8, [i]
	mov rcx, 34
	mov rdx, 10
	mov rsi, mystr
	mov rdi, rax
	call dprintf

	mov rdx, [i]
	mov rsi, exec_patt
	mov rdi, final_exec
	call sprintf

	mov rcx, final_exec
	mov rdx, final_filename
	mov rsi, cmd_patt
	mov rdi, final_cmd
	call sprintf

	mov rdi, final_cmd
	call system

.endprog:
	xor rdi, rdi
	call exit wrt ..plt

.error:
	mov rdi, 1
	call exit wrt ..plt
