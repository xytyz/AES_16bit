`timescale 1ns / 1ps
module Clk_100ms(
    input Clkin,
    output reg Clkout
    );
    
    reg [28:0] count =0;
    reg Clkout = 0;
    
    always@(posedge Clkin)
    begin
        if(count==28'd499_999)             //for 800ms, count = 39_999_999
        begin
            Clkout<=~Clkout;
            count<=0;
        end
        
        else
            count<=count+1;
    end
endmodule
