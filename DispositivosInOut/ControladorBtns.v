`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2016 12:38:25
// Design Name: 
// Module Name: ControladorBtns
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


module ControladorBotones(
    input clk, reset, we, cs,
    input [1:0] reg_sel,
    input [15:0] in,
    output [15:0] out
	);
	
	wire btnS;	
    reg btns1;
    assign out = {15'b0, btns1};
    assign btnS = in[0];
    
	reg btns_next =  1'b0;
	reg btnS_reg = 1'b0;
	
	always@(posedge clk)
		begin
		if (reset)
			btns1 <= 1'd0;
		else
			btns1 <= btns_next;
		end
			
	always@(posedge btnS, posedge we)
		if(we)
			btnS_reg <= 1'b0;
		else
			btnS_reg <= 1'b1;
			
	always@*
		btns_next = btnS_reg;        
endmodule