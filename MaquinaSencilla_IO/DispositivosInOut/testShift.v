`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:21:19 06/10/2016
// Design Name:   shift
// Module Name:   E:/luisfpga/MaquinaSencilla/testShift.v
// Project Name:  MaquinaSencilla
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testShift;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] reg_sel;
	reg [15:0] data_in;
	reg cs;
	reg we;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	shift uut (
		.clk(clk), 
		.reset(reset), 
		.reg_sel(reg_sel), 
		.data_in(data_in), 
		.cs(cs), 
		.we(we), 
		.data_out(data_out)
	);
	
	localparam  T=20; // clock period

	always
   begin
      clk = 1'b1;
      #(T/2);
      clk = 1'b0;
      #(T/2);
   end



	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		reg_sel = 0;
		data_in = 0;
		cs = 1;
		we = 0;

		// Wait 100 ns for global reset to finish
		#100;
      reg_sel = 2'b00;
		data_in = 16'b1000000000000001; //direccion y cantidad, esto es 2 shift right
		we = 1;
		#20;
      reg_sel = 2'b01;
		data_in = 16'b0000000000000010; //numero a shiftear
		we = 1;
		#20;
		reg_sel = 2'b11;
		#100;
		reg_sel = 2'b10;

	end
      
endmodule

