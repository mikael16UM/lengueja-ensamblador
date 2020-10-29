.MODEL SMALL
.STACK
.DATA

cadena db	"hola mundo$"
.CODE

main: mov ax, @data
      mov ds, ax
      
      mov ah, 09h 		; servicio para imprimir cadenas
      mov dx, offset cadena
      int 21h
	
      .exit 0
end

