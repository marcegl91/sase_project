`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2016 09:56:23
// Design Name: 
// Module Name: Placa
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


module Placa(
    input clk,
    input reset,
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] Led, sseg,
    output [3:0] an,     
    input rx,
    output tx
    ); 
    
    wire [15:0] inport;
    wire [4:0] dirport;
    wire [15:0] outport;
    wire we;
    MaquinaSencilla MS(.clk(clk), .reset(reset), .inport(inport), .dirport(dirport), .outport(outport), .we(we));
        
    wire [18:0] device0in,  device1in,  device2in,  device3in, device4in, device5in, device6in, device7in;
    wire [15:0] device0out, device1out, device2out, device3out, device4out, device5out, device6out, device7out;
    LogicaIO L(.dev_sel(dirport[4:2]), .reg_sel(dirport[1:0]), .we(we), .data_out(outport), .data_in(inport),
            .device0in(device0out), .device0out(device0in), .device0cs(device0cs),
            .device1in(device1out), .device1out(device1in), .device1cs(device1cs),
            .device2in(device2out), .device2out(device2in), .device2cs(device2cs),
            .device3in(device3out), .device3out(device3in), .device3cs(device3cs),
            .device4in(device4out), .device4out(device4in), .device4cs(device4cs),
            .device5in(device5out), .device5out(device5in), .device5cs(device5cs),
            .device6in(device6out), .device6out(device6in), .device6cs(device6cs),
            .device7in(device7out), .device7out(device7in), .device7cs(device7cs)
            );
            
	// Pines I/O externos:
	assign Led = device7out[7:0];
	assign sseg = device4out[7:0];
	assign an = device4out[11:8];
	// reset <- btnS (Asignado en el .ucf)
	            
    // DEVICE 7: LEDS
    ControladorLED CntrlLed(.clk(clk), .reset(reset), .we(device7in[18]), .reg_sel(device7in[17:16]), .cs(device7cs), .in(device7in[15:0]), .out(device7out));   
    // DEVICE 6: SWITCHES
    ControladorSwitches CntrlSwt(.clk(clk), .reset(reset), .we(device6in[18]), .reg_sel(device6in[17:16]), .cs(device6cs), .in({8'b0, sw}), .out(device6out));
    // DEVICE 5 : BOTONES
    ControladorBotones  CntrlBtn(.clk(clk), .reset(reset), .we(device5in[18]), .reg_sel(device5in[17:16]), .cs(device5cs), .in({12'b0, btn}), .out(device5out));
    // DEVICE 4: SEVEN SEGMENTS
    ControladorSSEG CntrlSSEG(.clk(clk), .reset(reset), .we(device4in[18]), .reg_sel(device4in[17:16]), .cs(device4cs), .in(device4in[15:0]), .out(device4out));
    // DEVICE 3: UART
    ControladorUART CntrlUART(.clk(clk), .reset(reset), .we(device3in[18]), .reg_sel({device3in[17:16]}), .cs(device3cs), .in({8'b0, device3in[7:0]}), .out(device3out), .tx(tx), .rx(rx));
    // DEVICE 2: Timer
    Timer TimerModule(.clk(clk), .reset(reset), .we(device2in[18]), .reg_sel({device2in[17:16]}), .cs(device2cs), .in({device2in[15:0]}), .out(device2out));
    // DEVICE 1: SHIFTER
    ControladorShifter CntrlShifter(.clk(clk), .reset(reset), .we(device1in[18]), .reg_sel({device1in[17:16]}), .cs(device1cs), .in({device1in[15:0]}), .out(device1out));
    // DEVICE 0: -------
    ALM alm(.clk(clk), .reset(reset), .we(device0in[18]), .reg_sel({device0in[17:16]}), .cs(device0cs), .in({device0in[15:0]}), .out(device0out));
endmodule
