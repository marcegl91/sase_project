`timescale 1ns / 1ps

module UP(
    input clk,
    input reset,
    input [1:0] mux_dir, mux_in, alu_op,
    input le, pc_w, ir_w, a_w, b_w, fz_w, sp_w, sp_d,
    input [15:0] inport,
    output reg fz,
    output [5:0] cop,
    output [15:0] mem_out,
    output [4:0] dirport
    );
    
    reg [15:0] ir, ir_next;
    reg [15:0] a, a_next;
    reg [15:0] b, b_next;
    reg [6:0] pc, pc_next;
    reg [6:0] sp, sp_next;
    reg fz_next;
    
    assign cop = ir[15:10];
    assign dirport = ir[11:7];
    
    wire [15:0] alu_out;
    reg [6:0] mux_dir_out;
    reg [15:0] mux_mem_out;
       
    Alu A(.A(a), .B(b), .op(alu_op), .z(alu_z), .out(alu_out));
    RAM Mem(.clk(clk), .le(le), .dir(mux_dir_out), .ent(mux_mem_out), .sal(mem_out));
    
    always@*
    begin
        case (mux_dir)
            2'd0: mux_dir_out = pc;
            2'd1: mux_dir_out = sp;
            2'd2: mux_dir_out = ir[13:7];
            2'd3: mux_dir_out = ir[6:0];
        endcase
    end
    
    always@*
    begin
        case (mux_in)
            2'd0: mux_mem_out = alu_out;
            2'd1: mux_mem_out = pc;
            2'd2: mux_mem_out = inport;
            default: mux_mem_out = 16'bX;
        endcase
    end
    
    always@(posedge clk)
    begin
    if (reset)
    begin
        ir <= 16'd0;
        pc <= 7'd0;
        a  <= 16'd0;
        b  <= 16'd0;
        sp <= 16'd0;
        fz <= 1'd0;
    end
    else
    begin
        ir <= ir_next;
        pc <= pc_next;
        a  <= a_next;
        b  <= b_next;
        sp <= sp_next;
        fz <= fz_next;
    end
    end
    
    always@*
    begin
        pc_next = pc;
        ir_next = ir;
        a_next = a;
        b_next = b;
        sp_next = sp;
        fz_next = fz;
        
        if (pc_w)
            pc_next = mux_dir_out + 1'd1;
        if (ir_w)
            ir_next = mem_out;
        if (a_w)
            a_next = mem_out;
        if (b_w)
            b_next = mem_out;
        if (sp_w)
            sp_next = sp_d ? (sp + 7'b1) : (sp - 7'b1);
        if (fz_w)
            fz_next = alu_z;
    end
endmodule
