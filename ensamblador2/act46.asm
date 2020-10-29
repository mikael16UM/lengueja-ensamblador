.model small
.386
.387
extrn reto: near
extrn lee18bcd: near
extrn desidec: near

.stack
.data

numero dd ?
auxiliar dt ?

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov dx, offset numero
	 call lee18bcd
	 call reto
	 
	 mov dx, offset numero
	 call desidec
	 call reto
	 
	 .exit 0
	 
end