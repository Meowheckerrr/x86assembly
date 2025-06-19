ORG 0x7C00
BITS 16 

;FAT!@ Format Start
jmp short main  ;short means it's a 1-byte offset jump (for space-saving)
nop ;It's used here to fill space so that the BPB starts exactly at byte 3
; BIOS Parameter Block (BPB)
; -> Core disk geometry and FAT layout

bdb_oem:                   db 'MEOWBOOT'       ; OEM Name (8 bytes)
bdb_bytes_per_sector:      dw 512              ; 512 bytes per sector
bdb_sectors_per_cluster:   db 1                ; 1 sector per cluster
bdb_reserved_sectors:      dw 1                ; 1 reserved sector (boot sector)
bdb_fat_count:             db 2                ; 2 FATs
bdb_dir_entries_count:     dw 0x00E0           ; 224 root directory entries
bdb_total_sectors:         dw 2880             ; Total sectors (1.44MB floppy)
bdb_media_descriptor_type: db 0xF0             ; Media descriptor = 0xF0 (floppy)
bdb_sectors_per_fat:       dw 9                ; 9 sectors per FAT
bdb_sectors_per_track:     dw 18               ; 18 sectors per track
bdb_heads:                 dw 2                ; 2 heads (double-sided)
bdb_hidden_sectors:        dd 0                ; 0 hidden sectors (floppy)
bdb_large_sector_count:    dd 0                ; Not used (only if total_sectors is 0)

; Extended Boot Record (EBR)
; -> Volume metadata (label, ID, etc.)
ebr_drive_number:   db 0
                    db 0           ; reserved
ebr_signature:      db 0x29
ebr_volume_id:      db 0x12, 0x34, 0x56, 0x78
ebr_volume_label:   db 'NEOW OS    '     ; 11 bytes, space padded
ebr_system_id:      db 'FAT12   '        ; 8 bytes, space padded

main:

    MOV ax, 0      ; clear AX register
    MOV ds, ax     ; set Data Segment = 0
    MOV es, ax     ; set Extra Segment = 0
    MOV ss, ax     ; set Stack Segment = 0
    

    # Reading Data Form Disk
        # Cover LAB Address into CHS 

    MOV [ebr_drive_number], dl ;
    MOV ax, 1 ; AX save LBA index, we will try to read it 
    MOV CL,1 ; Sector Number
    MOV BX, 0x7E00
    call disk_read 
    
    MOV sp, 0x7C00 ; Put our stack in boot loader
    mov si, msg
    call print
    HLT

halt:
    jmp halt

lba_to_chs:

    push ax
    push dx

    ;Sector = (LBA % sectorsPerTrack) + 1
    xor dx,dx
    div word [bdb_sectors_per_track] ;Div = DX:AX \ [] 16 bit ; AX = Quotiont
    INC dx ;sector = remainder + 1 
    mov cx, dx ; CX will hold sector 

    ;Header = (LBA / SectorsPerTrack) % Heads
    ;C = (LBA / SectorsPerTrack) / Heads

disk_read:
    # AX 16-bit Registers(Real Mode) <-> EAX 32 bit registers
    push ax
    push bx
    push cx
    push dx
    push di 
    call lba_to_chs


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
