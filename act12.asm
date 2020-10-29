.model small
extrn reto: near
extrn lee2: near
extrn des4: near
extrn des2: near
.stack
.data

.code
a1 db 0
a2 db 0
a3 db 0
b1 db 0
b2 db 0
b3 db 0

main:
	 mov ax, @data
	 mov ds, ax
	 
	 call lee2
	 mov a1, al ; parte alta
	 call lee2
	 mov a2, al ; parte media
	 call lee2
	 mov a3, al ; parte baja
	 call reto
	 
	 call lee2
	 mov b1, al
	 call lee2
	 mov b2, al
	 call lee2
	 mov b3, al
	 call reto
	 
	 mov al, a3
	 mov bl, b3
	 add al, bl
	 mov a3, al
	 
	 mov ah, a2
	 mov bh, b2
	 adc ah, bh
	 mov a2, ah
	 
	 mov bl, b1
	 mov al, a1
	 adc al, bl
	 mov a1, al
	 
	 jnc sigue
	 
	 mov ah, 02h
	 mov dl, 31h
	 int 21h
	 
sigue: 
	 mov dl, a1
	 call des2
	 mov dh, a2
	 mov dl, a3
	 call des4
	 jmp over
	 
over: .exit 0
end