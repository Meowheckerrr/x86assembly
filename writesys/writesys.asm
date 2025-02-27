
section .data
    msg db "meowhecker",0x0A ;
    msgLen equ $-msg

section .text
    global _start

_start:
    mov eax, 0x04 ;#define __NR_write 4
    mov ebx, 1 ;# file descriptor 1 (stdout)
    mov ecx, msg ;# buffer address
    mov edx, msgLen ;# buffer size

    int 0x80 ;# syscall
    mov eax, 1 ;# define __NR_exit 1
    xor ebx, ebx ;# exit code 0
    int 0x80 ;# syscall
    