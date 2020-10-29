.model small
.386
.387
extrn reto: near
extrn desfdec: near
.stack
.data

dos dd 2
var dd 1
acum dd 1.0
cuatro dd 4
uno dd 1

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov cx, 4800
	 
	 finit
	 
	 fld acum
ciclo:
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
	 loop ciclo
	 
	 fild cuatro
	 fmul
	 fstp acum
	 fwait
	 
	 mov dx, offset acum
	 call desfdec
	 call reto
	 .exit 0
	 
end
