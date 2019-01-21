section .data
string db "section .data%1$cstring db %3$c%4$s%3$c%1$c%1$csection .text%1$c%2$cglobal _main%1$c%2$cextern _printf%1$c%1$c_main:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$clea rdi, [ rel string ]%1$c%2$cmov rsi, 0xa%1$c%2$cmov rdx, 0x9%1$c%2$cmov rcx, 0x22%1$c%2$clea r8, [ rel string ]%1$c%2$ccall _printf%1$c%2$cleave%1$c%2$cret%1$c"

section .text
	global _main
	extern _printf

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [ rel string ]
	mov rsi, 0xa
	mov rdx, 0x9
	mov rcx, 0x22
	lea r8, [ rel string ]
	call _printf
	leave
	ret
