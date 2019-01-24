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

	lea rdi, [ rel filename ]
	mov rsi, 1537
	mov rdx, 0644o
	mov rax, OPEN
	syscall
	jc error
	mov r12, rax

	sub rsp, 64
	mov rdi, r12
	lea rsi, [ rel string ]
	mov rdx, 0xa
	mov rcx, 0x9
	mov r8, 0x22
	mov r9, 0x3b
	push rsi
	call _dprintf
	add rsp, 64

	mov rdi, r12
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
	string db "%%macro MAIN 0%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$cpush rdi%1$c%2$cpush rsi%1$c%2$cpush rdx%1$c%2$cpush rcx%1$c%2$cpush r8%1$c%2$cpush r9%1$c%2$cpush r12%1$c%1$c%2$clea rdi, [ rel filename ]%1$c%2$cmov rsi, 1537%1$c%2$cmov rdx, 0644o%1$c%2$cmov rax, OPEN%1$c%2$csyscall%1$c%2$cjc error%1$c%2$cmov r12, rax%1$c%1$c%2$csub rsp, 64%1$c%2$cmov rdi, r12%1$c%2$clea rsi, [ rel string ]%1$c%2$cmov rdx, 0xa%1$c%2$cmov rcx, 0x9%1$c%2$cmov r8, 0x22%1$c%2$cmov r9, 0x3b%1$c%2$cpush rsi%1$c%2$ccall _dprintf%1$c%2$cadd rsp, 64%1$c%1$c%2$cmov rdi, r10%1$c%2$cmov rax, CLOSE%1$c%2$csyscall%1$c%2$cjc error%1$c%1$c%2$cpop r12%1$c%2$cpop r9%1$c%2$cpop r8%1$c%2$cpop rcx%1$c%2$cpop rdx%1$c%2$cpop rsi%1$c%2$cpop rdi%1$c%1$c%2$cxor rax, rax%1$c%1$c%2$cleave%1$c%2$cret%1$c%1$cerror:%1$c%2$cmov rax, -1%1$c%1$c%2$cleave%1$c%2$cret%1$c%%endmacro%1$c%1$c%%define FT MAIN%1$c%%define OPEN 0x2000005%1$c%%define CLOSE 0x2000006%1$c%1$csection .data%1$c%2$cfilename db %3$cGrace_kid.s%3$c, 0x0%1$c%2$cstring db %3$c%5$s%3$c, 0x0%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cextern _dprintf%1$c%1$c%4$c%1$c%4$c%2$cComment%1$c%4$c%1$c%1$cFT%1$c", 0x0

section .text
	global _main
	extern _dprintf

;
;	Comment
;

FT
