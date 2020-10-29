.MODEL SMALL 
.STACK
.DATA

.CODE

main:
	call lee1
	mov bl, al
	call lee1
	add al, bl
	call desp
	mov dl, al
	mov ah, 02h
	int 21h
	jmp over
	
	
lee1: 
	 mov ah, 01h
	 int 21h
	 sub al, 30h
	 cmp al, 09
	 jg compo
	 jle regreso
	 
	 
compo: 
	 sub al, 07h
	 cmp al, 0fh
	 jg compo2
	 jle regreso
	 

regreso: ret


compo2:
	 sub al, 20h
	 jmp regreso
	 

desp: 
	 add al, 30h
	 cmp al, 39h
	 jg desp2
	 jle regreso
	 
desp2: 
	 add al, 07h
	 jmp regreso


over: .exit 0

end