`timescale 1ns / 1ps

module computation(
    output[15:0] altered,
	input [15:0] code);
	wire[15:0]subbed;
	subByte s1(.code(code),.altered(subbed));
	shiftRow r1(.code(subbed),.altered(altered));	
	
endmodule
