.model small
.386
.387
extrn des2: near
extrn reto: near
extrn desfdec: near
.stack
.data

uno dd 1
cuatro dd 4
dos dd 2
acum dd 1.0
var dd 1
compara dd 0.01
auxliar dd ?



.code

main :
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 mov cx, 00
	 
ciclo:
	 fld acum
	 fild uno
	 
	 fild var
	 fild dos
	 fadd
	 fist var  		;acá actualizamos var a var+2
	 
	 fdiv 	 ;pila: 1/var, acum
	 
	 fsub	 ;pila : acum - 1/var
	 
	 fst acum 	; actualizamos el valor de acum
				; pila: acum 
	
	 fild uno
	 fild var
	 fild dos
	 fadd 
	 fist var
	
	 fdiv 
	 fadd
	  
	 fst acum
	 fwait
	 inc cx 
	 fild cuatro
	 fmul
	 fldpi
	 fsub
	 fabs
	 fld compara
	 fcompp
	 fstsw ax
	 fwait 
	 
	 and ah, 45h
	 cmp ah, 00
	 jne ciclo
	 fwait
	 
	 fld acum
	 fild cuatro
	 fmul
	 fstp acum 
	 fwait
	 
	 mov dx, offset acum
	 call desfdec
	 call reto
	 
	 mov dl, ch
	 call des2
	 mov dl, cl
	 call des2
	 call reto
	 
	 .exit 0
	 
end

