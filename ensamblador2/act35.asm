.model small
extrn reto: near
extrn des4: near
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
	 
	 push bx
	 mov cx, 300
	 mov dx, 400
	 mov bx, 00
	 
imprimir:
	 cp 0eh cx dx
	 jmp compara
	 
compara:
	 inc bx
	 cmp bx, 100
	 jl lado1
	 cmp bx, 200
	 jl lado2
	 cmp bx, 300
	 jl lado3
	 cmp bx, 400
	 jl lado4
	 jmp salida
	 
lado1:
	 inc cx
	 inc dx
	 jmp imprimir
	 
lado2:
	 inc cx
	 dec dx
	 jmp imprimir
	 
lado3:
	 dec cx
	 dec dx
	 jmp imprimir
	 
lado4:
	 dec cx
	 inc dx
	 jmp imprimir
	 
salida:
	 pop bx
	 mov ah, 00h
	 int 16h
	 
	 pop bx
	 mov ax, 4f02h
	 int 10h
	 
fin:
	 .exit 0 
	 
end