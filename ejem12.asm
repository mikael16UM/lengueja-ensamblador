.model small
extrn reto:near
extrn lee2:near
extrn des4:near
.stack
.data
.code
main:	mov ax,@data
	mov ds,ax
	call lee2
	mov bh,al	;primero, alta
	call lee2
	mov bl,al	;primero baja
	call reto
	
	call lee2
	mov dl,al
	call lee2
	call reto
	
	mov ah,dl	;datos en AX, BX
	add al,bl	;primera suma
	adc ah,bh	;segunda suma, resultado en carry y AX
	jnc sigue
	
	push ax
	mov ah,02h
	mov dl,'1'
	int 21h
	pop ax
	
sigue:	mov dx,ax
	call des4
	.exit
end