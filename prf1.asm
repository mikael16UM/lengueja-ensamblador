.model small
extrn reto: near
.stack
.data

.code

main:
	 mov ax, @data
	 mov ds, ax
	 call reto
	 mov dl, 41h
	 mov ah, 02h
	 int 21h 
	 call reto
	 mov dl, 42h
	 mov ah, 02h
	 int 21h
	 call reto
	 jmp over

over: .exit 0
end