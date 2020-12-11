assume cs:code
code segment
    start:  
	mov ax,0B800h
	mov ds,ax
	mov bx,0710h       ;将目的地址设为 800:0  800:0710h 设置显示在屏幕中间

	mov cx,15
    mov ah,41h ; add by zlun
    s:
	mov [bx],ah        ;将数据传送到目的地址，第一行
    inc ah
	inc bx

	mov al,02h
	mov [bx],al
	inc bx

	loop s
	      	      
	mov ax,4c00h
	int 21h
	      
code ends
end start
