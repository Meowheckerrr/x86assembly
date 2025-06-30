global _start

section .text
_start: ;(F0=0 and F1=1)  ;(F0=0 and F1=1)
    
    ;initialize the value 
    xor rax,rbx
    xor rbx,rax
    inc rbx
    
    ;fib loop count
    mov rcx,10

_loopfib:
    add rax,rbx
    xchg rax,rbx
    cmp rbx,10
    js _loopfib ;depend on last register 



    

