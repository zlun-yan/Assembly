ASSUME CS:codes, DS:datas
datas segment
    db 2,5,6,8,3,7,4,9,2,6,1  ;字节
datas ends

codes segment
    start:
    mov ax,datas
    mov ds,ax

    ;输出原来排序
    mov cx,9
    mov bx,0
    call label2

    ;把datas中的数从小到大排序
    ;冒泡排序
    mov cx,10
    sort:
    push cx
    mov cx,10
    mov bx,0

    compare:
    mov ah,ds:[bx]
    mov al,ds:[bx+1]
    cmp ah,al
    jnc swap
    jmp continue

    swap:
    mov ds:[bx], al
    mov ds:[bx+1], ah

    continue:
    inc bx
    loop compare
    
    pop cx
    loop sort

    ;换行
    mov dl,10
    mov ah,6
    int 21h

    ;输出新排序
    mov cx,9
    mov bx,0
    call label2

    mov ah,4ch
    int 21h

    ;输出排序子程序
    label2:
    mov dl,[bx]
    add dl,30h
    mov ah,6
    int 21h
    inc bx
    loop label2
    ret

codes ends
end start