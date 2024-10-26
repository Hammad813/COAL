;task 01 : Write assembly code to solve the following, and display result on the screen:
;3+5-2-1+3

.model small
.stack 100h
.data
.code
main proc

    mov al, 3           
    add al, 5          
    sub al, 2           
    sub al, 1          
    add al, 3          
    
    add al,48   

    mov dl, al        
    mov ah, 2          
    int 21h            

    mov ah, 4Ch       
    int 21h            

main endp
end main
