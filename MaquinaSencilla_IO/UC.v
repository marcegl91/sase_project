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
    input c3, c2, c1, c0, fz,
    output reg [11:0] out
    );
    
    reg [3:0] estado_actual; 
    reg [3:0] estado_futuro;
    
    initial
        begin
        estado_actual = 4'd0;
        out = 12'b00xx01100000;
        end
    
    always@*
        begin
            case(estado_actual)
                0: out = 12'b00xx01100000; 
                1: out = 12'bxxxx00000000;
                2: out = 12'b10xx00001000; 
                6: out = 12'b11xx00010000; 
                7: out = 12'b110010000100; 
                9: out = 12'bxx0100000100; 
                10: out = 12'b111010000100; 
                11: out = 12'b11xx01100000; 
                14: out = 12'b111010000010; // IN
                15: out = 12'b111000000101; // OUT
                
                default: out = 12'dx;
             endcase   
        end
    
    always@(posedge clk)
        estado_actual <= estado_futuro;                

    always@*
        begin
            // IN:  1110
            // OUT: 1111
            // BEQ: 1100
            casex({estado_actual, c1, c0, fz, c3, c2})
             // 0
             9'b0000_xxx_xx: estado_futuro = 4'd1;
             // 1
             9'b0001_0xx_xx: estado_futuro = 4'd2;
             9'b0001_x0x_xx: estado_futuro = 4'd2;
             9'b0001_111_0x: estado_futuro = 4'd11; // Branch
             9'b0001_110_0x: estado_futuro = 4'd0; // No branch
             9'b0001_11x_10: estado_futuro = 4'd14;
             9'b0001_11x_11: estado_futuro = 4'd15;
             //2
             9'b0010_0xx_xx: estado_futuro = 4'd6;
             9'b0010_10x_xx: estado_futuro = 4'd10;
             //6             
             9'b0110_x0x_xx: estado_futuro = 4'd7;
             9'b0110_x1x_xx: estado_futuro = 4'd9;
             //7
             9'b0111_xxx_xx: estado_futuro = 4'd0;
             //9
             9'b1001_xxx_xx: estado_futuro = 4'd0;
             //10
             9'b1010_xxx_xx: estado_futuro = 4'd0;
             //11
             9'b1011_xxx_xx: estado_futuro = 4'd1;             
             //14
             9'b1110_xx_xx_x: estado_futuro = 4'd0; 
             //15
             9'b1111_xx_xx_x: estado_futuro = 4'd0; 
                                       
             default: estado_futuro = estado_actual;
             endcase
        end
    
    
    
endmodule
