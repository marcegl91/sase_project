`timescale 1ns / 1ps

// Bitwise Module
module BWM(
	input clk, reset,
	input [15:0] in,
	input cs, we,
	input [1:0] reg_sel,
	output reg [15:0] out
    );
   
    
    // Reg. selectors:
    localparam D0_reg_sel = 2'd0;
    localparam D1_reg_sel = 2'd1;
    localparam OP_reg_sel = 2'd2;
    localparam OUT_reg_sel = 2'd3;
    
    // Op. codes:
    localparam AND_op = 16'd0;
    localparam OR_op = 16'd1;
    localparam NOT_op = 16'd2;
    localparam NAND_op = 16'd3;
    localparam XOR_op = 16'd4;
    localparam NOR_op = 16'd5;
    localparam XNOR_op = 16'd6;
    localparam BITSEL_op = 16'd7;

	reg [15:0] D0, D1, OP, RES;
    
    always@(posedge clk)
    	if (reset)
    	   	begin
    	    D0 <= 16'b0;  	    
			D1 <= 16'b0;
    		OP <= 16'b0;
    		out <= 16'b0;
    		end
    	else
			case({cs, we, reg_sel})
				{1'b1, 1'b1, D0_reg_sel}:  D0 <= in;
				{1'b1, 1'b1, D1_reg_sel}:  D1 <= in;
				{1'b1, 1'b1, OP_reg_sel}:  OP <= in;
				{1'b1, 1'b0, OUT_reg_sel}: out <= RES;
				default: out <= 16'b0;
			endcase
    	
    always@*
    	case(OP)
			AND_op: RES = (D0 & D1);
			XOR_op: RES = (D0 ^ D1);
			OR_op:  RES = (D0 | D1);
			NOT_op: RES = ~D0;
			NAND_op: RES = ~(D0 & D1);
			NOR_op: RES = ~(D0 | D1);
			XNOR_op: RES = ~(D0 ^ D1); 
			BITSEL_op: 
					begin
					if (D1 <= 15)
						RES = D0[D1];
					else
						RES = 16'b0;
					end
			default: RES = 16'b0;
    		endcase
endmodule
