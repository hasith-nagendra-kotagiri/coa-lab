ORG 100h                

MOV CX, 26             ; Set loop counter for 26 letters (A-Z)
MOV AL, 'Z'            ; Initialize AL with ASCII value of 'Z'

print_loop:
    MOV DL, AL         ; Move AL (current letter) to DL for printing
    MOV AH, 02h        ; DOS function to print character
    INT 21h            ; Call DOS interrupt to print character

    DEC AL             ; Move to the previous letter (e.g., from 'Z' to 'Y')
    LOOP print_loop    ; Decrement CX and repeat if CX is not zero

MOV AH, 4Ch            ; DOS function to terminate program
INT 21h                

END
