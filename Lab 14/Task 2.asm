TITLE  Grade Calculation Using IF-ELSE Directives
; Program to determine the grade based on marks
; Uses IF-ELSE directives for grade assignment
INCLUDE Irvine32.inc

.data
A BYTE 'A'
B BYTE 'B'
C BYTE 'C'
D BYTE 'D'  
F BYTE 'F'
gradeAverage  WORD ?
OkToRegister  BYTE ?
FALSE BYTE 0
TRUE  BYTE 1

.code
main PROC

    mov gradeAverage, 75        ; Assign a valid value within range
    call CheckRegistration      ; Call the function

    exit
main ENDP

CheckRegistration PROC

    mov OkToRegister, FALSE     ; Initialize as FALSE

    .IF gradeAverage > 80
        mov OkToRegister, A
    .ELSEIF gradeAverage <= 80
        .IF gradeAverage > 70
            mov OkToRegister, B
        .ENDIF
    .ELSEIF gradeAverage <= 70
        .IF gradeAverage > 60
            mov OkToRegister, C
        .ENDIF
    .ELSEIF gradeAverage <= 50
        mov OkToRegister, F
    .ENDIF

    ret
CheckRegistration endp

end main