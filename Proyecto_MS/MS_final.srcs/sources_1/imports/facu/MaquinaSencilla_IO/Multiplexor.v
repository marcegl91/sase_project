`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2016 11:52:56
// Design Name: 
// Module Name: Multiplexor
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


module Multiplexor(
    input [1:0] sel,
    input [6:0] m3, m2, m1, m0,
    output reg [6:0] out
    );
    
    always@*
    begin
        case (sel)
            2'b00: out = m0;
            2'b01: out = m1;
            2'b10: out = m2;
            2'b11: out = m3;
        endcase
    end
endmodule
