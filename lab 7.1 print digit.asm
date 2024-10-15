org 100h
;display messege to ask input from user
mov dx,OFFSET msg_input
mov ah,09h
int 21h

;read single integer from user
mov ah,01h
int 21h

cmp al,'0'
jl NotDigit
cmp al,'9'
jg NotDigit

mov cl,al

;print the message of saying 'the entered digit is: '
mov dx,offset msg_output
mov ah,09h
int 21h

mov dx,0000h

mov dl,cl
mov ah,02h
int 21h
jmp EndProgram

NotDigit:
mov dx,offset msg_error
mov ah,09h
int 21h

EndProgram:
mov ah,4Ch
int 21h


msg_input  db 'Enter a digit: $'
msg_output db 0Dh, 0Ah, 'The entered digit is: $'  ; Output message
msg_error  db 0Dh, 0Ah, 'Error: Not a digit $'  ; Error message

end                ; End of program