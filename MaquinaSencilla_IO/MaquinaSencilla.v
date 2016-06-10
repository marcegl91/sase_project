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
    wire [14:0] out;
    assign we = out[0];
     
     UC C(.clk(clk), .reset(reset), 
     	.c1(cop[5]), .c0(cop[4]), .c3(cop[3]), .c2(cop[2]), .c5(cop[1]), .c4(cop[0]),
     	.fz(fz), .out(out));
     
     UP P(.mx1(out[11]), .mx0(out[10]), 
     	.alu_op1(out[9]), .alu_op0(out[8]), 
     	.le(out[7]), 
     	.pc_w(out[6]), .ir_w(out[5]), .a_w(out[4]), .b_w(out[3]), .fz_w(out[2]), 
     	.mx_memio(out[1]), .mx_mempc(out[14]),
     	.sp_w(out[13:12]),
       	.clk(clk), .reset(reset), 
       	.cop(cop), .fz(fz), 
       	.inport(inport), .mem_out(outport), .dirport(dirport));
  
        
endmodule
