org 100h               ; Origin for COM file format
jmp start:
output db "The alphabets from Z-A: $ "
start:
mov dx,offset output 
mov ah,09h
int 21h
; Print characters from 'Z' to 'A'
mov cx, 26             ; Loop counter set to 26 (for letters A to Z)
mov al, 'Z'            ; Start with the character 'Z'
print:
    ; Print the character
    mov dl, al         ; Move the character to DL
    mov ah, 02h        ; DOS function 02h: print character
    int 21h            ; Call DOS interrupt
    ; Prepare for the next iteration
    dec al             ; Move to the previous character
    loop print         ; Loop until CX is zero

; Terminate the program
mov ah, 4Ch            ; DOS function 4Ch: terminate program
int 21h                ; Call DOS interrupt to exit
end                     ; End of program
