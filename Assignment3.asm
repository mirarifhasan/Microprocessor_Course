S SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:S
ORG 1000H

START:
MOV AL,80H
OUT 1FH,AL

MOV BX,03H

MOV SI,OFFSET DATA
L1:MOV AL,BYTE PTR CS:[SI]
OUT 19H,AL

MOV CX,0FFFFH
L2:LOOP L2


MOV CX,0FFFFH
L3:LOOP L3


MOV CX,0FFFFH
L4:LOOP L4

INC SI
DEC BX
CMP BX,0H
JE END
JMP L1

DATA:

DB 092H
DB 08EH
DB 099H


END:
S ENDS
END START

DATA 