.MODEL SMALL
.STACK
.DATA
cadena db "Es mayor$"


.CODE
main : mov ax, @DATA
	   mov ds, ax
	   
	   mov al, 5h
	   mov bl, 1h 
	   cmp al, bl ; se modifican banderas
	   jl sigue
	   
	   ;esto de acá se ejecuta si no saltó
	   mov ah, 09h
	   mov dx, offset cadena
	   int 21h
	   ;y sigue ´para abajo
	      
sigue: .exit 0

end