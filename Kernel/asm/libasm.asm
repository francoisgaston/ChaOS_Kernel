GLOBAL cpuVendor
GLOBAL default_process
section .text
	
cpuVendor:							; Devuelve un string del nombre del fabricante del procesador (por ejemplo, si es Intel devuelve el string "Genuine Intel")
	push rbp
	mov rbp, rsp

	push rbx

	mov rax, 0
	cpuid


	mov [rdi], ebx
	mov [rdi + 4], edx
	mov [rdi + 8], ecx

	mov byte [rdi+13], 0

	mov rax, rdi

	pop rbx

	mov rsp, rbp
	pop rbp
	ret

default_process:
    ;mov rax, 1 ;no se si necesita tener esta instruccion, probar despues
    nop
    jmp default_process ;usa al procesador y no cambia las cosas
