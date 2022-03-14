[org 0x7c00]

; Invoke BIOS teletype routine

print_string:
    ; Push current register to a stack to avoid side-effects
    pusha

    ; Invoke BIOS teletype routine
    mov ah, 0x0e

    ; Start the loop
    print_char:
        ; Check if we reached the end of the string
        cmp byte [bx], 0
        ; If so, exit the loop
        je finish
        ; Otherwise, print the next character
        mov al, [bx]
        int 0x10
        ; Increment the pointer
        add bx, 1
        ; Jump back to the start of the loop
        jmp print_char

    finish:
        ; Restore register
        popa
        ; Return
        ret
