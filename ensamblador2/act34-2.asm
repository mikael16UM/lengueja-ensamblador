.model small
extrn reto: near
extrn des2: near
.stack

.code
cp macro  color, coorx, coory
			 mov al, color
			 mov ah, 0ch
			 mov cx, coorx
			 mov dx, coory
			 int 10h 
endm

main:
	 mov ax, 4f03h
	 int 10h
	 push bx
	 
	 mov ax, 4f02h
	 mov bx, 105h
	 int 10h
	 
	 mov cx, 300
	 mov dx, 400
	 
imprimir:
	 cp 0eh cx dx
	 inc cx
	 cmp cx, 400
	 jg ajuste
	 jmp imprimir
	 
ajuste:
	 inc dx
	 cmp dx, 500
	 jg salida
	 mov cx, 300
	 jmp imprimir
	 
salida:
	 mov ah, 00h
	 int 16h
	 
	 pop bx
	 mov ax, 4f02h
	 int 10h
	 
fin:
	 .exit 0 
	 
end