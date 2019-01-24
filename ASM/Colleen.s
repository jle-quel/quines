section .data
	string db "section .data%1$c%2$cstring db %3$c%5$s%3$c, 0x0%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cextern _printf%1$c%1$c%4$c%1$c%4$c%2$cComment%1$c%4$c%1$c%1$cfunction:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$clea rdi, [ rel string ]%1$c%2$cmov rsi, 0xa%1$c%2$cmov rdx, 0x9%1$c%2$cmov rcx, 0x22%1$c%2$cmov r8, 0x3b%1$c%2$cmov r9, rdi%1$c%2$ccall _printf%1$c%1$c%2$cleave%1$c%2$cret%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$c%4$c%1$c%2$c%4$c%2$cComment%1$c%2$c%4$c%1$c%1$c%2$cpush rdi%1$c%2$cpush rsi%1$c%2$cpush rdx%1$c%2$cpush rcx%1$c%2$cpush r8%1$c%2$cpush r9%1$c%1$c%2$csub rsp, 48%1$c%2$ccall function%1$c%2$cadd rsp, 48%1$c%1$c%2$cpop r9%1$c%2$cpop r8%1$c%2$cpop rcx%1$c%2$cpop rdx%1$c%2$cpop rsi%1$c%2$cpop rdi%1$c%1$c%2$cxor rax, rax%1$c%1$c%2$cleave%1$c%2$cret%1$c", 0x0

section .text
	global _main
	extern _printf

;
;	Comment
;

function:
	push rbp
	mov rbp, rsp

	lea rdi, [ rel string ]
	mov rsi, 0xa
	mov rdx, 0x9
	mov rcx, 0x22
	mov r8, 0x3b
	mov r9, rdi
	call _printf

	leave
	ret

_main:
	push rbp
	mov rbp, rsp

	;
	;	Comment
	;

	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9

	sub rsp, 48
	call function
	add rsp, 48

	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi

	xor rax, rax

	leave
	ret
