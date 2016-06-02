`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: dualPortRegiser_tb
/////////////////////////////////////////////////////////////////
module maquina_sencilla_t();
        
  
    localparam T = 20;
    
    reg clk;
    
    always
    begin
        clk = 1'b0;
        #T;
        clk = 1'b1;
        #T;
    end
    
    wire [4:0] dirport;
    reg [15:0] inport;
    wire we;
    wire [15:0] outport;
    
    always@*
        if(dirport == 5'b0)
            inport = 15'd2;
        else
            if(dirport == 5'b1)
                inport = 15'd4;
       
    
    MaquinaSencilla M(.clk(clk), .inport(inport), .dirport(dirport), .outport(outport), .we(we));

endmodule 