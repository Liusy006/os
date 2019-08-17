print_hex_bx:
	pusha
	mov si, HEX_STR

	mov cx, 4
	begin_:
		mov dx, bx
		and dx, 0x0f ; and 15
		cmp dx, 0x09 ; compare with 9, if less add '0' else add 'a'
		mov ax, 0
		ja bigger
		mov al, '0'
		jmp next
		bigger:
			mov al, 'a'
			sub dx, 0x0a

		next:
		add ax, dx
	 	sub si, 1
		mov [si+6], al 
	

		push cx
		mov cl, 4 
		shr bx, cl         	; every time bit right mov 4 bits
		pop cx

	loop begin_
		
		mov bx, HEX_STR
		call print_string_bx
		popa
		ret

%include "print_string_bx.asm"
			

HEX_STR:
	db '0x0000', 0
