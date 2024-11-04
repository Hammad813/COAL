.model small
.stack 100h
.data
    string db "Hello, World!", 0  ; Input string with null terminator
.code
main proc
    mov ax, @data         ; Setup data segment
    mov ds, ax
    lea si, String   ; SI points to the start of the string

find_length:
    mov al, [si]          ; Load each character from the string into AL
    cmp al, 0             ; Check if it's the null terminator
    je reverse            ; If null terminator found, jump to reverse process
    inc si                ; Move SI to the next character
    jmp find_length       ; Continue until null terminator

reverse:
    dec si                ; Point SI to the last valid character in the string
    lea di, String        ; Load starting address of string into DI

swap_loop:
    cmp si, di            ; Compare start and end pointers (SI and DI)
    jle done_reverse      ; If SI <= DI, swapping is done
    ; Swap process
    mov al, [di]          ; Load character from the start into AL
    mov bl, [si]          ; Load character from the end into BL
    mov [di], bl          ; Place end character at the start
    mov [si], al          ; Place start character at the end

    inc di                ; Move DI to the next character from the start
    dec si                ; Move SI to the previous character from the end
    jmp swap_loop         

done_reverse:
    mov ah, 4ch            
    int 21h               
main endp
end main