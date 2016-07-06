; Reinicio la UART
OUT 5,@0 ; Esta funcion debe seguir estando aquí???

; Inicialización...
MOV @100,N ; Número de iteraciones para converger
MOV @99,NMin1 ; Número de iteraciones para converger
MOV @16,M ; Número total de elementos (16 en total)
MOV @0,k ; Inicializa el contador de iteraciones para convergencia

; Comienza iteración principal
MainIt: CMP k,N
	
	; Si terminé de iterar voy al final del programa
		BEQ EndProgram

	; Inicializo los punteros al comienzo del arreglo
		LEA Data,u_prev_ptr
		LEA Data,u_curr_ptr
		LEA Data,u_next_ptr
		ADD @1,u_curr_ptr
		ADD @2,u_next_ptr

	; Inicializo i
		MOV @2,i

	; Comienza la subiteración
		SubIt: CMP i,M
		BEQ EndSubit

		; Obtengo valores apuntados, u_prev = u(i-1) y u_next = u(i+1)
			MOV [u_prev_ptr],u_prev
			MOV [u_next_ptr],u_next

		; Promedio, u(i) = ( u(i+1) + u(i-1) ) / 2
			MOV u_prev,res
			ADD u_next,res
			SHIFTR res,@1
			MOV res,[u_curr_ptr]

		; Envío u(i) a la uart
			SendUart: CMP k,NMin1
				BEQ SendToUart
				JMP EndSendUart
				SendToUart:
					OUT 12,res
					SHIFTR res,8
					OUT 12,res
			EndSendUart:

		; Incremento subiteración
			INC i

		; Actualizo punteros u(i-1), u(i) y u(i+1)
			INC u_prev_ptr
			INC u_curr_ptr
			INC u_next_ptr

		; Salto al principio del ciclo: SubIt
			JMP SubIt

	EndSubit:

	; Incremento iteración principal
		INC k

	; Salto al principio del ciclo: SubIt
		JMP MainIt

; ; Se envían los datos generados a la PC
; 
; 	; Obtengo el primer puntero, u_curr_ptr = u(1)
; 		LEA Data,u_curr_ptr
; 	
; 	; Inicializo i
; 		MOV @0,i
; 
; 	; Comienza la subiteración
; 		it_uart: CMP i,M
; 		BEQ EndUartIt
; 		
; 		; Obtengo valor apuntado, u(i)
; 			MOV [u_curr_ptr],u
; 
; 		; Envío u(i) a la uart
; 			OUT 12,u
; 			SHIFTR u,8
; 			OUT 12,u
; 
; 		; Incremento subiteración
; 			ADD @1,i
; 
; 		; Actualizo puntero
; 			ADD @1,u_curr_ptr
; 
; 		; Salto al principio del ciclo: SubIt
; 			JMP it_uart
; 
; 	EndUartIt:

EndProgram:
	JMP EndProgram

Data:	DW 65535
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
	DW 0
; VAR:DW MOV @10,0	