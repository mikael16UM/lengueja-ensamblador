.model small
extrn reto: near
extrn espa: near
extrn des2: near
.stack
.data
arr1 db "el perro de jose es un dinosaruio$"
arr2 db "perro$"
res1 db "es subcadena$"
res2 db "no es subcadena$"
.code 

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 cld
	 mov cx, 34
	 mov di, offset arr1
	 mov al, 'p'
	 repne scasb
	 
	 mov dx, di
	 dec di
	 push dx ; guardamos la posicion para imprimirlo posteriormentre si sí es subcadena
	 
	 mov cx, 05
	 mov si, offset arr2
	 repe cmpsb 
	 cmp cx, 00
	 je subcadena
	 
	 mov dx, offset res2
	 mov ah, 09h
	 int 21h
	 add sp, 02h
	 call reto
	 jmp over
	 
subcadena:
	 mov ah, 09h
	 mov dx, offset arr1
	 int 21h
	 call reto
	 mov dx, offset arr2
	 int 21h
	 call reto
	 mov dx, offset res1
	 int 21h
	 call espa
	 pop dx
	 call des2
	 call reto
over:
	 .exit 0
end