`timescale 1ns / 1ps
module Anode_control(
    input clkin_ac,
    input reset,
    output reg [3:0] anode

    );

wire clkout; 
Ref_clk k1(.clkin(clkin_ac),
           .ref_reset(reset),
           .ref_clk(clkout));
           
wire [1:0] out;
Ref_counter k2(.clkin(clkin_ac),
               .ref_counter_reset(reset),
               .ref_count(out));  
    
    
always@(posedge clkout)
	begin
		case(out)
		2'd0: anode <= 4'b1110;
		2'd1: anode <= 4'b1101;
		2'd2: anode <= 4'b1011;
		2'd3: anode <= 4'b0111;
		endcase
	end
endmodule
