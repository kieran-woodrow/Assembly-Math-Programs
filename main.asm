segment .data
        text1 db "Please enter the first number: " ;get user numbers
        text2 db "Please enter the second number: " ; display after getting numbers

segment .bss
        result resb 2
        answerOne resb 2; reserve 1 bytes
        answerTwo resb 2
        quotient resb 2;
        remainder resb 2;
      
    
segment .text
        global _start

_start

call _printtext1
call _getdigit1
call _printtext2
call _getdigit2
call _addFunction
call _seperateFunction



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
        mov edx, 31 ; has length of 25 characters
        syscall
        ret

_printtext2:
        mov eax, 1
        mov rdi, 1
        mov rsi, text2
        mov edx, 32
        syscall
        ret

_addFunction
        mov eax, [answerOne]                               ; move answer one into register
        sub eax, '0'                                       ; convert to ascii
        mov ebx, [answerTwo]                               ; move answer two to register
        sub ebx, '0'                                       ; convert to ascii
        add eax, ebx                                       ; ad the two variables togther
        add eax, '0'                                       ; convert to decimal
        mov [result], eax   
                                                           ; move from register and into variable result
        syscall                                            ; function end
        ret                                                ; return function value

_seperateFunction

        mov ax, [result]  
        sub al, '0'
        mov bl, 10
        xor ah, ah
        div bl
        add al, '0'
        add ah, '0'
       
        mov byte [quotient], al 
        mov byte [remainder], ah

        mov rax, 1
        mov rdi, 1
        mov rsi, quotient
        mov rdx, 1
        syscall
        

        mov rax, 1
        mov rdi, 1
        mov rsi, remainder
        mov rdx, 1
        syscall

        ret


 
     




      



       