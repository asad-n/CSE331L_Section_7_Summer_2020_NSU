.MODEL  SMALL
.DATA
  NUMBER  DB  ?
  PROMPT  DB  0AH,0DH,"ENTER NO: $"
  MSG_NX   DB  0AH,0DH,"The number is not X$"
  MSG_X  DB  0AH,0DH,"The number is X$" 

.CODE
  MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    LEA DX,PROMPT
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV NUMBER,AL
            
    MOV AH,00

    MOV CL,2
    DIV CL
    MOV CL,AL

   LBL1:
    MOV AH,00
    MOV AL,NUMBER
    DIV CL
    CMP AH,00
    JZ LBL2
    DEC CL
    CMP CL,1
    JNE LBL1
    JMP LBL3
    
   LBL2:
    MOV AH,09H
    LEA DX,MSG_NX
    INT 21H
    JMP EXIT    
    
   LBL3:
    MOV AH,09H
    LEA DX,MSG_X
    INT 21H
    
   EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN