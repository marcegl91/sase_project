Polling1: IN 8,d
CMP @0,d
BEQ Polling1
IN 4,a
OUT 8,@0
OUT @0,a
Polling2: IN 8,d
CMP d,@0
BEQ Polling2
IN 4,b
OUT 8,@0
OUT @0,b
Begin: MOV @0,c
MOV @0,i
While: CMP i,b
BEQ End
ADD a,c
ADD @1,i
CMP a,a
BEQ While
End: OUT @0,c
CMP c,c
BEQ End
