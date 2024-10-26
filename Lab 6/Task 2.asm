.model small
.stack 100h
.data

.code
    main proc
    mov dl,1
    mov cx,9
    add dl,48
    Numbers:  
    mov ah,2
    int 21h 
    inc dl 
    loop Numbers  
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
                
    mov dl,'A'
    mov cx,26  
    Alpha:  
    mov ah,2
    int 21h 
    inc dl 
    loop Alpha
              
    mov ah,4ch
    int 21h
main endp
    end main