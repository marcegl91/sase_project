`timescale 1ns / 1ps

module ControladorSwitches(
    input clk, reset, we, cs,
    input [1:0] reg_sel,
    input [15:0] in,
    output [15:0] out
    );

    wire [7:0] swt;
    reg [7:0] swt_val;

    assign swt = in[7:0];
    assign out = {8'b0, swt_val};

    reg [7:0] swt_next;
    always@(posedge clk)
    	if (reset)
    		swt_val <= 8'd0;
    	else
        	swt_val <= swt_next;

    always@*
        if(cs)
            swt_next = swt;
        else
            swt_next = swt_val;

endmodule
