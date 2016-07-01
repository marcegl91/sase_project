;TODO: FALTA IMPLEMENTAR IN y OUT

; == INIT ==
;REQUIERE que los dos programas sean validos y estén cargados en memoria

; == FETCH ==
fetch: OUT [PCB_PTR_actual], dir, [PCB_PTR_actual+OFFSET_IP]; OUT [PCB_PTR_actual+OFFSET_DIR_DISP], dir, [PCB_PTR_actual+OFFSET_IP]
IN [PCB_PTR_actual], data, temp_a ; IN [PCB_PTR_actual+OFFSET_DIR_DISP], data, instruccion_actual

; == DECODE/PARSER ==
CMP temp_a, FIRMA_END ;CMP instruccion_actual, FIRMA_END
BEQ finalizar_programa

OUT disp_parser, data, temp_a;OUT disp_parser, data, instruccion_actual

IN disp_parser, dir_a, temp_a ;IN disp_parser, dir_a, direccion_a
OUT [PCB_PTR_actual], dir, temp_a ;OUT [PCB_PTR_actual+OFFSET_DIR_DISP], dir, direccion_a 
OUT [PCB_PTR_actual], data, a ;OUT [PCB_PTR_actual+OFFSET_DIR_DISP], data, a

;Aca no uso temp_a (y uso direccion_b) porque a direccion_b la voy a necesitar mas adelante igual
IN disp_parser, dir_b, direccion_b  ;IN disp_parser, dir_b, direccion_b
OUT [PCB_PTR_actual], dir, direccion_b ;OUT [PCB_PTR_actual+OFFSET_DIR_DISP], dir, direccion_b 
OUT [PCB_PTR_actual], data, b; OUT [PCB_PTR_actual+OFFSET_DIR_DISP], data, b

IN disp_parser, codigo_operacion, temp_a ;IN disp_parser, codigo_operacion, codigoOp

; == EXECUTE ==
INC [PCB_PTR_actual+OFFSET_IP] ;Incremento el IP

CMP temp_a, CODIGO_BEQ ;CMP codigoOp, CODIGO_BEQ
BEQ beq

MOV CERO, [PCB_PTR_actual+OFFSET_Z] ;Pongo el Z en cero para la siguiente instruccion

;Case para ver si es ADD/CMP/MOV
CMP temp_a, CERO ;CMP codigoOp, CODIGO_ADD
BEQ add
CMP temp_a, CODIGO_CMP ;CMP codigoOp, CODIGO_CMP
BEQ cmp
;CMP temp_a, CODIGO_IN ;CMP codigoOp, CODIGO_IN
;BEQ in
;CMP temp_a, CODIGO_OUT ;CMP codigoOp, CODIGO_OUT
;BEQ out

mov: MOV a, b 
     BEQ fin_exec
	 MOV UNO,[PCB_PTR_actual+OFFSET_Z]
     JMP fin_exec

add: ADD a, b 
     BEQ fin_exec
	 MOV UNO,[PCB_PTR_actual+OFFSET_Z]
     JMP fin_exec	 

cmp: CMP a, b 
     BEQ fin_exec
	 MOV UNO,[PCB_PTR_actual+OFFSET_Z]
     JMP fin_exec	 	 

beq: CMP [PCB_PTR_actual+OFFSET_Z], CERO 
     BEQ schedule
	 MOV b, [PCB_PTR_actual+OFFSET_IP]
	 JMP schedule

fin_exec: OUT [PCB_PTR_actual], dir, direccion_b; OUT [PCB_PTR_actual+OFFSET_DIR_DISP], dir, direccion_b
          OUT [PCB_PTR_actual], data, b ;OUT [PCB_PTR_actual+OFFSET_DIR_DISP], data, b
		  
; == SCHEDULE ==
schedule: INC cantidad_instrucciones
		  CMP cantidad_instrucciones, LIMITE_INSTRUCCIONES
		  BEQ cambiar_programa
		  JMP fetch

cambiar_programa: MOV CERO, cantidad_instrucciones
				  MOV [PCB_PTR_actual+OFFSET_NEXT_PCB], PCB_PTR_actual
		          JMP fetch

finalizar_programa: CMP [PCB_PTR_actual+OFFSET_NEXT_PCB], [PCB_PTR_actual+OFFSET_PREV_PCB]
                    BEQ terminamos
					MOV [PCB_PTR_actual+OFFSET_NEXT_PCB], [PCB_PTR_actual+OFFSET_PREV_PCB]

terminamos: ;prender LEDS

;Solo MOV soporta indirecciones
;OUT no soporta tres operandos

;CONSTANTES
;CONSTANTES
OFFSET_PREV_PCB: DW 4
OFFSET_NEXT_PCB: DW 3 
OFFSET_Z: DW 2
OFFSET_IP: DW 1
;OFFSET_DIR_DISP: DW 0 ;CONSTANTE DE FANTASIA

LIMITE_INSTRUCCIONES: DW 5
CERO: DW 0 ;0000000000000000 (tambien es CODIGO_ADD)
UNO: DW 1

FIRMA_END: DW 53247 ;1100111111111111

CODIGO_CMP: DW 4 ;0000000000000100
CODIGO_MOV: DW 8 ;0000000000001000
CODIGO_BEQ: DW 12 ;0000000000001100
;CODIGO_IN: DW 14 ;0000000000001110
;CODIGO_OUT: DW 15 ;0000000000001111

;VARIABLES TEMPORALES
temp_a: DW 0

;VARIABLES
PCB_PTR_actual: DW 123
cantidad_instrucciones: DW 0 
a: DW 0
b: DW 0
direccion_b: DW 0;Guardada para devolver el operando a la memoria externa despues de la operacion

;== Estas son las dos PCB de las memorias 5 y 6 ==
DW 5 ; OFFSET_DIR_DISP (dispositivo 5)
DW 0; OFFSET_IP
DW 0;OFFSET_Z
DW 123;OFFSET_NEXT_PCB (linea de ProgA)
DW 123;OFFSET_PREV_PCB (linea de ProgA)
DW 4 ;OFFSET_DIR_DISP (dispositivo 4)
DW 0 ;OFFSET_IP
DW 0 ;OFFSET_Z
DW 118;OFFSET_NEXT_PCB (linea de ProgB)
DW 118; OFFSET_PREV_PCB (linea de ProgB)
