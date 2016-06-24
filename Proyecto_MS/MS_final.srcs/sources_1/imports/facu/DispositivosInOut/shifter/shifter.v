`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:06 06/10/2016 
// Design Name: 
// Module Name:    shifter 
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
module shifter(
	input wire clk, reset,
	input [15:0] valueEntry,
	input direction,
	input [3:0] timesEntry,
	output reg [15:0] result,
	output reg [15:0] ready
    );
	 
reg [15:0] value;
reg [15:0] shiftedValue;
reg [3:0] times;
reg FirstTime;
reg stop;

always @(posedge clk) 
	begin
		
		if (reset)
			begin
				if(!stop)
					begin
						ready <= 16'b0;
						result <= 1'b0;
						FirstTime <= 1'b1;
					end
				stop <= 1'b1;
			end
		else
			begin
				stop <= 1'b0;
			end
			
			
		if (FirstTime)
			begin
				value <= valueEntry;
				times <= timesEntry;
				FirstTime <= 1'b0;
			end
		else
			begin
				if(times == 0)
					begin
						result <= value;
						ready <= 1'b1;
					end
				else
					begin			
						value <= shiftedValue;
						times <= times - 1;
					end
			end
	end


always @*
		if (direction)
			shiftedValue <= {1'b0,value[15:1]};
		else
			shiftedValue <= {value[14:0],1'b0};

endmodule
