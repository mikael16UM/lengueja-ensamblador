.model small
.386
extrn reto: near
extrn des2: near
extrn espa: near
extrn lee2: near
.stack
.data

arreglo db 5 dup(?)
.code

main:	
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 mov cx, 05h
	 mov bx, offset arreglo
	 
lectura:
	 call lee2
	 mov byte ptr [bx], al
	 inc bx
	 call espa
	 loop lectura
	 ;mov arreglo
	 call reto
	 
	 ;sub arreglo, 05h
	 
	 mov cx, 05h
	 mov si, offset arreglo
	 cld
ciclo:	
	 lodsb
	 mov dl, al
	 call des2
	 call espa
	 loop ciclo
	 call reto
	 
	 mov cx, 05h
	 dec si
	 std
	 
ciclo2:	
	 lodsb
	 mov dl, al
	 call des2
	 call espa
	 loop ciclo2
	 call reto
	 .exit 0
end