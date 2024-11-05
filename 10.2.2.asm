org 100h               ; Origin for COM file format
mov dx,offset output 
mov ah,09h
int 21h

; Print characters from 'A' to 'Z'
mov cx, 26             ; Loop counter set to 26 (for letters A to Z)
mov al, 'A'            ; Start with the character 'A'

print:
    ; Print the character
    mov dl, al         ; Move the character to DL
    mov ah, 02h        ; DOS function 02h: print character
    int 21h            ; Call DOS interrupt

    ; Prepare for the next iteration
    inc al             ; Move to the next character
    loop print         ; Loop until CX is zero

; Terminate the program
mov ah, 4Ch            ; DOS function 4Ch: terminate program
int 21h                ; Call DOS interrupt to exit
 
output db "The alphabets from A-Z: $ " 
end                     ; End of program
