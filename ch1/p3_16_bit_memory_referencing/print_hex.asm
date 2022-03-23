; Routine body to print a hex string store in dx
print_hex:
    ; Push the exising registers to the stack
    pusha

    ; Initialize the counter, we will print a nibble at a time, 16 bit = 4 nibbles
    mov cx, 4

    print_hex_char:
        ; Decrement the counter
        add cx, -1

        ; Move the hex string stored in dx to ax
        mov ax, dx
        ; Get the last nibble of ax and store in ax
        and ax, 0xf
        ; Shift dx to the right by 4 bits
        shr dx, 4

        ; bx points to the string template 0x0000
        mov bx, HEX_OUT
        ; Skip two bytes (0x)
        add bx, 2
        ; Skip counter steps to get to the current string byte which needs to be printed
        add bx, cx

        ; Compare the current nibble to letter a
        cmp ax, 0xa
        ; If the current nibble is a digit, call set_char directly
        jl set_char
        ; If the current nibble is a letter, call set_char after adding 0x27 (decimal 39)
        add al, 0x27
        ; Jump to set_char. This is not really needed, but it makes the code more readable
        jmp set_char

    set_char:
        ; Add 0x30 (decimal 48) to the current nibble to get the ASCII value (ASCII for 0 is 48)
        add al, 0x30
        ; Copy the last nibble to byte pointer bx
        mov byte [bx], al
        cmp cx, 0
        je print_hex_done
        jmp print_hex_char

    print_hex_done:
        ; Move back the string pointer to the beginning of the string
        add bx, -2
        ; Print the string stored in bx
        call print_string
        ; Pop the registers from the stack
        popa
        ; Return to the caller
        ret

%include 'print_string.asm'

; Template string for printing hex
HEX_OUT:
    db '0x0000', 0
