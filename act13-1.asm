.model small
extrn lee2:near
extrn des4: near
extrn reto: near
.stack
.data

.code

main:	
	 mov ax, @data
	 mov ds, ax
	 
	 call lee2
	 mov bl, al
	 call reto
	 
	 call lee2
	 call reto 
	 mul bl
	 
	 mov dx, ax
	 call des4
	 call reto
	 
	 .exit 0

end