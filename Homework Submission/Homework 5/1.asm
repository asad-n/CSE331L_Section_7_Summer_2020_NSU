
.MODEL SMALL 
.STACK 100H

.DATA
 PROMPT DB 'ENTER THE BINARY NUM:$'
 MSG DB 0DH, 0AH, 'GIVEN BINARY NUM IN REV ORDER:$'
 
.CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    XOR BL,BL
    
    
    MOV CX,8
    MOV AH,1                       
    
@INPUT:
    INT 21H
    CMP AL, 0DH
    JE @END
    AND AL, 0FH
    SHL BL,1
    OR BL,AL
    
 LOOP @INPUT

@END:
    MOV AL,BL
    MOV CX,8     


;@LOOP:
; SHL AL,4
; RCR BL,4
;
;LOOP @LOOP
  SHR BL,5
  ;RCL BL,4

  LEA DX, MSG
  MOV AH,9
  INT 21H


  MOV CX, 8
  MOV AH, 2  
  
  
@OUTPUT:
  SHL BL, 1
  
JNC @ZERO
  
  MOV DL, 31H
  JMP @PRINT


@ZERO:
 MOV DL, 30H
    
  
@PRINT:
  INT 21H
LOOP @OUTPUT


 MOV AH, 4CH
 INT 21H
 MAIN ENDP
END MAIN






