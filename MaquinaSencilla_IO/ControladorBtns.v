`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2016 12:38:25
// Design Name: 
// Module Name: ControladorBtns
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


module ControladorBotones(
    input clk,
    input btnS,
    input we,
    output reg btns1
    );
        

    reg btns_next =  1'b0;
    reg btnS_reg = 1'b0;
    always@(posedge clk)
        begin
        btns1 <= btns_next;
        end
            
    always@(posedge btnS, posedge we)    
        if(we)
            btnS_reg <= 1'b0;
        else
             btnS_reg <= 1'b1;
    always@*
        btns_next = btnS_reg;        
endmodule