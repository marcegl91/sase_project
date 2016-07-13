# Arithmetic Logic Module
Implementa distintas operaciones que trabajan sobre dos operandos de 16 bits.

Exceptuando el divisor todas las operaciones están implementadas con lógica combinacional, por lo que los resultados son inmediatos.

## Interfaz
Cuatro registros de 16 bits:
* 0: `D0` (w)
* 1: `D1` (w)
* 2: `OP` (w)
* 3: `OUT` (r)

Los registros de escritura mantienen sus valores hasta ser explícitamente sobreescritos.

## Operaciones

### Bit a bit
| Código (`OP`)	| Descripción 	| Resultado (`OUT`) 			|
|---------------|---------------|-------------------------------|
|0				| AND			| `D0 & D1`						|
|1				| OR			| `D0 | D1`						|
|2				| NOT			| `~D0`							|
|3				| NAND			| `~(D0 & D1)`					|
|4				| XOR			| `D0 ^ D1`						|
|5				| NOR			| `~(D0 | D1)`					|
|6				| XNOR			| `~(D0 ^ D1)`					|
|7				| BITSEL		| `D0[D1]` 						|
|8				| MERGE_H		| `{D1[15:8], D0[15:8]}` 		|
|9				| MERGE_L		| `{D1[7:0], D0[7:0]}`			|
|10				| MERGE_HL		| `{D1[15:8], D0[7:0]}`			|
|11				| MERGE_LH		| `{D1[7:0], D0[15:8]}`			|
|12				| SWAP_HL		| `{D0[7:0], D0[15:8]}`			|

### Aritméticas
| Código (`OP`)	| Descripción 	| Resultado (`OUT`) 		|
|---------------|---------------|---------------------------|
|13				| MULT			| `D0[7:0] * D1[7:0]`		|
|14				| DIV			| `D0 / D1`					|
|15				| DIV_REM		| `D0 % D1`					|
