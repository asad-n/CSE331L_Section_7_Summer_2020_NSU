.MODEL SMALL 
.STACK 100H 
.DATA 
    PROMPT DB 0AH, 0DH, "Enter an integer: $" 
    MSG_P DB 0AH, 0DH, "The integer is: P$"
    MSG_N DB 0AH, 0DH, "The integer is: N$"
    
    NUMBER DB 0
    
.CODE 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
        
        LEA DX, PROMPT
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV BH, AL
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        
        MOV CH, AL
        MOV AL, BH
        MOV BL, 10
        MUL BL
        
        ADD AL, CH
        ;MOV CX, AX
        
        JS NEGATIVE
        
        LEA DX, MSG_P
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        
        NEGATIVE:
          LEA DX, MSG_N
          MOV AH, 9
          INT 21H
        
        EXIT:
        MOV AX, 4CH
        INT 21H
        
    END MAIN