.model small
extrn lee4: near
extrn des4: near
extrn reto: near
.stack
.data

.code

main:
	 mov ax, @data
	 mov ds, ax
	 
	 call lee4
	 mov bx, ax
	 call reto
	 
	 call lee4
	 call reto 
	 mul bx
	 mov cx, ax
	 
	 call des4
	 mov ax, cx
	 mov dx, ax
	 call des4
	 call reto
	 
	 .exit 0
end