.model small
.386
extrn reto: near
extrn lee2: near
extrn espa: near
extrn des2: near
.stack
.data

arreglo db 41h, 42h, 43h, 44h, 45h 
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
	 
	 .exit 0
	 

end