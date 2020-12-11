assume cs:code
code segment
    mov al,82h
    mov cl,4
    rol al,cl

    mov ax,4c00h
    int 21h
code ends
end

; rol 好像会影响 cf 和 of 标志位