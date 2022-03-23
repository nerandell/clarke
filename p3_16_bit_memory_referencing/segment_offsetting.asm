; Invoke BIOS teletype routine
mov ah, 0x0e

; Move the pointer directly
mov al, memory_ref
; Print the character stored in al
int 0x10

; Move the value in the pointer.
mov al, [memory_ref]
; Print the character stored in al. However, the pointer was not offset correctly
int 0x10

; Move the offset in the register
mov cx, 0x7c0
; Set data segment to 0x7c0
mov ds, cx
; Move the value to the printed to the register
mov al, [memory_ref]
; Print the character stored in al. This should correctly offset and print the character
int 0x10

; Move the offset in the register
mov cx, 0x7c0
; Set data segment to 0x7c0
mov es, cx
; Move the value to the printed to the register. Offset is forced to value stored in es
mov al, [es:memory_ref]
; Print the character stored in al. This should correctly offset and print the character
int 0x10

; Infinite loop
jmp $

memory_ref:
    db 'X'

; Padding to 512 bytes
times 510-($-$$) db 0

; Boot sector identifier
dw 0xaa55

