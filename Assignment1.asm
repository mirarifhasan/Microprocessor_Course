L SEGMENT PARA PUBLIC 'CODE'
ASSUME CS: L
ORG 1000H

START:
;control register on
MOV AL,80H
OUT 1FH,AL

;diplay 5
MOV AL,092H
OUT 19H,AL

;for delay
	MOV CX,0FFFFH
	L1:LOOP L1
;for delay
	MOV CX,0FFFFH
	L2:LOOP L2
;for delay
	MOV CX,0FFFFH
	L3:LOOP L3
;for delay
	MOV CX,0FFFFH
	L4:LOOP L4
;for delay
	MOV CX,0FFFFH
	L5:LOOP L5

;display F
MOV AL,08EH
OUT 19H,AL

;for delay
	MOV CX,0FFFFH
	L6:LOOP L6
;for delay
	MOV CX,0FFFFH
	L7:LOOP L7
;for delay
	MOV CX,0FFFFH
	L8:LOOP L8
;for delay
	MOV CX,0FFFFH
	L9:LOOP L9
;for delay
	MOV CX,0FFFFH
	L10:LOOP L10

;display 4
MOV AL,099H
OUT 19H,AL

L ENDS
END START
