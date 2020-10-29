.model small
.386
.387
extrn desfdec: near
extrn reto: near
.stack
.data

etiqueta dd 00.3455

.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 mov dx, offset etiqueta
	 call desfdec
	 call reto
	 
	 .exit 0 
	 
end