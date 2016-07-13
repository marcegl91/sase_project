`timescale 1ns / 1ps

module Timer(
	input clk, reset,
	input cs, we,
	input [1:0] reg_sel,
	input [15:0] in,
	output reg [15:0] out
	);

	reg [15:0] prescaler_goal, rounds_goal;
	reg [15:0] prescaler, prescaler_next;
	reg [15:0] rounds, rounds_next;
	reg running, running_next;
	wire output_enabled, done;

	localparam ROUNDS_reg = 2'b00;
	localparam PRESCALER_reg = 2'b01;
	localparam STATUS_reg = 2'b10;
	localparam DONE_reg = 2'b11;

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
			// Writes:
			case({cs, we, reg_sel})
				{1'b1, 1'b1, ROUNDS_reg}:
				begin
					rounds_goal <= in;
					running <= 1'b0;
					prescaler <= 16'b0;
					rounds <= 16'b0;
				end
				{1'b1, 1'b1, PRESCALER_reg}:
				begin
					prescaler_goal <= in;
					running <= 1'b0;
					prescaler <= 16'b0;
					rounds <= 16'b0;
				end
				{1'b1, 1'b1, STATUS_reg}: // Toggle run/stop
					begin
					running <= in[0];
					prescaler <= prescaler_next;
					rounds <= rounds_next;
					end
				{1'b1, 1'b1, DONE_reg}: // Reset & pause
					begin
					running <= 1'b0;
					prescaler <= 16'b0;
					rounds <= 16'b0;
					end
				default:
				    begin 
					prescaler <= prescaler_next;
					rounds <= rounds_next;
					running <= running_next;
					end
			endcase
		end
	end

		 always@*
		 begin
			// Next-state logic:
		    rounds_next = (running && (rounds != rounds_goal) && ((prescaler + 1'b1) == prescaler_goal))? rounds + 16'b1 : rounds;

			if (!running)
			     prescaler_next = prescaler;
			else if (prescaler == prescaler_goal)
			     prescaler_next = 16'b0;
			else
		         prescaler_next = prescaler + 1'b1;
		         
			//prescaler_next = (!running || (prescaler == prescaler_goal))? 16'b0 : prescaler + 16'b1;
			running_next = (running && (rounds_next != rounds_goal));
			
			// Output:
			case({cs, we, reg_sel})
				{1'b1, 1'b0, ROUNDS_reg}: out = rounds;
				{1'b1, 1'b0, PRESCALER_reg}: out = prescaler;
				{1'b1, 1'b0, STATUS_reg}: out = running;
				{1'b1, 1'b0, DONE_reg}: out = (rounds == rounds_goal);
				default: out = 16'b0;
			endcase
		end

endmodule