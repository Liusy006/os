;
; A simple boot sector programer
;

[org 0x7c00]
 	mov bx, HELLO_WORLD
	call print_string_bx

	jmp $ 

%include "print_string_bx.asm"

HELLO_WORLD:
	db 'Hello, world!', 0

times 510-($-$$) db 0

dw 0xaa55
