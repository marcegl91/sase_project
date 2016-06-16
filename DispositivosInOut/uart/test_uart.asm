OUT 5, @0
Loop1:IN 7, a
CMP a, @1
OUT 0, a
BEQ Loop1
IN 5, b
ADD @1, b
OUT 0, b
OUT 4, b
Loop2: IN 7, a
CMP a, @1
BEQ Loop2
IN 5, b
ADD @1, b
OUT 0, b
OUT 4, b
CMP a, a
BEQ Loop2
