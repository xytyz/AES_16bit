module cathode(
    input [3:0] Digit,
    output reg [6:0] Cathode=0
 );
 
 always@(Digit)
 begin
    case(Digit)             //     gfedbca
            4'b0000: Cathode = 7'b1000000; // "0"     
            4'b0001: Cathode = 7'b1111001; // "1" 
            4'b0010: Cathode = 7'b0100100; // "2" 
            4'b0011: Cathode = 7'b0110000; // "3" 
            4'b0100: Cathode = 7'b0011001; // "4" 
            4'b0101: Cathode = 7'b0010010; // "5" 
            4'b0110: Cathode = 7'b0000010; // "6" 
            4'b0111: Cathode = 7'b1111000; // "7" 
            4'b1000: Cathode = 7'b0000000; // "8"     
            4'b1001: Cathode = 7'b0010000; // "9" 
            4'b1010: Cathode = 7'b0001000; // "a"
			4'b1011: Cathode = 7'b0000011; // "b"
			4'b1100: Cathode = 7'b1000110; // "c"
			4'b1101: Cathode = 7'b0100001; // "d"
			4'b1110: Cathode = 7'b0000110; // "e"
			4'b1111: Cathode = 7'b0001110; // "f"
			4'b10000: Cathode = 7'b0001100; // "p"
			4'b10001: Cathode = 7'b0111111; // "-"
		
            default:  Cathode = 7'b1000000; // "0"
    endcase
 end
 endmodule