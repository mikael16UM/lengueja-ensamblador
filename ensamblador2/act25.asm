.model small
.386
extrn des2: near
extrn espa: near
extrn reto: near
.stack
.data

arrgelo db "AAABBBABBA"
.code

main:
	 mov ax, @data
	 mov ds, ax
	 mov es, ax
	 
	 cld
	 mov cl, 10d
	 mov di, offset arrgelo
	 
busqueda:
	 mov al, 'A'
	 repne scasb
	 mov dx, di
	 ;sub dx, 01
	 call des2
	 call espa
	 cmp cx, 00
	 jg busqueda
	 call reto
	 
	 .exit 0

end