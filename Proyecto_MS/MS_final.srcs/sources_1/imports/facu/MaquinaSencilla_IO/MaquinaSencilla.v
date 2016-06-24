`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2016 12:36:06
// Design Name: 
// Module Name: MaquinaSencilla
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


module MaquinaSencilla(
    input clk,
    input reset,
    input [15:0] inport,
    output [4:0] dirport,
    output [15:0] outport,
    output we
    );
    
    wire [5:0] cop;
    wire [14:0] control;
    assign we = control[0];
     
     UC C(.clk(clk), .reset(reset), .cop(cop),
     	.fz(fz), .control(control));
     
     UP P(.mux_dir(control[11:10]), 
     	.alu_op(control[9:8]), 
     	.le(control[7]), 
     	.pc_w(control[6]), .ir_w(control[5]), .a_w(control[4]), .b_w(control[3]), .fz_w(control[2]), 
     	.mux_in({control[1], control[14]}),
     	.sp_w(control[13]), .sp_d(control[12]),
       	.clk(clk), .reset(reset), 
       	.cop(cop), .fz(fz), 
       	.inport(inport), .mem_out(outport), .dirport(dirport));
  
        
endmodule
