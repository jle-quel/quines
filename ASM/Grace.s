%macro MAIN 0
_main:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r12

	; Open
	lea rdi, [ rel filename ]
	mov rsi, 1537
	mov rdx, 0644o
	mov rax, OPEN
	syscall
	jc error
	mov r12, rax

	; Dprintf
	sub rsp, 64
	mov rdi, r12
	lea rsi, [ rel string ]
	mov rdx, 0xa ; 1
	mov rcx, 0x9 ; 2
	mov r8, 0x22 ; 3
	mov r9, 0x3b ; 4
	push rsi     ; 5
	call _dprintf
	add rsp, 64

	; Close
	mov rdi, r10
	mov rax, CLOSE
	syscall
	jc error

	pop r12
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi

	xor rax, rax

	leave
	ret

error:
	mov rax, -1

	leave
	ret
%endmacro

%define FT MAIN
%define OPEN 0x2000005
%define CLOSE 0x2000006

section .data
	filename db "Grace_kid.s", 0x0
	string db "%%macro MAIN 0%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$c%1$c%1%c%2$cpush rdi%1$c%2$cpush rsi%1$c%2$cpush rdx%1$c%2$cpush rcx%1$c%2$cpush r8%1$c%2$cpush r9%1$c%2$cpush r12%1$c%1$c%2$clea rdi, [ rel filename ]%1$c%2$cmov rsi, 1537%1$c%2$c", 0x0

section .text
	global _main
	extern _dprintf

;
;	Comment
;

FT
