section .text
    global _start

_start:
    call func ;push Return Address onto Stack -> EBP
    mov eax,1
    int 0x80

func:
    mov ebx,42
    ret ;POP ESP jum ESP 