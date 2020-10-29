.MODEL SMALL
.STACK
.DATA

.CODE
; creacion de lee2 y des2
main: 
	 call lee2
	 mov dl, al
	 call des2
	 jmp over
	 

regreso: ret

lee2: 
	 call lee1
	 mov cl, 04h
	 shl al, cl
	 mov bl, al
	 call lee1
	 add al, bl
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
	 
des2:
	 mov bl, dl
	 mov cl, 04h
	 shr dl, cl
	 call des1
	 mov dl, bl
	 and dl, 0fh
	 call des1
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
	 
	 
	
over: .exit 0
end