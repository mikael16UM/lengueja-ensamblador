.MODEL SMALL
.STACK
.DATA

.CODE

main : 
		mov ax, @DATA
		mov dx, ax
		
		mov ah, 01h
		int 21h
		mov dl, al
		cmp dl, 60h
		jg convertir
		
paso:	inc dl
		cmp dl, 3ah
		je sumar7
		
paso2:	mov ah, 02h
		int 21h
		jmp over

convertir: sub dl, 20h
		   jmp paso
		   
sumar7:	add dl, 07h
		jmp paso2
			

over:  .exit 0

end