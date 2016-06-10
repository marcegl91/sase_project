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
BEQ:  1100 00XXX AAAAAAA
NEG:  1100 01XXX AAAAAAA
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
Ver README del Ensamblador
