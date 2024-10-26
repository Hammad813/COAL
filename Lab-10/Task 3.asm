.model small
.stack 100h
.data

.code
Display macro char
    mov dl, char
    mov ah, 2
    int 21h
endm

main proc
    ; Display numbers 1 to 9
    mov dl, 1
    mov cx, 9
    add dl, 48 
Numbers:
    Display dl
    inc dl
    loop Numbers

    Display 10 
    Display 13 


    mov dl, 'A'
    mov cx, 26
Alpha:
    Display dl
    inc dl
    loop Alpha

   
    mov ah, 4Ch
    int 21h
main endp
end main
