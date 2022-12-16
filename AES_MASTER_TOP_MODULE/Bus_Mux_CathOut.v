`timescale 1ns / 1ps
module Bus_Mux_CathOut(
    input [4:0] A, B,
    input sel,
    output [4:0] Y
    );
    
    assign Y = sel? B : A;
endmodule
