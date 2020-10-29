.MODEL SMALL
.STACK
.DATA

destino db, 'Z'
actual db, 'A'
lim db, 'A'

.CODE


main : mov ax, @DATA
	   mov ds, ax
	   
	   mov destino, 'Z'
	   mov  lim, 41h
paso1: mov actual, 41h
	   
inicio: 
		mov dl, actual
        mov ah, 02h
	    int 21h
	    add actual, 01h
	   
	   mov bl, actual
	   mov bh, lim
	   cmp bl, bh
	   jl inicio
	   je inicio
	   
	   add lim, 01h
	   mov dl, 20h
	   mov ah, 02h
	   int 21h
	   mov bh, lim
	   mov bl, destino
	   cmp bh, bl
	   jl paso1
	   je paso1

final: .exit 0                                                                                                                  n
end