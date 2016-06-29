ASEGURENSE QUE EL CS DE ESTE DISPOSITIVO ESTE ACTIVADO
EL SHIFTER ACEPTA SHIFTS ENTRE 0 y 15

el dispositivo siempre tiene en la salida el valor del shifterXX que se este mirando, solo se puede escribir en
-shifter00, la informacion del shift, con la direccion del shift en el bit mas significativo y la cantidad de shifts en
los 4 bits menos significativos
-shifter01, el numero a shiftear
se empieza a shiftear ni bien se pasa ver el shifter11 donde tengo el registro ready, cuando este sea 1 puedo ver el valor
resultante en shifter10



OUT shifter00 dxxxxxxxxxxxssss // d = 0 (shift left), d = 1 (shift right), ssss = (cantidad de shifts)
OUT shifter01 vvvvvvvvvvvvvvvv // vvvvvvvvvvvvvvvv (valor a shiftear)
in shifter11
ciclo:CMP shifter11 0
JZ ciclo
in shifter10