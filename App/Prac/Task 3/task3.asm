segment .data
        text1 db "Enter the first number: " ;get user numbers
        text2 db "Enter the second number: " ; display after getting numbers
 

segment .bss
        result resb 1
        answerOne resb 2; reserve 1 bytes
        answerTwo resb 2
      
        

segment .text
        global _start

_start

call _printtext1
call _getdigit1
call _printtext2
call _getdigit2
call _addFunction



mov rax, 60
mov rdi, 0
syscall


_getdigit1:
        mov eax, 0
        mov rdi, 0
        mov rsi, answerOne
        mov edx, 2
        syscall
        ret

_getdigit2:
        mov eax, 0
        mov rdi, 0
        mov rsi, answerTwo 
        mov edx, 1
        syscall
        ret

_printtext1:
        mov eax, 1 ; SYS-WRITE code is 1
        mov rdi, 1 ; STDOUTPUT code is 1
        mov rsi, text1 ; output text 1
        mov edx, 24 ; has length of 25 characters
        syscall
        ret

_printtext2:
        mov eax, 1
        mov rdi, 1
        mov rsi, text2
        mov edx, 25
        syscall
        ret

_addFunction
        mov eax, [answerOne]
        sub eax, '0'

        mov ebx, [answerTwo]
        sub ebx, '0'

        add eax, ebx
        add eax, '0'
        mov [result], eax
        mov eax, 1
        mov rdi, 1
        mov rsi, result
        mov edx, 1
        syscall
        ret
      



       
