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
    ;选择排序
    mov cx,9
    mov bx,0 ;bx用来存第一个元素的位置
    sort:
    mov si,bx ;si用来指向新的元素
    inc si
    mov di,si ;di用来存最小的元素的位置
    mov ah,ds:[bx] ;ah用来存最小的元素的值
    push cx
    mov cx,10
    sub cx,bx

    compare:
    mov al,ds:[si]
    cmp ah,al
    jnc minn
    jmp continue

    minn:
    mov ah,al
    mov di,si

    continue:
    inc si
    loop compare
    
    pop cx
    mov al,ds:[bx]
    mov ds:[bx],ah
    mov ds:[di],al
    inc bx
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