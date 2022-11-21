`timescale 1ns / 1ps

module Ref_counter(
    input clkin,
    input ref_counter_reset,
    output reg [1:0] ref_count = 0

    );
    
wire ref_counter_out;

Ref_clk z1(.clkin(clkin),
           .ref_reset(ref_counter_reset),
           .ref_clk(ref_counter_out));
           
always@(posedge ref_counter_out or posedge ref_counter_reset)
    begin
        if(ref_counter_reset)
            ref_count <= 0;
        else 
            ref_count <= ref_count + 1;    
    end
    
endmodule
