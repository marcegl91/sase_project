; fibonacci(n) = 0-1-1-2-3-5-8-13-21-34...
; 8 == BTNS
; 4 == SWITCHES
; 0 == LEDS
; 15 == MEMORIA
;Polling del valor n del algoritmo, supongo n >= 0 fib(0)=0
Pollingn: IN 8,d
CMP @0,d
BEQ Pollingn
IN 4,n
OUT 8,@0

;inicializo i
MOV @0,i

;pongo el lugar a de memoria en 0 y lo mando para afuera, despues miro, n = i => end
MOV @0, a
OUT 15,a
CMP i,n
BEQ End
ADD @1,i

;pongo el lugar b de memoria en 1 y lo mando para afuera, despues miro, n = i => end
MOV @0,b
OUT 15,b
CMP i,n
BEQ End
ADD @1,i

;sumo a con b y saco el resultado
DoWhile:
ADD a,b
OUT 15,a

;veo si llegue al numero deseado
CMP i,n
BEQ End
ADD @1,i

;ordeno para que sirvan en la proxima iteracion
MOV b,c
MOV a,b
MOV c,a
CMP a,a
BEQ DoWhile

End: OUT 0,a
CMP c,c
BEQ End
