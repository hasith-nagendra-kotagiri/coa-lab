ORG 100h                 

MOV CX, 10            
MOV AL, 9             

print_loop:
    ADD AL, '0'          
    MOV DL, AL        
    MOV AH, 02h        
    INT 21h             
    SUB AL, '0'        
    DEC AL            
    LOOP print_loop    
MOV AH, 4Ch           
INT 21h                

END