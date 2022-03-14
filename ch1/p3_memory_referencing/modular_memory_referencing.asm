[org 0x7c00]

; Call the function to print string
mov bx, HELLO_MSG
call print_string

; Call the function to print string
mov bx, GOODBYE_MSG
call print_string

; Loop indefinitely
jmp $

%include "print_string.asm"

HELLO_MSG:
    ; Null terminated string
    db "Hello, World!", 0;

GOODBYE_MSG:
    ; Null terminated string
    db "Goodbye, World!", 0;

; Padding to make a 512 byte sector
times 510-($-$$) db 0

; Boot identifier
dw 0xaa55
