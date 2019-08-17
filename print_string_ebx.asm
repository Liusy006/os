[bits 32]
; Define some constants
VEDIO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_ebx:
	pusha
	mov edx, VEDIO_MEMORY

print_string_ebx_loop:
	mov al, [ebx]
	mov ah, WHITE_ON_BLACK

	cmp al, 0
	je print_string_ebx_done

	mov [edx], ax

	add ebx, 1
	add edx, 2

	jmp print_string_ebx_loop

print_string_ebx_done:
	popa
	ret
