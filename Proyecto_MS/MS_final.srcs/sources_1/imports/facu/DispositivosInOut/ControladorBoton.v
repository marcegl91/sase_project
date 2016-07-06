`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2016 12:17:33
// Design Name: 
// Module Name: ControladorBoton
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControladorBoton(
    input clk, reset,
    input btn_in,
    input cs, we,
    output out
    );
    
      
    wire tick;
    wire db_level;
    wire G;

   assign clear=(we)& cs; 
   assign G= (~we)& (~db_level)& tick;
    
   debounce db (.clk(clk), .reset(reset),.sw(btn_in),.db_level(db_level),.db_tick(tick));
   
   LDCE LDCE_inst (
       .Q(out),      // Data output
       .CLR(clear),  // Asynchronous clear/reset input
       .D(1'b1),      // Data input
       .G(G),      // Gate input
       .GE(cs)     // Gate enable input
     );       
    
endmodule
