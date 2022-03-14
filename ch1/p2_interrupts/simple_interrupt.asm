; Invoke BIOS teletype routine
mov ah, 0x0e

; Store the character to the printed on the screen in the register
mov al, 'H'
; Trigger interrupt
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

; Padding to make 512 bytes of memory
times 510-($-$$) db 0

; Boot identifier
dw 0xaa55


