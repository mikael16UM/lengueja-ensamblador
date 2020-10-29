.model small
extrn des4: near
extrn reto: near
extrn espa: near
.stack
.data

patron	db	"*.*",0		;Cualquier archivo
DTA	db	21 dup(0)
attr	db	0
time	dw	0
date	dw	0
sizel	dw	0
sizeh	dw	0
fname	db	13 dup(0)

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
	 
nf:
	 mov bx, offset sizeh
	 mov dx, [bx]
	 call des4
	 mov bx, offset sizel
	 mov dx, [bx]
	 call des4
	 call reto
	 call reto
	 	
	 mov ah,4Fh
	 int 21h
	 jc salida
	 push offset fname
	 call despc
	 add sp,02
	 call reto
	 jmp nf
	 
salida:
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
	 
end