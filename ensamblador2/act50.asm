.model small
.386
.387
extrn reto: near
extrn des2: near
extrn lee18bcd: near
.stack
.data

num1 dd 1.3
num2 dd 1.3

.code

main :
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 finit
	 fld num1
	 fld num2
	 fcompp 	;comparar y vaciar la pila
	 fstsw ax	; ax tiene la palabra de estado
	 
	 fwait 
	 and ah, 45h	; aplicar máscara 01000101 a la parte alta
	 mov dl, ah 	;el simbolo está guardado en la parte alta
	 call des2
	 call reto
	 
	 .exit 0
	 
end

; > 00 mayor
; > 01 menor
; = 40 iguales
; ! 45 no comparables