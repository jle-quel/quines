section .data
	string db "section .data%1$c%2$cstring db %3$c%5$s%3$c%1$c%1$c%4$c Comment%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cextern _printf%1$c%1$cfunction:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$clea rdi, [ rel string ]%1$c%2$cmov rsi, 0xa%1$c%2$cmov rdx, 0x9%1$c%2$cmov rcx, 0x22%1$c%2$cmov r8, 0x3b%1$c%2$clea r9, [ rel string ]%1$c%2$ccall _printf%1$c%2$cxor rax, rax%1$c%2$cleave%1$c%2$cret%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$c%4$c Comment%1$c%2$ccall function%1$c%2$cleave%1$c%2$cret%1$c"

; Comment

section .text
	global _main
	extern _printf

function:
	push rbp
	mov rbp, rsp
	lea rdi, [ rel string ]
	mov rsi, 0xa
	mov rdx, 0x9
	mov rcx, 0x22
	mov r8, 0x3b
	lea r9, [ rel string ]
	call _printf
	xor rax, rax
	leave
	ret

_main:
	push rbp
	mov rbp, rsp
	; Comment
	call function
	leave
	ret
