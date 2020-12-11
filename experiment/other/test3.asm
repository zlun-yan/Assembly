assume cs:code
data segment
	db "Life is a chain of moments of enjoyment, not only about survival.",0
data ends

code segment
    start:
    mov ax,data
	mov ds,ax
	mov si,0     ;设置起始地址为数据地址
	
	call letterc ;调用将字符串中的小写字母转变为大写字母的子程序
	      
	mov ah,4ch
	int 21h
	
	letterc:
    mov al,ds:[si]      ;取出数据段地址
	cmp al,0          ;判断是否为0
	je finish          ;等于0则跳转到finish段，结束继续转换
	and al,11011111B  ;将字母转换为大写
	mov ds:[si],al     ;将大写字母返回到字符串中
	inc si            ;读取下一个字母
	loop letterc      ;继续子程序
	 finish:ret           ;子程序结束，回到主程序
	
code ends
end start
