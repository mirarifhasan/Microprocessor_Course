s SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:s
ORG 1000H

START:
    ;TURN ON CONTROL REGISTER
    MOV AL, 080H
    OUT 1FH,AL
    OUT 1EH,AL
    ;LOOP CONTROL VARIABLE
    MOV BL,0
    
    ;SHOWING OUTPUTS

    ;SSD GREEN
    MOV AL,0C2H
    OUT 19H,AL

    ;DOT MATRIX
    MOV SI,OFFSET DATA      
L1: MOV AL,BYTE PTR CS:[SI] 
    ;PORT A
    OUT 18H,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT B
    OUT 1AH,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT C
    OUT 1CH,AL
    ;DELAY
    MOV CX,0EFFFH
    L2:LOOP L2

    ;INCREMENT
    INC SI
    INC BL

    ;CHECKING FOR SSD
    CMP BL,002H
    JE SSDO
    CMP BL,005H
    JE SSDR
    CMP BL,007H
    JE SSDG
	
	
    CMP BL,00CH
    JE LED
DELAY:
    MOV CX,0001H
    L8:LOOP L8
    MOV CX,0001H
    L6:LOOP L6
    JMP L1

;SSD CHANGES
SSDG:
    MOV AL,0C2H
    OUT 19H,AL
    JMP DELAY
SSDO:
    MOV AL,0C0H
    OUT 19H,AL
    JMP DELAY
SSDR:
    MOV AL,088H
    OUT 19H,AL
    JMP DELAY
   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LED:
   MOV BL,0

   MOV SI,OFFSET DATA      
L77: MOV AL,BYTE PTR CS:[SI] 
    ;PORT A
    OUT 18H,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT B
    OUT 1AH,AL
    INC SI
    MOV AL,BYTE PTR CS:[SI] 
    ;PORT C
    OUT 1CH,AL
    ;DELAY

    ;INCREMENT
    INC SI
    INC BL

    ;CHECKING FOR SSD
    CMP BL,002H
    JE SSDO1
    CMP BL,005H
    JE SSDR1
    CMP BL,007H
    JE SSDG1

    ;CHECKING FOR LOOP TERMINATION
   CMP BL,00CH
    JE LED
DELAY1:
 ;   MOV CX,0001H
 ;   L8:LOOP L8
  ;  MOV CX,0001H
  ;  L6:LOOP L6
    JMP L77

;SSD CHANGES
SSDG1:
   ; MOV AL,0C2H
  ;  OUT 19H,AL
   JMP DELAY1
SSDO1:
   ; MOV AL,0C0H
   ; OUT 19H,AL
    JMP DELAY1
SSDR1:
   ; MOV AL,088H
   ; OUT 19H,AL
    JMP DELAY1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DATA:
;r5,c0(green) 
DB 0DFH
DB 0FFH
DB 001H

;r6,c1(green) 
DB 0BFH
DB 0FFH
DB 002H

;R7(ORANGE)
;C2
DB 07FH
DB 07FH
DB 004H

;C3
DB 07FH
DB 07FH
DB 008H

;C4
DB 07FH
DB 07FH
DB 010H

;R6,C5(RED)
DB 0FFH
DB 0BFH
DB 020H

;R5,C6(RED)
DB 0FFH
DB 0DFH
DB 040H

;R5(GREEN)
;C5
DB 0DFH
DB 0FFH
DB 020H

;C4
DB 0DFH
DB 0FFH
DB 010H

;C3
DB 0DFH
DB 0FFH
DB 008H
;C2
DB 0DFH
DB 0FFH
DB 004H
;C1
DB 0DFH
DB 0FFH
DB 002H
    
PL:
	s ENDS
	END START