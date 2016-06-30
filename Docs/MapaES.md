# Mapa de Entrada/Salida
Las direcciones de entrada/salida son de 5 bits de ancho y tienen la forma `[d3, d2, d1, r1, r0]`, donde los 3 bits más significativos identifican un dispositivo y los 2 menos significativos seleccionan un registro dentro de él.

| Dirección		| Dispositivo	| `Reg. 0`| `Reg. 1` | `Reg. 2` | `Reg. 3` | Observaciones |
| --------------|---------------|---------|----------|----------|----------|---------------|
| 0	| ... | | | | | | |
| 1	| ... | | | | | | |
| 2	| Shifter |`op`(w) [¬l/r, x10, #shifts] | `value`(w) | `data_out`(r)  | `ready`(r) | | 
| 3	| UART		| `tx_data`(w)	| `tx_data`(r)/`reset`(w) | `tx_full`(r) | `rx_empty`(r) | Opera con los 8 bits *menos* significativos|
| 4	| 7 Segmentos | `7seg_data`(w) | | | | | |
| 5	| Botones |`btnU`(r) | `btnD`(r) | `btnL`(r) | `btnR`(r) | Expande con ceros |
| 6	| Switches	| `swt_data`(r) | | |
| 7	| LEDs		| `led_data`(w) | | | |
|   | Timer | `rounds`(r) | `prescaler`(r) | `start`(w) | `done`(r) | Ver `Docs/timer-calc.html` para el cálculo de tiempos |

