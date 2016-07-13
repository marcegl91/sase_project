`timescale 1ns / 1ps

module RAM(
    input clk, le,
    input [6:0] dir,
    input [15:0] ent,
    output [15:0] sal
    );

    parameter RAM_WIDTH = 16;
    parameter RAM_ADDR_BITS = 7;

    reg [RAM_WIDTH-1:0] M[(2**RAM_ADDR_BITS)-1:0];

    initial
        begin
//           // Programa
//           $readmemb("C:/Users/azure/Desktop/repoMS/sase_project-master/Proyecto_MS/MS_final.srcs/sources_1/imports/facu/MaquinaSencilla_IO/timerysseg.hex", M);
//           // Datos
//           $readmemb("C:/Users/azure/Desktop/MaquinaSencillaIO/MaquinaSencillaIO.srcs/sources_1/imports/MaquinaSencilla.srcs/sources_1/new/datos.data", M, 100, 106);

        end

    always @(posedge clk)
      if (le)
         M[dir] <= ent;

    assign sal = M[dir];

endmodule
