.model small
.386
extrn espa: near
extrn des2: near
extrn lee2: near
extrn reto: near
.stack
.data

arreglo db 07 dup(?)

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
	 
	 print "dimension del arreglo:"
	 call espa
	 call lee2
	 call reto
	 mov cl, al
	 push ax ; guardo el valor del contador
	 print "ingrese los elementos a guardar:"
	 call reto
	 mov bx, offset arreglo
	 
lectura:
	 call lee2
	 mov byte ptr [bx], al
	 inc bx
	 call espa
	 loop lectura
	 call reto
	 
	 ; hasta acá hemos guardado nuestro arreglo 
	 
	 print "ingrese el valor a ser buscado:"
	 call espa
	 call lee2
	 call reto
	 pop cx
	 cld
	 mov di, offset arreglo
	 repne scasb
	 
	 jne noen
	 print "encontrado en la posicion: "
	 mov dx, di
	 sub dx, 01h
	 call espa
	 call des2
	 jmp fin

noen:
	 print "no encontrado"
fin:
	 call reto
	 .exit 0
end