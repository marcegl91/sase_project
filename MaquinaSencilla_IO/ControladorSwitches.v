`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2016 10:18:57
// Design Name: 
// Module Name: ControladorSwitches
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




module ControladorSwitches(
    input clk,
    input [7:0] sw,
    output reg [7:0] sw1
    );
        
    
    reg [7:0] sw_next = 8'b11110000;
    always@(posedge clk)
        sw1 <= sw_next;

    always@*
        sw_next = sw;

endmodule