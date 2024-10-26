.model small
.stack 100h
.data
msg db "The sum of three digits: $"
result db ?  
.code

sum macro num1, num2, num3
    mov al, num1    
    add al, num2    
    add al, num3    
    add al, '0'     
    mov result, al  
endm

main proc
    mov ax, @data
    mov ds, ax  
    
    lea dx, msg
    mov ah, 9     
    int 21h      
    
    sum 2, 3, 4  
    
    mov dl, result
    mov ah, 2   
    int 21h       
    
    mov ah, 4Ch       
    int 21h      
    
main endp

end main