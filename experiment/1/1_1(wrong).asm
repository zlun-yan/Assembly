ASSUME CS:CODES
CODES SEGMENT
    mov ax,0
    mov ds,ax

    mov bx,023fh
    mov cx,63
    s:
    mov [bx],cx
    sub bx,1
    loop s

    mov ax,4c00h
    int 21h

CODES ENDS
END

; 这个为什么错呢  因为这里cx是16位啊 而我每次bx只自减1 所以就会覆盖之前的内容了