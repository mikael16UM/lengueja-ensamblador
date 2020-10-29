.MODEL SMALL
public espa
public reto 
public lee4 
public lee2 
public lee1 
public des4 
public des2 
public des1
public des2n
.STACK
.CODE

reto:	push ax
		push dx
		mov dl,0dh
		mov ah,02
		int 21h
		mov dl,0ah
		mov ah,02
		int 21h
		pop dx
		pop ax
		ret
		
espa:	push ax
		push dx
		mov dl,20h
		mov ah,02
		int 21h
		pop dx
		pop ax
		ret

lee1:	mov ah,01
		int 21h
		sub al,30h
		cmp al,09h
		jle l1s
		sub al,7h
		cmp al,0fh
		jle l1s
		sub al,20h

l1s:	ret

des1:	add dl,30h
		cmp dl,39h
		jle d1s
		add dl,07h
		
d1s:	mov ah,02
		int 21h
		ret

lee2:	push bx
		push cx
		call lee1
		mov cl,4
		shl al,cl
		mov bl,al
		call lee1
		add al,bl
		pop cx
		pop bx
		ret
		
des2:	push bx
		push cx
		mov bl,dl
		mov cl,4
		shr dl,cl
		call des1
		mov dl,bl
		and dl,0fh
		call des1
		pop cx
		pop bx
		ret

lee4:	push bx
		call lee2
		mov bl,al
		call lee2
		mov ah,bl
		pop bx
		ret

des4:	mov bx,dx
		mov dl,dh
		call des2
		mov dx,bx
		call des2
		ret		
		
des2n:	push dx
		and al,80h
		jz etiqueta
		call negativo
		not dl
		inc dl
		pop dx

etiqueta:	call des2
		ret

negativo:	push dx
		push ax
		mov dl,2dh
		mov ah,02
		int 21h
		pop ax
		pop dx
		ret
end