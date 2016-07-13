// Arithmetic-Logic Module
module ALM(
    input clk, reset,
    input [15:0] in,
    input cs, we,
    input [1:0] reg_sel,
    output reg [15:0] out
    );

    parameter MULTIPLIER_DISABLE = 1'b1;
    parameter DIVIDER_DISABLE = 1'b0;

    // Reg. selectors:
    localparam D0_reg_sel = 2'd0;
    localparam D1_reg_sel = 2'd1;
    localparam OP_reg_sel = 2'd2;
    localparam OUT_reg_sel = 2'd3;

    // op. codes:
    localparam AND_op = 16'd0;
    localparam OR_op = 16'd1;
    localparam NOT_op = 16'd2;
    localparam NAND_op = 16'd3;
    localparam XOR_op = 16'd4;
    localparam NOR_op = 16'd5;
    localparam XNOR_op = 16'd6;
    localparam BITSEL_op = 16'd7;
    localparam MERGE_H_op = 16'd8;
    localparam MERGE_L_op = 16'd9;
    localparam MERGE_HL_op = 16'd10;
    localparam MERGE_LH_op = 16'd11;
    localparam SWAP_HL_op = 16'd12;

    localparam MULT_op = 16'd13;
    localparam DIV_op = 16'd14;
    localparam DIV_REM_op = 16'd15;

    reg [15:0] D1, D0, op, res;

    always@(posedge clk)
        if (reset)
            begin
            D0 <= 16'b0;
            D1 <= 16'b0;
            op <= 16'b0;
            out <= 16'b0;
            end
        else
            case({cs, we, reg_sel})
                {1'b1, 1'b1, D0_reg_sel}:  D0 <= in;
                {1'b1, 1'b1, D1_reg_sel}:  D1 <= in;
                {1'b1, 1'b1, OP_reg_sel}:  op <= in;
                {1'b1, 1'b0, OUT_reg_sel}: out <= res;
                default: out <= 16'b0;
            endcase

    always@*
        case(op)
        // Bitwise operations:
            AND_op: res = (D0 & D1);
            XOR_op: res = (D0 ^ D1);
            OR_op:  res = (D0 | D1);
            NOT_op: res = ~D0;
            NAND_op: res = ~(D0 & D1);
            NOR_op: res = ~(D0 | D1);
            XNOR_op: res = ~(D0 ^ D1);
            BITSEL_op:
                    begin
                    if (D1 <= 15)
                        res = D0[D1];
                    else
                        res = 16'b0;
                    end
            MERGE_H_op: res = {D1[15:8], D0[15:8]};
            MERGE_L_op: res = {D1[7:0], D0[7:0]};
            MERGE_HL_op: res = {D1[15:8], D0[7:0]};
            MERGE_LH_op: res = {D1[7:0], D0[15:8]};
            SWAP_HL_op: res = {D0[7:0], D0[15:8]};
       	// Arithmetic:
            MULT_op: res = multiplier_out;
            DIV_op:  res = divider_res_out;
            DIV_REM_op: res = divider_rem_out;

            default: res = 16'b0;
            endcase


    // External modules:
    wire [15:0] multiplier_out;
    wire [15:0] divider_res_out, divider_rem_out;

    generate
        if (!MULTIPLIER_DISABLE)
            Multiplier multiplier (.a(D0[7:0]), .b(D1[7:0]), .p(multiplier_out));

        if (!DIVIDER_DISABLE)
            Divider divider(.clk(clk), .dividend(D0), .divisor(D1), .quotient(divider_res_out), .fractional(divider_rem_out));
    endgenerate


endmodule