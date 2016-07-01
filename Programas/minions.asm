;CODIGO: 28-16-16 lineas de codigo (asumiendo que valen dos)
;CONSTANTES: OFFSET_Z, OFFSET_IP, OFFSET_DIR_DISP, 0, 1, CODIGO_ADD, CODIGO_CMP, CODIGO_MOV, CODIGO_BEQ, LIMITE_INSTRUCCIONES
;TOTAL: 28-16-9-16-14-1-3-5 = 93 (de 128)

;NOTA: CODIGO_ADD, CODIGO_CMP, CODIGO_MOV, CODIGO_BEQ (son de 4)
; == INIT ==
;REQUIERE que los dos programas sean validos y estén cargados en memoria


; == FETCH ==
fetch: OUT [PCB_PTR_actual-OFFSET_DIR_DISP], dir, [PCB_PTR_actual-OFFSET_IP]
	   IN [PCB_PTR_actual-OFFSET_DIR_DISP], data, instruccion_actual

; == DECODE/PARSER ==
CMP instruccion_actual, FIRMA_END ;1100111111...
BEQ finalizar_programa
OUT disp_parser, data, instruccion_actual
IN disp_parser, codigo_operacion, codigoOp
IN disp_parser, dir_a, direccion_a
IN disp_parser, dir_b, direccion_b

OUT [PCB_PTR_actual-OFFSET_DIR_DISP], dir, direccion_a 
OUT [PCB_PTR_actual-OFFSET_DIR_DISP], data, a 

OUT [PCB_PTR_actual-OFFSET_DIR_DISP], dir, direccion_b 
OUT [PCB_PTR_actual-OFFSET_DIR_DISP], data, b

; == EXECUTE ==
INC [PCB_PTR_actual-OFFSET_IP] ;Incremento el IP

CMP codigoOp, CODIGO_BEQ
BEQ beq

MOV 0,[PCB_PTR_actual-OFFSET_Z] ;Pongo el Z en cero para la siguiente instruccion


;Case para ver si es ADD/CMP/MOV
CMP codigoOp, CODIGO_ADD
BEQ add
CMP codigoOp, CODIGO_CMP
BEQ cmp
CMP codigoOp, CODIGO_IN
BEQ in
CMP codigoOp, CODIGO_OUT
BEQ out

mov: MOV a, b 
     BEQ fin_exec
	 MOV 1,[PCB_PTR_actual-OFFSET_Z]
     JMP fin_exec

add: ADD a, b 
     BEQ fin_exec
	 MOV 1,[PCB_PTR_actual-OFFSET_Z]
     JMP fin_exec	 

cmp: CMP a, b 
     BEQ fin_exec
	 MOV 1,[PCB_PTR_actual-OFFSET_Z]
     JMP fin_exec	 	 

beq: CMP [PCB_PTR_actual-OFFSET_Z], 0 ;If z = 0. OJO que no quede abajo del cero
     BEQ schedule
	 MOV b, [PCB_PTR_actual-OFFSET_IP]
	 JMP schedule

fin_exec: OUT [PCB_PTR_actual-OFFSET_DIR_DISP], dir, dirOpB ;Hay que tener dirOpB guardada
          OUT [PCB_PTR_actual-OFFSET_DIR_DISP], data, b
		  
; == SCHEDULE ==
schedule: INC cantidad_instrucciones
		  CMP cantidad_instrucciones, LIMITE_INSTRUCCIONES
		  BEQ cambiar_programa
		  JMP fetch

cambiar_programa: MOV 0, cantidad_instrucciones
				  MOV [PCB_PTR_actual-OFFSET_NEXT_PCB], PCB_PTR_actual
		          JMP fetch

finalizar_programa: CMP [PCB_PTR_actual-OFFSET_NEXT_PCB], [PCB_PTR_actual-OFFSET_PREV_PCB]
                    BEQ terminamos
					MOV [PCB_PTR_actual-OFFSET_NEXT_PCB], [PCB_PTR_actual-OFFSET_PREV_PCB]

terminamos: ;prender LEDS

;CONSTANTES
OFFSET_PREV_PCB: DW 0 ;TODO: OPTIMIZAR
OFFSET_NEXT_PCB: DW 1 
OFFSET_Z: DW 2
OFFSET_IP: DW 3
OFFSET_DIR_DISP: DW 4

CODIGO_ADD: DW 0000000000000000
CODIGO_CMP: DW 0000000000000100
CODIGO_MOV: DW 0000000000001000
CODIGO_BEQ: DW 0000000000001100
CODIGO_IN: DW 0000000000001110
CODIGO_OUT: DW 0000000000001111
LIMITE_INSTRUCCIONES: DW 0000000000000101
;0
;1

PCB_PTR_actual: DW FFFFFF
cantidad_instrucciones: DW 0

;a: DW 0
;b: DW 0
;direccion_a: DW 0
;direccion_b: DW 0

;Estas son las dos PCB de las memorias 100 y 101
DW 101 ; OFFSET_DIR_DISP
DW 0; OFFSET_IP
DW 0;OFFSET_Z
DW progA;OFFSET_NEXT_PCB
progB: DW progA;OFFSET_PREV_PCB

DW 100 ;OFFSET_DIR_DISP
DW 0 ;OFFSET_IP
DW 0 ;OFFSET_Z
DW progB;OFFSET_NEXT_PCB
progA: DW progB; OFFSET_PREV_PCB

