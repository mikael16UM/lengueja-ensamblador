.model small
.386
extrn reto: near
extrn des2: near
extrn espa: near
.stack
.data

arreglo db 3 dup(?)
.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov di, offset arreglo
	 cld
	 mov cx, 05h
	 mov al, 43h
	 rep stosb
	 
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
	 .exit 0
end