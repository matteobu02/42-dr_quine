global _start
extern sprintf
extern creat
extern dprintf
extern system
extern exit

section .bss
filename_ptr resb 32
filename_obj_ptr resb 32
child_exec_ptr resb 64
sys_command_ptr resb 256

section .data
i: dd 5
mystr: db "global _start%1$cextern sprintf%1$cextern creat%1$cextern dprintf%1$cextern system%1$cextern exit%1$c%1$csection .bss%1$cfilename_ptr resb 32%1$cfilename_obj_ptr resb 32%1$cchild_exec_ptr resb 64%1$csys_command_ptr resb 256%1$c%1$csection .data%1$ci: dd %3$d%1$cmystr: db %2$c%4$s%2$c,0%1$cfilename: db %2$cSully_%%d.s%2$c,0%1$cfilename_obj: db %2$cSully_%%d.o%2$c,0%1$cchild_exec: db %2$cSully_%%d%2$c,0%1$csys_command: db %2$cnasm -f elf64 %%1$s -o %%2$s && ld --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc %%2$s -o %%3$s && ./%%3$s%2$c,0%1$c%1$csection .text%1$c_start:%1$c	cmp DWORD [i], 0%1$c	jng .endprog%1$c%1$c	mov edx, DWORD [i]%1$c	dec edx%1$c	mov rsi, filename%1$c	mov rdi, filename_ptr%1$c	call sprintf%1$c%1$c	mov edx, DWORD [i]%1$c	dec edx%1$c	mov rsi, filename_obj%1$c	mov rdi, filename_obj_ptr%1$c	call sprintf%1$c%1$c	mov rsi, 0600o%1$c	mov rdi, filename_ptr%1$c	call creat%1$c	cmp rax, -1%1$c	je .error%1$c%1$c	mov r9, mystr%1$c	mov r8d, DWORD [i]%1$c	dec r8d%1$c	mov rcx, 34%1$c	mov rdx, 10%1$c	mov rsi, mystr%1$c	mov rdi, rax%1$c	call dprintf%1$c%1$c	mov edx, DWORD [i]%1$c	dec edx%1$c	mov rsi, child_exec%1$c	mov rdi, child_exec_ptr%1$c	call sprintf%1$c%1$c	mov r8, child_exec_ptr%1$c	mov rcx, filename_obj_ptr%1$c	mov rdx, filename_ptr%1$c	mov rsi, sys_command%1$c	mov rdi, sys_command_ptr%1$c	call sprintf%1$c%1$c	mov rdi, sys_command_ptr%1$c	call system%1$c%1$c.endprog:%1$c	xor rdi, rdi%1$c	call exit wrt ..plt%1$c%1$c.error:%1$c	mov rdi, 1%1$c	call exit wrt ..plt%1$c",0
filename: db "Sully_%d.s",0
filename_obj: db "Sully_%d.o",0
child_exec: db "Sully_%d",0
sys_command: db "nasm -f elf64 %1$s -o %2$s && ld --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc %2$s -o %3$s && ./%3$s",0

section .text
_start:
	cmp DWORD [i], 0
	jng .endprog

	mov edx, DWORD [i]
	dec edx
	mov rsi, filename
	mov rdi, filename_ptr
	call sprintf

	mov edx, DWORD [i]
	dec edx
	mov rsi, filename_obj
	mov rdi, filename_obj_ptr
	call sprintf

	mov rsi, 0600o
	mov rdi, filename_ptr
	call creat
	cmp rax, -1
	je .error

	mov r9, mystr
	mov r8d, DWORD [i]
	dec r8d
	mov rcx, 34
	mov rdx, 10
	mov rsi, mystr
	mov rdi, rax
	call dprintf

	mov edx, DWORD [i]
	dec edx
	mov rsi, child_exec
	mov rdi, child_exec_ptr
	call sprintf

	mov r8, child_exec_ptr
	mov rcx, filename_obj_ptr
	mov rdx, filename_ptr
	mov rsi, sys_command
	mov rdi, sys_command_ptr
	call sprintf

	mov rdi, sys_command_ptr
	call system

.endprog:
	xor rdi, rdi
	call exit wrt ..plt

.error:
	mov rdi, 1
	call exit wrt ..plt
