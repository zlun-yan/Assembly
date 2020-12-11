assume cs:codeseg
dataseg segment
    db "Beginner's All-purpose Symbolic Instruction Code.",0
dataseg ends

codeseg segment
    begin:
    mov ax,dataseg
    mov ds,ax
    mov si,0
    call letterc

    mov ax,4c00h
    int 21h

    letterc:
    mov ah,[si]
    inc si
    cmp ah,0
    jne continue1
    ret

    continue1:
    cmp ah,61h
    jnb continue2
    jmp letterc

    continue2:
    cmp ah,7ah
    jna do
    jmp letterc

    do:
    and ah,11011111B
    mov [si-1],ah
    jmp letterc

codeseg ends
end begin