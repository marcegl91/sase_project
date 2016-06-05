`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2016 10:22:30
// Design Name: 
// Module Name: UP
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


module UP(
    input mx1, mx0, 
    alu_op1, alu_op0, 
    le, pc_w, ir_w, a_w, b_w, fz_w, 
    mx_memio,
    input [15:0] inport,
    input clk,
    input reset,
    output reg fz,
    output [3:0] cop,
    output [15:0] mem_out,
    output [4:0] dirport
    );
    
    reg [15:0] ir, ir_next;
    reg [15:0] a, a_next, b, b_next;
    reg [6:0] pc, pc_next;
    reg fz_next;
    
    initial
    begin  
        pc = 7'd0;
        fz = 1'b0;
    end
        
    assign cop = ir[15:12];
    assign dirport = ir[11:7];
    wire [15:0] alu_out; //, mem_out;
    wire [6:0] mux_out;
   
    reg [15:0] mux_mem_out;
       
    Alu A(.A(a), .B(b), .op({alu_op1, alu_op0}), .z(alu_z), .out(alu_out));
    Multiplexor mux(.m3(ir[6:0]), .m2(ir[13:7]), .m1(7'd0), .m0(pc), .sel({mx1, mx0}), .out(mux_out));
    RAM Mem(.clk(clk), .le(le), .dir(mux_out), .ent(mux_mem_out), .sal(mem_out));
    
    
    always@(posedge clk)
    begin
    if (reset)
        begin
        ir <= 16'd0;
        pc <= 7'd0;
        a <= 16'd0;
        b <= 16'd0;
        fz <= 1'd0;
        end
    else
       begin
       ir <= ir_next;
       pc <= pc_next;
       a <= a_next;
       b <= b_next;
       fz <= fz_next;
       end
    end
    
    always@*
    begin
        if (mx_memio)
            mux_mem_out = inport;
        else
            mux_mem_out = alu_out;
    end
    
    always@*
    begin
        pc_next = pc;
        ir_next = ir;
        a_next = a;
        b_next = b;
        fz_next = fz;
        
        if (pc_w)
            pc_next = mux_out + 1'd1;
        if (ir_w)
            ir_next = mem_out;
        if (a_w)
            a_next = mem_out;
        if (b_w)
            b_next = mem_out;
        if (fz_w)
            fz_next = alu_z;
    end
    
    
endmodule
