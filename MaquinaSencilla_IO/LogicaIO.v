`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2016 09:57:22
// Design Name: 
// Module Name: LogicaIO
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


module LogicaIO(
    input clk,
    input [2:0] dev_sel,
    input [1:0] reg_sel,
    input we,
    input [15:0] data_in,
    output reg [15:0] data_out,
    output [7:0] Led,
    input [7:0] sw,
    input btnS
    );
    
    reg we_led;
    reg [15:0] data_in_led; 
    ControladorLED CntrlLed(.we(we_led), .in(data_in_led), .Led(Led), .clk(clk));
    
    wire [7:0] sw1;
    wire [15:0] data_in_swt; 
    ControladorSwitches CntrlSwt(.clk(clk), .sw1(sw1), .sw(sw));
    
    reg we_btns;
    wire btns1;
    wire cntrl;
    ControladorBotones CntrlBtns(.clk(clk), .btns1(btns1), .btnS(btnS), .we(we_btns));
        
    
    always@*
        begin
        we_led = 1'b0;
        data_in_led = 16'd0;
        we_btns = 1'b0;
        data_out = 16'd0;
          
        case(dev_sel)
            0:  
			begin
                data_in_led = data_in;
                we_led = we;
                end               
            1:
                data_out = {8'd0, sw1};            
            2:  
                begin
                data_out = {15'b0, btns1};
                we_btns = we;
                end
            3: ;          
            default: ;
        endcase
        end
endmodule
