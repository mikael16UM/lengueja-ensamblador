.model small
extrn reto: near
extrn espa: near
extrn des2: near 
.stack
.data

buf db 60
tlee db ?
cadena db 60 dup (?)

.code

main:
	 
	 mov ax, @data
	 mov ds, ax
	 
	 mov dx, offset buf
	 mov ah, 0Ah
	 int 21h 
	 call reto
	 
	 mov bx, offset tlee
	 mov dx, [bx]
	 call des2
	 call reto 
	 
	 mov bx, offset cadena
	 mov di, offset tlee
	 mov cx, [di]
	 mov ch, 00
	 
	 add bl, cl
	 mov dx, 24h
	 mov [bx], dx
	 sub bl, cl
	 mov dx, bx
	 mov ah, 09
	 int 21h
	 call reto
	 
	 .exit 0 
end
