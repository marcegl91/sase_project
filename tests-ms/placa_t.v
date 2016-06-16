`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: dualPortRegiser_tb
/////////////////////////////////////////////////////////////////
module placa_t();
        
  
    localparam T = 20;
    
    reg clk;
    
    always
    begin
        clk = 1'b0;
        #T;
        clk = 1'b1;
        #T;
    end
    initial 
    begin
        sw_t = 8'd1;
        #100;
        sw_t = 8'd2;
        #100;
        sw_t = 8'd3;
        #100;
        sw_t = 8'd4;
        #1000;
        btnS = 1'b1;
        #1000;
        btnS = 1'b0;
        #200;
        sw_t = 8'd7;
        #200;
        sw_t = 8'd5; 
    end
    reg [7:0] sw_t;
    wire [7:0] Led_t;
    reg btnS;   
    
    Placa plac(.clk(clk), .sw(sw_t), .Led(Led_t), .btnS(btnS));

endmodule 