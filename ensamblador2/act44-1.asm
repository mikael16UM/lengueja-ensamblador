.model small
.386
.387
extrn des2: near
extrn reto: near
.stack 
.data

areab dt ? 
radiob dt 10h
mil dt 1000
millon dt 1000000

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 finit
	 
	 fbld radiob
	 fmul st, st(0)
	 fldpi
	 fmul
	 
	 fbld millon
	 fmul
	 fbstp areab
	 fwait
	 
	 mov di, 08
	 mov bx, offset areab
	 mov cx, 09
	 
ciclo:
	 push bx
	 mov dx, [bx+di]
	 call des2
	 dec di
	 cmp di, 02
	 je punto
	 
regreso:
	 pop bx
	 loop ciclo
	 call reto
	 
	 .exit 0
		
punto:
	 mov dx, '.'
	 mov ah, 02
	 int 21h 
	 jmp regreso
	 
	 
end