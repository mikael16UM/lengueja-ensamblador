.MODEL SMALL
.STACK
.DATA


.CODE

main : mov ax, @data
       mov ds, ax
       
       mov cx, 1ah
       mov dl, 41h
       mov ah, 02h
ciclo: int 21h
       add dl, 20h
       mov ah, 02h
       int 21h
       sub dl, 1fh
       loop ciclo
       mov ah, 4ch
       int 21h
       .exit 0
end

	