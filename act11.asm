.model small
extrn reto: near
extrn lee2: near
extrn des2: near
.stack
.data

arreglo db 3 dup(?)

.code
; hacer un codigo que guarde en un arreglo tres numeros y despues desplegar su suma

main:
	 mov ax, @data
	 mov ds, ax
	 mov cx, 03h
	 mov bx, offset arreglo
	 
ciclo:
	 call lee2
	 mov byte ptr [bx], al
	 inc bx
	 call reto
	 loop ciclo
	 
	 ;mov arreglo, bx
	 mov cx, 03h
	 mov dl, 00h
	 dec bx

ciclo2:
	 add dl, [bx]
	 dec bx
	 loop ciclo2
	 
	 call des2
	 call reto
	 .exit 0
end