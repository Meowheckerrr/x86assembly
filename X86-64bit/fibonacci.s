global _start
extern  printf

section .data
    message db "Fibonacci Sequence",0x0a ;#define __NR_write 1
    messageLength equ $-message
    format db "%d",0x0a, 0x00

section .text
_start: ;(F0=0 and F1=1)  ;(F0=0 and F1=1)
    call printMessage  ;push printMessage to stack 
    call initFibo
    call loopfib
    call exit

printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, messageLength
    syscall
    ret

initFibo:
    ;initialize the value 
    xor rax,rax
    xor rbx,rbx
    inc rbx
    ret
    
loopfib:
    call printFib
    add rax,rbx
    xchg rax,rbx
    
    cmp rbx,10
    js loopfib ;depend on last register 
    ret

printFib:
    push rax
    push rbx
    mov rdi, format ; printf(outFormat, rbx)
    mov rsi, rbx
    call printf
    pop rbx
    pop rax
    ret 

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    

