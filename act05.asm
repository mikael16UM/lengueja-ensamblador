.MODEL SMALL
.STACK
.DATA

.CODE
 ; creacion de lee1 y des1
main:
	 call lee1
	 mov bl, al
	 call lee1
	 add al, bl
	 mov dl, al
	 call des1
	 
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
	 
regreso: ret

des1:
	 add dl, 30h
	 cmp dl, 39h
	 jg suma
	 mov ah, 02h
	 int 21h
	 jmp over
	 
suma: 
	 add dl, 07h
	 mov ah, 02h
	 int 21h
	 jmp over 

over: .exit 0
END