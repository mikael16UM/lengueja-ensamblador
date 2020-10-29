.model small
.stack
.data

.code
 ; creacion de des4 y lee4
 
main:
	 call lee4
	 mov dx, ax
	 call lee4
	 add ax, dx
	 mov dx, ax
	 call des4
	 jmp over
	 
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
	 


regreso: 
	 ret
over: .exit 0

end