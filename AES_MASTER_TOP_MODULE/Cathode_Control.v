 module Cathode_Control(
    input [4:0] Digit,
    output reg [6:0] Cathode
 );
 
 always@(Digit)
 begin
    case(Digit)             //     gfedbca
            5'b00000: Cathode = 7'b1000000; // "0"     
            5'b00001: Cathode = 7'b1111001; // "1" 
            5'b00010: Cathode = 7'b0100100; // "2" 
            5'b00011: Cathode = 7'b0110000; // "3" 
            5'b00100: Cathode = 7'b0011001; // "4" 
            5'b00101: Cathode = 7'b0010010; // "5" 
            5'b00110: Cathode = 7'b0000010; // "6" 
            5'b00111: Cathode = 7'b1111000; // "7" 
            5'b01000: Cathode = 7'b0000000; // "8"     
            5'b01001: Cathode = 7'b0010000; // "9" 
            5'b01010: Cathode = 7'b0001000; // "a"
			5'b01011: Cathode = 7'b0000011; // "b"
			5'b01100: Cathode = 7'b1000110; // "c"
			5'b01101: Cathode = 7'b0100001; // "d"
			5'b01110: Cathode = 7'b0000110; // "e"
			5'b01111: Cathode = 7'b0001110; // "f"
			5'b10000: Cathode = 7'b0001100; // "p"
			5'b10001: Cathode = 7'b0111111; // "-"
		
            default:  Cathode = 7'b1000000; // "0"
    endcase
 end
 endmodule
