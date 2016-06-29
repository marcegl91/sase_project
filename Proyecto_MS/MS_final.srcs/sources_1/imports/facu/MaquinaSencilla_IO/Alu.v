`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:54 04/10/2016 
// Design Name: 
// Module Name:    Alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Alu(
    input [15:0] a,
    input [15:0] b,
    input [1:0] op,
    output z,
    output reg [15:0] out
    );
	 
    always @*
    begin
    case (op)
        0: // Suma
            out=(a+b);
        1: // XOR
            out=a^b;
        2: // b
            out=b;
        3: // NEG
            out=b^16'b1111111111111111;
        default:
          out=16'dx;
    endcase
    end
	
	assign z = (!out)? 1'b1: 1'b0; 
endmodule
			
