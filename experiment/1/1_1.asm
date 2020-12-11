assume cs:code
code segment
    mov ax,0
    mov ds,ax

    mov ah,0
    mov cx,64
    mov bx,0200h
    s:
    mov [bx],ah
    inc bx
    inc ah
    loop s

    mov ah,4ch
    int 21h

code ends
end