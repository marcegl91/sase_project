`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2016 09:56:23
// Design Name: 
// Module Name: Placa
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


module Placa(
    input clk,
    input reset,
    input [7:0] sw,
    output [7:0] Led,
    input btnS
    );
    
    wire [15:0] inport;
    wire [4:0] dirport;
    wire [15:0] outport;
    wire we;
    MaquinaSencilla MS(.clk(clk), .reset(reset), .inport(inport), .dirport(dirport), .outport(outport), .we(we));
    LogicaIO L(.dev_sel(dirport[4:2]), .reg_sel(dirport[1:0]), 
    			.data_in(outport), .data_out(inport), .we(we),
               	.Led(Led), .sw(sw), .btnS(btnS), 
               	.clk(clk), .reset(reset));
    
endmodule
