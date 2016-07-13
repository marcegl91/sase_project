# Mapa de Entrada/Salida
Las direcciones de entrada/salida son de 5 bits de ancho y tienen la forma `{d[2:0], r[1:0]}`, donde los 3 bits más significativos identifican un dispositivo y los 2 menos significativos seleccionan un registro dentro de él.

| Dirección	| Dispositivo	| `Reg. 0`| `Reg. 1` | `Reg. 2` | `Reg. 3` | Observaciones |
| ----------|---------------|---------|----------|----------|----------|---------------|
| 0	| ALM 			| `d0`(w) | `d1`(w) |`op`(w) | `out`(r) | Ver `Docs/ALM.md` |
| 1	| Shifter 		| `op`(w) | `value`(w) | `data_out`(r)  | | `op = {{11{x}}, 1'b(¬l/r), 4'b(#shifts)}` |
| 2	| Timer 		| `rounds`(r) `rounds_goal`(w) | `prescaler`(r) `prescaler_goal`(w) | `status`(r) `start`(w) | `done`(r) `reset`(w) | Ver `Docs/timer-calc.html` para el cálculo de tiempos |
| 3	| UART			| `tx_data`(w)	| `rx_data`(r) `reset`(w) | `tx_full`(r) | `rx_empty`(r) | Opera con los 8 bits *menos* significativos|
| 4	| 7 Segmentos 	| `7seg_data`(w) | | | | | |
| 5	| Botones 		| `btnU`(r) | `btnD`(r) | `btnL`(r) | `btnR`(r) | Expande con ceros |
| 6	| Switches		| `swt_data`(r) | | |
| 7	| LEDs			| `led_data`(w) | | | |