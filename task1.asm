segment .data
        text1 db "Please input a 5 digit number: " ;get user numbers
        text2 db "This is the number you are looking for: " ; display after getting numbers

segment .bss
        digits resb 1 ; reserve 1 bytes

segment .text
        global _start

_start

call _printtext1
call _getdigits
call _printtext2
call _printdigits

mov rax, 60
mov rdi, 0
syscall

_getdigits:
        mov eax, 0
        mov rdi, 0
        mov rsi, digits
        mov edx, 5
        syscall
        ret

_printtext1:
        mov eax, 1
        mov rdi, 1
        mov rsi, text1
        mov edx, 31
        syscall
        ret

_printtext2:
        mov eax, 1
        mov rdi, 1
        mov rsi, text2
        mov edx, 40
        syscall
        ret

_printdigits:
        mov eax, 1
        mov rdx, 1
        mov rsi, digits
        mov edx, 5
        syscall
        ret