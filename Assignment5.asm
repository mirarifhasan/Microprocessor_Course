; Write an assembly code to glow dots on Dot Matrix Display scroll  having C0(Orange)-R2(Green)-C4(Red)
DOT12 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:DOT12
ORG 1000H

START:
    ;TURN ON CONTROL REGISTER
    MOV AL, 080H
    OUT 1EH,AL
    
    ;LOOP CONTROL VARIABLE
    MOV BL,0
    
    ;SHOWING OUTPUTS
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
    CMP BL,018H
    JE PL
    MOV CX,0001H
    L8:LOOP L8
     MOV CX,0001H
    L6:LOOP L6
    JMP L1
    
    DATA:
    ;C0(orange)
		DB 07FH
		DB 07FH	
		DB 001H
		
		DB 0BFH
		DB 0BFH	
		DB 001H 
		
		DB 0DFH
		DB 0DFH	
		DB 001H 
		    
		DB 0EFH
		DB 0EFH	
		DB 001H

		DB 0F7H
		DB 0F7H	
		DB 001H
		
		DB 0FBH
		DB 0FBH	
		DB 001H 
		
		DB 0FDH
		DB 0FDH	
		DB 001H
		
		DB 0FEH
		DB 0FEH	
		DB 001H
	;R2(Green)
		DB 0FBH
		DB 0FFH	
		DB 001H 
		
		DB 0FBH
		DB 0FFH	
		DB 002H 
		
		DB 0FBH
		DB 0FFH	
		DB 004H 
		
		DB 0FBH
		DB 0FFH		
		DB 008H 
		
		DB 0FBH
		DB 0FFH	
		DB 010H 
		
		DB 0FBH
		DB 0FFH	
		DB 020H 
		
		DB 0FBH
		DB 0FFH	
		DB 040H 
		
		DB 0FBH
		DB 0FFH	
		DB 080H 
	;C4(Red)
		DB 0FFH
		DB 07FH
		DB 010H 
		
		DB 0FFH
		DB 0BFH 
		DB 010H
		
		DB 0FFH
		DB 0DFH
		DB 010H
		
		DB 0FFH
		DB 0EFH 
		DB 010H
		
		DB 0FFH
		DB 0F7H
		DB 010H
		
		DB 0FFH
		DB 0FBH
		DB 010H
		
		DB 0FFH
		DB 0FDH
		DB 010H
		
		DB 0FFH
		DB 0FEH
		DB 010H
    
    
    
    PL:
DOT12 ENDS
END START