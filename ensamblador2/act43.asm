.model small
.386
.387
extrn des2: near
extrn reto: near
.stack
.data

radiob dt 10h
areab dt ?
mil dt 1000


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
	 
	 fbld mil
	 fmul 
	 fbstp areab
	 
	 mov di, 08
	 mov bx, offset areab
	 mov cx, 9

ciclo:
	 push bx
	 mov dx, [bx+di]
	 call des2
	 dec di
	 pop bx
	 loop ciclo
	 
	 call reto
	 .exit 0
	 
end 