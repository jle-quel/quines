section .bss
	filebuf resb 10
	cmdbuf resb 60

section .data
	filename db "Sully_%d.s", 0x0
	cmdname db "nasm -f macho64 Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && ./Sully_%1$d", 0x0
	string db "section .bss%1$c%2$cfilebuf resb 10%1$c%2$ccmdbuf resb 60%1$c%1$csection .data%1$c%2$cfilename db %3$cSully_%%d.s%3$c, 0x0%1$c%2$ccmdname db %3$cnasm -f macho64 Sully_%%1$d.s && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0x0%1$c%2$cstring db %3$c%5$s%3$c, 0x0%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cextern _sprintf%1$c%2$cextern _dprintf%1$c%2$cextern _system%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$cpush rdi%1$c%2$cpush rsi%1$c%2$cpush rdx%1$c%2$cpush rcx%1$c%2$cpush r8%1$c%2$cpush r12%1$c%2$cpush r13%1$c%1$c%2$cmov r12, %4$d%1$c%1$c%2$ccmp r12d, -1%1$c%2$cje end%1$c%1$c%2$csub rsp, 56%1$c%2$clea rdi, [ rel filebuf ]%1$c%2$clea rsi, [ rel filename ]%1$c%2$cmov rdx, r12%1$c%2$ccall _sprintf%1$c%2$cadd rsp, 56%1$c%1$c%2$csub rsp, 56%1$c%2$clea rdi, [ rel cmdbuf ]%1$c%2$clea rsi, [ rel cmdname ]%1$c%2$cmov rdx, r12%1$c%2$ccall _sprintf%1$c%2$cadd rsp, 56%1$c%1$c%2$clea rdi, [ rel filebuf ]%1$c%2$cmov rsi, 1537%1$c%2$cmov rdx, 0644o%1$c%2$cmov rax, 0x2000005%1$c%2$csyscall%1$c%2$cjc error%1$c%2$cmov r13, rax%1$c%1$c%2$csub rsp, 64%1$c%2$cmov rdi, r13%1$c%2$clea rsi, [ rel string ]%1$c%2$cmov rdx, 0xa%1$c%2$cmov rcx, 0x9%1$c%2$cmov r8, 0x22%1$c%2$cmov r9, r12%1$c%2$cdec r9%1$c%2$cpush rsi%1$c%2$ccall _dprintf%1$c%2$cadd rsp, 64%1$c%1$c%2$cmov rdi, r13%1$c%2$cmov rax, 0x2000006%1$c%2$csyscall%1$c%2$cjc error%1$c%1$c%2$clea rdi, [ rel cmdbuf ]%1$c%2$ccall _system%1$c%1$c%2$cpop r13%1$c%2$cpop r12%1$c%2$cpop r8%1$c%2$cpop rcx%1$c%2$cpop rdx%1$c%2$cpop rsi%1$c%2$cpop rdi%1$c%1$cend:%1$c%2$cxor rax, rax%1$c%1$c%2$cleave%1$c%2$cret%1$c%1$cerror:%1$c%2$cmov rax, -1%1$c%1$c%2$cleave%1$c%2$cret%1$c", 0x0

section .text
	global _main
	extern _sprintf
	extern _dprintf
	extern _system

_main:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r12
	push r13

	mov r12, 5

	cmp r12d, -1
	je end

	sub rsp, 56
	lea rdi, [ rel filebuf ]
	lea rsi, [ rel filename ]
	mov rdx, r12
	call _sprintf
	add rsp, 56

	sub rsp, 56
	lea rdi, [ rel cmdbuf ]
	lea rsi, [ rel cmdname ]
	mov rdx, r12
	call _sprintf
	add rsp, 56

	lea rdi, [ rel filebuf ]
	mov rsi, 1537
	mov rdx, 0644o
	mov rax, 0x2000005
	syscall
	jc error
	mov r13, rax

	sub rsp, 64
	mov rdi, r13
	lea rsi, [ rel string ]
	mov rdx, 0xa
	mov rcx, 0x9
	mov r8, 0x22
	mov r9, r12
	dec r9
	push rsi
	call _dprintf
	add rsp, 64

	mov rdi, r13
	mov rax, 0x2000006
	syscall
	jc error

	lea rdi, [ rel cmdbuf ]
	call _system

	pop r13
	pop r12
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi

end:
	xor rax, rax

	leave
	ret

error:
	mov rax, -1

	leave
	ret
