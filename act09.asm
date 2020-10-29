.model small
extrn reto: near
extrn lee4: near
extrn des4: near 
extrn des2: near
extrn lee2: near
.stack
.data

.code

main:
	 ;call lee4
	 call lee2
	 call reto
	 mov dx, ax
	 ;call des4
	 call des2
	 ;call reto
	 .exit 0
end