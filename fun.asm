.MODEL SMALL
public reto
public lee4
public des4
public lee2
public des2
public des1
public espa
public des2n

.stack
.code

;introducir un retorno de  carro

espa:	
	 push ax
	 push dx
	 mov ah,02h
	 mov dl,20h
	 int 21h
	 pop dx
	 pop ax
	 ret
reto: 
	 push ax
	 push dx
	 mov ah, 02h
	 mov dl, 0dh
	 int 21h
	 mov dl, 0ah
	 int 21h
	 pop dx
	 pop ax
	 ret
	 

lee4:
	 push bx
	 call lee2
	 mov bl, al
	 call lee2
	 mov ah, bl
	 pop bx
	 jmp regreso

lee2: 
	 push bx
	 push cx
	 call lee1
	 mov cl, 04h
	 shl al, cl
	 mov bl, al
	 call lee1
	 add al, bl
	 pop cx
	 pop bx
	 jmp regreso
	 
lee1:
	 mov ah, 01h
	 int 21h
	 sub al, 30h
	 cmp al, 09h
	 jg compo
	 jle regreso

compo:
	 sub al, 07h
	 cmp al, 0fh
	 jg compo2
	 jle regreso

compo2: 
	 sub al, 20h
	 jmp regreso

des4: 
	mov bx, dx
	mov dl, dh
	call des2
	mov dx, bx
	call des2
	jmp regreso

des2:
	 push bx
	 push cx
	 mov bl, dl
	 mov cl, 04h
	 shr dl, cl
	 call des1
	 mov dl, bl
	 and dl, 0fh
	 call des1
	 pop cx
	 pop bx
	 jmp regreso
	 
des1:
	 add dl, 30h
	 cmp dl, 39h
	 jg suma
	 mov ah, 02h
	 int 21h
	 jmp regreso

suma: 
	 add dl, 07h
	 mov ah, 02h
	 int 21h
	 jmp regreso

desmen:
	 push ax
	 mov ah, 09
	 int 21h
	 pop ax
	 jmp regreso
	 
des2n:	
	 push dx
	 and al,80h
	 jz etiqueta
	 call negativo
	 not dl
	 inc dl
	 pop dx
	 jmp etiqueta

etiqueta:	
	 call des2
	 jmp regreso

negativo:	
	 push dx
	 push ax
	 mov dl,2dh
	 mov ah,02
	 int 21h
	 pop ax
	 pop dx
		ret


regreso: 
	 ret
end