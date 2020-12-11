datas segment
   db 2,5,6,8,3,7,4,9,2,6,1
datas ends

codes segment
assume cs:codes,ds:datas
start:
     mov ax,datas
     mov ds,ax
    
     ;输出原来排序
     mov cx,11
     mov bx,0
     call label2
     ;将datas中的数从小到大排序
     
     ;换行
     mov dl,10
     mov ah,6
     int 21h
     mov dl,13
     mov ah,6
     int 21h
     
     ;冒泡排序
     mov cx,10  
;冒泡排序可以每次将最大的数放到数据段末端,所以循环十次即可
sort:
     push cx
     mov cx,10
;每次循环需要将所有相邻的数据进行比较，11个数据比较10次
     mov bx,0
     compare:
       mov ah,ds:[bx]   ;当前位置的数据和下一位置的数据比较
       mov al,ds:[bx+1]
       cmp ah,al
       jnc swop  ;如果ah>al,跳转到swop，交换两个数据位置
       jmp continue  
;否则，跳过数据交换段，直接到continue，进行下一个位置的数据继续比较
       
     swop:   ;交换两个数据位置
        mov ds:[bx],al
        mov ds:[bx+1],ah
             
     continue:       ;继续下一个数据比较 
       inc bx
       loop compare
       pop cx        ;继续下一次总循环
       loop sort
     
     ;输出新排序
     mov cx,11
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
