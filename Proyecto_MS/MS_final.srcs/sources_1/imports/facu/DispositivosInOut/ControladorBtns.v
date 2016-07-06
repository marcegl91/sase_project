`timescale 1ns / 1ps

module ControladorBotones(
    input clk, reset, we, cs,
    input [1:0] reg_sel,
    input [15:0] in,
    output reg [15:0] out
	);
	
	assign btn_3 = in[3];
	assign btn_2 = in[2];
	assign btn_1 = in[1];
	assign btn_0 = in[0];
	
	ControladorBoton b3 (.clk(clk), .reset(reset), .cs(cs), .we(we), .btn_in(btn_3), .out(btn3_out));
	ControladorBoton b2 (.clk(clk), .reset(reset), .cs(cs), .we(we), .btn_in(btn_2), .out(btn2_out));
	ControladorBoton b1 (.clk(clk), .reset(reset), .cs(cs), .we(we), .btn_in(btn_1), .out(btn1_out));
	ControladorBoton b0 (.clk(clk), .reset(reset), .cs(cs), .we(we), .btn_in(btn_0), .out(btn0_out));
	
	always@(posedge clk)
	   if (cs & !we)
	       case (reg_sel)
	       2'b00: out <= {15'b0, btn0_out};
	       2'b01: out <= {15'b0, btn1_out};
	       2'b10: out <= {15'b0, btn2_out};
	       2'b11: out <= {15'b0, btn3_out};
	       endcase
	   else
	       out <= 16'd0;
endmodule
