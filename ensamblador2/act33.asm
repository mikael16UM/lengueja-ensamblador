.model small
extrn reto: near
extrn des4: near
.stack
.data

patron	db	"*.txt",0		;Cualquier archivo
DTA	db	21 dup(0)
attr	db	0
time	dw	0
date	dw	0
sizel	dw	0
sizeh	dw	0
fname	db	13 dup(0)
buffer db 0ffh dup (?)
fid dw ?
.code

main: 
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	
	;creacion del DTA
	mov ah, 1ah
	mov dx, offset DTA
	int 21h
	
	mov dx, offset patron
	mov cx, 0
	mov ah, 4eh
	int 21h
	jc salida
	
	push offset fname
	call despc
	add sp, 02
	call reto	

apertura:
	 mov ah, 3dh
	 mov al, 0
	 mov dx, offset fname
	 int 21h
	 jc error
	 mov fid, ax
	 
lectura:
	 mov ah, 3fh
	 mov bx, fid
	 mov cx, 05
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
	 jg lectura
	 
cerrar:
	 mov ah, 3eh
	 mov bx, fid
	 int 21h
	 jc error
	 call reto

nf:
	 mov ah, 4fh
	 int 21h
	 jc salida
	 push offset fname
	 call despc
	 add sp, 02
	 call reto
	 jmp apertura
	 
salida:
	 call reto
	 .exit 0

error:
	 mov dx, ax
	 call des4
	 .exit 0
	 
;----------------------------------------------------------------------------------------------------------------------------------------	 
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