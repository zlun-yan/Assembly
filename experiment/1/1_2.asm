assume cs:code
a segment
    dw 1,2,3,4,5,6,7,8
a ends

b segment
    dw 8 dup(0)
b ends

code segment
    start:
    mov ax,a
    mov ds,ax

    mov bx,0
    mov cx,8
    s1:
    push [bx]
    add bx,2
    loop s1

    mov ax,b
    mov ds,ax

    mov bx,0
    mov cx,8
    s2:
    pop [bx]
    add bx,2
    loop s2

    mov ah,4ch
    int 21h
code ends
end start