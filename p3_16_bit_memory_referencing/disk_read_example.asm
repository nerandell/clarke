; Setting correct offset
[org 0x7c00]

; BIOS stores our boot drive in DL , so it's best to remember this for later.
mov [BOOT_DRIVE], dl
; Set the stack pointer to the top of the stack.
mov bp, 0x8000
; Set the stack pointer to the bottom of the stack.
mov sp, bp

; Set the drive to read from.
mov dl, [BOOT_DRIVE]
; Set the number of sectors to read.
mov dh, 2
; Set the pointer to read the value to.
mov bx, 0x9000
; Read from the disk
call disk_read

; Set the pointer to the address the disk read was stored at.
mov dx, [0x9000]
; Print the hex value stored at the address
call print_hex

; Set the pointer to the address the next sector from the disk read was stored at.
mov dx, [0x9000 + 512]
; Print the hex value stored at the address
call print_hex

; Infinite loop
jmp $

BOOT_DRIVE: db 0

%include "print_hex.asm"
%include "disk_read.asm"

; Padding to make 512 byte boot sector
times 510-($-$$) db 0

; Boot sector identifier
dw 0xaa55

; Write to 512 byte sector
times 256 dw 0xdada
; Write to the next 512 byte sector
times 256 dw 0xface

