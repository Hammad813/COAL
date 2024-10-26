;Task 3
.model small
.stack 100h

.data
    array db 5, 10, 15, 24      
    result db ?                 
    msg db "The sum is calculated.$"  

.code
main proc
       mov ax, @data
    mov ds, ax

   
    xor al, al                    
    mov cx, 4                     
    lea si, array                 

SumLoop:    
    add al, [si]                  
    inc si                        
    loop SumLoop                  

   
    mov result, al 
   
   
    mov dx, offset msg            
    mov ah, 09h                   
    int 21h 
    
    mov dl,result
    mov ah,2
    int 21h 
    
                      
    mov ax, 4Ch                
    int 21h                      

main endp
end main