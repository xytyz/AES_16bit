`timescale 1ns / 1ps

module encr_to_cathode(
    input [4:0] alph,
    output reg [7:0] cathode 

    );
    
always@(alph)
begin
    case(alph) //                     gfedcba
                5'd0  : cathode <= 7'b1000000; 
				5'd1  : cathode <= 7'b1111001; 
				5'd2  : cathode <= 7'b0100100; 
				5'd3  : cathode <= 7'b0110000; 
				5'd4  : cathode <= 7'b0011001; 
				5'd5  : cathode <= 7'b0010010; 
				5'd6  : cathode <= 7'b0000010; 
				5'd7  : cathode <= 7'b1111000; 
				5'd8  : cathode <= 7'b0000000; 
				5'd9  : cathode <= 7'b0010000;
				5'd10 : cathode <= 7'b0001000; // A
				5'd11 : cathode <= 7'b0000011; // B
				5'd12 : cathode <= 7'b1000110; // C
				5'd13 : cathode <= 7'b0100001; // D
				5'd14 : cathode <= 7'b0000110; // E
				5'd15 : cathode <= 7'b0001110; // F
				5'd16 : cathode <= 7'b0001100; // P
				5'd17 : cathode <= 7'b0111111; // -
            
    endcase
end  
endmodule
