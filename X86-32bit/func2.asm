global main
extern printf ;external symbols

section .data
    msg db "meowhecker %d", 0x0a, 0x00  ; Use "%d" instead of "%i" for standard integer format

section .text
main:
    push ebp
    mov ebp, esp

    ;The stack must be aligned to 16 bytes before calling a function in System V ABI (Linux).
    sub esp, 8             ; Align the stack to 16 bytes (optional, but prevents crashes)
    push dword 666         ; Correctly push the integer
    push msg               ; Push the format string address
    call printf            ; Call printf

    add esp, 8             ; Clean up arguments from the stack

    mov eax, 0             ; Return 0
    mov esp, ebp
    pop ebp
    ret
