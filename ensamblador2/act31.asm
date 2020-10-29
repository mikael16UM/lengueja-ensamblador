.model small
extrn des4: near
extrn reto: near
.stack
.data

archivo db "texto30.txt", 0h
buffer db 0ffh dup (?)
fid dw ?

.code 

main :
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov ah, 3dh
	 mov al, 0
	 mov dx, offset archivo
	 int 21h
	 jc error
	 mov fid, ax
	 
lectura:
	 mov ah, 3fh
	 mov bx, fid
	 mov cx, 02
	 mov dx, offset buffer
	 int 21h
	 jc error
	 
	 mov bx, ax
	 mov cx, ax
	 add bx, offset buffer
	 mov byte ptr [bx], 24h
	 
	 mov ah, 09
	 mov dx, offset buffer
	 int 21h
	 cmp cx, 00
	 ;call reto
	 jg lectura
	 
cerrar:
	 mov ah, 3eh
	 mov bx, fid
	 int 21h
	 jc error
	 jmp salida

error:
	 mov dx, ax
	 call des4
	 call reto
	 .exit 1
	 
salida:
	 .exit 0
end