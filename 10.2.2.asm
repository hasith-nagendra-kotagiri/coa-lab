
org 100h

mov cx,26
mov ax,A

prin_loop:
   mov al,0
   mov dl,al
   mov al,02h
   int 21h
    
   inc al

ret




