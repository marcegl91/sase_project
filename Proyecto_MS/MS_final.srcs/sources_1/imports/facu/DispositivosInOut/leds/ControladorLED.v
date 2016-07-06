`timescale 1ns / 1ps

module ControladorLED(
    input clk, reset, we, cs,
    input [1:0] reg_sel,
    input [15:0] in,
    output [15:0] out
    );

    assign out = {8'b0, Led};

    reg [7:0] Led;
    reg [7:0] led_next = 8'b00000000;
    always@(posedge clk)
    	if (reset)
    		Led <= 8'd0;
    	else
        	Led <= led_next;

    always@*
        if(we & cs)
            led_next = in[7:0];
        else
            led_next = Led;
        
endmodule
