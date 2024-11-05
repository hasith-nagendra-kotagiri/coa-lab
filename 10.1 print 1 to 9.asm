org 100h               ; Origin for COM file format
mov dx ,offset output 
mov ah,09h
int 21h

; Print numbers from 0 to 9
mov cx, 10             ; Loop counter set to 10 (for numbers 0 to 9)
mov al, 0              ; Start with the number 0

print:
    ; Convert number in AL to ASCII character
    add al, '0'        ; Convert number to ASCII

    ; Print the character
    mov dl, al         ; Move the ASCII character to DL
    mov ah, 02h        ; DOS function 02h: print character
    int 21h            ; Call DOS interrupt
    
    
    
    ; Prepare for the next iteration
    sub al, '0'        ; Convert back to integer
    inc al             ; Increment the number
    loop print         ; Loop until CX is zero

; Terminate the program
mov ah, 4Ch            ; DOS function 4Ch: terminate program
int 21h                ; Call DOS interrupt to exit

output db "The numbers from 0-9: $ " 
end                     ; End of program
