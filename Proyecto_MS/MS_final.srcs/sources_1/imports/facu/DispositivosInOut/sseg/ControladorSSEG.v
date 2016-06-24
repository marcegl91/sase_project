`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2016 11:54:20
// Design Name: 
// Module Name: ControladorSSEG
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


module ControladorSSEG(
    input clk, reset,

    input [1:0] reg_sel,
    input [15:0] in,
    input we, cs,
    output [15:0] out,
    
    output [7:0] sseg,
    output [3:0] an
    );
    
    assign out = 16'b0;
    
    reg [3:0] sseg_0_next, sseg_1_next, sseg_2_next, sseg_3_next;
    reg [3:0] sseg_0 = 0, sseg_1 = 0, sseg_2 = 0, sseg_3 = 0;
    
    always @(posedge clk) begin
        sseg_0 <= sseg_0_next;
        sseg_1 <= sseg_1_next;
        sseg_2 <= sseg_2_next;
        sseg_3 <= sseg_3_next;
    end
    
    wire [7:0] sseg_0_disp, sseg_1_disp, sseg_2_disp, sseg_3_disp;
    
    hex_to_sseg hex_0(sseg_0, 1, sseg_0_disp);
    hex_to_sseg hex_1(sseg_1, 1, sseg_1_disp);
    hex_to_sseg hex_2(sseg_2, 1, sseg_2_disp);
    hex_to_sseg hex_3(sseg_3, 1, sseg_3_disp);
    
    disp_mux dm(clk, 0, sseg_0_disp, sseg_1_disp, sseg_2_disp, sseg_3_disp, an, sseg);
    
    always @* begin
        if (we & cs) begin
            sseg_3_next = in[3:0];
            sseg_2_next = in[7:4];
            sseg_1_next = in[11:8];
            sseg_0_next = in[15:12];
        end
        else begin
            sseg_0_next = sseg_0;
            sseg_1_next = sseg_1;
            sseg_2_next = sseg_2;
            sseg_3_next = sseg_3;
        end
    end
    
endmodule
