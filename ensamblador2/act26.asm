.model small
.stack
.data
origen db "basura basura inicio:esto quiero copiar$"
destino db 40 dup(?)

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 cld
	 ;mov si, offset destino
	 mov di, offset origen
	 mov cx, 40d
	 
busqueda:
	 mov al, ':'
	 repne scasb
	 mov si, di
	 mov di ,offset destino
	 rep movsb
	 mov ah, 09h
	 mov dx, offset destino
	 int 21h
	 .exit
end 