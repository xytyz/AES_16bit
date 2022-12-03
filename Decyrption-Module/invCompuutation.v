`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2022 22:21:37
// Design Name: 
// Module Name: invCompuutation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module invComputation(
    input[15:0] code,
	output [15:0] altered);
	wire[15:0]buff;
	shiftRow r1(.code(code),.altered(buff));
	invSubByte s1(.code(buff),.altered(altered));
		
	
endmodule
