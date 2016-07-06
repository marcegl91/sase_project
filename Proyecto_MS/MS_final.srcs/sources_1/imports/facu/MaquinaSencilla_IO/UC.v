`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2016 12:01:03
// Design Name: 
// Module Name: UC
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


module UC(
    input clk,
    input reset,
    input [5:0] cop,
    input fz,
    output reg [1:0] mux_dir, mux_in, alu_op,
    output reg le, pc_w, ir_w, a_w, b_w, fz_w, sp_w, sp_d, we
    );
    
    reg [4:0] estado; 
    reg [4:0] estado_next;
    
    localparam [4:0]
        fetch   = 4'd0,
        decode  = 4'd1,
        load_f  = 4'd2,
        load_d  = 4'd3,
        add     = 4'd4,
        cmp     = 4'd5,
        mov     = 4'd6,
        jump    = 4'd7,
        in      = 4'd8,
        out     = 4'd9,
        dec_sp  = 4'd10,
        push_pc = 4'd11,
        pop_pc  = 4'd12;
    
    always@(posedge clk)
    begin
        if (reset)
            estado <= fetch;
        else
            estado <= estado_next;
    end

    always@*
    begin
        sp_w = 1'b0;
        sp_d = 1'b0;
        mux_dir = 2'bx;
        alu_op = 2'bx;
        le = 1'b0;
        pc_w = 1'b0;
        ir_w = 1'b0;
        a_w = 1'b0;
        b_w = 1'b0;
        fz_w = 1'b0;
        mux_in = 2'b0;
        we = 1'b0;

        case (estado)
            fetch:
            begin
                mux_dir = 2'b00;
                pc_w = 1'b1;
                ir_w = 1'b1;
            end

            load_f:
            begin
                mux_dir = 2'b10;
                b_w = 1'b1;
            end

            load_d:
            begin
                mux_dir = 2'b11;
                a_w = 1'b1;
            end

            add:
            begin
                mux_dir = 2'b11;
                alu_op = 2'b00;
                le = 1'b1;
                fz_w = 1'b1;
            end

            cmp:
            begin
                alu_op = 2'b01;
                fz_w = 1'b1;
            end

            mov:
            begin
                mux_dir = 2'b11;
                alu_op = 2'b10;
                le = 1'b1;
                fz_w = 1'b1;
            end

            jump:
            begin
                mux_dir = 2'b11;
                pc_w = 1'b1;
                ir_w = 1'b1;
            end

            in:
            begin
                mux_dir = 2'b11;
                alu_op = 2'b10;
                le = 1'b1;
                mux_in = 2'b10;
            end

            out:
            begin
                mux_dir = 2'b11;
                alu_op = 2'b10;
                fz_w = 1'b1;
                we = 1'b1;
            end

            dec_sp:
            begin
                sp_d = 1'b1;
            end

            push_pc:
            begin
                mux_dir = 2'b01;
                le = 1'b1;
                mux_in = 2'b01;
            end

            pop_pc:
            begin
                sp_w = 1'b1;
                sp_d = 1'b1;
                mux_dir = 2'b01;
                ir_w = 1'b1;
            end
            
            default: ;
         endcase   
    end
        	
    always@*
    begin
        case (estado)
            fetch: estado_next = decode;
            
            decode:
            begin
                casex ({cop, fz})
                    7'b0xxxxxx: estado_next = load_f;
                    7'bx0xxxxx: estado_next = load_f;
                    7'b11000x1: estado_next = jump;
                    7'b11000x0: estado_next = fetch;
                    7'b1110xxx: estado_next = in;
                    7'b1111xxx: estado_next = out; 
                    7'b110010x: estado_next = dec_sp;
                    7'b110011x: estado_next = pop_pc;
                    default:    estado_next = fetch;
                endcase
            end
            
            load_f:
            begin
                casex (cop)
                    7'b0xxxxx: estado_next = load_d;
                    7'b10xxxx: estado_next = mov;
                    default:   estado_next = fetch;
                endcase
            end
            
            load_d:
            begin
                casex (cop)
                    7'bx0xxxx: estado_next = add;
                    7'bx1xxxx: estado_next = cmp;
                    default:   estado_next = fetch;
                endcase
            end
            
            add:     estado_next = fetch;
            cmp:     estado_next = fetch;
            mov:     estado_next = fetch;
            jump:    estado_next = decode;
            in:      estado_next = fetch;
            out:     estado_next = fetch;
            dec_sp:  estado_next = push_pc;
            push_pc: estado_next = jump;
            pop_pc:  estado_next = jump;
            
            default: estado_next = fetch;
        endcase
    end
        
endmodule