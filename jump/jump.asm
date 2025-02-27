section .text
    global _start

_start:
    mov ecx, 50  
    mov ebx, 42 
    mov eax,1
    cmp ecx, 100 ; ecx(50) - 100 
    jl skip
    mov ebx, 13  ; flag > 0
    
skip:
    int 0x80 ;flag < 0 

