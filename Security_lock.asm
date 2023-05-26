
include emu8086.inc
.MODEL SMALL
.DATA   
       
           SIZE EQU 20 ;load the size of the database
         ID_MSG DB 13, 10, 'Enter your ID:$'
       PASS_MSG DB 13, 10, 'Enter your Password:$'
   ID_ERROR_MSG DB 13, 10, 'ID not Found!$'
 PASS_ERROR_MSG DB 13, 10, 'Wrong Password! Access denied$'
    Allowed_MSG DB 13, 10, 'Correct Password! ACCESS allowed$'
       LONG_MSG DB 13, 10, 'Long password! $'
        TEMP_ID DW 1 DUP(0)
        TEMP_Pass DB 1 DUP(0)
        IDSize = $-TEMP_ID
        ;Making the database
ID  DW  'A123', 'B456','CE20','DB71','E111','F500','G432','HC12','I321','J876','K123', 'L456', 'ME20', 'NB71', 'Z111', 'P500', 'Q432', 'RC12','S321','Y876'  
Password DB 1,   2,      3,    4,     7,   10,    11,    13,    12,     14   ,   5  ,   6  ,    8  ,    9   ,    15  ,   10  ,   11  ,   13  ,   12  , 14
    
.CODE
MAIN        PROC
            MOV AX,@DATA   ;The @DATA symbol represents the default segment used for data in the program.
            MOV DS,AX
            MOV AX,0000H
            
            
                        
                                                                                                         
;The followint ID_PROMPT used to display Enter your ID: message 
ID_PROMPT:  LEA DX,ID_MSG
            MOV AH,09H ;09H is the value that corresponds to the DOS service for displaying a string.
            INT 21H
            
            
ID_INPUT:   MOV  BX,0    ;BX will be use as index for accessing the elements of the password array.
            MOV  DX,0    ;DX will be used to store the length of the string entered by the user.
            LEA  DI,TEMP_ID  
            MOV  DX,IDSize
            CALL get_string ;string wil be stored in the temp_ID
            MOV  BL,0  ;will be used as a loop counter
            MOV  SI,0  ;SI will be use as index for accessing the elements of the ID array.

LOOP1:      MOV AX,ID[SI] 
            MOV DX,TEMP_ID
            CMP DX,AX
            JE  PASS_PROMPT  ;Jump equal
            INC BL
            ADD SI,4   ;in order to get the nex ID 
            CMP BL,SIZE
            JB  LOOP1: ;jump if below
            
ERROR_MSG:  LEA DX,ID_ERROR_MSG
            MOV AH,09H
            INT 21H
            JMP ID_PROMPT
             
;To display Enter your Password: message            
PASS_PROMPT:LEA DX,PASS_MSG
            MOV AH,09H
            INT 21H
            
            
Pass_INPUT: CALL   scan_num  ;password that will be stored in cl
            CMP    CL,0FH
            JG     Long ;Jump if Above or Equal
            MOV    BH,00H
            MOV    DL,Password[BX]
            CMP    CL,DL
            JE     CORRECT ;Jump equal
           
            
INCORRECT:  MOV AL, 0    ; Set AL to 0 to represent "denied"
            JMP INCORRECTMSG
            
            
CORRECT:   MOV  AL, 1    ; Set AL to 1 to represent "Access"
           JMP  CORRECTMSG
             
            
INCORRECTMSG:LEA DX,PASS_ERROR_MSG
             MOV AH,09H
             INT 21H
             JMP ID_PROMPT 
          
CORRECTMSG: LEA DX,Allowed_MSG
            MOV AH,09H
            INT 21H
            JMP Finish                                  
                        

Long:       LEA DX,LONG_MSG
            MOV AH,09H
            INT 21H
            JMP PASS_PROMPT
            

DEFINE_SCAN_NUM
DEFINE_GET_STRING
Finish:        
END MAIN        
        
    
     