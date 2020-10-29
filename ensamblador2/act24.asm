.model small
.386
extrn des2: near
extrn lee2: near
.stack
.data
arreglo db "BBBBABBBBB"
.code

print macro cadena
	 local dbcad, dbfin, salta
			 pusha
			 push ds
			 mov dx, cs
			 mov ds, dx
			 
			 mov dx, offset dbcad
			 mov ah, 09h
			 int 21h
			 jmp salta
	dbcad: db cadena
	dbfin: db 24h
	salta:	pop ds
			popa
endm

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov al, 'A'
	 mov cx, 10
	 cld
	 mov di, offset arreglo
	 repne scasb
	 
	 jne noen
	 print "encontrado"
	 jmp fin

noen:
	 print "no encontrado"
fin:
	 .exit 0
end