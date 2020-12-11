assume cs:code
code segment
	start:
    mov bx,3550h
	sub bx,2321h  ;计算3550h-2320h的结果
	
	mov ch,4      ;用于控制循环，2进制转化为16进制，每次移动4位，总共需要左移4次
    
	s1:
    mov cl,4      ;cl保存二进制移动位数
	rol bx,cl     ;将bx中的十六进制数据左移一位
	mov dl,bl
	and dl,0fh    ;将无用位清零
	cmp dl,9
	ja s2         
	add dl,30h    ;如果该数值在10以下，转换为ASCII码加30h
	jmp s3

	s2:
    add dl,37h    ;如果该数值在10以上，转换为ASCII码加37h

	s3:
    mov ah,2      ;利用DOS的2号中断功能显示dl的数值
	int 21h
	
	sub ch,1      ;循环进入下一次
	cmp ch,0      ;如果循环次数为0，则跳出循环结束移位程序
    jz over
	
	jmp s1        ;循环未结束，继续跳回到程序入口进行移位
	
    over:
    mov dl,17     ;显示一个H，表示16进制
    add dl,37h 
    mov ah,2      ;利用DOS的2号中断功能显示dl的数值
    int 21h

	mov ax,4c00h
	int 21h
code ends
end start
