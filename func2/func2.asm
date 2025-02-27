global main
extern printf

section .data
    msg db "meowhecker %d", 0x0a, 0x00  ; Use "%d" instead of "%i" for standard integer format

section .text
main:
    push ebp
    mov ebp, esp

    sub esp, 8             ; Align the stack to 16 bytes (optional, but prevents crashes)
    push dword 666         ; Correctly push the integer
    push msg               ; Push the format string address
    call printf            ; Call printf

    add esp, 8             ; Clean up arguments from the stack

    mov eax, 0             ; Return 0
    mov esp, ebp
    pop ebp
    ret