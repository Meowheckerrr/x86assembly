global _start

section .data
    program db '/bin//sh', 0 ; Null-terminated program path
    args dq program, 0    ; Argument array: ["/bin//sh", NULL]

section .text
_start:
    mov rax, 59
    lea rdi, [program]    ;lea rdi, [program]: Loads the memory address of the program string
    lea rsi, [args]
    xor rdx, rdx                ; RDX: NULL (no env variables)
    syscall