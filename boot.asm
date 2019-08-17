;
; A simple boot sector programer
;

[org 0x7c00]
 	;mov bx, HELLO_WORLD
	;call print_string_bx
	;mov bx, 0x1234
	;call print_hex_bx

	;jmp $ 
	;mov [BOOT_DRIVE], dl

	;mov bp, 0x8000
	;mov sp, bp

	;mov bx, 0x00
	;mov es, bx 
	;mov bx, 0x9000
	;mov dh, 5
	;mov dl, [BOOT_DRIVE]
	;call disk_load

	;mov bx, [0x9000]
	;call print_hex_bx

	;mov bx, [0x9000 + 512]
	;call print_hex_bx

	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print_string_bx

	call switch_to_pm

	jmp $
%include "print_string_bx.asm"
%include "gdt.asm"
%include "print_string_ebx.asm"
%include "switch_to_pm.asm"

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_ebx

	jmp $

MSG_REAL_MODE db "Started in 16-bit Real mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit protected mode", 0


;HELLO_WORLD:
	;db 'Hello, world!', 0

;BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

;times 256 dw 0xdada
;times 256 dw 0xface
