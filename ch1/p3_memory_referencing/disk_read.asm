; Read value from the disk. dh stores the number of sectors to read from disk
disk_read:
    ; Store the value in the stack for later use.
    push dx
    ; Invoke read from disk routine
    mov ah, 0x02
    ; Read from cylinder 0 of the disk;
    mov ch, 0x00
    ; Read dh sectors from the disk
    mov al, dh
    ; Move from the first track (0-indexed)
    mov dh, 0x00
    ; Read from the second track (1-indexed). First 512 byte sector is the boot sector
    mov cl, 0x02
    ; Interrupt to read from disk
    int 0x13

    ; Jump only if the disk read was not successful
    jc disk_error_unknown

    ; Pop the value from the stack to dx
    pop dx
    ; Compare the number of sectors read with the number of sectors to we wanted to read
    cmp dh, al
    ; Jump if the number of sectors read is not equal to the number of sectors to read
    jne disk_error
    ; Return to caller
    ret

disk_error_unknown:
    ; Move reference to string in bx
    mov bx, DISK_ERROR_UNKNOWN
    ; Print string
    call print_string
    ; Infinite loop
    jmp $

disk_error:
    ; Move reference to string in bx
    mov bx, DISK_ERROR
    ; Print string
    call print_string
    ; Infinite loop
    jmp $

DISK_ERROR_UNKNOWN:
    db "Unknown disk error message!", 0

DISK_ERROR:
    db "Disk error message!", 0
