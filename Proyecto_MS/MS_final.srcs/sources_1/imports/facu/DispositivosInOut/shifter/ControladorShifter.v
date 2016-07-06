`timescale 1ns / 1ps

module ControladorShifter(
	input clk, reset,
	input [1:0] reg_sel,
	input [15:0] in,
	input cs, we,
	output reg [15:0] out
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
		times = infoValue[3:0];
end

always @*
begin
    if(cs)
    begin
        case(reg_sel[1:0])
            2'b00: begin
                infoWrite = we;
                originalWrite = 1'b0;
                resetShift = 1'b0;
                out = infoValue;
                end
            2'b01:begin
                infoWrite = 1'b0;
                originalWrite = we;
                resetShift = 1'b0;
                out = originalValue;
                end
            2'b10:begin
                infoWrite = 1'b0;
                originalWrite = 1'b0;
                resetShift = 1'b0;
                out = shift_out;
                end
            2'b11:begin
                infoWrite = 1'b0;
                originalWrite = 1'b0;
                resetShift = 1'b1;
                out = ready_out;
                end
        endcase
end
end


shifter shifter(.clk(clk),.reset(resetShift),.valueEntry(originalValue),.direction(infoValue[15]),.timesEntry(times),.result(shift_out),.ready(ready_out));
Register info(.clk(clk),.reset(reset),.valueEntry(in),.value(infoValue),.enableWrite(infoWrite));
Register original(.clk(clk),.reset(reset),.valueEntry(in),.value(originalValue),.enableWrite(originalWrite));
endmodule
