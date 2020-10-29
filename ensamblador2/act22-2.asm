.model small
.386
extrn reto: near
extrn des2: near
extrn espa: near
.stack
.data

arreglo db 5 dup(?) ;25, 35, 45, 55, 65
.code

main:	
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
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