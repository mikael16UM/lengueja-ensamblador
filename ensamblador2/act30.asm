.model small
extrn reto: near
extrn espa: near
extrn des4: near
.stack

.data

buffer db 70
tam db ?
cadena db 70 dup(?)

archivo db "texto30.txt", 0h
fid dw  ?

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
apertura:
	 mov ah, 3ch
	 mov cx, 0
	 mov dx, offset archivo
	 int 21h
	 jc error
	 mov fid, ax
	 jmp lectura
	
	 
	 
lectura:
	 mov dx, offset buffer
	 mov ah, 0ah
	 int 21h
	 call reto
	 
	 mov di, offset tam
	 mov bx, offset cadena
	 mov cx, [di]
	 mov ch, 00
	 cmp cl, 00
	 jle cierre
	 add bl, cl
	 mov dx, 0ah
	 mov [bx], dx
	 sub bl, cl
	 jmp escritura
	 
	 
escritura:
	 mov ah, 40h
	 mov bx, fid 
	 mov di, offset tam
	 mov cx, [di]
	 mov ch, 00
	 inc cl
	 push bx
	 mov bx, cx
	 add bx, offset cadena
	 mov byte ptr [bx], 0dh
	 inc bx
	 mov byte ptr [bx], 0ah
	 pop bx
	 mov dx, offset cadena
	 int 21h 
	 jc error
	 jmp lectura
	 
cierre:
	 mov bx, offset cadena
	 mov byte ptr [bx], 0dh
	 inc bx
	 mov byte ptr [bx], 0ah
	 mov ah, 3eh
	 mov bx, fid
	 int 21h
	 jc error
	 jmp salida
	 
error:
	 mov dx, ax
	 call des4
	 .exit 1
	 
salida:
	 .exit 0
end