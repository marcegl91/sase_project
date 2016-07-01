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
     
    wire [1:0] mux_dir, mux_in, alu_op;
    wire le, pc_w, ir_w, a_w, b_w, fz_w, sp_w, sp_d;

     UC C(.clk(clk), .reset(reset), .cop(cop), .fz(fz), .we(we),
        .mux_dir(mux_dir), .mux_in(mux_in), .alu_op(alu_op),
        .le(le), .pc_w(pc_w), .ir_w(ir_w), .a_w(a_w), .b_w(b_w),
        .fz_w(fz_w), .sp_w(sp_w), .sp_d(sp_d));

     UP P(.clk(clk), .reset(reset), .cop(cop), .fz(fz), 
       	.inport(inport), .mem_out(outport), .dirport(dirport),
        .mux_dir(mux_dir), .mux_in(mux_in), .alu_op(alu_op),
        .le(le), .pc_w(pc_w), .ir_w(ir_w), .a_w(a_w), .b_w(b_w),
        .fz_w(fz_w), .sp_w(sp_w), .sp_d(sp_d));

endmodule
