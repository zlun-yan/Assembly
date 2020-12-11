assume cs:code
data segment
    db 'wlcome to masm!'   ;数据段
data ends

code segment
    start:  
    mov ax,data
    mov ds,ax
	mov si,0       ;将源地址设为数据段起始地址
	
	mov ax,0B800h
	mov es,ax
	mov di,0       ;将目的地址设为800:0
	add di,0710h   ;设置显示在屏幕中间

	mov cx,15
    s:
    mov ax,ds:[si]        ;从源地址取出数据
	inc si
	mov es:[di],ax        ;将数据传送到目的地址，第一行
	mov es:[di+00A0h],ax  ;第二行
	mov es:[di+0140h],ax  ;第三行
	inc di
	mov al,00000010B      ;改变颜色为绿色
	mov es:[di],al
	mov al,00100100B      ;绿底红色
	mov es:[di+00A0h],al
	mov al,01110001B      ;白底蓝色
	mov es:[di+0140h],al
	inc di
	loop s
	      	      
	mov ax,4c00h
	int 21h
	      
code ends
end start
