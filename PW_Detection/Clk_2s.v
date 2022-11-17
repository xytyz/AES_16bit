`timescale 1ns / 1ps
module Clk_2s(
    input Clkin,
    output Clkout
    );
    
    reg [28:0] count =0;
    reg Clkout = 0;
    
    always@(posedge Clkin)
    begin
        if(count==28'd99_999_999)             //for 2s, count = 99_999_999
        begin
            Clkout<=~Clkout;
            count<=0;
        end
        
        else
            count<=count+1;
    end
endmodule
