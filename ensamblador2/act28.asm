.model small
extrn reto: near
extrn des2: near
extrn espa: near
.stack
.data

arr1 db "Cuando digo ya, es ya y no otro ya."
arr2 db "ay"
noes db "no se encontraron coincidencias$"

.code
main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 cld
	 mov cx, 35
	 mov di, offset arr1
	 mov bl, 00
	 
inicio:

	 mov si, offset arr2
	 mov al, [si]
	 repne scasb
	 cmp cx, 00
	 je nosub
	 
	 push cx
	 mov dx, di
	 push dx
	 dec di
	 
	 mov cx, 02
	 ;mov si, offset arr2
	 repe cmpsb
	 je subcad
	 pop dx
	 jmp regreso
	 
subcad:
	 pop dx
	 cmp dx, 24h
	 jge over
	 call des2
	 call espa
	 mov bl, 01
	 
regreso:
	 pop cx
	 cmp di, 35
	 jge nosub
	 jl inicio
	 
nosub:
	 cmp bl, 01
	 je over
	 mov dx, offset noes
	 mov ah, 09
	 int 21h
	 jmp over
	 	 
over:
	 call reto
	 .exit 0
end