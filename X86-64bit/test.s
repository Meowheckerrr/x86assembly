global _start

section .data
    message db "Meowhappy"
    length equ $-message

section .text
_start:
    mov rsi, message
    mov rdi, 1
    mov rax, 1
    mov rdx, length
    syscall

    mov rax, 60
    mov rdi, 0
    syscall