.model small
.386
.stack
.data
color	db	0Fh
offx	dw	0h	;Offset para x y y, para desplazar figura a voluntad, se usa con macro pixelo
offy	dw	0h
equis	dw	?
ye	dw	?
incx	dw	?
incy	dw	?
.code
;Semejante al macro "pixel" pero agrega un offset
pixelo	macro x,y	;usar CX y DX como registro para pasar dato
	pusha
	
	mov bx,offset color
	mov al,[bx]
	mov ah,0Ch	;funcion escribir punto
	mov cx,x
	add cx,offx
	mov dx,y
	add dx,offy
	int 10h
	popa
endm
main:	mov ax,@data
	mov ds,ax
	
	;leer configuración de pantalla y guardarla en la pila
	mov ah,0fh
	int 10h
	push ax
	;definir pantalla 640x480, 16 colores
	mov ah,0
	mov al,12h
	int 10h
	;ciclo de la animación, 20 cuadros
	mov cx,50
	mov color,3
	push bx
	mov bx, 02
 ciclo:	push cx
 	
	inc bl
	cmp bl, 0fh
	je blanqueo
	mov color, bl
back:
	;Dibujar rombo, por líneas
	mov equis,100
	mov ye,200
	
	mov incx,1
	mov incy,-1
	call lrombo
	mov incx,1
	mov incy,1
	call lrombo
	mov incx,-1
	mov incy,1
	call lrombo
	mov incx,-1
	mov incy,-1
	call lrombo
	;Producir un retardo
	call retardo
	;Limpiar la pantalla
	call borra
	;Ajusta desplazamiento para siguiente rombo
	inc offx
	inc offy
	;Repetir
	
	pop cx
	loop ciclo
	;restaurar pantalla
	pop ax
	mov ah,0
	int 10h
	
	pop dx
fin:	.exit 0

blanqueo:
	 sub bl, 0ah
	 jmp back
	 
lrombo:	mov cx,150
 l_r:	pixelo equis ye
 	mov ax,incx
	add equis,ax
	mov ax,incy
	add ye,ax
	loop l_r
	ret
borra:	mov ah,06
	mov al,0
	mov bh,0
	mov cx,0000h
	mov dx,8080h
	int 10h
	ret
retardo:
	push cx
	mov cx,0FFFFh
 r_c1:	
	push cx
	mov cx,0004h
 r_c2:	loop r_c2
 
	pop cx
 
	loop r_c1
	pop cx
	ret
end