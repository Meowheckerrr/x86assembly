global _start

section .text
_start:
    mov rbx, 'y is me!'
    push rbx
    mov rbx, 'meowhapp'
    push rbx
    
    mov rsi, rsp 
    xor rdi, rdi
    mov dil, 1
    xor rax, rax
    mov al, 1
    xor rdx, rdx
    mov dl, 16
    syscall

    xor rax, rax
    mov al, 60
    xor dil, dil
    ;mov dl, 0   (contain 0x00)
    syscall