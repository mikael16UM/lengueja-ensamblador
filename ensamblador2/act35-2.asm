.model small
extrn reto: near
extrn des4: near
.stack

.data

ini dw 0
fini dw 0
arriba dw 0
abajo dw 0
limIn dw 0
x dw 0
y dw 0
band db 0
band2 db 0

.code
cp macro  color, coorx, coory
			 mov al, color
			 mov ah, 0ch
			 mov cx, coorx
			 mov dx, coory
			 int 10h 
endm

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 
	 mov ax, 4f03h
	 int 10h
	 push bx
	 
	 mov ax, 4f02h
	 mov bx, 105h
	 int 10h
	 
	 mov ini, 250
	 mov fini, 400
	 mov x, 250
	 mov y, 450
	 mov cl, 00
	 mov ch, 00
	 push bx
	  
	  
imprime:
	 cp 0eh x y
	 jmp ajuste
	 
ajuste:	 
	 mov bx, offset x
	 mov dx, [bx]
	 inc dx
	 mov x, dx
	 
	 mov bx, offset fini
	 mov dx, [bx]
	 cmp x, dx
	 jle imprime 
	 jmp ychange
	

reduce:
	 mov bx, offset ini
	 mov dx, [bx]
	 inc dx
	 mov ini, dx
	 mov x, dx
	 
	 mov bx, offset fini
	 mov dx, [bx]
	 dec dx
	 mov fini, dx
	 
	 cmp ini, dx
	 jle imprime
	 jmp cambio
	 
ychange:
	 mov bx, offset y
	 mov dx, [bx]
	 cmp band, 01
	 je down
	 inc dx
	 
regreso:
	mov y, dx
	 jmp reduce
	 
cambio:
	 cmp band, 00
	 jne salida
	 mov y, 450
	 mov ini, 250
	 mov fini, 400
	 mov x, 250
	 mov band, 01
	 jmp imprime
	 
down:
	 dec dx
	 jmp regreso
	 
salida:
	 pop bx
	 mov ah, 00h
	 int 16h
	 
	 pop bx
	 mov ax, 4f02h
	 int 10h
	 
finale:
	 .exit 0 
	 
end