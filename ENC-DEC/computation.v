`timescale 1ns / 1ps

module computation(
	output[255:0] altered,
	input [255:0] code);
	wire[255:0]subbed,shifted;

	subByte s1(.code(code),.altered(subbed)); //sub the bytes using LUTs
	shiftRow r1(.code(subbed),.altered(shifted)); //Shift each row by a factor
	mixCol m1(.code(shifted),.altered(altered)); //mix the columns

endmodule
