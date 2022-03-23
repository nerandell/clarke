; Invoke BIOS teletype routine
mov ah, 0x0e

; Declare stack pointers
mov bp, 0x8000
mov sp, bp

; Push values to the stack
push "A"
push "B"
push "C"

; Pop values from the stack
pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

jmp $

; Padding values
times 510-($-$$) db 0

; Boot sector identifier
dw 0xaa55


