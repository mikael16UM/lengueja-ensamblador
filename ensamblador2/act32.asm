.model small
extrn reto: near
extrn des4: near
.stack
.data

dir db "..", 00h

.code

main:
	
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov ah, 3bh
	 mov dx, offset dir
	 int 21h 
	 jc error
	 
	 push offset dir
	 call despc
	 add sp, 02
	 jmp salida
	 
error:
	 mov dx, ax
	 call des4
	 .exit 1
salida:
	 call reto
	 .exit 0
	 
despc:
	 push bp
	 mov bp, sp
	 mov ah, 02
	 cld
	 mov si, [bp+04]

dcl: 
	 lodsb		 ; carga el elemnto el al e incrementa SI
	 cmp al, 00  ;compara si no tiene el fin de cadena
	 je dcs
	 mov dl, al
	 int 21h
	 jmp dcl
	 
dcs:
	 mov sp, bp
	 pop bp
	 ret
	 
	
end