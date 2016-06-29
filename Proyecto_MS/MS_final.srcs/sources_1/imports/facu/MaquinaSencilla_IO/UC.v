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
    output reg [14:0] control
    );
    
    reg [4:0] estado; 
    reg [4:0] estado_next;
    
    initial
    begin
        estado = 5'd0;
    end
    
    localparam [4:0]
        fetch   = 5'd0,
        decode  = 5'd1,
        load_f  = 5'd2,
        load_d  = 5'd6,
        add     = 5'd7,
        cmp     = 5'd9,
        mov     = 5'd10,
        jump    = 5'd11,
        in      = 5'd14,
        out     = 5'd15,
        dec_sp  = 5'd16,
        push_pc = 5'd17,
        pop_pc  = 5'd18;
    
    always@(posedge clk)
    begin
        if (reset)
            estado <= 5'd0;
        else
            estado <= estado_next;
    end

    always@*
    begin
        case (estado)
            0:  control = 15'b000_00xx01100000; 
            1:  control = 15'b000_xxxx00000000;
            2:  control = 15'b000_10xx00001000; 
            6:  control = 15'b000_11xx00010000; 
            7:  control = 15'b000_110010000100; 
            9:  control = 15'b000_xx0100000100; 
            10: control = 15'b000_111010000100; 
            11: control = 15'b000_11xx01100000; 
            14: control = 15'b000_111010000010;
            15: control = 15'b000_111000000101;
            16: control = 15'b010_xxxx00000000;
            17: control = 15'b100_01xx10000000;
            18: control = 15'b011_01xx00100000;
            
            default: control = 15'dx;
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
                    7'b11001xx: estado_next = load_f;
                    default:      estado_next = fetch;
                endcase
            end
            
            load_f:
            begin
                casex (cop)
                    7'b0xxxxx: estado_next = load_d;
                    7'b10xxxx: estado_next = mov;
                    7'b110010: estado_next = dec_sp;
                    7'b110011: estado_next = pop_pc;
                    default:      estado_next = fetch;
                endcase
            end
            
            load_d:
            begin
                casex (cop)
                    7'bx0xxxx: estado_next = add;
                    7'bx1xxxx: estado_next = cmp;
                    default:      estado_next = fetch;
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