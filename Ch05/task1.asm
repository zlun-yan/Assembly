assume cs:code
code SEGMENT
    mov ax, 2
    add ax, ax

    mov ax, 4c00h
    int 21h
code ENDS
end