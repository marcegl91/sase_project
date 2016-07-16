`timescale 1ns / 1ps

module ControladorShifter(
	input clk, reset,
	input [1:0] reg_sel,
	input [15:0] in,
	input cs, we,
	output reg [15:0] out
);

localparam DATA_reg_sel = 2'd0;
localparam TIMES_reg_sel = 2'd1;
localparam SHIFTL_reg_sel = 2'd2;
localparam SHIFTR_reg_sel = 2'd3;

reg [15:0] data;
reg [3:0] times; // [0, 15]
reg [15:0] shifted_L, shifted_R;

always @(posedge clk)
begin
	if (reset)
	begin
		data <= 16'b0;
		times <= 4'b0;
		out <= 16'b0;
	end
	else
		case({cs, we, reg_sel})
			// Writes:
			{1'b1, 1'b1, DATA_reg_sel}: data <= in;
			{1'b1, 1'b1, TIMES_reg_sel}: times <= in[3:0];
			// Reads:
			{1'b1, 1'b0, SHIFTL_reg_sel}: out <= shifted_L;
			{1'b1, 1'b0, SHIFTR_reg_sel}: out <= shifted_R;
			default: out <= 16'b0;
		endcase
end

always@*
begin
	shifted_L = (data << times);
	shifted_R = (data >> times);
end

endmodule