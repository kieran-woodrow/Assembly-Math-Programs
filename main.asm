segment .data
        text1 db "Please enter the first number: " 
        text2 db "Please enter the second number: "
        text3 db "r" 

segment .bss
        answerOne resb 1
        answerTwo resb 2
        answerThree resb 1
        answerFour resb 2
        resultOne resb 1
        resultTwo resb 1
        quotient resb 1
        remainder resb 1
        q1 resb 1
        r1 resb 1
        q2 resb 1
        r2 resb 1
     
segment .text
        global _start

_start
call _printTextOne
call _firstDigit
call _printTextTwo
call _secondDigit
call _divideFunction
call _divideAgain
call _printOne
call _printTwo
call _printThree
call _printFour
call _printFive

mov rax, 60
mov rdi, 0
syscall

_printTextOne:
        mov rax, 1
        mov rdi, 1
        mov rsi, text1
        mov rdx, 31
        syscall
        ret

_firstDigit:
        mov rax, 0
        mov rdi, 0
        mov rsi, answerOne
        mov rdx, 1
        syscall
  
        mov rax, 0
        mov rdi, 0
        mov rsi, answerTwo
        mov rdx, 2
        syscall
        
        mov al, [answerOne]                               
        sub al, '0'                                      
        mov bl, 10  
        mul bl                       
        mov cl, [answerTwo]    
        sub cl, '0'
        add al, cl                                       
        add al, '0'                                     
        mov [resultOne], al   
        ret

_printTextTwo:
        mov rax, 1
        mov rdi, 1
        mov rsi, text2
        mov rdx, 32
        syscall
        ret

_secondDigit:
        mov rax, 0
        mov rdi, 0
        mov rsi, answerThree
        mov rdx, 1
        syscall
  
        mov rax, 0
        mov rdi, 0
        mov rsi, answerFour
        mov rdx, 2
        syscall
        
        mov al, [answerThree]                               
        sub al, '0'                                      
        mov bl, 10  
        mul bl                       
        mov cl, [answerFour]    
        sub cl, '0'
        add al, cl                                       
        add al, '0'                                     
        mov [resultTwo], al   
        ret

_divideFunction:
        mov ax, [resultOne]                            
        sub al, '0'                                        
        mov bl, [resultTwo]
        sub bl, '0'
        xor ah, ah
        div bl
        add al, '0'
        add ah, '0'
       
        mov [quotient], al 
        mov [remainder], ah
        ret

_divideAgain:

        mov ax, [quotient]
        sub al, '0'
        mov bl, 10
        xor ah, ah
        div bl
        add al, '0'
        add ah, '0'
        mov [q1], al
        mov [r1], ah
 
        mov al, [remainder]
        sub al, '0'
        mov bl, 10
        xor ah, ah
        div bl
        add al, '0'
        add ah, '0'
        mov [q2], al
        mov [r2], ah
        syscall
        ret
   
   
_printOne:
        mov rax, 1
        mov rdi, 1
        mov rsi, q1
        mov rdx, 1
        syscall
        ret

_printTwo:
        mov rax, 1
        mov rdi, 1
        mov rsi, r1
        mov rdx, 1
        syscall
        ret

_printThree:
        mov rax, 1
        mov rdi, 1
        mov rsi, text3
        mov rdx, 1
        syscall
        ret

_printFour:
        mov rax, 1
        mov rdi, 1
        mov rsi, q2
        mov rdx, 1
        syscall
        ret

_printFive:
        mov rax, 1
        mov rdi, 1
        mov rsi, r2
        mov rdx, 1
        syscall
        ret




        
   
   
   

        









  
       

       
       

 