.model small
.stack 100h
.data
msgMenu db "Select an option:", 13, 10, "1. Add", 13, 10, "2. Subtract", 13, 10, "3. Division",13,10,"4. EXIT ", 13, 10, "$"
msgChoice db "Enter your choice (1-3): $"
msgAdd db "The result of addition is: $"
msgSub db "The result of subtraction is: $"
msgDiv db "The result of division is: $"
addResult db ?  
subResult db ? 
divResult db ? 

.code

add_numbers macro num1, num2
    mov al, num1
    add al, num2  
    add al, '0'
    mov addResult, al
endm

sub_numbers macro num1, num2
    mov al, num1
    sub al, num2
    add al, '0'
    mov subResult, al
endm
     
div_numbers macro num1, num2      
    mov al, num1 
    mov ah, 0      
    mov bl, num2       
    div bl             
    add al, '0'        
    mov divResult, al  
endm

main proc
    mov ax, @data
    mov ds, ax  

    menu:

    call display_menu        ; Display menu
    call get_choice          ; Get user choice

    cmp al, '1'              
    je perform_addition      

    cmp al, '2'              
    je perform_subtraction   
                          
    cmp al, '3'              
    je perform_division
                          
    cmp al, '4'              
    je exit_program          

    jmp menu                 ; Invalid input, redisplay menu

perform_addition:
    add_numbers 5, 3      
    call display_add_result ; Display addition result
    call newline            
    jmp menu                

perform_subtraction:
    sub_numbers 5, 3      
    call display_sub_result ; Display subtraction result
    call newline            
    jmp menu                
                  
perform_division:
    div_numbers 6, 2      
    call display_div_result ; Display division result
    call newline            
    jmp menu  
                      
exit_program:
    mov ah, 4Ch             
    int 21h                 

main endp 

display_menu proc
    lea dx, msgMenu
    mov ah, 9
    int 21h
    ret
display_menu endp

get_choice proc
    lea dx, msgChoice
    mov ah, 9
    int 21h

    mov ah, 1              
    int 21h                
    ret
get_choice endp

display_add_result proc
    call newline
    lea dx, msgAdd
    mov ah, 9     
    int 21h       
    mov ah, 2
    mov dl, addResult    
    int 21h
    ret
display_add_result endp  

display_sub_result proc
    call newline      
    lea dx, msgSub
    mov ah, 9     
    int 21h       
    mov ah, 2
    mov dl, subResult    
    int 21h
    ret
display_sub_result endp    

display_div_result proc
    call newline      
    lea dx, msgDiv
    mov ah, 9     
    int 21h       
    mov ah, 2
    mov dl, divResult    
    int 21h
    ret
display_div_result endp

newline proc
    mov ah, 2
    mov dl, 13      
    int 21h
    mov dl, 10      
    int 21h
    ret
newline endp

end main
