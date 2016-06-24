# Mapa de Entrada/Salida
Las direcciones de entrada/salida son de 5 bits de ancho y tienen la forma `[d3, d2, d1, r1, r0]`, donde los 3 bits más significativos identifican un dispositivo y los 2 menos significativos seleccionan un registro dentro de él.

| Dirección 	| Dispositivo 	| `Reg. 0`| `Reg. 1` | `Reg. 2` | `Reg. 3` | Observaciones |
| ----------	|---------------|---------|----------|----------|----------|---------------|
| x	| LEDs 		| `LED_data`(w)| | | |
| x	| UART		| `Tx_Data`(w)	| `Rx_data`(r)/`Reset`(w) | `Tx_full`(r)| `Rx_empty`(w)| Opera con los 8 bits *menos* significativos|
| x	| Switches	| `SWT_data`(r)| | |
| x	| Botones | | | | | | |
| x	| Shifter | | | | | | |
| x	| 7 Segmentos | | | | | | |
| x	| Bitwise Module | | | | | | |
| x	| ... | | | | | | |