ORG 100h           ; Origin, to specify that the program starts at 100h (for COM file format)

; Display message to prompt user input
MOV DX, OFFSET msg_input  ; Load the address of the input prompt message
MOV AH, 09h               ; Function 09h of INT 21h is used to display a string
INT 21h                   ; Call DOS interrupt to display the message

; Read a single character from the user
MOV AH, 01h               ; Function 01h of INT 21h is used to read a character
INT 21h                   ; Call DOS interrupt to get the character
MOV BL, AL                ; Store the input character from AL into BL register

; Display output message
MOV DX, OFFSET msg_output ; Load the address of the output message
MOV AH, 09h               ; Function 09h of INT 21h is used to display a string
INT 21h                   ; Call DOS interrupt to display the message

; Print the entered character on the screen
MOV DL, BL                ; Move the input character from BL to DL for printing
MOV AH, 02h               ; Function 02h of INT 21h is used to print a character
INT 21h                   ; Call DOS interrupt to print the character

; Terminate the program
MOV AH, 4Ch               ; Function 4Ch of INT 21h terminates the program
INT 21h                   ; Call DOS interrupt to exit

; Data section
msg_input  DB 'Enter a character: $'    ; Input prompt message
msg_output DB 0Dh, 0Ah, 'Entered character is: $' ; Output message (with newline)

END
