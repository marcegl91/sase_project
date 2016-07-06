`timescale 1ns / 1ps

module ControladorShifter(
	input clk, reset,
	input [1:0] reg_sel,
	input [15:0] in,
	input cs, we,
	output reg [15:0] out
);

reg [15:0] shift_out;
reg [3:0] times;
reg direction;
reg infoWrite, originalWrite, resetShift;
wire [15:0] infoValue;
wire [15:0] originalValue;
wire [15:0] ready_out;

always @*
begin
    if(cs)
		begin
		times = infoValue[3:0];
		direction = infoValue[4];
		end
end

always @*
begin
    if(cs)
    begin
        case(reg_sel[1:0])
            2'b00: begin
                infoWrite = we;
                originalWrite = 1'b0;
                out = infoValue;
                end
            2'b01:begin
                infoWrite = 1'b0;
                originalWrite = we;
                out = originalValue;
                end
            2'b10:begin
                infoWrite = 1'b0;
                originalWrite = 1'b0;
                out = shift_out;
                end
            2'b11:begin
                infoWrite = 1'b0;
                originalWrite = 1'b0;
                out = shift_out;
                end
        endcase
    end
end

always @*
begin
    if (direction)
		begin
			case(times)
			4'b0000:shift_out = originalValue;
			4'b0001:shift_out = {1'b0,originalValue[15:1]};
			4'b0010:shift_out = {2'b0,originalValue[15:2]};
			4'b0011:shift_out = {3'b0,originalValue[15:3]};
			4'b0100:shift_out = {4'b0,originalValue[15:4]};
			4'b0101:shift_out = {5'b0,originalValue[15:5]};
			4'b0110:shift_out = {6'b0,originalValue[15:6]};
			4'b0111:shift_out = {7'b0,originalValue[15:7]};
			4'b1000:shift_out = {8'b0,originalValue[15:8]};
			4'b1001:shift_out = {9'b0,originalValue[15:9]};
			4'b1010:shift_out = {10'b0,originalValue[15:10]};
			4'b1011:shift_out = {11'b0,originalValue[15:11]};
			4'b1100:shift_out = {12'b0,originalValue[15:12]};
			4'b1101:shift_out = {13'b0,originalValue[15:13]};
			4'b1110:shift_out = {14'b0,originalValue[15:14]};
			4'b1111:shift_out = {15'b0,originalValue[15]};
			endcase
		end
    else
        begin
			case(times)
			4'b0000:shift_out = originalValue;
			4'b0001:shift_out = {originalValue[14:0],1'b0};
			4'b0010:shift_out = {originalValue[13:0],2'b0};
			4'b0011:shift_out = {originalValue[12:0],3'b0};
			4'b0100:shift_out = {originalValue[11:0],4'b0};
			4'b0101:shift_out = {originalValue[10:0],5'b0};
			4'b0110:shift_out = {originalValue[9:0],6'b0};
			4'b0111:shift_out = {originalValue[8:0],7'b0};
			4'b1000:shift_out = {originalValue[7:0],8'b0};
			4'b1001:shift_out = {originalValue[6:0],9'b0};
			4'b1010:shift_out = {originalValue[5:0],10'b0};
			4'b1011:shift_out = {originalValue[4:0],11'b0};
			4'b1100:shift_out = {originalValue[3:0],12'b0};
			4'b1101:shift_out = {originalValue[2:0],13'b0};
			4'b1110:shift_out = {originalValue[1:0],14'b0};
			4'b1111:shift_out = {originalValue[0],15'b0};
			endcase
		end
end

Register info(.clk(clk),.reset(reset),.valueEntry(in),.value(infoValue),.enableWrite(infoWrite));
Register original(.clk(clk),.reset(reset),.valueEntry(in),.value(originalValue),.enableWrite(originalWrite));
endmodule
