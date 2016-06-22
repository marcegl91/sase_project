ASEGURENSE QUE EL CS DE ESTE DISPOSITIVO ESTE ACTIVADO
el dispositivo siempre tiene en la salida el valor del shifterXX que se este mirando, solo se puede escribir en
-shifter00, la informacion del shift, con la direccion del shift en el bit mas significativo y la cantidad de shifts -1 en
los 4 bits menos significativos, si quiero hacer 7 shift left debo escribir 0xxxxxxxxxxx0110
-shifter01, el numero a shiftear
se empieza a shiftear ni bien se pasa ver el shifter11 donde tengo el registro ready, cuando este sea 1 puedo ver el valor
resultante en shifter10

no existe shift 0, siempre se shiftea por lo menos una vez
//Shift left 8 de un valor
OUT shifter00 dxxxxxxxxxxxssss // d=0(shift left) s=0111 (siempre es 1 menos de lo que es)
OUT shifter01 vvvvvvvvvvvvvvvv
IN shifter11
ciclo:comparar shifter11 con 0
es 0? saltar a ciclo
in shifter10


OUT shifter00 xxxxxxxxxxxxxxxx
OUT shifter01 xxxxxxxxxxxxxxxx
in shifter11
ciclo:cMP shifter11 0
JZ ciclo
in shifter10