`timescale 1ns / 1ps

module Alu(
    input [15:0] A,
    input [15:0] B,
    input [1:0] op,
    output z,
    output reg [15:0] out
    );
	 
    always @*
    begin
    case (op)
        0: // Suma
            out=(A+B);
        1: // XOR
            out=A^B;
        2: // B
            out=B;
        3: // NEG
            out=B^16'b1111111111111111;
        default:
          out=16'dx;
    endcase
    end
	
	assign z = (!out)? 1'b1: 1'b0; 
endmodule
			
