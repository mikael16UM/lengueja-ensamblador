.MODEL SMALL
.STACK
.DATA

mayor db, "eres superman$"
menor db, "ya valiste queso$"

.CODE 

main: mov ax, @DATA
	  mov ds, ax
	  
	  mov ah, 01
	  int 21h
	  mov dl, al
	  sub dl, 30h
	  cmp dl, 06
	  jl reprobado
	  jg aprobado
	  
reprobado: mov ah, 09
		   mov dx, offset menor
		   int 21h
		   jmp sigue

aprobado: mov ah, 09
		  mov dx, offset mayor
		  int 21h
		  jmp sigue
		  
sigue: .exit 0

end