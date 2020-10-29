.model small
extrn lee2: near
extrn des2: near
extrn reto: near
.stack
.data
.code

main: 
	mov ax, @data
	mov ds, ax
	
	call lee2
	call reto
	push ax
	call lee2
	call reto
	push ax
	
	call suma
	add sp, 04h
	mov dl ,al
	call des2
	.exit 0
	
suma: 
	 push bp
	 mov bp, sp
	 mov ax, [bp+6]
	 mov bx, [bp+4]
	 add al, bl
	 mov sp, bp
	 pop bp
	 ret
	 
end