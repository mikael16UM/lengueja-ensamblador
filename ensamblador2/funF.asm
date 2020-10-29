.model small
.386
.387
public reto
public desidec
public desfdec

.stack
.data

temp dt ?
variable dd ?

millon dt 1000000

.code

reto:
	 push ax
	 push dx
	 mov ah, 02
	 mov dl, 0dh
	 int 21h 
	 mov dl, 0ah
	 int 21h
	 pop dx
	 pop ax
	 ret
	 
desidec:
	 push dx
	 push bx
	 push cx
	 
	 
	 mov bx, dx
	 finit
	 fild dword ptr [bx]
	 fbstp temp
	 fwait
	 mov bx, offset temp
	 mov cx, 09
	 add bx, 08
	 
ciclo0:
	 mov dx, [bx]
	 cmp dx, 00
	 jne ciclo
	 dec bx
	 dec cx
	 cmp cx, 01
	 je casoE
	 jmp ciclo0
	 
casoE:
	 mov dx, [bx]
	 cmp dx, 00
	 jne ciclo
	 push ax
	 mov ah, 02
	 mov dx, '0'
	 int 21h
	 pop ax
	 jmp salida
	 
ciclo:
	 mov dx, [bx]
	 call des2
	 dec bx
	 loop ciclo
	 
salida:
	 pop cx
	 pop bx
	 pop dx
	 ret
	 
desfdec:
	 push dx
	 push bx
	 push cx
	 
	 finit
	 mov di, offset variable
	 mov si, dx
	 cld
	 mov cx, 04
	 rep movsb
	 fld variable
	 fbld millon
	 fmul
	 fbstp temp
	 fwait
	 
	 mov bx, offset temp
	 mov cx, 06
	 add bx, 08
	 
recorrer:
	 mov dx, [bx]
	 cmp dx, 00
	 jne entero
	 dec bx
	 dec cx
	 cmp cx, 01
	 jg recorrer
	 

entero:
	 mov dx, [bx]
	 call des2
	 dec bx
	 loop entero
	 
punto:
	 push ax
	 mov ah, 02
	 mov dx, '.'
	 int 21h 
	 pop ax
	 
	 mov cx, 02
	 
decimal:
	 mov dx, [bx]
	 call des2
	 dec bx
	 loop decimal	 
	 
acabo:
	 pop cx
	 pop bx
	 pop dx
	 ret
	 
	 
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
	 ret
	 
des1:
	 add dl, 30h
	 cmp dl, 39h
	 jg suma
	 mov ah, 02h
	 int 21h
	 ret

suma: 
	 add dl, 07h
	 mov ah, 02h
	 int 21h
	 ret 


end
