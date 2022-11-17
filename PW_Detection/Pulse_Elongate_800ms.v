`timescale 1ns / 1ps
module Pulse_Elongate_800ms(
    input clk, reset, trigger,
    output reg pulse = 0
    );
    
        parameter PULSE_WIDTH = 80_000_000;       //80_000_000
        reg [28:0] count = 0;

        wire countReset = reset || (count == PULSE_WIDTH);

        always@(posedge trigger, posedge countReset) 
        begin
                if (countReset) 
                begin
                    pulse <= 1'b0;
                end 
                
                else 
                begin
                    pulse <= 1'b1;
                end
        end


        always@(posedge clk, posedge countReset) 
        begin
                if(countReset) 
                begin
                    count <= 0;
                end 
                
                else 
                begin
                    if(pulse) 
                    begin
                        count <= count + 1'b1;
                    end
                end
        end
    
endmodule
