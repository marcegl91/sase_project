M�quina Sencilla con soporte de:
OUT de LEDS (DEVICE DIR 000 | REGISTER SELECTED 00)
IN de SWITCHES (DEVICE DIR 001 | REGISTER SELECTED 00)
IN/OUT de BTNS (DEVICE DIR 010 | REGISTER SELECTED 00)

OP:
IN:  1110 (DEVICE_DIR|REG_SEL) | DESTINY
OUT: 1111 (DEVICE_DIR|REG_SEL) | SOURCE
BEQ: 1100 XXXXXXXXXXXXXXXXXXXX | DIR

Mecanismo de entrada de datos, por software:
Polling del bot�n BTNS hasta que tenga valor 1.
Una vez que tiene valor 1, leer switches.
Poner 0 en registro de control de BTNS.

Detalles de implementaci�n:
- Lectura de archivos de entrada en RAM.v
- Controlador de Bot�n:
	- Dos registros, uno del valor actual del bot�n y otro 
	para el c�lculo	del pr�ximo valor.
	- El segundo registro tiene como clock el valor actual 
	del bot�n y como reset asincr�nico el write_enable de la MS.
	- Es decir, el valor actual se pone en 1 en el posedge del bot�n,
	y se pone en 0 cuando se activa el write_enable.
 

Ensambladores:
- TODO Emi y Fran