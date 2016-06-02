Polling1: IN btn_s,d
CMP cte0,d
BEQ Polling1
IN swt,a
OUT btn_s,cte0
OUT led,a
Polling2: IN btn_s,d
CMP d,cte0
BEQ Polling2
IN swt,b
OUT btn_s,cte0
OUT led,b
Begin: MOV cte0,c
MOV cte0,i
While: CMP i,b
BEQ End
ADD a,c
ADD cte1,i
CMP a,a
BEQ While
End: OUT led,c
CMP c,c
BEQ End
cte0:0
cte1:1
a:0
b:0
c:0
d:0
i:0
