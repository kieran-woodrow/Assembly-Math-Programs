segment .data
        text1 db "Please input an integer: " ;get user numbers
        text2 db "Result: " ; display after getting numbers
        text3 db "negative"
        text4 db "positive"
        a dq 5
        b dq 0

segment .bss
        digit resb 2 ; reserve 1 bytes
        result resb 2
        number resb 2

segment .text
        global _start

_start

call _printtext1
call _getdigits
call _printtext2
call _convertAndSubtract



mov rax, 60
mov rdi, 0
syscall


_getdigits:
        mov eax, 0
        mov rdi, 0
        mov rsi, digit 
        mov edx, 1
        syscall
        ret

_printtext1:
        mov eax, 1 ; SYS-WRITE code is 1
        mov rdi, 1 ; STDOUTPUT code is 1
        mov rsi, text1 ; output text 1
        mov edx, 25 ; has length of 25 characters
        syscall
        ret

_printtext2:
        mov eax, 1
        mov rdi, 1
        mov rsi, text2
        mov edx, 8
        syscall
        ret

_convertAndSubtract:
        mov rax, [digit]
        sub rax, '0'
        sub rax, 5
        cmp rax, 0
        jge _labelOne
        jl _labelTwo
        syscall
        ret        
 
_labelOne:
        mov rax, 1
        mov rdi, 1
        mov rsi, text4
        mov rdx, 8
        syscall 
        ret
        

_labelTwo:
        mov rax, 1
        mov rdi, 1
        mov rsi, text3
        mov rdx, 8
        syscall
        ret

    

    