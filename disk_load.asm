; load DH secotors to ES:BX from drive DL
disk_load:
	push dx			;store dx 
	
	mov ah, 0x02	;BIOS read sector function
	mov al, dh 		;Read DH sectors
	mov ch, 0x00	;Select cylinder 0
	mov dh, 0x00	;Select head 0
	mov cl, 0x02	;Start reading from second sector

	int 0x13		;BIOS interrupt

	jc disk_cerror	;jump if error

	pop dx			;Restore DX from the stack
	cmp dh, al		;if al (sectors read) != DH (sector except)

	jne disk_error	; display error
	ret

disk_cerror:
	mov bx, DISK_CARRY_MSG
	call print_string_bx
	jmp $


disk_error:
	mov bx, DISK_ERROR_MSG
	call print_string_bx
	jmp $

DISK_ERROR_MSG db "Disk read error!", 0
DISK_CARRY_MSG db "Disk read error, carry flag is set!", 0
