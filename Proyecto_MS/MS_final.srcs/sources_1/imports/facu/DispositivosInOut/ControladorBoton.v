`timescale 1ns / 1ps

module ControladorBoton(
    input clk, reset,
    input btn_in,
    input cs, we,
    output out
    );
    
    reg btn1;
    assign out = btn1;
    
    reg btn_next =  1'b0;
    reg btn_reg = 1'b0;
    
    always@(posedge clk)
        begin
        if (reset)
            btn1 <= 1'd0;
        else
            btn1 <= btn_next;
        end
            
    always@(posedge btn_in, posedge we)
        if(we)
            btn_reg <= 1'b0;
        else
            btn_reg <= 1'b1;
            
    always@*
        btn_next = btn_reg;        
    
endmodule
