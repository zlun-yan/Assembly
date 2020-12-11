assume cs:code
data segment
    db 'welcome to masm!'
data ends

code segment
    start:
    mov ax,data
    mov ds,ax  ;ds段寄存器 来保存输出字符串
    mov di,0   ;di 用来保存输出字符串的偏移地址

    mov ax,0b800h
    mov es,ax  ;es段寄存器 来保存屏幕输出位置
    mov si,0862h   ;si 用来保存输出位置的偏移地址

    mov cx,16  ;字符串一共16个字符
    s:
    mov ah,ds:[di]
    mov es:[si],ah
    mov es:[si+00a0h],ah
    mov es:[si+0140h],ah
    inc di
    inc si  ;设置显示字符

    mov ah,00000010B
    mov es:[si],ah  ;设置第一行显示的颜色
    mov ah,00100100B
    mov es:[si+00a0h],ah  ;设置第二行显示的颜色
    mov ah,01110001B
    mov es:[si+0140h],ah  ;设置第三行显示的颜色
    inc si

    loop s

    mov ax,4c00h
    int 21h     
code ends
end start