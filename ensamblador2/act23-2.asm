.model small
.386
extrn lee2: near
extrn des2: near
extrn espa: near
extrn reto: near
extrn arrC: near

.stack
.data

arreglo db 30h dup(?)

.code

main:	
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	
	 mov di, offset arreglo
	 push di
	 call lee2
	 call espa
	 push ax
	 call lee2
	 call reto
	 mov dx, ax
	 push ax
	 
	 call arrC
	 mov cl, dl
	 mov si, offset arreglo
	 cld
ciclo:	
	 lodsb
	 mov dl, al
	 call des2
	 call espa
	 loop ciclo
	 call reto
	 add sp, 08h
	 .exit 0
end