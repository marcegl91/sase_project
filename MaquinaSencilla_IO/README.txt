# Máquina Sencilla

## Con soporte de:
OUT de LEDS (DEVICE DIR 000 | REGISTER SELECTED 00)
IN de SWITCHES (DEVICE DIR 001 | REGISTER SELECTED 00)
IN/OUT de BTNS (DEVICE DIR 010 | REGISTER SELECTED 00)

## OP
P = (DEVICE_DIR|REG_SEL)
D = DEST
S = SRC
A = ADDR

IN:   1110 PPPPP DDDDDDD
OUT:  1111 PPPPP SSSSSSS
BEQ:  1100 0XXXX AAAAAAA
CALL: 1100 10XXX AAAAAAA
RET:  1100 11XXX XXXXXXX

## Mecanismo de entrada de datos, por software
Polling del botón BTNS hasta que tenga valor 1.
Una vez que tiene valor 1, leer switches.
Poner 0 en registro de control de BTNS.

## Detalles de implementación
- Lectura de archivos de entrada en RAM.v
- Controlador de Botón:
	- Dos registros, uno del valor actual del botón y otro 
	para el cálculo	del próximo valor.
	- El segundo registro tiene como clock el valor actual 
	del botón y como reset asincrónico el write_enable de la MS.
	- Es decir, el valor actual se pone en 1 en el posedge del botón,
	y se pone en 0 cuando se activa el write_enable.
 

## Ensambladores
- TODO Emi y Fran
Instrucciones soportadas por el ensamblador (EMI)
P = (DEVICE_DIR|REG_SEL)
D = DEST
S = SRC
A = ADDR

ADD S,D => [D]=[S]+[D],Z=([S]+[D])==0  - Suma S+D y lo almacena en D, Si S+D=0 entonces flag Z es 1 si no flag Z=0
CMP S,D => Z=([S]+[D])==0          - Si S+D=0 , entonces el flag Z=1 si no flag Z = 0
MOV S,D => [D]=[S]                 - Mueve lo que esta en la posicion de memoria S a la posicion D
IN P,D  => D=[P]		   - Mueve a la posicion de memoria D lo que esta en el puerto P
OUT P,S => [P]=S                   - Mueve al puerto P lo que esta en la memoria en la posicion S 
BEQ D   => si Z==1 => PC=[D]       - salta si el flag Z esta activo
CALL D  => [reg]=PC, PC=D, reg-1   - llama a una funcion
RET	=> reg+1, PC=[reg]         - retorna de un call
JMP D   =>PC=[D]                   - salta a la posicion D
LEA "TAG",D  => [D]="TAG"          - Carga la direccion en que se encuentra la etiqueta,variable o constante "TAG" en la                                    posicion D       
DW xxxxxx                          -Define un word de 16 bits en esa posicion (el numero ingresado debe ser decimal)
LABEL:                             -Define una etiqueta

Soporta uso de variables y constantes

Ejemplos
*******************
* Instruccion MOV *
*******************
MOV a,1  -> Mueve algo de la "variable" a a la posicion 1
MOV 1,a  -> Mueve algo de la posicion 1 a la variable a
MOV @10,a  -> Mueve una constante a la variable a
MOV @10,1  -> Mueve una constante a la posicion de memoria 1                        

*******************
* Instruccion ADD *
*******************
ADD a,b -> Suma la variable a con b y lo guarda en b 
ADD a,1 -> Suma la posicion 1 con a y lo guarda en la posicion 1
ADD 1,a -> Suma la variable a con 1 y lo guarda en la variable a 
ADD @1,a -> Suma la variable a con la constante y lo guarda en la variable a

*******************
* Instruccion CMP *
*******************
CMP es analogo a ADD salvo que solo altera los flags

*******************
* Instruccion BEQ *
*******************
BEQ 1     -> si la comparacion FZ=1 salta a la posicion 1
BEQ LABEL -> si la comparacion FZ=1 salta a la etiqueta LABEL

**********************
* Instruccion IN/OUT *
**********************
IN puerto,10 -> mueve lo del puerto a la posicion de memoria 10
IN puerto,a  -> mueve lo del puerto a la variable a
OUT puerto,10 -> mueve lo de la posicion de memoria 10 al puerto
OUT puerto,a  -> mueve lo de la variable al puerto

********************
* Instruccion CALL *
********************
CALL LABEL -> Salta a la etiqueta LABEL
CALL a -> Salta a la posicion de la variable a (peligroso si es involuntario)
CALL 100 -> Salta a la posicion 100  (valor absoluto)

********************
* Instruccion LEA *
********************
LEA LABEL,A -> Carga la posicion de la etiqueta LABEL en A
LEA b,A     -> Carga la posicion de la variable b en A 
LEA @100,A  -> Carga la posicion de la constante 100 a A

*********************************************************************
* IMPORTANTE: SI UNA VARIABLE TIENE EL MISMO NOMBRE QUE UNA ETIQUETA*
* LA VARIABLE EQUIVALDRA A LO MISMO QUE APUNTE LA ETIQUETA          *
*********************************************************************
