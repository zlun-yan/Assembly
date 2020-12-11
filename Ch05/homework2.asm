assume cs:code
code SEGMENT
    mov ax, 1234h
    mov ds, ax

    mov bx, 0
    mov ax, 1
    mov cx, 100
s:  add bx, ax
    add ax, 1
    loop s

    mov di, 5
    mov [di], bx

    mov ax, 4c00h
    int 21h
code ENDS
end