.model small
extrn lee2: near
extrn des2: near
extrn reto: near
.stack
.data
.code

main:
	 call lee2
	 call reto
	 mov dl, al
	 and dl, 80h
	 jz desplegar
	 
	 not al
	 inc al
	 push ax
	 mov ah, 02h
	 mov dl, '-'
	 int 21h
	 pop ax
	
desplegar:
	 mov dl, al
	 call des2
	 call reto
	 
	 
	 .exit 0
end