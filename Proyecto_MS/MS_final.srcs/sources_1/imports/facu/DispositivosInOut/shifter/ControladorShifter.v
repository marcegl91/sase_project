`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:04 06/08/2016 
// Design Name: 
// Module Name:    shift 
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
module ControladorShifter(
	input clk, reset,
	input [1:0] reg_sel,
	input [15:0] data_in,
	input cs, we,
	output reg [15:0] data_out
);

wire [15:0] shift_out;
reg [3:0] times;
reg infoWrite, originalWrite, resetShift;
wire [15:0] infoValue;
wire [15:0] originalValue;
wire [15:0] ready_out;

always @*
begin
if(cs)
begin
	if (infoValue[14:0] >= 16)
		times = 4'b1111;
	else
		times = infoValue[3:0];
end
end

always @*
begin
if(cs)
begin
	case(reg_sel[1:0])
		2'b00: begin
			infoWrite = we;
			originalWrite = 0;
			resetShift = 0;
			data_out = infoValue;
			end
		2'b01:begin
			infoWrite = 0;
			originalWrite = we;
			resetShift = 0;
			data_out = originalValue;
			end
		2'b10:begin
			infoWrite = 0;
			originalWrite = 0;
			resetShift = 0;
			data_out = shift_out;
			end
		2'b11:begin
			infoWrite = 0;
			originalWrite = 0;
			resetShift = 1;
			data_out = ready_out;
			end
	endcase
end
end


shifter shifter(.clk(clk),.reset(resetShift),.valueEntry(originalValue),.direction(infoValue[15]),.timesEntry(times),.result(shift_out),.ready(ready_out));
Register info(.clk(clk),.reset(reset),.valueEntry(data_in),.value(infoValue),.enableWrite(infoWrite));
Register original(.clk(clk),.reset(reset),.valueEntry(data_in),.value(originalValue),.enableWrite(originalWrite));
endmodule
