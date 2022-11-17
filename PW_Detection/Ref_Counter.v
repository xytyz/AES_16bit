`timescale 1ns / 1ps

module Ref_Counter(
    input clkin, reset,
    output reg [1:0] count
    );
    
    wire clkout;
    
    Ref_Clk RefClockk1(.clkout(clkout),
                       .clkin(clkin),
                       .reset(reset));
                          
    always@(posedge clkout or posedge reset)
    begin
        if(reset)
            count<=0;
        else
            count<=count+1;
    end
    
    
endmodule
