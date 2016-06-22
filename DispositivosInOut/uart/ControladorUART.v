//Listing 8.5
module ControladorUART
   (
    input wire clk, reset, rx,
    output wire tx,
    
    input cs, we, 
    input [1:0] reg_sel,
    input [15:0] in,
    output reg [15:0] out
    );

    // signal declaration
    reg tx_full, rx_empty;
    wire tx_full_next, rx_empty_next;
    reg wr_uart, rd_uart, force_reset;
    wire [7:0] w_data, r_data;
    
    assign reset_uart = reset | force_reset;
        
    always@(posedge clk)
        if (reset)
            begin
            tx_full <= 1'b0;
            rx_empty <= 1'b0;
            end
        else
            begin
            tx_full <= tx_full_next;
            rx_empty <= rx_empty_next;
            end
                     
    
    assign w_data = in[7:0];
    always@*
        begin
        wr_uart = 1'b0;
        rd_uart = 1'b0;
        force_reset = 1'b0;
        out = 16'b0;
        // RX_EMPTY = 11
        // TX_FULL = 10
        // TX = 00
        // RX = 01
        if(cs)
            begin
            if(we)
                begin
                if (reg_sel == 2'b0)
                    wr_uart = 1'b1;
                else if(reg_sel == 2'b01)
                    force_reset = 1'b1;
                end
            else
                begin
                if(reg_sel == 2'b01)
                    begin
                    rd_uart = 1'b1;
                    out = {8'b0, r_data};
                    end
                else if(reg_sel == 2'b10)
                    out = {15'b0, tx_full};
                else if(reg_sel == 2'b11)
                    out = {15'b0, rx_empty};
                end
            end
       end
                
   // body
   // instantiate uart
   uart uart_unit
      (.clk(clk), .reset(reset_uart), .rd_uart(rd_uart),
       .wr_uart(wr_uart), .rx(rx), .w_data(w_data),
       .tx_full(tx_full_next), .rx_empty(rx_empty_next),
       .r_data(r_data), .tx(tx));
    
endmodule       
