; Infinite loop
loop:
    jmp loop

; Padding with 0s to make a 512 byte block
times 510-($-$$) db 0

; Boot sector identifier
dw 0xaa55
