`timescale 1ns / 1ps

module ram_tb();

localparam T = 20;
    
    reg clk;
    
    always
    begin
        clk = 1'b0;
        #T;
        clk = 1'b1;
        #T;
    end
    
reg [6:0] dir;
wire [15:0] sal;
reg [15:0] ent;
reg le;


RAM r(.clk(clk), .le(le), .dir(dir), .ent(ent), .sal(sal));


initial
    begin
    le = 1'd0;
    dir = 7'd0;
    
    #100;
    dir = 7'd0;
    #100;
    dir = 7'd1;
    #100;
    dir = 7'd2;
    #100;
            
    end
    
 endmodule
    
