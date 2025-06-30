ORG 0x7c00
BITS 16 

main:

    MOV ax, 0      ; clear AX register
    MOV ds, ax     ; set Data Segment = 0
    MOV es, ax     ; set Extra Segment = 0
    MOV ss, ax     ; set Stack Segment = 0
    
    MOV sp, 0x7C00 ; Put our stack in boot loader
    mov si, msg
    call print
    HLT

halt:
    jmp halt


print:
    push si  ;msg index 
    push ax
    push bx

print_loop:
    lodsb ; Load byte from memory pointed by SI into AL
    test al, al ; Check if AL is 0   or using OR al, al
    JZ print_end

    ; Print the Character to the screen via video call
    mov ah, 0x0E ;BIOS video interrupt function: Print character in TTY mode.
    mov bh, 0
    int 0x10

    jmp print_loop

print_end:
    pop bx ; Restore BX
    pop ax ; Restore AX
    pop si ; Restore SI
    RET 


msg: DB "meowhappy OS Boot !!!!", 0x0D, 0x0A, 0 


TIMES 510 -($-$$) DB 0 ;Finding the address of 510 byte 
DW 0xAA55  ;Writing boot signature -> 55 AA
