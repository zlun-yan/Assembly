assume cs:code
code segment
    start:
    ;mov bx,3550h
    ;sub bx,2320h
    mov bx,3550h
    sub bx,2321h

    mov cx,4
    s:
    push cx
    mov cl,4
    rol bx,cl
    pop cx

    mov dl,bl
    and dl,0fh

    cmp dl,9
    ja letter

    add dl,30h ;数字输出
    jmp output

    letter:
    add dl,37h ;字母输出

    output:
    mov ah,2
    int 21h

    loop s

    mov dl,17     ;显示一个H，表示16进制
    add dl,37h 
    mov ah,2
    int 21h

	mov ax,4c00h
	int 21h
code ends
end start



    