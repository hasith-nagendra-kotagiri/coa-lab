org 100h
s dw 1234h
h dw 5678h

mov ax, s
mov bx, h
mul bx

mov ah, dl
and ah, 0F0h
shr ah, 4
add ah, 30h
cmp ah, 39h
jle first
add ah, 7 

first:
mov dl, ah
mov ah, 02h
int 21h

mov ah, dl
and ah, 0Fh
add ah, 30h
cmp ah, 39h
jle second
add ah, 7 

second:
mov dl, ah
mov ah, 02h
int 21h

mov ah, dh
and ah, 0F0h
shr ah, 4
add ah, 30h
cmp ah, 39h
jle third
add ah, 7 

third:
mov dl, ah
mov ah, 02h
int 21h

mov ah, dh
and ah, 0Fh
add ah, 30h
cmp ah, 39h
jle four
add ah, 7 

four:
mov dl, ah
mov ah, 02h
int 21h

mov ah, al
and ah, 0F0h
shr ah, 4
add ah, 30h
cmp ah, 39h
jle fifth
add ah, 7 

fifth:
mov dl, ah
mov ah, 02h
int 21h

mov ah, al
and ah, 0Fh
add ah, 30h
cmp ah, 39h
jle sixth
add ah, 7 

sixth:
mov dl, ah
mov ah, 02h
int 21h

mov ah, ah
and ah, 0F0h
shr ah, 4
add ah, 30h
cmp ah, 39h
jle seventh
add ah, 7 

seventh:
mov dl, ah
mov ah, 02h
int 21h

mov ah, ah
and ah, 0Fh
add ah, 30h
cmp ah, 39h
jle eighth
add ah, 7 

eighth:
mov dl, ah
mov ah, 02h
int 21h

mov ah, 4Ch
int 21h    mov ah, 4Ch       
    int 21h           ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BH

; --- Convert and print the high nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL (low byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of BL

; --- Convert and print the low nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BL


mov ah, 4Ch       
int 21h           