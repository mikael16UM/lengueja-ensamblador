.model small
extrn lee2:near
extrn des2:near
extrn reto: near
.stack
.data
.code

main:
	 mov ax, @data
	 mov ds, ax
	 call lee2
	 call reto
	 push ax
	 
	 call lee2
	 call reto
	 push ax
	 
	 call lee2
	 call reto
	 push ax
	 
	 call mayor3
	 add sp, 06h
	 mov dl, al
	 call des2
	 .exit 0
	 
mayor3: 
	 push bp
	 mov bp, sp
	 mov ax, [bp+8]
	 mov bx, [bp+6]
	 mov cx, [bp+4]
	 cmp ax, bx
	 jg caso1
	 jle caso2

caso1: 
	 cmp ax, cx
	 jg final
	 jle resp3

caso2:
	 cmp bx, cx
	 jg resp2
	 jle resp3
	 
resp2: 
	 mov ax, bx
	 jmp final

resp3:
	 mov ax, cx
	 jmp final
	 
final:
	 mov sp, bp
	 pop bp
	 ret
end