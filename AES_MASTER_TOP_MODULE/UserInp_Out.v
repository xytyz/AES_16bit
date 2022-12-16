`timescale 1ns / 1ps
module UserInp_Out(
    input clkin, reset,
    input [15:0] inpreg,
    output reg [4:0] Digit
    );
    
    wire [3:0] count;

    Ref_Counter RefCntr(.count(count),
                        .clkin(clkin), 
                        .reset(reset));
                        
    always@(count)
    begin
    case(count) 
        4'd0 : begin
                   Digit[4] <= 0;       
                   Digit[3] <= inpreg[3];       
                   Digit[2] <= inpreg[2];       
                   Digit[1] <= inpreg[1];       
                   Digit[0] <= inpreg[0];       
               end
               
        4'd1 : begin
                   Digit[4] <= 0;       
                   Digit[3] <= inpreg[7];       
                   Digit[2] <= inpreg[6];       
                   Digit[1] <= inpreg[5];       
                   Digit[0] <= inpreg[4];       
               end
               
        4'd2 : begin
                   Digit[4] <= 0;       
                   Digit[3] <= inpreg[11];       
                   Digit[2] <= inpreg[10];       
                   Digit[1] <= inpreg[9];       
                   Digit[0] <= inpreg[8];       
               end
               
        4'd3 : begin
                   Digit[4] <= 0;       
                   Digit[3] <= inpreg[15];       
                   Digit[2] <= inpreg[14];       
                   Digit[1] <= inpreg[13];       
                   Digit[0] <= inpreg[12];       
               end
    endcase
    end
endmodule
