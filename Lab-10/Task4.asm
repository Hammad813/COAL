.model small
.stack 100h
.data
.code

; Define a macro to swap the values of two registers
SWAP MACRO reg1, reg2
    push reg1    ; Push the first register onto the stack
    push reg2    ; Push the second register onto the stack
    pop reg1     ; Pop back into the first register
    pop reg2     ; Pop back into the second register
ENDM

main proc
    mov ax, 0AF16h   
    mov bx, 0AF50h   

    ; Call the SWAP macro to swap the values of AX and BX
    SWAP ax, bx

    mov ah, 4Ch
    int 21h
main endp
end main
