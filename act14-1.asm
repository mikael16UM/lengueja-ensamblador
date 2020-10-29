.model small
extrn des2: near
extrn lee2: near
extrn lee4: near
extrn reto: near
extrn desmen: near
.stack
.data

.code

main:
	 mov ax, @data
	 mov ds, ax
	 
	 call lee4
	 mov cx, ax
	 call reto
	 call lee2
	 call reto
	 mov bl, al
	 mov ax, cx
	 div  bl
	 mov dl, al
	 call des2
	 call reto
	
	 
	.exit 0
end