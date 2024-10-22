ORG 100h
; Two-digit number to be displayed 
mov al, 23        ; Load the two-digit number into AL
; Split the number into tens and units
mov bl, 10        ; Set divisor to 10 to separate tens and units
div bl                ; Divide AL by 10, AL = quotient (tens), AH = remainder (units)
; Store the quotient (tens) and remainder (units)
mov bh, al        ; Store the tens digit in BH
mov bl, ah        ; Store the units digit in BL
mov dx, offset msg_1 
mov ah, 09h       
int 21h  
; Convert tens digit to ASCII
add bh, '0'        ; Convert the tens digit to ASCII
mov dl, bh        ; Move the ASCII tens digit to DL for printing
mov ah, 02h     ; DOS interrupt to print a character
int 21h              ; Print the tens digit
; Convert units digit to ASCII
add bl, '0'         ; Convert the units digit to ASCII
mov dl, bl         ; Move the ASCII units digit to DL for printing
mov ah, 02h     ; DOS interrupt to print a character
int 21h              ; Print the units digit
; Terminate the program
mov ah, 4Ch     ; DOS interrupt to exit the program
int 21h
msg_1  db 'The two digit no is :  $'
end
