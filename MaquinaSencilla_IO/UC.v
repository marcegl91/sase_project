`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2016 12:01:03
// Design Name: 
// Module Name: UC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UC(
    input clk,
    input reset,
    input c3, c2, c1, c0, c5, c4, fz,
    output reg [14:0] out
    );
    
    reg [4:0] estado_actual; 
    reg [4:0] estado_futuro;
    
    initial
        begin
        estado_actual = 5'd0;
        out = 15'b000_00xx01100000;
        end
    
    always@*
        begin
            case(estado_actual)
                0: out =  15'b000_00xx01100000; 
                1: out =  15'b000_xxxx00000000;
                2: out =  15'b000_10xx00001000; 
                6: out =  15'b000_11xx00010000; 
                7: out =  15'b000_110010000100; 
                9: out =  15'b000_xx0100000100; 
                10: out = 15'b000_111010000100; 
                11: out = 15'b000_11xx01100000; 
                14: out = 15'b000_111010000010; // IN
                15: out = 15'b000_111000000101; // OUT
                16: out = 15'b010_xxxx00000000;
                17: out = 15'b100_01xx10000000;
                18: out = 15'b011_01xx00100000;
                
                default: out = 15'dx;
             endcase   
        end
        	
    always@(posedge clk)
    	if (reset)
    		estado_actual <= 5'd0;
    	else
        	estado_actual <= estado_futuro;                

    always@*
        begin
            // IN:  1110
            // OUT: 1111
            // BEQ: 1100
            casex({estado_actual, c1, c0, fz, c3, c2, c5, c4})
             // 0
             12'b00000_xxx_xx_xx: estado_futuro = 5'd1;
             // 1
             12'b00001_0xx_xx_xx: estado_futuro = 5'd2;
             12'b00001_x0x_xx_xx: estado_futuro = 5'd2;
             12'b00001_111_00_0x: estado_futuro = 5'd11; // Branch
             12'b00001_110_00_0x: estado_futuro = 5'd0; // No branch
             12'b00001_11x_10_xx: estado_futuro = 5'd14;
             12'b00001_11x_11_xx: estado_futuro = 5'd15; 
             12'b00001_11x_00_1x: estado_futuro = 5'd2; // call & ret
             //2
             12'b00010_0xx_xx_xx: estado_futuro = 5'd6;
             12'b00010_10x_xx_xx: estado_futuro = 5'd10;
             12'b00010_11x_00_10: estado_futuro = 5'd16; // call_1
             12'b00010_11x_00_11: estado_futuro = 5'd18; // ret
             //6             
             12'b00110_x0x_xx_xx: estado_futuro = 5'd7;
             12'b00110_x1x_xx_xx: estado_futuro = 5'd9;
             //7
             12'b00111_xxx_xx_xx: estado_futuro = 5'd0;
             //9
             12'b01001_xxx_xx_xx: estado_futuro = 5'd0;
             //10
             12'b01010_xxx_xx_xx: estado_futuro = 5'd0;
             //11
             12'b01011_xxx_xx_xx: estado_futuro = 5'd1;             
             //14
             12'b01110_xx_xx_x_xx: estado_futuro = 5'd0; 
             //15
             12'b01111_xx_xx_x_xx: estado_futuro = 5'd0; 
             //16 (call_1)
             12'b10000_xxx_xx_xx: estado_futuro = 5'd17;
             //17 (call_2)
             12'b10001_xxx_xx_xx: estado_futuro = 5'd11;
             //18 (ret)
             12'b10010_xxx_xx_xx: estado_futuro = 5'd11;
             default: estado_futuro = estado_actual;
             endcase
        end
        
endmodule