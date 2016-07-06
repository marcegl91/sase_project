`timescale 1ns / 1ps

module LogicaIO(
    input [2:0] dev_sel,
    input [1:0] reg_sel,
    input we,
    input [15:0] data_out,
    output reg [15:0] data_in,
    
    input [15:0] device0in,    
    output [18:0] device0out,
    output reg device0cs,
    
    input [15:0] device1in,    
    output [18:0] device1out,
    output reg device1cs,
    
    input [15:0] device2in,    
    output [18:0] device2out,
    output reg device2cs,
    
    input [15:0] device3in,    
    output [18:0] device3out,
    output reg device3cs,
    
    input [15:0] device4in,    
    output [18:0] device4out,
    output reg device4cs,
    
    input [15:0] device5in,    
    output [18:0] device5out,
    output reg device5cs,
    
    input [15:0] device6in,    
    output [18:0] device6out,
    output reg device6cs,
    
    input [15:0] device7in,    
    output [18:0] device7out,
    output reg device7cs
    
    );        
    
    assign device0out = {we, reg_sel, data_out};
    assign device1out = {we, reg_sel, data_out};
    assign device2out = {we, reg_sel, data_out};
    assign device3out = {we, reg_sel, data_out};
    assign device4out = {we, reg_sel, data_out};
    assign device5out = {we, reg_sel, data_out};
    assign device6out = {we, reg_sel, data_out};
    assign device7out = {we, reg_sel, data_out};
    
    always@*
        begin
        device0cs = 1'b0;
        device1cs = 1'b0;
        device2cs = 1'b0;
        device3cs = 1'b0;
        device4cs = 1'b0;
        device5cs = 1'b0;
        device6cs = 1'b0;
        device7cs = 1'b0;
        data_in = 15'b0;
 
        case(dev_sel)
            0:
                begin
                device0cs = 1'b1;
                data_in = device0in;
                end
            1:
                begin
                device1cs = 1'b1;
                data_in = device1in;
                end
            2:
                begin
                device2cs = 1'b1;
                data_in = device2in;
                end
            3:
                begin
                device3cs = 1'b1;
                data_in = device3in;
                end
                
            4:
                begin
                device4cs = 1'b1;
                data_in = device4in;
                end
            
            5:
                begin
                device5cs = 1'b1;
                data_in = device5in;
                end
            
            6:
                begin
                device6cs = 1'b1;
                data_in = device6in;
                end
                
           7:
                begin
                device7cs = 1'b1;
                data_in = device7in;
                end     
           
            default: ;
        endcase
        end
endmodule
