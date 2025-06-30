section .text
    global _start

_start:
    call func
    mov eax, 1 ;system call number for exit
    xor ebx, ebx ;exit code 0
    int 0x80

func:
    ;preserverStack - Prologue
    push ebp
    mov ebp,esp
    sub esp, 5 ;Assign Memeory Spaces 
    
    
    mov [esp], byte "m"
    mov [esp+1], byte "e"
    mov [esp+2], byte "o"
    mov [esp+3], byte "w"
    mov [esp+4], byte 0x0a
    ;print string
    mov eax, 4 ;system call number for write
    mov ebx, 1 ;file descriptor (stdout)
    mov ecx, esp ;address of buffer
    mov edx, 5 ;number of bytes to write
    int 0x80

    ;Recover EBP and Return to Origional Address - Epilogue
    mov esp, ebp
    pop ebp
    ret