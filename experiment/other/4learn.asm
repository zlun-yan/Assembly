assume cs:code
code segment
	start:
    mov bx,3550h
	sub bx,2321h  
	
	mov ch,4
    
	s1:
    mov cl,4      
	rol bx,cl     
	mov dl,bl
	and dl,0fh    
	cmp dl,9
	ja s2        
	add dl,30h    
	jmp s3

	s2:
    add dl,37h    

	s3:
    mov ah,2      
	int 21h
	
	sub ch,1      
	cmp ch,0      
    jz over
	
	jmp s1        
	
    over:
    mov dl,17     
    add dl,37h 
    mov ah,2      
    int 21h

	mov ax,4c00h
	int 21h
code ends
end start
