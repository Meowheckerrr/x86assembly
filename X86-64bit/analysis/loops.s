global _start

section .text
_start:
    mov rax, 2
    mov rcx, 5
mul_loop:
    imul rax, rax
    loop mul_loop