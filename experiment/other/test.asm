assume cs:code
code segment
    start:
    mov ax,07b0h
    add ax,00a0h

    mov ax,4c00h
    int 21h
code ends
end start
