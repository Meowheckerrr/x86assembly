section .text
    global _start

_start:
    push 10 ; func args 
    call selfAddFunc
    mov ebx,eax
    mov eax,1
    int 0x80

selfAddFunc:
    push ebp
    mov ebp, esp

    ; Load the first argument into EAX
    mov eax, [ebp + 8]
    add eax,eax
    
    mov esp,ebp
    pop ebp
    ret