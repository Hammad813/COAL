;TASK 01: 
.model small
.stack 100h 
.data
arr db 4,1,3,5

.code 
       main proc
       mov ax,@data
       mov ds,ax    
           
       lea si,arr    
       mov cx,4
       LABEL:
       mov dl,[si] 
       add dl,48   
       mov ah,2
       int 21h
       inc si
       loop LABEL
       
       mov ah,4ch
       int 21h
       
       main endp
end main