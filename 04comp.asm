.MODEL SMALL
.STACK
.DATA

mayor db, "ES MAYOR$"
menor db, "ES MENOR$"
igual db, "SON IGUALES$"

.CODE
 
 main : mov ax, @DATA
		mov ds, ax
		
		mov ah, 01h
		int 21h
		mov bl, al ; guardo el primer número
		mov ah, 01h
		int 21h
		cmp bl, al
		
		jl menos
		je iguales
		jg mayore
		
menos: mov ah, 09h
	   mov dx, offset menor
	   int 21h
	   jmp sigue

iguales: mov ah, 09h
	     mov dx, offset igual
		 int 21h
		 jmp sigue
		 
mayore: mov ah, 09h
		mov dx, offset mayor
		int 21h
		jmp sigue
		
sigue: .exit 0

end
		