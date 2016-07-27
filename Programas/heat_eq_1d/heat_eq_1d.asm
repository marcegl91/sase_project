; Reinicio la UART
OUT UART_RX,@0 

; Inicialización...
MOV @150,N ; Número de iteraciones para converger
MOV @149,NMin1 ; Número de iteraciones para converger
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
			; Si terminé de iterar voy al final de la subiteración
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

						EsperaUART1:
						  IN UART_FULL,a
						  CMP a,@1
						  BEQ EsperaUART1
						
						OUT UART_TX,res
						
						EsperaUART2:
						  IN UART_FULL,a
						  CMP a,@1
						  BEQ EsperaUART2
						
						OUT SSEG,res
						SHIFTR res,@8
						OUT UART_TX,res
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

EndProgram:
	JMP EndProgram

Data:	DW 32767
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
	


