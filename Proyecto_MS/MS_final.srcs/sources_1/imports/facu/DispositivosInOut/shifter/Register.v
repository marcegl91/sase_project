`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:44 04/20/2016 
// Design Name: 
// Module Name:    Register
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
module Register(
	input wire clk, reset,
	input [15:0] valueEntry,
	input enableWrite,
	output reg [15:0] value
);
    reg [15:0] valueNext;

always @(posedge clk) 
	begin
		if(reset)
			value <= 16'b0;
		else
			value <= valueNext;
	end

always @(posedge enableWrite)
begin
		valueNext <= valueEntry;
end

endmodule
