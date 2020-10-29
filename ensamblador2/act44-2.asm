.model small
.386
.387
extrn des2: near
extrn des4: near
extrn reto: near
.stack
.data

areab dt ?
variable dt ?
mil dt 1000000
radiob dt 10h

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
	 fbstp variable
	 fwait
	 
	 mov bx, offset variable
	 mov dx, [bx]
	 call des4
	 
	 mov dx, '.'
	 mov ah, 02
	 int 21h
	 
	 finit
	 fbld radiob
	 fmul st, st(0)
	 fldpi 
	 fmul
	 fbld variable
	 fsub
	 fbld mil
	 fmul
	 fbstp areab
	 fwait

	 
	 mov bx, offset areab
	 mov di, 02
	 mov cx, 03
	 
ciclo:
	 mov dx, [bx + di]
	 call des2
	 dec di
	 loop ciclo
	 call reto
	 
	 .exit 0
	 
	 
end