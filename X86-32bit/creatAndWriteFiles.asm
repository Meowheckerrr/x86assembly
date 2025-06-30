global main

section .data
    filepath DD "/home/kali/Desktop/x86assembly/meow.txt"
    message DD "meowhecker",0x0a

section .text

main: 
    ; grep -r "O_CREAT" /usr/include/
    ; /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:# define O_CREAT          0100 /* Not fcntl.  */


    mov eax, 5
    mov ebx, filepath
    mov ecx, 101o      ; O_CREAT + O_WRONLY
    mov edx, 700o
    int 0x80

    mov ebx,eax
    mov eax,4
    mov ecx,message
    mov edx,11 
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
