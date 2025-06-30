section .text
    global _start

_start:
    sub esp,5
    mov [esp], byte "m"
    mov [esp+1], byte "e"
    mov [esp+2], byte "o"
    mov [esp+3], byte "w"
    mov [esp+4], byte 10
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 5
    int 0x80

    ;Exit 
    mov eax, 1
    xor ebx, ebx
    int 0x80