loop:
	jmp loop

; Over 510 bytes minus the space needed for the loop
; allocate the byte value 0 to all those bytes
times 510-($-$$) db 0

; Allocates 2 bytes (define word - DW)
dw 0xaa55