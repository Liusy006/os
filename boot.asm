;
; A simple boot sector programer
;

[org 0x7c00]
 	;mov bx, HELLO_WORLD
	;call print_string_bx
	;mov bx, 0x1234
	;call print_hex_bx

	;jmp $ 
	mov [BOOT_DRIVE], dl

	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x00
	mov es, bx 
	mov bx, 0x9000
	mov dh, 5
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov bx, [0x9000]
	call print_hex_bx

	mov bx, [0x9000 + 512]
	call print_hex_bx

	jmp $

%include "print_hex_bx.asm"
%include "disk_load.asm"


;HELLO_WORLD:
	;db 'Hello, world!', 0

BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
