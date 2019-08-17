;
; A simple boot sector programer
;

[org 0x7c00]
 	;mov bx, HELLO_WORLD
	;call print_string_bx
	mov bx, 0x1234
	call print_hex_bx

	jmp $ 

;%include "print_string_bx.asm"
%include "print_hex_bx.asm"

HELLO_WORLD:
	db 'Hello, world!', 0

times 510-($-$$) db 0

dw 0xaa55
