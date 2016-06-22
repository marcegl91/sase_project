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
    input [7:0] swt,
    output [7:0] Led,
    input btnS,
    input rx,
    output tx
    );
    
    wire [15:0] inport;
    wire [4:0] dirport;
    wire [15:0] outport;
    wire we;
    MaquinaSencilla MS(.clk(clk), .reset(reset), .inport(inport), .dirport(dirport), .outport(outport), .we(we));
        
    wire [18:0] device0in,  device1in,  device2in,  device3in;
    wire [15:0] device0out, device1out, device2out, device3out;
    LogicaIO L(.dev_sel(dirport[4:2]), .reg_sel(dirport[1:0]), .we(we), .data_out(outport), .data_in(inport),
            .device0in(device0out), .device0out(device0in), .device0cs(device0cs),
            .device1in(device1out), .device1out(device1in), .device1cs(device1cs),
            .device2in(device2out), .device2out(device2in), .device2cs(device2cs),
            .device3in(), .device3out(), .device3cs(),
            .device4in(), .device4out(), .device4cs(),
            .device5in(), .device5out(), .device5cs(),
            .device6in(), .device6out(), .device6cs(),
            .device7in(), .device7out(), .device7cs()
            );
    // DEVICE 0: LEDS
    assign Led = device0out[7:0];
    ControladorLED CntrlLed(.clk(clk), .reset(reset), .we(device0in[18]), .reg_sel(device0in[17:16]), .cs(device0cs), .in(device0in[15:0]), .out(device0out));
    
    // DEVICE 1: UART
    // ControladorUART CntrlUART(.clk(clk), .reset(reset), .we(device1in[18]), .reg_sel({device1in[17:16]}), .cs(device1cs), .in(device1in[15:0]), .out(device1out), .rx(rx), .tx(tx));
    
    ControladorSwitches CntrlSwt(.clk(clk), .reset(reset), .we(device1in[18]), .reg_sel(device1in[17:16]), .cs(device1cs), .in({8'b0, swt}), .out(device1out));
    
    ControladorBotones  CntrlBtn(.clk(clk), .reset(reset), .we(device2in[18]), .reg_sel(device2in[17:16]), .cs(device2cs), .in({15'b0, btnS}), .out(device2out));


endmodule
