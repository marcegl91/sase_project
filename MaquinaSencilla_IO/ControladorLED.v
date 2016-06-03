`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2016 12:50:39
// Design Name: 
// Module Name: ControladorLED
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


module ControladorLED(
    input [15:0] in,
    input clk, reset,
    input we,
    output reg [7:0] Led
    );

    reg [7:0] led_next = 8'b00000000;
    always@(posedge clk)
    	if (reset)
    		Led <= 8'd0;
    	else
        	Led <= led_next;

    always@*
        if(we)
            led_next = in[7:0];
        else
            led_next = Led;
        
endmodule
