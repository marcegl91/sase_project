# Bitwise Module
Implementa operaciones bit a bit.

## Interfaz
Las entradas y la salida son de 16 bits.

### Registros
|Reg. sel.  | Nombre    | Descripción           |
|-----------|-----------|-----------------------|
| 0         | `D0`      | Operando 0            |
| 1         | `D1`      | Operando 1 (opcional) |
| 2         | `OP`      | Código de operación   |
| 3         | `OUT`     | Resultado             |


### Operaciones
| Opcode    | Operación                                 |
|-----------|-------------------------------------------|
|0          | AND                                       |
|1          | OR                                        |
|2          | NOT (`OUT = ~D0`)                         |
|3          | NAND                                      |
|4          | XNOR                                      |
|5          | NOR                                       |
|6          | XNOR                                      |
|7          | BITSEL (`OUT = D0[D1]`, si 0 <= D1 <= 15) |