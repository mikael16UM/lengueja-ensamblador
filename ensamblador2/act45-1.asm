.model small
.386
.387
extrn desidec: near
extrn reto: near
.stack
.data

etiqueta dd   100001

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov dx, offset etiqueta
	 call desidec
	 call reto
	 
	 .exit 0 
	 
end