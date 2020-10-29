.modell small
extrn reto: near
extrn lee2: near
.stack
.data

; programa que despliega tres numeros de un arreglo 

dato db 41h, 42h, 43h ; arreglo de 3 bytes

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov bx, offset dato
	 mov cx, 03h
	 mov ah, 02h
ciclo:
	 mov dl, [bx]
	 int 21h
	 inc bx
	 loop ciclo
	.exit 0
end