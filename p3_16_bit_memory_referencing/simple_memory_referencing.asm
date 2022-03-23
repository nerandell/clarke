; Invoke BIOS teletype routine
mov ah, 0x0e

; Store the address of the memory reference in the ax register
mov al, memory_ref
; Trigger interrupt
int 0x10

; Store the contents of memory reference in the ax register
mov al, [memory_ref]
int 0x10

; Store the contents of offsetted memory reference from start of the boot sector in the ax register
mov bx, memory_ref
add bx, 0x7c00
mov al, [bx]
int 0x10

jmp $

memory_ref:
    db "X"

times 510-($-$$) db 0

dw 0xaa55
