.model small
extrn lee4:near
extrn des4:near
extrn reto: near
.stack
.data
.code

main:
	 mov ax, @data
	 mov ds, ax
	 
	 call lee4
	 mov dx, ax
	 call lee4
	 call reto
	 push ax
	 call lee4
	 call reto
	 mov cx, ax
	 pop ax
	 div cx
	 push dx
	 mov dx, ax
	 call des4
	 call reto
	 pop dx
	 call des4
	 call reto
	 
	.exit 0
end
