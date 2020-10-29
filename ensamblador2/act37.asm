.model small
extrn des2: near
extrn reto: near
.stack 
.data

antes db ?
despu db ?

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 ;funcion leer modo
	 
	 mov ah, 0fh
	 int 10h 
	 push ax
	 
	 mov ah, 0
	 mov al, 12h
	 int 10h
	 
	 mov ah, 0dh
	 mov cx, 0200
	 mov dx, 0280
	 int 10h
	 mov antes, al
	 
	 mov al,0eh
	 mov ah, 0ch
	 mov cx, 0200
	 mov dx, 0280
	 int 10h
	 
	 mov ah,0Dh	;Función leer punto .
	 mov cx,0200	;Coordenada X.
	 mov dx,0280	;Coordenada Y.
	 int 10h
	 mov despu,al
	 
	 mov ah,00h
	 int 16h
	 ;Restaurar pantalla
	 
	 pop ax		;Modo original en la pila.
	 mov dl,al
	 mov ah,0	;Función establecer modo
	 int 10h		;Establecer. Queda como al principio.
	 
	 ;Desplegar resultados
	
	 mov dl,antes
	 call des2
	 call reto
	 mov dl,despu
	 call des2
	 call reto
	 
 fin:	.exit 0
end