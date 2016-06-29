`timescale 1ns / 1ps

module Timer(
	input clk, reset,
	input cs, we,
	input [1:0] reg_sel,
	input [15:0] in,
	output [15:0] out
	);

	reg [15:0] prescaler_goal, rounds_goal;
	reg [15:0] prescaler, prescaler_next;
	reg [15:0] rounds, rounds_next;
	reg running, running_next;
	wire output_enabled, done;

	localparam ROUNDS_reg = 2'b00;
	localparam PRESCALER_reg = 2'b01;
	localparam START_reg = 2'b10;
	localparam DONE_reg = 2'b11;

	assign done = (rounds == rounds_goal);
	assign output_enabled = (cs & (reg_sel == DONE_reg));
	assign out = (done & output_enabled);

	always@(posedge clk)
	begin
		if(reset)
		begin
			prescaler <= 16'b0;
			prescaler_goal <= 16'b0;
			rounds <= 16'b0;
			rounds_goal <= 16'b0;
			running <= 1'b0;
		end

		else
		begin
			prescaler <= prescaler_next;
			rounds <= rounds_next;
			running <= running_next;

			case({cs, we, reg_sel})
				{1'b1, 1'b1, ROUNDS_reg}:
				begin
					running <= 1'b0;
					rounds_goal <= in;
				end

				{1'b1, 1'b1, PRESCALER_reg}:
				begin
					running <= 1'b0;
					prescaler_goal <= in;
				end

				{1'b1, 1'b1, START_reg}:
					begin
					prescaler <= 16'b0;
					rounds <= 16'b0;
					running <= 1'b1;
					end
				default: ;
			endcase
		end
	end

		 always@*
		 begin
			rounds_next = ((rounds != rounds_goal) && (prescaler == prescaler_goal))? rounds + 16'b1 : rounds;
			prescaler_next = (!running || (prescaler == prescaler_goal))? 16'b0 : prescaler + 16'b1;
			running_next = (rounds_next != rounds_goal);
		end

endmodule