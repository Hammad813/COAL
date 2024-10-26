;Write assembly code to add three numbers using variables. 
;Store values in variables and perform addition using registers.
;You can store the result in place of your own choice.  

.model
.stack 100h
.data

var1 DB 1       
var2 DB 2
var3 DB 3   
display DB 0     

.code
     main proc
     
     mov ax, @data
     mov ds, ax 
     
     mov al, var1
     mov bl, var2
     mov cl, var3
     
     add al,bl
     add al,cl 
     
     add ax , 30h
     mov dl , al
     
     mov ah , 2     
     int 21h
                  
     mov display, al  
               
     mov ah,4Ch
     int 21h
      
     endp main   
end main